import 'package:dio/dio.dart';
import 'package:zanpakuto/models/requests/create_chat_request.dart';
import 'package:zanpakuto/models/chat_model.dart';
import 'package:zanpakuto/models/app_response.dart';
import 'package:zanpakuto/repositories/repositories.dart';
import 'package:zanpakuto/utils/dio_client/dio_client.dart';
import 'package:zanpakuto/utils/utils.dart';

class ChatRepository extends BaseChatRepository {
  final Dio _dioClient;
  ChatRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;
  @override
  Future<AppResponse<ChatEntity?>> createChat(CreateChatRequest request) async {
    final response = await _dioClient.post(
      Endpoints.createChat,
      data: request.toJson(),
    );
    vLog(response.data);
    // vLog(response.data);
    return AppResponse<ChatEntity?>.fromJson(
        response.data,
        (dynamic json) => response.data['success'] && json != null
            ? ChatEntity.fromJson(json)
            : null);
  }

  @override
  Future<AppResponse<List<ChatEntity>>> getChats() async {
    final response = await _dioClient.post(Endpoints.getChats);

    return AppResponse<List<ChatEntity>>.fromJson(
        response.data,
        (dynamic json) => response.data['success'] && json != null
            ? (json as List<dynamic>)
                .map((e) => ChatEntity.fromJson(e))
                .toList()
            : []);
  }

  @override
  Future<AppResponse<ChatEntity?>> getSingleChat(int chatId) async {
    final response = await _dioClient.post(
      "${Endpoints.getSingleChat}$chatId",
    );
    return AppResponse<ChatEntity?>.fromJson(
        response.data,
        (dynamic json) => response.data['success'] && json != null
            ? ChatEntity.fromJson(json)
            : null);
  }
}
