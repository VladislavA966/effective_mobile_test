import 'package:effective_mobile_test/config/routes.dart';
import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:effective_mobile_test/features/country_selected_scree/presentation/bloc/tickets_offer_bloc.dart';
import 'package:effective_mobile_test/features/country_selected_scree/presentation/widgets/date_time_widget.dart';
import 'package:effective_mobile_test/features/country_selected_scree/presentation/widgets/tickets_container.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/decaration_container.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/grey_divider.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/main_button.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/text_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CountrySelectedScreen extends StatefulWidget {
  final String toController;
  final String fromController;
  const CountrySelectedScreen(
      {super.key, required this.toController, required this.fromController});

  @override
  State<CountrySelectedScreen> createState() => _CountrySelectedScreenState();
}

class _CountrySelectedScreenState extends State<CountrySelectedScreen> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  @override
  void initState() {
    fromController.text = widget.fromController;
    toController.text = widget.toController;
    _getTicketOffers();
    super.initState();
  }

  void _getTicketOffers() {
    context.read<TicketsOfferBloc>().add(GetTicketsOfferEvent());
  }

  DateTime departureDate = DateTime.now();
  DateTime? backDate;

  void _selectDate(
      DateTime? currentDate, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != currentDate) {
      setState(() {
        onDateSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),
                _buildTextFields(context),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _backDateButton(),
                    const SizedBox(width: 8),
                    _departureDateButton(),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTicketOffers(),
                const SizedBox(height: 24),
                _buildMainButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  DateButton _departureDateButton() {
    return DateButton(
      date: departureDate,
      onPressed: () =>
          _selectDate(departureDate, (newDate) => departureDate = newDate),
    );
  }

  DateButton _backDateButton() {
    return DateButton(
      date: backDate,
      onPressed: () => _selectDate(backDate, (newDate) => backDate = newDate),
    );
  }

  MainButton _buildMainButton() {
    return MainButton(
      title: 'Посмотреть все билеты',
      onPressed: _goToAllTicketsScreen,
      color: AppColors.blue,
    );
  }

  void _goToAllTicketsScreen() {
    context.goNamed(
      Routes.allTicketsScreen.name,
      queryParameters: {
        "fromCity": fromController.text,
        "toCity": toController.text,
        "departureDate": DateFormat.MMMMEEEEd().format(departureDate)
      },
    );
  }

  Widget _buildTicketOffers() {
    return BlocBuilder<TicketsOfferBloc, TicketsOfferState>(
      builder: (context, state) {
        if (state is TicketsOfferLoaded) {
          return DecorationContainer(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: 8),
                _buildOfferTickets(state),
                const GreyDivider(),
                _buildTextButton(),
              ],
            ),
          );
        } else if (state is TicketsOfferLoading) {
          return const CircularProgressIndicator();
        }
        return const SizedBox();
      },
    );
  }

  ListView _buildOfferTickets(TicketsOfferLoaded state) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final timeRange =
            state.ticketOffers.offers[index].timeRange?.join(', ');
        return _buildTicketContainer(state, index, timeRange);
      },
      separatorBuilder: (context, index) => const GreyDivider(),
      itemCount: state.ticketOffers.offers.length,
    );
  }

  TicketContainer _buildTicketContainer(
      TicketsOfferLoaded state, int index, String? timeRange) {
    return TicketContainer(
      price: state.ticketOffers.offers[index].price.value,
      lines: state.ticketOffers.offers[index].title,
      timeRange: timeRange ?? '',
    );
  }

  Text _buildTitle() {
    return Text(
      'Прямые рейсы',
      style: AppFonts.s22w600.copyWith(
        color: AppColors.white,
      ),
    );
  }

  Center _buildTextButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Показать все',
          style: AppFonts.s16w600.copyWith(
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }

  TextFieldsContainer _buildTextFields(BuildContext context) {
    return TextFieldsContainer(
      fromSuffix: IconButton(
        onPressed: _changeControllerValue,
        icon: const Icon(
          Icons.change_history_outlined,
          color: AppColors.white,
        ),
      ),
      toSuffix: IconButton(
        onPressed: _cleanToController,
        icon: const Icon(
          Icons.close,
          color: AppColors.white,
        ),
      ),
      fromController: fromController,
      toController: toController,
      readOnly: true,
      icon: IconButton(
        onPressed: _goToPrevPage,
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
      ),
    );
  }

  void _goToPrevPage() {
    context.pop();
  }

  void _cleanToController() {
    setState(() {
      toController.text = '';
    });
  }

  void _changeControllerValue() {
    final temp = fromController.text;
    fromController.text = toController.text;
    toController.text = temp;
  }
}
