import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NewAddressState extends Equatable {
  final LatLng? currentLocation;
  final String? address;
  final List<Marker> markers;

  const NewAddressState({
    required this.currentLocation,
    required this.address,
    required this.markers,
  });

  factory NewAddressState.initial() {
    return NewAddressState(currentLocation: null, address: null, markers: []);
  }

  NewAddressState copyWith({
    LatLng? currentLocation,
    String? address,
    List<Marker>? markers,
  }) {
    return NewAddressState(
      currentLocation: currentLocation ?? this.currentLocation,
      address: address ?? this.address,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object?> get props => [currentLocation, address, markers];
}
