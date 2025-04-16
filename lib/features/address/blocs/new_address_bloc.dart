import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:store_app/features/address/blocs/new_address_event.dart';
import 'package:store_app/features/address/blocs/new_address_state.dart';

class NewAddressBloc extends Bloc<NewAddressEvent, NewAddressState> {
  NewAddressBloc() : super(NewAddressState.initial()) {
    on<GoToCurrentLocation>(_onGoToCurrentLocation);
    on<NewAddressLocation>(_onChooseLocation);
    on<AddressPicked>(_onAddressPicked);
  }
  final mapController = MapController();
  final nicknameController = TextEditingController();
  final fullAddressController = TextEditingController();
  Future<void> _onGoToCurrentLocation(
    GoToCurrentLocation event,
    Emitter<NewAddressState> emit,
  ) async {
    var status = await Permission.locationWhenInUse.status;

    if (status.isDenied) {
      status = await Permission.locationWhenInUse.request();
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    if (status.isGranted) {
      LocationSettings locationSettings;
      if (Platform.isAndroid) {
        locationSettings = AndroidSettings(accuracy: LocationAccuracy.best);
      } else if (Platform.isIOS) {
        locationSettings = AppleSettings(
          accuracy: LocationAccuracy.best,
          activityType: ActivityType.other,
          pauseLocationUpdatesAutomatically: false,
        );
      } else {
        locationSettings = LocationSettings();
      }
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      final currentLocation = LatLng(position.latitude, position.longitude);
      mapController.move(currentLocation, mapController.camera.zoom);
      emit(
        state.copyWith(
          currentLocation: currentLocation,
          markers: [
            Marker(
              point: currentLocation,
              child: SvgPicture.asset("assets/icons/map_pin.svg"),
              width: 40,
              height: 40,
            ),
          ],
          showBottomSheet: true
        ),
      );
      final placeMark = await placemarkFromCoordinates(
        currentLocation.latitude,
        currentLocation.longitude,
      );
      if (placeMark.isNotEmpty) {
        Placemark p = placeMark.first;
        final addressString =
            '${p.country}, ${p.administrativeArea}, ${p.country}, ${p.street}, ${p.name}';
        emit(state.copyWith(address: addressString));
      }
    }
  }

  Future<void> _onChooseLocation(
    NewAddressLocation event,
    Emitter<NewAddressState> emit,
  ) async {
    final currentPosition = LatLng(
      event.chosenLocation.latitude,
      event.chosenLocation.longitude,
    );
    final updatedLocation = List<LatLng>.from(state.selectedLocation);
    updatedLocation.add(currentPosition);
    final updatedMarker = [
      Marker(
        point: currentPosition,
        child: SvgPicture.asset("assets/icons/map_pin.svg"),
        width: 40,
        height: 40,
      ),
    ];
    mapController.move(currentPosition, mapController.camera.zoom);
    emit(
      state.copyWith(
        currentLocation: currentPosition,
        markers: updatedMarker,
        selectedLocation: updatedLocation,
      ),
    );
    List<Placemark> placeMark = await placemarkFromCoordinates(
      currentPosition.latitude,
      currentPosition.longitude,
    );
    if (placeMark.isNotEmpty) {
      Placemark p = placeMark.first;
      final addressString =
          '${p.country}, ${p.administrativeArea}, ${p.country}, ${p.street}, ${p.name}';
      emit(state.copyWith(address: addressString));
    }
  }

  Future<void> _onAddressPicked(
    AddressPicked event,
    Emitter<NewAddressState> emit,
  ) async {
    final placeMarks = await placemarkFromCoordinates(
      event.pickedLocation.latitude,
      event.pickedLocation.latitude,
    );
    if (placeMarks.isNotEmpty) {
      final place = placeMarks.first;
      final address = '${place.street},${place.locality}, ${place.country}';
      emit(state.copyWith(pickedLocation: address, showBottomSheet: true));
    }
  }
}
