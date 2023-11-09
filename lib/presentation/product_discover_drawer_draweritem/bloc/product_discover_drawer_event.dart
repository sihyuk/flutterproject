// ignore_for_file: must_be_immutable

part of 'product_discover_drawer_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProductDiscoverDrawer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProductDiscoverDrawerEvent extends Equatable {}

/// Event that is dispatched when the ProductDiscoverDrawer widget is first created.
class ProductDiscoverDrawerInitialEvent extends ProductDiscoverDrawerEvent {
  @override
  List<Object?> get props => [];
}
