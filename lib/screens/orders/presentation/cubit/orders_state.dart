import 'package:dashboard/screens/orders/data/models/order_model.dart';

class OrdersFailure extends OrdersState {
  final String message;

  const OrdersFailure(this.message);
}

class OrdersInitial extends OrdersState {
  const OrdersInitial();
}

class OrdersLoading extends OrdersState {
  const OrdersLoading();
}

sealed class OrdersState {
  const OrdersState();
}

class OrdersSuccess extends OrdersState {
  final List<OrderModel> orders;

  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const OrdersSuccess({
    required this.orders,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  int get from {
    if (orders.isEmpty) {
      return 0;
    }

    return ((currentPage - 1) * perPage) + 1;
  }

  bool get hasNextPage => currentPage < lastPage;

  bool get hasPreviousPage => currentPage > 1;

  int get to {
    if (orders.isEmpty) {
      return 0;
    }

    final value = from + orders.length - 1;

    return value > total ? total : value;
  }
}
