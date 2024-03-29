import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_reso/core/usecases/usecases.dart';
import 'package:tdd_reso/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_reso/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_reso/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:tdd_reso/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });
  const tNumberTrivia =  NumberTrivia(number: 1,text: 'test');
  test('should get trivia from repository', () async {
    when(()=> mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((realInvocation) async => const Right(tNumberTrivia));
    final result = await usecase(NoParams());
    expect(result, const Right(tNumberTrivia));
    verify(()=> mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
