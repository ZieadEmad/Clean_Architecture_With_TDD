import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  final String text ;
  final int number ;
  const NumberTrivia({required this.number, required this.text}) ;
  @override
  // TODO: implement props
  List<Object?> get props => [number,text];
}