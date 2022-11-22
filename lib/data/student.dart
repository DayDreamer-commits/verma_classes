
enum BatchType{
  regular,
  olympiad,
}

enum Gender{
  male,
  female,
}


class Student{
  String id;
  String name;
  int standard;
  String school;
  String phoneNumber;
  String whatsappNumber;
  BatchType batchType;
  Gender gender;
  String dob;
  String guardianName;
  String guardianContact;

//<editor-fold desc="Data Methods">

  Student({
    required this.id,
    required this.name,
    required this.standard,
    required this.school,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.batchType,
    required this.gender,
    required this.dob,
    required this.guardianName,
    required this.guardianContact,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          standard == other.standard &&
          school == other.school &&
          phoneNumber == other.phoneNumber &&
          whatsappNumber == other.whatsappNumber &&
          batchType == other.batchType &&
          gender == other.gender &&
          dob == other.dob &&
          guardianName == other.guardianName &&
          guardianContact == other.guardianContact);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      standard.hashCode ^
      school.hashCode ^
      phoneNumber.hashCode ^
      whatsappNumber.hashCode ^
      batchType.hashCode ^
      gender.hashCode ^
      dob.hashCode ^
      guardianName.hashCode ^
      guardianContact.hashCode;

  @override
  String toString() {
    return 'Student{ id: $id, name: $name, standard: $standard, school: $school, phoneNumber: $phoneNumber, whatsappNumber: $whatsappNumber, batchType: $batchType, genderl: $gender, dob: $dob, guardianName: $guardianName, guardianContact: $guardianContact,}';
  }

  Student copyWith({
    String? id,
    String? name,
    int? standard,
    String? school,
    String? phoneNumber,
    String? whatsappNumber,
    BatchType? batchType,
    Gender? genderl,
    String? dob,
    String? guardianName,
    String? guardianContact,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      standard: standard ?? this.standard,
      school: school ?? this.school,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      batchType: batchType ?? this.batchType,
      gender: genderl ?? this.gender,
      dob: dob ?? this.dob,
      guardianName: guardianName ?? this.guardianName,
      guardianContact: guardianContact ?? this.guardianContact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'standard': standard,
      'school': school,
      'phoneNumber': phoneNumber,
      'whatsappNumber': whatsappNumber,
      'batchType': batchType,
      'genderl': gender,
      'dob': dob,
      'guardianName': guardianName,
      'guardianContact': guardianContact,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      name: map['name'] as String,
      standard: map['standard'] as int,
      school: map['school'] as String,
      phoneNumber: map['phoneNumber'] as String,
      whatsappNumber: map['whatsappNumber'] as String,
      batchType: map['batchType'] as BatchType,
      gender: map['genderl'] as Gender,
      dob: map['dob'] as String,
      guardianName: map['guardianName'] as String,
      guardianContact: map['guardianContact'] as String,
    );
  }

//</editor-fold>
}