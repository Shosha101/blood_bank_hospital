import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:blood_bank_hospital/features/settings/data/model/hospital_model.dart';
import 'package:blood_bank_hospital/features/settings/logic/hospital_cubit.dart';
import 'package:blood_bank_hospital/features/settings/logic/hospital_state.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<HospitalCubit>()..getHospitalData(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(title: context.tr('hospital_details')),
                const SizedBox(height: 14),
                BlocBuilder<HospitalCubit, HospitalState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const _HospitalLoading(),
                      loading: () => const _HospitalLoading(),
                      success: (hospital) => _HospitalCard(hospital: hospital),
                      error: (errorHandler) => AppCard(
                        child: Center(
                          child: StateMessage(
                            icon: Icons.error_outline,
                            title: context.tr('hospital_error'),
                            body: errorHandler.apiErrorModel.message,
                            actionLabel: context.tr('retry'),
                            onAction: () =>
                                context.read<HospitalCubit>().getHospitalData(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                SectionHeader(title: context.tr('preferences')),
                const SizedBox(height: 14),
                AppCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      const _TileIcon(Icons.language),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.tr('language'),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.text,
                              ),
                            ),
                            Text(
                              context.tr('language_name'),
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const LanguagePill(),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SectionHeader(title: context.tr('help_support')),
                const SizedBox(height: 14),
                AppCard(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    children: [
                      _SupportTile(
                        icon: Icons.support_agent,
                        label: context.tr('contact_support'),
                      ),
                      const Divider(height: 1, color: AppColors.border),
                      _SupportTile(
                        icon: Icons.help_outline,
                        label: context.tr('faq'),
                      ),
                      const Divider(height: 1, color: AppColors.border),
                      _SupportTile(
                        icon: Icons.flag_outlined,
                        label: context.tr('report_issue'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HospitalLoading extends StatelessWidget {
  const _HospitalLoading();

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      child: SizedBox(
        height: 150,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _HospitalCard extends StatelessWidget {
  final HospitalModel hospital;
  const _HospitalCard({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/building.png',
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospital.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      context.tr('app_role'),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 18),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              _Detail(
                icon: Icons.location_on_outlined,
                label: context.tr('area'),
                value: hospital.areaName,
              ),
              _Detail(
                icon: Icons.phone_outlined,
                label: context.tr('phone'),
                value: hospital.phoneNumber,
                ltr: true,
              ),
              _Detail(
                icon: Icons.water_drop_outlined,
                label: context.tr('min_stock'),
                value: context.tr(
                  'litres',
                  args: ['${hospital.minimumBloodQuantityByLiter}'],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool ltr;

  const _Detail({
    required this.icon,
    required this.label,
    required this.value,
    this.ltr = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          _TileIcon(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: AppColors.muted),
                ),
                Text(
                  value,
                  textDirection: ltr ? TextDirection.ltr : null,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TileIcon extends StatelessWidget {
  final IconData icon;
  const _TileIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 20, color: AppColors.primary),
    );
  }
}

class _SupportTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SupportTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    // The card behind paints a background, so the tile needs its own Material for ink.
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: _TileIcon(icon),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.text,
          ),
        ),
        trailing: Icon(
          Directionality.of(context) == TextDirection.rtl
              ? Icons.chevron_left
              : Icons.chevron_right,
          color: AppColors.hint,
        ),
        onTap: () {},
      ),
    );
  }
}
