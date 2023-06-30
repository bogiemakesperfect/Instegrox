import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_review/in_app_review.dart';
const KEY = 'FIRST_TIME_OPEN';

class RatingService{
  late SharedPreferences _rew;
  final InAppReview _inAppReview = InAppReview.instance;

  Future<bool> isSecondTimeOpen() async{
    _rew = await SharedPreferences.getInstance();
    try{
      dynamic isSecondTime = _rew.getBool(KEY) as bool ;
      if(isSecondTime == null && !isSecondTime ){
        _rew.setBool(KEY, false);
        return false;
      } else if(isSecondTime != null && isSecondTime){
        _rew.setBool(KEY, false);
        return true;  
      } else {
        _rew.setBool(KEY, true);
        return false;
      }
    } catch(e){
      print(e);
      return false;
    }
  }



  Future<bool> showRating()async{
      try{
        if(await _inAppReview.isAvailable()){
          _inAppReview.requestReview();
          return true;
        } else {
          _inAppReview.openStoreListing(
            appStoreId:"com.socialx.sosyalx"
          );
        }
        return true;
      } catch(e){
        print(e);
        return false;
      }
  }
}