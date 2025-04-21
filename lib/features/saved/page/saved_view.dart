import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/saved/blocs/saved_bloc.dart';
import 'package:store_app/features/saved/blocs/saved_state.dart';

import '../widgets/saved_detail.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Saved Items", isTrue: true),
      body: BlocBuilder<SavedBloc, SavedState>(
        builder: (context, state) {
          return switch (state.status) {
            null => throw UnimplementedError(),
            SavedStatus.loading => Center(child: CircularProgressIndicator(),),
            SavedStatus.error => Center(child: Text("Xato Bor"),),
            SavedStatus.idle =>
                GridView.builder(
                  padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 20.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19,
                    mainAxisSpacing: 1,
                    // mainAxisExtent: ,
                    childAspectRatio: 161.w / 190.h,
                  ),
                  itemCount: state.saved!.length,
                  itemBuilder: (context, index) {
                    return SavedDetail(saved: state.saved![index],);
                  },
                ),
          };
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}

