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

  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const SalesSuccess({
    required this.sales,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  int get from {
    if (sales.isEmpty) {
      return 0;
    }

    return ((currentPage - 1) * perPage) + 1;
  }

  bool get hasNextPage => currentPage < lastPage;

  bool get hasPreviousPage => currentPage > 1;

  int get to {
    if (sales.isEmpty) {
      return 0;
    }

    final value = from + sales.length - 1;

    return value > total ? total : value;
  }
}
