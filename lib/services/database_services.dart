import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION = "Users";
const String CHAT_COLLECTION = "Chats";
const String MESSAGES_COLLECTION = "Messages";

class DatabaseServices {

  final FirebaseFirestore _db  = FirebaseFirestore.instance;
  DatabaseServices(){}


}