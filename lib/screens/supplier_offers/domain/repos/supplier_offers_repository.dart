import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_offers/data/models/create_supplier_offer_request.dart';
import 'package:dashboard/screens/supplier_offers/data/models/supplier_offers_response.dart';
import 'package:dashboard/screens/supplier_offers/data/models/update_supplier_offer_request.dart';

abstract class SupplierOffersRepository {
  Future<ApiResult<dynamic>> createSupplierOffer(
    CreateSupplierOfferRequest request,
  );

  Future<ApiResult<void>> deleteSupplierOffer(int id);

  Future<ApiResult<SupplierOffersResponse>> getSupplierOffers({
    int? supplierProductId,
    String? status,
  });

  Future<ApiResult<dynamic>> updateSupplierOffer(
    UpdateSupplierOfferRequest request,
  );
}
