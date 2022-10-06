import 'package:zanpakuto/models/models.dart';
import 'package:zanpakuto/utils/utils.dart';

String getChatName(List<ChatMemberEntity> members, UserEntity currentUser) {
  final otherMembers =
      members.where((element) => element.userId != currentUser.id).toList();
  if (otherMembers.isNotEmpty) {
    vLog(otherMembers);
    return otherMembers[0].user.username;
  }
  return "N/A";
}
