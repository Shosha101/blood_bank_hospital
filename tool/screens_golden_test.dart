// Renders the redesigned dashboard off-screen with sample data, in Arabic and English.
// Run: flutter test --update-goldens tool/screens_golden_test.dart  (PNGs land in tool/shots/)
import 'dart:io';

import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/active_requests_model.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/blood_type_model.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_state.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/dashboard_screen.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/model/inventory_management_model.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_cubit.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_state.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/login/logic/login_state.dart';
import 'package:blood_bank_hospital/features/login/ui/login_screen.dart';
import 'package:blood_bank_hospital/features/past_requests/data/model/pasts_requests_model.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_cubit.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_state.dart';
import 'package:blood_bank_hospital/features/settings/data/model/hospital_model.dart';
import 'package:blood_bank_hospital/features/settings/logic/hospital_cubit.dart';
import 'package:blood_bank_hospital/features/settings/logic/hospital_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeLoginCubit extends Cubit<LoginState> implements LoginCubit {
  FakeLoginCubit() : super(const LoginState.initial());
  @override
  Future<void> login(String phoneNumber, String password) async {}
  @override
  Future<void> logout() async {}
}

class FakeSummaryCardCubit extends Cubit<SummaryCardState>
    implements SummaryCardCubit {
  FakeSummaryCardCubit() : super(const SummaryCardState.initial());
  @override
  void getRequestCounts() => emit(
    const SummaryCardState.success(
      openRequestsCount: 5,
      completedRequestsCount: 128,
    ),
  );
}

class FakeActiveRequestsCubit extends Cubit<ActiveRequestsState>
    implements ActiveRequestsCubit {
  FakeActiveRequestsCubit() : super(const ActiveRequestsState.initial());
  @override
  Future<void> getActiveRequests() async =>
      emit(ActiveRequestsState.success(activeRequests));
}

class FakeDonationRequestCubit extends Cubit<DonationRequestState>
    implements DonationRequestCubit {
  FakeDonationRequestCubit() : super(const DonationRequestState.initial());
  @override
  void createDonationRequest(DonationRequestModel request) {}
}

class FakeBloodTypeCubit extends Cubit<BloodTypeState>
    implements BloodTypeCubit {
  FakeBloodTypeCubit() : super(const BloodTypeState.initial());
  @override
  void getBloodTypes() => emit(
    BloodTypeState.success([
      for (var i = 0; i < bloodTypes.length; i++)
        BloodTypeModel(id: i + 1, name: bloodTypes[i]),
    ]),
  );
}

class FakeInventoryCubit extends Cubit<InventoryState>
    implements InventoryCubit {
  FakeInventoryCubit() : super(const InventoryState.initial());
  @override
  void getInventory() => emit(InventoryState.success(inventory));
  @override
  void updateInventory(InventoryModel updatedInventory) {}
}

class FakePastRequestsCubit extends Cubit<PastRequestsState>
    implements PastRequestsCubit {
  FakePastRequestsCubit() : super(const PastRequestsState.initial());
  @override
  void getPastRequests() => emit(PastRequestsState.success(pastRequests));
}

class FakeHospitalCubit extends Cubit<HospitalState> implements HospitalCubit {
  FakeHospitalCubit(this.hospital) : super(const HospitalState.initial());
  final HospitalModel hospital;
  @override
  Future<void> getHospitalData() async =>
      emit(HospitalState.success(hospital));
}

const bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

InventoryModel stock(int id, String type, int quantity, int days, String status) {
  final expiry = DateTime.now().add(Duration(days: days, hours: 3));
  return InventoryModel(
    id: id,
    bloodTypeName: type,
    currentQuantity: quantity,
    expirationDate: expiry.toIso8601String(),
    status: status,
  );
}

final inventory = [
  stock(1, 'A+', 42, 31, 'Available'),
  stock(2, 'A-', 9, 18, 'Low Stock'),
  stock(3, 'B+', 35, 26, 'Available'),
  stock(4, 'B-', 0, 12, 'Out of Stock'),
  stock(5, 'AB+', 18, 22, 'Available'),
  stock(6, 'AB-', 4, 5, 'Low Stock'),
  stock(7, 'O+', 57, 34, 'Available'),
  stock(8, 'O-', 7, 9, 'Low Stock'),
];

final activeRequests = [
  ActiveRequestsModel(id: 1048, bloodTypeName: 'O-', numOfLiter: 6, status: 'Open', createdAt: '2026-10-01T09:30:00'),
  ActiveRequestsModel(id: 1047, bloodTypeName: 'B-', numOfLiter: 4, status: 'Open', createdAt: '2026-09-30T16:05:00'),
  ActiveRequestsModel(id: 1045, bloodTypeName: 'AB-', numOfLiter: 3, status: 'Pending', createdAt: '2026-09-29T11:40:00'),
  ActiveRequestsModel(id: 1042, bloodTypeName: 'A-', numOfLiter: 5, status: 'Pending', createdAt: '2026-09-28T08:15:00'),
  ActiveRequestsModel(id: 1039, bloodTypeName: 'O+', numOfLiter: 8, status: 'Open', createdAt: '2026-09-27T13:20:00'),
];

final pastRequests = [
  PastsRequestsModel(id: 1036, bloodTypeName: 'O+', numOfLiter: 10, status: 'Completed', createdAt: '2026-09-24T10:00:00'),
  PastsRequestsModel(id: 1033, bloodTypeName: 'A+', numOfLiter: 6, status: 'Completed', createdAt: '2026-09-21T15:30:00'),
  PastsRequestsModel(id: 1031, bloodTypeName: 'B+', numOfLiter: 4, status: 'In Progress', createdAt: '2026-09-19T09:10:00'),
  PastsRequestsModel(id: 1028, bloodTypeName: 'AB+', numOfLiter: 2, status: 'Completed', createdAt: '2026-09-15T12:45:00'),
  PastsRequestsModel(id: 1024, bloodTypeName: 'O-', numOfLiter: 5, status: 'Pending', createdAt: '2026-09-11T17:25:00'),
  PastsRequestsModel(id: 1019, bloodTypeName: 'A-', numOfLiter: 3, status: 'Completed', createdAt: '2026-09-06T08:50:00'),
  PastsRequestsModel(id: 1015, bloodTypeName: 'B-', numOfLiter: 7, status: 'Completed', createdAt: '2026-09-02T14:05:00'),
];

final hospitals = {
  'ar': HospitalModel(id: 16, name: 'مستشفى السلام', phoneNumber: '0112345678', areaName: 'حي الزهور', minimumBloodQuantityByLiter: 20),
  'en': HospitalModel(id: 16, name: 'Al Salam Hospital', phoneNumber: '0112345678', areaName: 'Al Zuhour District', minimumBloodQuantityByLiter: 20),
};

Future<void> loadFonts() async {
  Future<ByteData> file(String path) async => ByteData.view((await File(path).readAsBytes()).buffer);
  final plex = FontLoader(AppTheme.fontFamily);
  for (final weight in ['Regular', 'Medium', 'SemiBold', 'Bold']) {
    plex.addFont(file('assets/fonts/IBMPlexSansArabic-$weight.ttf'));
  }
  await plex.load();
  final sdk = File(Platform.resolvedExecutable).parent.parent.parent.parent.path;
  await (FontLoader('MaterialIcons')..addFont(file('$sdk/artifacts/material_fonts/materialicons-regular.otf'))).load();
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    FlutterSecureStorage.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    await loadFonts();
  });

  Future<void> pumpApp(WidgetTester tester, String lang, Widget home) async {
    tester.view.physicalSize = const Size(2880, 1800);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.reset);

    FlutterSecureStorage.setMockInitialValues({});
    final getIt = GetIt.instance;
    await getIt.reset();
    getIt.registerFactory<LoginCubit>(() => FakeLoginCubit());
    getIt.registerFactory<SummaryCardCubit>(() => FakeSummaryCardCubit());
    getIt.registerFactory<ActiveRequestsCubit>(() => FakeActiveRequestsCubit());
    getIt.registerFactory<DonationRequestCubit>(() => FakeDonationRequestCubit());
    getIt.registerFactory<BloodTypeCubit>(() => FakeBloodTypeCubit());
    getIt.registerFactory<InventoryCubit>(() => FakeInventoryCubit());
    getIt.registerFactory<PastRequestsCubit>(() => FakePastRequestsCubit());
    getIt.registerFactory<HospitalCubit>(() => FakeHospitalCubit(hospitals[lang]!));

    await tester.runAsync(() async {
      await tester.pumpWidget(
        EasyLocalization(
          key: UniqueKey(),
          supportedLocales: const [Locale('ar'), Locale('en')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          startLocale: Locale(lang),
          saveLocale: false,
          child: Builder(
            builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: BlocProvider<LoginCubit>(create: (_) => getIt<LoginCubit>(), child: home),
            ),
          ),
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 300));
    });
    await tester.pumpAndSettle();
  }

  Future<void> shot(WidgetTester tester, String name) async {
    await tester.pumpAndSettle();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('shots/$name.png'));
  }

  for (final lang in ['ar', 'en']) {
    testWidgets('$lang login', (tester) async {
      debugDisableShadows = false;
      await pumpApp(tester, lang, const LoginScreen());
      await shot(tester, '$lang-01-login');
      debugDisableShadows = true;
    });

    testWidgets('$lang dashboard and new request', (tester) async {
      debugDisableShadows = false;
      await pumpApp(tester, lang, const DashBoardScreen());
      await shot(tester, '$lang-02-dashboard');

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('O-').last);
      await shot(tester, '$lang-03-new-request');
      debugDisableShadows = true;
    });

    testWidgets('$lang inventory and update', (tester) async {
      debugDisableShadows = false;
      await pumpApp(tester, lang, const DashBoardScreen());
      await tester.tap(find.byIcon(Icons.inventory_2_outlined));
      await shot(tester, '$lang-04-inventory');

      await tester.tap(find.byIcon(Icons.edit_outlined).first);
      await shot(tester, '$lang-05-update-inventory');
      debugDisableShadows = true;
    });

    testWidgets('$lang past requests', (tester) async {
      debugDisableShadows = false;
      await pumpApp(tester, lang, const DashBoardScreen());
      await tester.tap(find.byIcon(Icons.history));
      await shot(tester, '$lang-06-past-requests');
      debugDisableShadows = true;
    });

    testWidgets('$lang settings', (tester) async {
      debugDisableShadows = false;
      await pumpApp(tester, lang, const DashBoardScreen());
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();
      await tester.runAsync(() async {
        await precacheImage(
          const AssetImage('assets/images/building.png'),
          tester.element(find.byType(Image)),
        );
      });
      await shot(tester, '$lang-07-settings');
      debugDisableShadows = true;
    });
  }
}
