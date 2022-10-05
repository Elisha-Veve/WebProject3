import 'package:dio/dio.dart';
import 'package:zanpakuto/models/requests/create_chat_message_request.dart';
import 'package:zanpakuto/models/chat_message_model.dart';
import 'package:zanpakuto/models/app_response.dart';
import 'package:zanpakuto/repositories/repositories.dart';
import 'package:zanpakuto/utils/dio_client/dio_client.dart';

class ChatMessageRepository extends BaseChatMessageRepository {
  final Dio _dioClient;

  ChatMessageRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  @override
  Future<AppResponse<ChatMessageEntity?>> createChatMessage(
      CreateChatMessageRequest request) async {
    final response = await _dioClient.post(
      Endpoints.createChatMessage,
      data: request.toJson(),
    );

    return AppResponse<ChatMessageEntity?>.fromJson(
        response.data,
        (dynamic json) => response.data['success'] && json != null
            ? ChatMessageEntity.fromJson(json)
            : null);
  }

  @override
  Future<AppResponse<List<ChatMessageEntity>>> getChatMessages(
      {required int chatId, required int page}) async {
    final response = await _dioClient.get(
      Endpoints.getChatMessages,
      queryParameters: {
        'chat_id': chatId,
        'page': page,
      },
    );
    return AppResponse<List<ChatMessageEntity>>.fromJson(
        response.data,
        (dynamic json) => response.data['success'] && json != null
            ? (json as List<dynamic>)
                .map((e) => ChatMessageEntity.fromJson(e))
                .toList()
            : []);
  }
}
