import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/suppliers/data/models/create_supplier_request.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';
import 'package:flutter/foundation.dart';

import 'supplier_action_state.dart';

class CreateSupplierCubit
    extends Cubit<SupplierActionState> {
  final SuppliersRepository repository;

  CreateSupplierCubit(this.repository)
    : super(const SupplierActionInitial());

  Future<void> createSupplier({
    required String name,
    String? phone,
    String? email,
    String? address,
    required bool isActive,
  }) async {
    emit(const SupplierActionLoading());

    final result = await repository.createSupplier(
      CreateSupplierRequest(
        name: name.trim(),
        phone: _nullIfEmpty(phone),
        email: _nullIfEmpty(email),
        address: _nullIfEmpty(address),
        status: isActive ? 'active' : 'inactive',
      ),
    );

    result.when(
      success: (response) {
        debugPrint('CREATE SUPPLIER RESPONSE: $response');

        try {
          final data = response['data'];

          final supplierId = data['id'] as int;

          emit(
            SupplierActionSuccess(
              message:
                  'suppliers.messages.created_successfully',
              supplierId: supplierId,
            ),
          );
        } catch (error) {
          debugPrint('SUPPLIER ID PARSE ERROR: $error');

          emit(
            const SupplierActionFailure(
              'Supplier created but supplier ID could not be read.',
            ),
          );
        }
      },
      failure: (error) {
        emit(
          SupplierActionFailure(
            error.message ?? 'Failed to create supplier',
          ),
        );
      },
    );
  }

  String? _nullIfEmpty(String? value) {
    final trimmed = value?.trim();

    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }
}
