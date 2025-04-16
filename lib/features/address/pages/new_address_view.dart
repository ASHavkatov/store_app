import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/address/blocs/new_address_bloc.dart';
import 'package:store_app/features/address/blocs/new_address_event.dart';
import 'package:store_app/features/address/blocs/new_address_state.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';

class NewAddressView extends StatefulWidget {
  const NewAddressView({super.key});

  @override
  State<NewAddressView> createState() => _NewAddressViewState();
}

class _NewAddressViewState extends State<NewAddressView> {
  final LatLng _center = const LatLng(41.2995, 69.2401);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewAddressBloc, NewAddressState>(
      builder:
          (context, state) => Scaffold(
            appBar: StoreAppAppBar(title: "New Address"),
            body: Column(
              children: [
                Expanded(
                  child: FlutterMap(
                    mapController: context.read<NewAddressBloc>().mapController,
                    options: MapOptions(
                      initialCenter: state.currentLocation!,
                      onTap: (tapPosition, point) {
                        context.read<NewAddressBloc>().add(
                          NewAddressLocation(chosenLocation: point),
                        );
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: state.markers),
                      if (state.selectedLocation.length > 1)
                        PolylineLayer(
                          polylines: [
                            Polyline(
                              points: state.selectedLocation,
                              strokeWidth: 2,
                              color: AppColors.primary900,
                            ),
                          ],
                        ),
                      Positioned(
                        top: 40,
                        right: 10,
                        child: Column(
                          children: [
                            FloatingActionButton(
                              mini: true,
                              onPressed: () {
                                context
                                    .read<NewAddressBloc>()
                                    .mapController
                                    .move(
                                      _center,
                                      context
                                              .read<NewAddressBloc>()
                                              .mapController
                                              .camera
                                              .zoom +
                                          1,
                                    );
                              },
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                            SizedBox(height: 10.h),
                            FloatingActionButton(
                              mini: true,
                              onPressed: () {
                                context
                                    .read<NewAddressBloc>()
                                    .mapController
                                    .move(
                                      _center,
                                      context
                                              .read<NewAddressBloc>()
                                              .mapController
                                              .camera
                                              .zoom -
                                          1,
                                    );
                              },
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            SizedBox(height: 10.h),
                            FloatingActionButton(
                              mini: true,
                              onPressed: () {
                                // context.read<NewAddressBloc>().add(
                                //   GoToCurrentLocation(),
                                // );
                                state.showBottomSheet = true;
                              },
                              child: Icon(
                                Icons.my_location,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (state.showBottomSheet)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: SizedBox(
                            height: 403.h,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 25.w,
                                  right: 25.w,
                                  top: 30.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: StoreAppText(
                                            title: "Address",
                                            color: AppColors.primary900,
                                            size: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              state.showBottomSheet = false;
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            "assets/icons/cancel.svg",
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Divider(
                                      color: AppColors.primary100,
                                      height: 1.5,
                                    ),
                                    SizedBox(height: 20.h),
                                    StoreAppText(
                                      title: "Address Nickname",
                                      color: AppColors.primary900,
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height: 4),
                                    SizedBox(
                                      height: 52.h,
                                      child: TextFormField(
                                        controller:
                                            context
                                                .read<NewAddressBloc>()
                                                .nicknameController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          hintText: 'Choose One',
                                          hintStyle: TextStyle(
                                            color: AppColors.primary400,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    SizedBox(
                                      height: 52.h,
                                      child: TextFormField(
                                        controller:
                                            context
                                                .read<NewAddressBloc>()
                                                .fullAddressController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: AppColors.primary400,
                                              width: 1.5,
                                            ),
                                          ),
                                          hintText:
                                              'Enter Your Full Address ...',
                                          hintStyle: TextStyle(
                                            color: AppColors.primary400,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
