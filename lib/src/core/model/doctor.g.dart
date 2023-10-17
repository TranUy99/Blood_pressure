// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDTO _$DoctorDTOFromJson(Map<String, dynamic> json) => DoctorDTO(
      id: json['id'] as int?,
      email: json['z'] as String?,
      fullName: json['fullName'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as int?,
      image: json['image'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$DoctorDTOToJson(DoctorDTO instance) => <String, dynamic>{
      'id': instance.id,
      'z': instance.email,
      'fullName': instance.fullName,
      'address': instance.address,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
    };
