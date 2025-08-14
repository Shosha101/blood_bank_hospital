
import 'package:blood_bank_hospital/features/dashboard/data/repo/dashboard_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/dashboard_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo _dashboardRepo;
  DashboardCubit(this._dashboardRepo) : super(const DashboardState.initial());

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
