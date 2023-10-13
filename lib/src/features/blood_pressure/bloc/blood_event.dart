// ignore_for_file: non_constant_identifier_names

abstract class BloodEvent {}

//Create sign up event
class BloodButtonPressedEvent extends BloodEvent {
  final double? SystolicPressure;
  final double? DiastolicPressure;
  final double? PulsePressure;
  final double? HeartRate;
  final double? BodyTemperature;

  final String? createDay;

  BloodButtonPressedEvent(
      {required this.SystolicPressure,
      required this.DiastolicPressure,
      required this.PulsePressure,
      required this.HeartRate,
      required this.BodyTemperature,
      required this.createDay});
}

class FetchBloodEvent extends BloodEvent {}

class GetBloodById extends BloodEvent {
  final int? id;
  GetBloodById({required this.id});
}
