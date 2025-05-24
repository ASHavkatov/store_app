import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_type_detector/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/cards/blocs/card_state.dart';
import '../blocs/card_bloc.dart';

class CardContainer extends StatefulWidget {
  const CardContainer({super.key, required this.index});

  final int index;

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  String selectedValue = 'A';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        final cardNumber = state.model![widget.index].cardNumber.replaceAll('', '');
        final cardTypeList = detectCCType(cardNumber);
        final cardType = cardTypeList.isNotEmpty ? cardTypeList.first : null;
        final lastFourDigit = cardNumber.substring(cardNumber.length - 4);
        final typeLabel = getCardTypeLabel(cardType);
        return Container(
          width: double.infinity,
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.primary100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$typeLabel  **** **** **** $lastFourDigit',
                style: TextStyle(color: AppColors.primary900, fontSize: 14, fontWeight: FontWeight.w500),
              ),
              RadioMenuButton<String>(
                value: 'B',
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
                child: Text(""),
              ),
            ],
          ),
        );
      },
    );
  }

  String getCardTypeLabel(CreditCardType? type) {
    switch (type) {
      case CreditCardType.visa:
        return 'VISA';
      case CreditCardType.mastercard:
        return 'MasterCard';
      case CreditCardType.discover:
        return 'Discover';
      case CreditCardType.maestro:
        return 'Maestro';
      case CreditCardType.jcb:
        return 'JCB';
      default:
        return 'Card';
    }
  }
}
