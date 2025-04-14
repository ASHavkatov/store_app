import 'package:latlong2/latlong.dart';

sealed class NewAddressEvent{}

final class GoToLocation extends NewAddressEvent{}

class NewAddressLocation extends NewAddressEvent{
 final LatLng chosenLocation;
 NewAddressLocation({required this.chosenLocation});
}