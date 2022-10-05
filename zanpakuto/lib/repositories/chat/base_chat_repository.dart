import 'package:zanpakuto/models/models.dart';
import 'package:zanpakuto/models/requests/create_chat_request.dart';

abstract class BaseChatRepository {
  Future<AppResponse<List<ChatEntity>>> getChats();
  Future<AppResponse<ChatEntity?>> createChat(CreateChatRequest request);
  Future<AppResponse<ChatEntity?>> getSingleChat(int chatId);
}
