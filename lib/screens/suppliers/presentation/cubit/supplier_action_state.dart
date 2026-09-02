class SupplierActionFailure extends SupplierActionState {
  final String message;

  const SupplierActionFailure(this.message);
}

class SupplierActionInitial extends SupplierActionState {
  const SupplierActionInitial();
}

class SupplierActionLoading extends SupplierActionState {
  const SupplierActionLoading();
}

sealed class SupplierActionState {
  const SupplierActionState();
}

class SupplierActionSuccess extends SupplierActionState {
  final String? message;
  final int? supplierId;

  const SupplierActionSuccess({this.message, this.supplierId});
}
