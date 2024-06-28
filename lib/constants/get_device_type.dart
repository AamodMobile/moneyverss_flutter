import 'constants.dart';

class GetDeviceType{
  bool getDeviceType(BuildContext context) {
    bool isTablet;
    double ratio = MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;
    if( (ratio >= 0.74) && (ratio < 1.5) )
    {
      isTablet = true;
    } else{
      isTablet = false;
    }
    return isTablet;
  }
}