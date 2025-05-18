import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/authentication/verification/widgets/reset_password_app_bar.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/new_card/blocs/new_card_bloc.dart';

import '../blocs/new_card_state.dart';


class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  StoreAppAppBar(title: "New Card", isTrue: true),
      body: BlocBuilder<NewCardBloc, NewCardState>(builder: (context, state) {
        return switch(state.status) {
          NewCardStatus.error => Center(child: Text("Xatolik bor"),),
          NewCardStatus.loading => Center(child: CircularProgressIndicator(),),
          NewCardStatus.idle => Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckoutTitle(title: "Add Debit or Credit Card"),
              ],
            ),
          ),
        };
      }),
    );
  }
}
