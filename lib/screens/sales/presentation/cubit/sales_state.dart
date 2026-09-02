import 'package:dashboard/screens/sales/data/models/sale_model.dart';

class SalesFailure extends SalesState {
  final String message;

  const SalesFailure(this.message);
}

class SalesInitial extends SalesState {
  const SalesInitial();
}

class SalesLoading extends SalesState {
  const SalesLoading();
}

sealed class SalesState {
  const SalesState();
}

class SalesSuccess extends SalesState {
  final List<SaleModel> sales;

  const SalesSuccess(this.sales);
}
