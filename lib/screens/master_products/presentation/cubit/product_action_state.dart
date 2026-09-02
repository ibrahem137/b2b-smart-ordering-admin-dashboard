class ProductActionFailure extends ProductActionState {
  final String message;

  const ProductActionFailure(this.message);
}

class ProductActionInitial extends ProductActionState {
  const ProductActionInitial();
}

class ProductActionLoading extends ProductActionState {
  const ProductActionLoading();
}

sealed class ProductActionState {
  const ProductActionState();
}

class ProductActionSuccess extends ProductActionState {
  final String message;

  const ProductActionSuccess(this.message);
}
