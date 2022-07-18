import 'package:dartz/dartz.dart';
import 'package:tdd_reso/core/error/failures.dart';
import 'package:tdd_reso/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
}