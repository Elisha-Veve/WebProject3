class Endpoints {
  static const _apiVersion = "/api";
  static const _baseAuth = "$_apiVersion/auth";

  static const login = "$_baseAuth/login";
  static const loginWithToken = "$_baseAuth/login-with-token";
  static const register = "$_baseAuth/register";
  static const logout = "$_baseAuth/logout";

  static const _baseChat = "$_apiVersion/chat";
  static const getChats = _baseChat;
  static const createChat = "$_baseChat/";
  static const getSingleChat = "$_baseChat/";

  static const _baseChatMessage = "$_apiVersion/chat-message";
  static const getChatMessages = _baseChatMessage;
  static const createChatMessage = _baseChatMessage;

  static const getUsers = "$_apiVersion/user";
}
