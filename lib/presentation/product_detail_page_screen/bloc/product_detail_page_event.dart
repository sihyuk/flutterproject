// ignore_for_file: must_be_immutable

part of 'product_detail_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProductDetailPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProductDetailPageEvent extends Equatable {}

/// Event that is dispatched when the ProductDetailPage widget is first created.
class ProductDetailPageInitialEvent extends ProductDetailPageEvent {
  @override
  List<Object?> get props => [];
}
