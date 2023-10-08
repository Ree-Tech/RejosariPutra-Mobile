import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:rejosariputra_app/values/rejosari_putra_icon_icons.dart';

import '../../values/colors.dart';
import '../../widgets/customappbar.dart';
import '../../widgets/transaction_content.dart';

const filters = [
  Padding(
    padding: EdgeInsets.all(10.0),
    child: Text('Semua'),
  ),
  Text('Bulan Ini'),
  Text('Bulan Lalu'),
];

class CatatanKeuanganScreen extends StatefulWidget {
  static const routeName = "/catatan-keuangan";

  const CatatanKeuanganScreen({super.key});

  @override
  State<CatatanKeuanganScreen> createState() => _CatatanKeuanganScreenState();
}

class _CatatanKeuanganScreenState extends State<CatatanKeuanganScreen> {
  final _selectedFilter = [true, false, false];
  final _filters = ["Semua", "Bulan Ini", "Bulan Lalu"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        context,
        isBlue: true,
        titleText: "Catatan Keuangan",
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: ColorPalette.primary,
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.1,
                        ),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    transform: Matrix4.translationValues(0, -(MediaQuery.of(context).size.height * 0.15), 0),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const TransactionContent(
                            income: 8000000,
                            outcome: 25000000,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                                  lastDate: DateTime.now(),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size.square(12),
                                foregroundColor: ColorPalette.neutral[500],
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: ColorPalette.neutral[300]!,
                                  ),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Icon(RejosariPutraIcons.calendar),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ...List.generate(3, (index) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedFilter.forEachIndexed((filterIndex, element) {
                                          _selectedFilter[filterIndex] = index == filterIndex;
                                        });
                                      });
                                    },
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        color: _selectedFilter[index] ? ColorPalette.primary[100] : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: _selectedFilter[index] ? ColorPalette.primary : ColorPalette.neutral[300]!,
                                        ),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                        child: Text(
                                          _filters[index],
                                          style: Theme.of(context).textTheme.bodyMedium?.apply(
                                                color: _selectedFilter[index] ? ColorPalette.primary : ColorPalette.neutral[500],
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) => index % 6 != 5 ? const Divider() : Container(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                if (index % 6 == 0)
                  Container(
                    color: ColorPalette.primary[100],
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "MEI 2023",
                      style: Theme.of(context).textTheme.labelSmall?.apply(color: ColorPalette.primary),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              "Pak Joko",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(height: 5),
                            ...List.generate(
                              2,
                              (index) => Text(
                                "1 x Mesin Cuci Aqua",
                                style: Theme.of(context).textTheme.bodySmall?.apply(color: ColorPalette.neutral[500]),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Row(
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
                                    text: "Rp. 0",
                                    style: Theme.of(context).textTheme.bodySmall?.apply(color: ColorPalette.success),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 5),
                                      child: Icon(
                                        RejosariPutraIcons.arrowUp,
                                        color: ColorPalette.error[500]!,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Rp. 2.050.000",
                                    style: Theme.of(context).textTheme.bodySmall?.apply(color: ColorPalette.error[500]),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          itemCount: 30,
        ),
      ),
    );
  }
}
