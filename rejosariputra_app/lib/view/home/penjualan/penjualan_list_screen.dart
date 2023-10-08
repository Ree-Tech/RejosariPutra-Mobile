import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../../values/rejosari_putra_icon_icons.dart';
import '../../../widgets/customappbar.dart';

class PenjualanListScreen extends StatelessWidget {
  static const routeName = "/penjualan-list";

  const PenjualanListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        titleText: "Penjualan",
        isBlue: false,
        isMenuAvailable: true,
        actionIcon: RejosariPutraIcons.documentPrint,
        onActionClicked: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Clicked")),
          );
        },
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              floating: true,
              snap: true,
              toolbarHeight: 80,
              flexibleSpace: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            RejosariPutraIcons.search,
                            color: ColorPalette.neutral[600],
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: ColorPalette.neutral[300]!,
                            ),
                          ),
                          isDense: true,
                          hintText: "Cari",
                          hintStyle: Theme.of(context).textTheme.bodyLarge?.apply(color: ColorPalette.neutral[600]),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(RejosariPutraIcons.filter),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: ListView.separated(
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
                InkWell(
                  highlightColor: ColorPalette.primary[200],
                  splashColor: ColorPalette.primary[100],
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "27751",
                                style: Theme.of(context).textTheme.labelMedium?.apply(color: ColorPalette.primary),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                ".UMUM",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(height: 5),
                              ...List.generate(
                                3,
                                (index) => Text(
                                  "1 x Mesin Cuci Aqua",
                                  style: Theme.of(context).textTheme.bodySmall?.apply(color: ColorPalette.neutral[500]),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "18 Mei 2023",
                                style: Theme.of(context).textTheme.bodyMedium?.apply(color: ColorPalette.neutral[500]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: ColorPalette.error,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "10.250.000",
                            style: Theme.of(context).textTheme.labelMedium?.apply(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(RejosariPutraIcons.chevronRight)
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: 30,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(RejosariPutraIcons.add),
        ),
      ),
    );
  }
}
