import 'package:cloud_firestore/cloud_firestore.dart';

class Drink {
  final int id;
  final int count;
  final String name;
  final List<String> sur;

  Drink({
    required this.id,
    required this.count,
    required this.name,
    required this.sur,
  });

  // Drink.fromDocumentSnapshot(
  //   DocumentSnapshot<Map<dynamic, dynamic>> doc,
  // ) : name = doc.data()?['name'];

  factory Drink.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Drink(
      id: data?['id'],
      count: data?['count'],
      name: data?['name'],
      sur: List.from(data?['sur']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (count != null) "count": count,
      if (name != null) "name": name,
      if (sur != null) "sur": sur,
    };
  }
}

class City {
  final String? name;
  final String? state;
  final String? country;
  final bool? capital;
  final int? population;
  final List<String>? regions;

  City({
    this.name,
    this.state,
    this.country,
    this.capital,
    this.population,
    this.regions,
  });

  factory City.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return City(
      name: data?['name'],
      state: data?['state'],
      country: data?['country'],
      capital: data?['capital'],
      population: data?['population'],
      regions:
          data?['regions'] is Iterable ? List.from(data?['regions']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (state != null) "state": state,
      if (country != null) "country": country,
      if (capital != null) "capital": capital,
      if (population != null) "population": population,
      if (regions != null) "regions": regions,
    };
  }
}
