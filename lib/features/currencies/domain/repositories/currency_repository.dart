import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/currency.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<Currency>>> getCurrencies();
}
