import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class StateController extends GetxController {
  //________________________________________________________on boarding states controls

  final _buttonText  = "Next".obs;
  final _pageIndex = 0.obs;
  final _onBoardingStatus = false.obs;

  String get buttonText => _buttonText.value;
  int get pageIndex => _pageIndex.value;
  bool get onBoardingStatus => _onBoardingStatus.value;

  void updateOnBoardingStatus(bool status){
    _onBoardingStatus.value = status;
  }

  void updatePageIndex(int index){
    _pageIndex.value = index;
  }

  void updateButtonText(String text){
    _buttonText.value  = text;
  }

  void incrementPageIndex(){
    int newIndex = pageIndex + 1;
    _pageIndex.value = newIndex;
  }

//_________________________________________________________on boarding states controls

//_________________________________________________________savings homepage states controls

}