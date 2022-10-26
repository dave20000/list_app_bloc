import 'api/response/base_response.dart';
import '../data/models/character_dto.dart';

class AppSerializers {
  static final Map<dynamic, Function(Map<String, dynamic> val)> serializers = {
    BaseResponse: (data) => BaseResponse.fromJson(data),
    CharacterDto: (data) => CharacterDto.fromJson(data),
  };
}
