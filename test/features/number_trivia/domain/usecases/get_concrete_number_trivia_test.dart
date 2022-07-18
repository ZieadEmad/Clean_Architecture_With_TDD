import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_reso/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_reso/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_reso/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  const tNumber = 1 ;
  const tNumberTrivia =  NumberTrivia(number: tNumber,text: 'test');
  test('should get trivia for the number from repository', () async {
    when(()=> mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber)).thenAnswer((realInvocation) async => const Right(tNumberTrivia));
    final result = await usecase.execute(number: tNumber);
    expect(result, const Right(tNumberTrivia));
    verify(()=> mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
