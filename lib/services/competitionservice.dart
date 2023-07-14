import 'package:cloud_firestore/cloud_firestore.dart';

class CompetitionService {
  Future<int> questionLenght() async {
    QuerySnapshot question =
        await FirebaseFirestore.instance.collection("competition").get();

    int lenght = question.docs.length;

    return lenght;
  }
}
