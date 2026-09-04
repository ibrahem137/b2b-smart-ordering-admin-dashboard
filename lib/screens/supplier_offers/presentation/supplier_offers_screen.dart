import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/supplier_offers/data/models/supplier_offer_model.dart';
import 'package:dashboard/screens/supplier_offers/presentation/components/add_supplier_offer_dialog.dart';
import 'package:dashboard/screens/supplier_offers/presentation/components/edit_supplier_offer_dialog.dart';
import 'package:dashboard/screens/supplier_offers/presentation/components/supplier_offers_header.dart';
import 'package:dashboard/screens/supplier_offers/presentation/components/supplier_offers_table.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/create_supplier_offer_cubit.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/delete_supplier_offer_cubit.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offer_action_state.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offers_cubit.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offers_state.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/update_supplier_offer_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierOffersScreen extends StatelessWidget {
  const SupplierOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<SupplierOffersCubit>()..getSupplierOffers(),
        ),
        BlocProvider(create: (_) => getIt<DeleteSupplierOfferCubit>()),
      ],
      child: const _SupplierOffersView(),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 44, color: colors.error),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(color: colors.error),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: Text('common.retry'.tr()),
          ),
        ],
      ),
    );
  }
}

class _SupplierOffersView extends StatelessWidget {
  const _SupplierOffersView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocListener<DeleteSupplierOfferCubit, SupplierOfferActionState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(message)));

            context.read<SupplierOffersCubit>().getSupplierOffers();
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: colors.error,
                content: Text(message, style: TextStyle(color: colors.onError)),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SupplierOffersHeader(
              onAddOffer: () async {
                final created = await showDialog<bool>(
                  context: context,
                  builder: (_) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (_) => getIt<CreateSupplierOfferCubit>(),
                        ),
                        BlocProvider(
                          create: (_) =>
                              getIt<SupplierProductsCubit>()
                                ..getSupplierProducts(),
                        ),
                      ],
                      child: const AddSupplierOfferDialog(),
                    );
                  },
                );

                if (created == true && context.mounted) {
                  context.read<SupplierOffersCubit>().getSupplierOffers();
                }
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<SupplierOffersCubit, SupplierOffersState>(
                builder: (context, state) {
                  return switch (state) {
                    SupplierOffersInitial() ||
                    SupplierOffersLoading() => Center(
                      child: CircularProgressIndicator(color: colors.primary),
                    ),

                    SupplierOffersSuccess(:final offers) => SupplierOffersTable(
                      offers: offers,
                      onEdit: (SupplierOfferModel offer) async {
                        final updated = await showDialog<bool>(
                          context: context,
                          builder: (_) {
                            return MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (_) =>
                                      getIt<UpdateSupplierOfferCubit>(),
                                ),
                                BlocProvider(
                                  create: (_) =>
                                      getIt<SupplierProductsCubit>()
                                        ..getSupplierProducts(),
                                ),
                              ],
                              child: EditSupplierOfferDialog(offer: offer),
                            );
                          },
                        );

                        if (updated == true && context.mounted) {
                          context
                              .read<SupplierOffersCubit>()
                              .getSupplierOffers();
                        }
                      },
                      onDelete: (SupplierOfferModel offer) async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (dialogContext) {
                            final theme = Theme.of(dialogContext);
                            final dialogColors = theme.colorScheme;

                            return AlertDialog(
                              backgroundColor: dialogColors.surface,
                              title: Text(
                                'Delete Supplier Offer',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: dialogColors.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                'Are you sure you want to delete this supplier offer? This action cannot be undone.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: dialogColors.onSurfaceVariant,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(dialogContext).pop(false);
                                  },
                                  child: Text('common.cancel'.tr()),
                                ),
                                FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: dialogColors.error,
                                    foregroundColor: dialogColors.onError,
                                  ),
                                  onPressed: () {
                                    Navigator.of(dialogContext).pop(true);
                                  },
                                  child: Text('common.delete'.tr()),
                                ),
                              ],
                            );
                          },
                        );

                        if (confirmed != true || !context.mounted) {
                          return;
                        }

                        context
                            .read<DeleteSupplierOfferCubit>()
                            .deleteSupplierOffer(offer.id);
                      },
                    ),

                    SupplierOffersFailure(:final message) => _ErrorView(
                      message: message,
                      onRetry: () {
                        context.read<SupplierOffersCubit>().getSupplierOffers();
                      },
                    ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
