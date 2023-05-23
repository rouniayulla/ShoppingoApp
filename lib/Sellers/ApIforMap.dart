/// OPENROUTESERVICE DIRECTION SERVICE REQUEST 
/// Parameters are : startPoint, endPoint and api key
import 'package:open_route_service/open_route_service.dart';
const String baseUrl = 'https://api.openrouteservice.org/v2/directions/foot-walking';
const String baseUrl1='https://api.openrouteservice.org/v2/directions/driving-car';
const String apiKey = '5b3ce3597851110001cf624894bc62fb8f004691b1e389a2d8672f17';

getRouteUrl(String startPoint, String endPoint){
  
  return Uri.parse('$baseUrl1?api_key=$apiKey&start=$startPoint&end=$endPoint');
}
getRouteUrl1(String startPoint, String endPoint){
  print(Uri.parse('$baseUrl1?api_key=$apiKey&start=$startPoint&end=$endPoint'));
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}
