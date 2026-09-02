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

  const OrdersSuccess(this.orders);
}
