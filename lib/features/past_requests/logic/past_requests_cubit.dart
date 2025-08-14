
import 'package:blood_bank_hospital/features/past_requests/data/repo/past_requests_repo.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PastRequestsCubit extends Cubit<PastRequestsState> {
  final PastRequestsRepo _pastRequestsRepo;
  PastRequestsCubit(this._pastRequestsRepo) : super(const PastRequestsState.initial());

  // List<SpecializationsData?>? specializationsList = [];

  // void getSpecializations() async {
  //   emit(const HomeState.specializationsLoading());
  //   final response = await _homeRepo.getSpecialization();
  //   response.when(
  //     success: (specializationsResponseModel) {
  //       specializationsList =
  //           specializationsResponseModel.specializationDataList ?? [];

  //       // getting the doctors list for the first specialization by default.
  //       getDoctorsList(specializationId: specializationsList?.first?.id);

  //       emit(HomeState.specializationsSuccess(
  //           specializationsResponseModel.specializationDataList));
  //     },
  //     failure: (errorHandler) {
  //       emit(HomeState.specializationsError(errorHandler));
  //     },
  //   );
  // }

  // void getDoctorsList({required int? specializationId}) {
  //   List<Doctors?>? doctorsList =
  //       getDoctorsListBySpecializationId(specializationId);

  //   if (!doctorsList.isNullOrEmpty()) {
  //     emit(HomeState.doctorsSuccess(doctorsList));
  //   } else {
  //     emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
  //   }
  // }

  // /// returns the list of doctors based on the specialization id
  // getDoctorsListBySpecializationId(specializationId) {
  //   return specializationsList
  //       ?.firstWhere((specialization) => specialization?.id == specializationId)
  //       ?.doctorsList;
  // }
}
