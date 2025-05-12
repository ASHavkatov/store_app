import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/notification/blocs/notification_bloc.dart';
import 'package:store_app/features/notification/blocs/notification_state.dart';

import '../widgets/notification_empty.dart';
import '../widgets/notification_item.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Notifications"),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return switch (state.status) {
            null => throw UnimplementedError(),
            NotificationStatus.loading => Center(
              child: CircularProgressIndicator(),
            ),
            NotificationStatus.error => Center(child: Text("error")),
            NotificationStatus.idle =>
              state.model.isEmpty
                  ? NotificationEmpty()
                  : ListView.builder(
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      var model = state.model[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NotificationItem(
                              text: model.title,
                              desc: model.content,
                              svg: model.icon,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          };
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
