import 'package:latlong2/latlong.dart';

sealed class NewAddressEvent{}

final class GoToCurrentLocation extends NewAddressEvent{}

class NewAddressLocation extends NewAddressEvent{
 final LatLng chosenLocation;
 NewAddressLocation({required this.chosenLocation});
}

class AddressPicked extends NewAddressEvent {
 final LatLng pickedLocation;
 AddressPicked({required this.pickedLocation});
}