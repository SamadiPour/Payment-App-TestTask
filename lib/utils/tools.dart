import 'package:intl/intl.dart';

String formatPrice(num price) {
  return NumberFormat("#,###", "en_uk").format(price);
}
