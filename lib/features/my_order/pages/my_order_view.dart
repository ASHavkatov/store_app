import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/my_order/blocs/my_order_bloc.dart';
import 'package:store_app/features/my_order/blocs/my_order_state.dart';
import 'package:store_app/features/my_order/widgets/completed_items.dart';
import 'package:store_app/features/my_order/widgets/ongoing_item.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  bool selected = true;
  List<Widget> ongoingItems = [];
  List<Widget> completedItems = [
    CompletedItems(),
    CompletedItems(),
    CompletedItems(),
    CompletedItems(),
    CompletedItems(),
    CompletedItems(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "My Orders"),
      body: BlocBuilder<MyOrderBloc, MyOrderState>(
        builder: (context, state) {
          return switch (state.status) {
            MyOrderStatus.loading => Center(child: CupertinoActivityIndicator()),
            MyOrderStatus.error => Center(child: Text("My Order error")),
            MyOrderStatus.success => Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    width: double.infinity,
                    height: 54.h,
                    decoration: BoxDecoration(color: AppColors.primary100, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      spacing: 2,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = true;
                              });
                            },
                            child: Container(
                              width: 162.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: selected ? Colors.white : AppColors.primary100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  "Ongoing",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary900,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = false;
                              });
                            },
                            child: Container(
                              width: 162.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: !selected ? Colors.white : AppColors.primary100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  "Completed",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary900,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.model.length,
                      itemBuilder: (context, index)=> selected ? OngoingItem(index: index) : ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) => const CompletedItems(),
                      ),
                      separatorBuilder: (context,index)=> SizedBox(height: 10.h),
                    ),
                  ),
                ],
              ),
            ),
          };
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
