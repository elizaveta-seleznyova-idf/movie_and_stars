import 'package:flutter/material.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/screen/tickets/tickets_data.dart';

abstract class TicketsBloc extends Bloc<BaseArguments, TicketsData> {
  factory TicketsBloc() => _TicketsBloc();

  TextEditingController get cartNumberController;

  TextEditingController get dateExpireController;

  TextEditingController get cvvController;

  GlobalKey get ticketsScreenFormKey;
}

class _TicketsBloc extends BlocImpl<BaseArguments, TicketsData>
    implements TicketsBloc {
  _TicketsBloc();

  final TextEditingController _cartNumberController = TextEditingController();
  final TextEditingController _dateExpireController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final GlobalKey<FormState> _ticketsScreenFormKey = GlobalKey<FormState>();

  @override
  TextEditingController get cartNumberController => _cartNumberController;

  @override
  TextEditingController get dateExpireController => _dateExpireController;

  @override
  TextEditingController get cvvController => _cvvController;

  @override
  GlobalKey get ticketsScreenFormKey => _ticketsScreenFormKey;
}
