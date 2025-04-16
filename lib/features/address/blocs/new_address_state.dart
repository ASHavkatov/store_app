import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NewAddressState extends Equatable {
  final LatLng? currentLocation;
  final String? address, pickedLocation;
  final List<Marker> markers;
  final List<LatLng> selectedLocation;
  bool showBottomSheet = true;

   NewAddressState({
    required this.currentLocation,
    required this.address,
    required this.markers,
    required this.selectedLocation,
    required this.pickedLocation,
    required this.showBottomSheet,
  });

  factory NewAddressState.initial() {
    return NewAddressState(
      currentLocation: LatLng(41.28543, 69.20343),
      address: null,
      selectedLocation: [],
      markers: [],
      pickedLocation: '',
      showBottomSheet: false,
    );
  }

  NewAddressState copyWith({
    LatLng? currentLocation,
    String? address,
    List<Marker>? markers,
    List<LatLng>? selectedLocation,
    String? pickedLocation,
    bool? showBottomSheet,
  }) {
    return NewAddressState(
      currentLocation: currentLocation ?? this.currentLocation,
      address: address ?? this.address,
      markers: markers ?? this.markers,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      pickedLocation: pickedLocation ?? this.pickedLocation,
      showBottomSheet: showBottomSheet ?? this.showBottomSheet,
    );
  }

  @override
  List<Object?> get props => [
    currentLocation,
    address,
    markers,
    selectedLocation,
    pickedLocation,
    showBottomSheet,
  ];
}
