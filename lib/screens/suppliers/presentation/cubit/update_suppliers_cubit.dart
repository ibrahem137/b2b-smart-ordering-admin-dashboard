import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/suppliers/data/models/update_supplier_request.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';
import 'package:flutter/foundation.dart';

import 'supplier_action_state.dart';

class UpdateSupplierCubit
    extends Cubit<SupplierActionState> {
  final SuppliersRepository repository;

  UpdateSupplierCubit(this.repository)
    : super(const SupplierActionInitial());

  Future<void> updateSupplier({
    required int id,
    required String name,
    String? phone,
    String? email,
    String? address,
    required bool isActive,
  }) async {
    debugPrint('UPDATE CUBIT CALLED');

    emit(const SupplierActionLoading());

    final result = await repository.updateSupplier(
      UpdateSupplierRequest(
        id: id,
        name: name,
        phone: _emptyToNull(phone),
        email: _emptyToNull(email),
        address: _emptyToNull(address),
        status: isActive ? 'active' : 'inactive',
      ),
    );

    result.when(
      success: (response) {
        debugPrint('UPDATE SUCCESS: $response');

        emit(
          const SupplierActionSuccess(
            message:
                'suppliers.messages.updated_successfully',
          ),
        );
      },
      failure: (error) {
        debugPrint('UPDATE FAILED: ${error.message}');

        emit(
          SupplierActionFailure(
            error.message ?? 'Failed to update supplier',
          ),
        );
      },
    );
  }

  String? _emptyToNull(String? value) {
    final trimmed = value?.trim();

    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }
}
