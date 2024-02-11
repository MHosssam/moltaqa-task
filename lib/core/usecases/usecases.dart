import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:task/core/error/failures.dart';

abstract class UseCase<Type, model> {
  Future<Either<Failure, Type>> call(model model);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
