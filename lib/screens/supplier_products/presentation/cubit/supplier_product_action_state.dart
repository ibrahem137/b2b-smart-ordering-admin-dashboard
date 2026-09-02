class SupplierProductActionFailure extends SupplierProductActionState {
  final String message;

  const SupplierProductActionFailure(this.message);
}

class SupplierProductActionInitial extends SupplierProductActionState {
  const SupplierProductActionInitial();
}

class SupplierProductActionLoading extends SupplierProductActionState {
  const SupplierProductActionLoading();
}

sealed class SupplierProductActionState {
  const SupplierProductActionState();
}

class SupplierProductActionSuccess extends SupplierProductActionState {
  final String message;

  const SupplierProductActionSuccess(this.message);
}
