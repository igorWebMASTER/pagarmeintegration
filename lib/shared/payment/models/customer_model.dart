import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'document_model.dart';

class CustomerModel {
  final String type;
  final String country;
  final String name;
  final List<DocumentModel> documents;
  final String externalId; // id do backend/
  final String email;
  final List<String> phoneNumbers;
  CustomerModel({
    required this.type,
    required this.country,
    required this.name,
    required this.documents,
    required this.externalId,
    required this.email,
    required this.phoneNumbers,
  });

  CustomerModel copyWith({
    String? type,
    String? country,
    String? name,
    List<DocumentModel>? documents,
    String? externalId,
    String? email,
    List<String>? phoneNumbers,
  }) {
    return CustomerModel(
      type: type ?? this.type,
      country: country ?? this.country,
      name: name ?? this.name,
      documents: documents ?? this.documents,
      externalId: externalId ?? this.externalId,
      email: email ?? this.email,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'country': country,
      'name': name,
      'documents': documents.map((x) => x.toMap()).toList(),
      'externalId': externalId,
      'email': email,
      'phoneNumbers': phoneNumbers,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      type: map['type'],
      country: map['country'],
      name: map['name'],
      documents: List<DocumentModel>.from(
          map['documents']?.map((x) => DocumentModel.fromMap(x))),
      externalId: map['externalId'],
      email: map['email'],
      phoneNumbers: List<String>.from(map['phoneNumbers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerModel(type: $type, country: $country, name: $name, documents: $documents, externalId: $externalId, email: $email, phoneNumbers: $phoneNumbers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerModel &&
        other.type == type &&
        other.country == country &&
        other.name == name &&
        listEquals(other.documents, documents) &&
        other.externalId == externalId &&
        other.email == email &&
        listEquals(other.phoneNumbers, phoneNumbers);
  }

  @override
  int get hashCode {
    return type.hashCode ^
        country.hashCode ^
        name.hashCode ^
        documents.hashCode ^
        externalId.hashCode ^
        email.hashCode ^
        phoneNumbers.hashCode;
  }
}
