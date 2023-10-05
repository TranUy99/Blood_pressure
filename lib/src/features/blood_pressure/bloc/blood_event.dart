abstract class BloodEvent {}

//Create sign up event
class BloodButtonPressedEvent extends BloodEvent {
  final double? sys;
  final double? dia;
  final double? pulse;
  final String? createDay;

  BloodButtonPressedEvent(
      {required this.sys,
      required this.dia,
      required this.pulse,
      required this.createDay});
}
class FetchBloodEvent extends BloodEvent {}