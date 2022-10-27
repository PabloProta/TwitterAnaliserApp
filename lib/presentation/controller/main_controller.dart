import 'package:flutter/widgets.dart';
import 'package:twitter_analiser_app/presentation/model/hate_types.dart';

class MainController extends ChangeNotifier {
  String? _candidateSelected;
  String? _regionSelected;
  String? _plataformSelected;
  final List<HateTypes> _hatesSeleceted = [];

  void setCandidate(String candidate) {
    _candidateSelected = candidate;
    notifyListeners();
  }

  void setRegion(String region) {
    _regionSelected = region;
    notifyListeners();
  }

  void setPlataform(String plataform) {
    _plataformSelected = plataform;
    notifyListeners();
  }

  void setHate(HateTypes hate, bool isChecked) {
    if (isChecked) {
      _hatesSeleceted.add(hate);
    } else {
      _hatesSeleceted.remove(hate);
    }
    notifyListeners();
  }

  String? getCandidate() {
    return _candidateSelected;
  }

  String? getPlataform() {
    return _plataformSelected;
  }

  String? getRegion() {
    return _regionSelected;
  }

  bool getHate(HateTypes hate){
    if(_hatesSeleceted.contains(hate)){
      return true;
    }else{
      return false;
    }
  }
}
