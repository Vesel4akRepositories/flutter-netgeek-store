import 'package:injectable/injectable.dart';
import 'package:netgeek/core/network/api_helper.dart';
import 'package:netgeek/features/cart/models/product_cart_item.dart';
import 'package:netgeek/features/products/models/product.dart';

@injectable
class CheckoutRepository {
  final HttpManager _httpManager;

  CheckoutRepository(this._httpManager);

  Future<void> createOrder(List<ProductCartItem> products) async {
    try {
      await _httpManager.post(
        'orders/create/',
        data: {
          'order_products': products
              .map((e) => {
                    'product': e.id,
                    'quantity': e.quantity,
                    'price': e.price,
                  })
              .toList(),
        },
      );
      // await _httpManager.get(
      //   'orders/',
      //
      // );
    } catch (_) {
      rethrow;
    }
  }
}
