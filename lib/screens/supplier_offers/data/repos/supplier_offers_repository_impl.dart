import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/supplier_offers/data/models/create_supplier_offer_request.dart';
import 'package:dashboard/screens/supplier_offers/data/models/supplier_offers_response.dart';
import 'package:dashboard/screens/supplier_offers/data/models/update_supplier_offer_request.dart';
import 'package:dashboard/screens/supplier_offers/domain/repos/supplier_offers_repository.dart';

class SupplierOffersRepositoryImpl implements SupplierOffersRepository {
  final ApiService apiService;

  SupplierOffersRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<dynamic>> createSupplierOffer(
    CreateSupplierOfferRequest request,
  ) async {
    try {
      final response = await apiService.createSupplierOffer(
        request.supplierProductId,
        request.offerPrice,
        request.offerStock,
        request.status,
        request.expiresAt,
        request.image,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> deleteSupplierOffer(int id) async {
    try {
      await apiService.deleteSupplierOffer(id);

      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<SupplierOffersResponse>> getSupplierOffers({
    int? supplierProductId,
    String? status,
  }) async {
    try {
      final response = await apiService.getSupplierOffers(
        supplierProductId: supplierProductId,
        status: status,
        perPage: 15,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<dynamic>> updateSupplierOffer(
    UpdateSupplierOfferRequest request,
  ) async {
    try {
      final response = await apiService.updateSupplierOffer(
        request.id,
        'PATCH',
        request.supplierProductId,
        request.offerPrice,
        request.offerStock,
        request.status,
        request.expiresAt,
        request.image,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
