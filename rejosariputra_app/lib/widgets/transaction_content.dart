import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../values/colors.dart';
import '../values/rejosari_putra_icon_icons.dart';

class TransactionContent extends StatelessWidget {
  final int income;
  final int outcome;

  const TransactionContent({super.key, required this.income, required this.outcome});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: "id_ID",
      symbol: "Rp. ",
      decimalDigits: 0,
    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    RejosariPutraIcons.arrowDown,
                                    color: ColorPalette.success,
                                    size: 12,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: "Pemasukan",
                                style: Theme.of(context).textTheme.bodyMedium?.apply(color: ColorPalette.neutral[500]),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          currencyFormatter.format(income),
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    color: ColorPalette.neutral[300],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    RejosariPutraIcons.arrowUp,
                                    color: ColorPalette.error,
                                    size: 12,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: "Pengeluaran",
                                style: Theme.of(context).textTheme.bodyMedium?.apply(color: ColorPalette.neutral[500]),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          currencyFormatter.format(outcome),
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 1,
            color: ColorPalette.neutral[300],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Selisih  ",
                    style: Theme.of(context).textTheme.bodyMedium?.apply(color: ColorPalette.neutral[500]),
                  ),
                  TextSpan(
                    text: currencyFormatter.format(income - outcome),
                    style: Theme.of(context).textTheme.labelLarge?.apply(color: ColorPalette.primary),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
