import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class DoctorDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'z')
  final String? email;

 @JsonKey(name: 'fullName')
  final String? fullName;

   @JsonKey(name: 'address')
  final String? address;  

  @JsonKey(name: 'gender')
  final int? gender;


  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;

  @JsonKey(name: 'image')
  final String? image;

  DoctorDTO({
    this.id,
    this.email,
    this.fullName,
    this.address,
    this.gender,
    this.image,
    this.phoneNumber
  });

  factory DoctorDTO.fromJson(Map<String, dynamic> json) => _$DoctorDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDTOToJson(this);
}
