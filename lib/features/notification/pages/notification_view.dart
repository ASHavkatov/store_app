import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/notification/blocs/notification_bloc.dart';
import 'package:store_app/features/notification/blocs/notification_state.dart';

import '../../../core/utils/notification_format_date.dart';
import '../widgets/notification_empty.dart';
import '../widgets/notification_item.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Notifications",  isTrue: true,),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          final grouped = groupNotificationsByDate(state.model);
          return switch (state.status) {
            null => throw UnimplementedError(),
            NotificationStatus.loading => Center(
              child: CircularProgressIndicator(),
            ),
            NotificationStatus.error => Center(child: Text("error")),
            NotificationStatus.idle =>
              state.model.isEmpty
                  ? NotificationEmpty()
                  : Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                    child: ListView(
                                    children: groupNotificationsByDate(state.model).entries.map((entry) {
                    final label = entry.key;
                    final items = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckoutTitle(title: label, fontWeight: FontWeight.w600, fontSize: 16),
                        ...items.map((model) => NotificationItem(
                          text: model.title,
                          desc: model.content,
                          svg: model.icon,
                        )),
                        SizedBox(height: 16.h),
                      ],
                    );
                                    }).toList(),
                                  ),
                  ),
          };
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
