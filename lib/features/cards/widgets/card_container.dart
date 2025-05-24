import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_type_detector/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/cards/blocs/card_event.dart';
import 'package:store_app/features/cards/blocs/card_state.dart';
import '../blocs/card_bloc.dart';

class CardContainer extends StatefulWidget {
  const CardContainer({super.key, required this.index, required this.groupValue, required this.onChanged});

  final int index;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        final cardNumber = state.model![widget.index].cardNumber.replaceAll('', '');
        final cardTypeList = detectCCType(cardNumber);
        final cardType = cardTypeList.isNotEmpty ? cardTypeList.first : null;
        final lastFourDigit = cardNumber.substring(cardNumber.length - 4);
        final typeLabel = getCardTypeLabel(cardType, cardNumber);
        return GestureDetector(
          onLongPress: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: Center(
                      child: Text(
                        "Important",
                        style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    content: Center(
                      child: Text(
                        "Do you want to delete your card?",
                        style: TextStyle(color: AppColors.successGreen, fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: AppColors.error, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<CardBloc>().add(DeleteCardEvent(id: state.model![widget.index].id));
                          Navigator.pop(context);
                          setState(() {

                          });
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(color: AppColors.successGreen, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
            );
          },
          child: Container(
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
                  '$typeLabel ',
                  style: TextStyle(color: AppColors.primary900, fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  ' **** **** **** $lastFourDigit',
                  style: TextStyle(color: AppColors.primary900, fontSize: 14, fontWeight: FontWeight.w500),
                ),
                RadioMenuButton<int>(value: widget.index, groupValue: widget.groupValue, onChanged: widget.onChanged, child: Text("")),
              ],
            ),
          ),
        );
      },
    );
  }

  String getCardTypeLabel(CreditCardType? type, String cardNumber) {
    final bin = cardNumber.substring(0, 6);
    final binInt = int.tryParse(bin) ?? 0;
    if (bin.startsWith('9860')) return 'Humo';
    if (bin.startsWith('8600')) return 'UzCard';
    if (bin.startsWith('4')) return 'Visa';
    if ((binInt >= 510000 && binInt <= 559999) || (binInt >= 222100 && binInt <= 272099)) return 'MasterCard';
    if ((binInt >= 601100 && binInt <= 601199) ||
        (binInt >= 622126 && binInt <= 622925) ||
        (binInt >= 644000 && binInt <= 649999) ||
        (binInt >= 650000 && binInt <= 659999)) {
      return 'Discover';
    }
    if ((binInt >= 500000 && binInt <= 509999) || (binInt >= 560000 && binInt <= 699999)) {
      return 'Maestro';
    }
    if (binInt >= 352800 && binInt <= 358999) {
      return 'JCB';
    }

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
