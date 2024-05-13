import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:effective_mobile_test/features/all_tickets/presentation/bloc/tickets_bloc.dart';
import 'package:effective_mobile_test/features/all_tickets/presentation/widgets/ticket_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

//Полностью за хардкоженый экран
class AllTicketsScreen extends StatefulWidget {
  final String fromCity;
  final String toCity;
  final String departureDate;
  const AllTicketsScreen({
    super.key,
    required this.fromCity,
    required this.toCity,
    required this.departureDate,
  });

  @override
  State<AllTicketsScreen> createState() => _AllTicketsScreenState();
}

class _AllTicketsScreenState extends State<AllTicketsScreen> {
  @override
  void initState() {
    BlocProvider.of<TicketsBloc>(context).add(GetTicketsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildInfoContainer(context),
                const SizedBox(height: 34),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const TicketInfoContainer();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildInfoContainer(BuildContext context) {
    return Container(
      color: AppColors.grey3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: AppColors.blue,
              onPressed: () {
                context.pop();
              },
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.fromCity} - ${widget.toCity}',
                  style: AppFonts.s16w600.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "${widget.departureDate}, 1 пассажир",
                  style: AppFonts.s14w400.copyWith(
                    color: AppColors.grey7,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
