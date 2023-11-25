import 'package:flutter/material.dart';

const kRegularFont = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

const kMediumFont = TextStyle(
  fontSize: 40,
  color: Colors.white,
  fontWeight: FontWeight.w500,
  // shadows: [
  //   Shadow(
  //     color: Color(0x3E000000),
  //     blurRadius: 4,
  //     offset: Offset(0, 4),
  //   ),
  // ],
);

const kLightFont = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);

const kBoldFont = TextStyle(
  fontSize: 40,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

double setBackgroundOpacity(int weatherCode) {
  switch (weatherCode) {
    case 1000:
      return 0.0;
    case 1003:
      return 0.25;
    case 1006:
    case 1009:
      return 0.3;
    case 1030:
      return 0.32;
    case 1063:
    case 1066:
    case 1069:
    case 1072:
      return 0.33;
    case 1087:
    case 1114:
    case 1117:
    case 1135:
    case 1147:
    case 1150:
    case 1153:
    case 1168:
    case 1171:
    case 1180:
    case 1204:
    case 1210:
    case 1189:
      return 0.34;
    case 1183:
    case 1186:
    case 1213:
      return 0.345;
    case 1198:
    case 1201:
    case 1207:
    case 1216:
    case 1240:
      return 0.35;
    case 1192:
    case 1249:
    case 1252:
    case 1255:
      return 0.36;
    case 1219:
    case 1195:
    case 1222:
    case 1225:
    case 1243:
    case 1246:
    case 1258:
    case 1261:
      return 0.37;
    case 1264:
    case 1273:
    case 1276:
    case 1279:
      return 0.38;
    case 1282:
      return 0.4;
    default:
      return 0.3;
  }
}

List<dynamic> setBackroundImage(String locationName) {
  bool isVisible = false;
  String imageName = 'download.jpeg';

  switch (locationName) {
    case 'New York':
      isVisible = true;
      imageName = 'new_york.png';
      break;
    case 'Paris':
      isVisible = true;
      imageName = 'paris.png';
      break;
      case 'Dubai':
      isVisible = true;
      imageName = 'dubai.png';
      break;
      case 'Bangkok':
      isVisible = true;
      imageName = 'bangkok.png';
      break;
      case 'Barcelona':
      isVisible = true;
      imageName = 'barcelona.png';
      break;
      case 'Rome':
      isVisible = true;
      imageName = 'rome.png';
      break;
      case 'Beijing':
      isVisible = true;
      imageName = 'beijing.png';
      break;
      case 'London':
      isVisible = true;
      imageName = 'london.png';
      break;
      case 'Minsk':
      isVisible = true;
      imageName = 'minsk.png';
      break;

    default:
      break;
  }
    return [isVisible, imageName];

}
