import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
part 'new_address_state.freezed.dart';

@freezed
abstract class NewAddressState with _$NewAddressState {
  const factory NewAddressState({
    required LatLng? currentLocation,
    required String? address,
    @MarkerJsonConverter()
    required List<Marker> markers,
    @LatLngJsonConverter()
    required List<LatLng> selectedLocation,
    required String? pickedLocation,
  }) = _NewAddressState;

  factory NewAddressState.initial() {
    return NewAddressState(
      currentLocation: LatLng(41.28543, 69.20343),
      address: null,
      selectedLocation: [],
      markers: [],
      pickedLocation: '',
    );
  }
}

class MarkerJsonConverter extends JsonConverter<List<Marker>, List<String>>{
  const MarkerJsonConverter();
  @override
  List<Marker> fromJson(List<String> json) {
    return List.generate(5, (index)=> Marker(point: LatLng(41.28543, 69.20343), child: Icon(Icons.add)));
  }
  @override
  List<String> toJson(List<Marker> object) {
    return List.generate(5, (index)=> "Marker ${index+1}");
  }
}
class LatLngJsonConverter extends JsonConverter<List<LatLng>, List<String>> {
  const LatLngJsonConverter();

  @override
  List<LatLng> fromJson(List<String> json) {
    return json.map((e) {
      final parts = e.split(','); // "41.28543,69.20343"
      final lat = double.tryParse(parts[0]) ?? 0.0;
      final lng = double.tryParse(parts[1]) ?? 0.0;
      return LatLng(lat, lng);
    }).toList();
  }

  @override
  List<String> toJson(List<LatLng> object) {
    return object.map((e) => '${e.latitude},${e.longitude}').toList();
  }
}
