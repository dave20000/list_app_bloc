import 'ui_model.dart';

abstract class ToJson {
  Map<String, dynamic> toJson();

  UIModel toModel();
}
