abstract class DoctorEvent {}

class FetchDoctorEvent extends DoctorEvent {}

class GetScheduleEvent extends DoctorEvent {
  final int? doctorId;
  final String? workDate;
  GetScheduleEvent({
    required this.doctorId,
    required this.workDate,
  });
}
