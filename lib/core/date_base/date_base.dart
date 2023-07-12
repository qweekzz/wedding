import 'package:cloud_firestore/cloud_firestore.dart';

class DateBase {
  final _db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getDrink() async {
    return await FirebaseFirestore.instance
        .collection('drink')
        .doc('XVgKwflIDT2j55ak41x9')
        .get();

    // QuerySnapshot<Map<String, dynamic>> snapshot =
    //     await _db.collection("drink").get();
    // return snapshot.docs
    //     .map((docSnapshot) => Drink.fromDocumentSnapshot(docSnapshot))
    //     .toList();
  }

  Future addName(name, String surname, List<int>? listOfDrink) async {
    print(listOfDrink);
    print(name);
    print(surname);

    listOfDrink?.forEach((element) async {
      await _db.collection("drink").doc("XVgKwflIDT2j55ak41x9").set({
        "$element": {
          // 'title': 'Вино красное',
          'count': FieldValue.increment(1),
          'sur': FieldValue.arrayUnion(['Имя:  $name  ,  Фамилия:  $surname']),
        }
      }, SetOptions(merge: true));
    });
  }

  // Future<void> test(doc) async {
  //   final drink = Drink(
  //     id: 0,
  //     count: 2,
  //     name: 'Вино красное',
  //     sur: ['test1', 'test2'],
  //   );
  //   final docRef = _db
  //       .collection("drink")
  //       .withConverter(
  //         fromFirestore: Drink.fromFirestore,
  //         toFirestore: (Drink drink, options) => drink.toFirestore(),
  //       )
  //       .doc("XVgKwflIDT2j55ak41x9");
  //   return await docRef.set(drink, SetOptions(merge: true));
  // }
}
