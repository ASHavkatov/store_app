import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:store_app/features/customer_service/blocs/customer_service_bloc.dart';
import 'package:store_app/features/customer_service/blocs/customer_service_state.dart';
import '../../../core/utils/colors.dart';
import '../../common/presentations/store_app_icon_button.dart';
import '../../home/presentations/widgets/store_icon_button_container.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({super.key});

  @override
  State<CustomerServicePage> createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
  final controller = TextEditingController();
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> pickedImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future<void> requestPermission() async {
    if (await Permission.photos.request().isGranted) {
      pickedImage(ImageSource.gallery);
    } else {
      Permission.photos.isDenied;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 64.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Align(
            alignment: Alignment.center,
            child: StoreIconButton(
              icon: "assets/icons/back-arrow.svg",
              width: 19.w,
              height: 16.h,
              callback: () => context.pop(),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Customer Service",
          style: TextStyle(color: AppColors.primary900, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        toolbarHeight: 64.h,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: StoreIconButtonContainer(
              image: "assets/icons/call.svg",
              callback: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "You can connect us via",
                      style: TextStyle(color: AppColors.error, fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Number: +99 893 944 15 24"),
                        Text("Telegram: @fatxullofayzullayev"),
                        Text("Instagram: @_fat_uz"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: Text("Cancel", style: TextStyle(color: AppColors.error)),
                      ),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: Text("OK", style: TextStyle(color: AppColors.successGreen)),
                      ),
                    ],
                  ),
                );
              },
              iconWidth: 24.w,
              iconHeight: 24.h,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CustomerServiceBloc, CustomerServiceState>(
        builder: (context, state) => SafeArea(
          // bottom: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: state.messages.length,
                    separatorBuilder: (context, index) => SizedBox(height: 10.h),
                    itemBuilder: (context, index) => Align(
                      alignment: state.messages[index]["direction"] == "to"
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: state.messages[index]["direction"] == "to"
                              ? AppColors.primary100
                              : AppColors.primary900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                state.messages[index]["message"],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: state.messages[index]["direction"] == "to"
                                      ? AppColors.primary900
                                      : AppColors.primary100,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                state.messages[index]["date"],
                                style: TextStyle(
                                  color: state.messages[index]["direction"] == "to"
                                      ? AppColors.primary900
                                      : AppColors.primary100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 54.h,
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                            label: Text(
                              "Write your message...",
                              style: TextStyle(color: AppColors.primary400, fontSize: 16),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            suffix: IconButton(
                              onPressed: (){


                              },
                              icon: SvgPicture.asset(
                                "assets/icons/galery.svg",
                                width: 24.w,
                                height: 24.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(color: AppColors.primary900, borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            context.read<CustomerServiceBloc>().add(CustomerServiceSendEvent(message: controller.text));
                            controller.text = "";
                          },
                          icon: SvgPicture.asset("assets/icons/microphone.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
