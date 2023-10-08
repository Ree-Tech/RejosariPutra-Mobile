import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rejosariputra_app/values/colors.dart';
import 'package:rejosariputra_app/view/home/catatan_keuangan_screen.dart';
import 'package:rejosariputra_app/widgets/app_drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../values/rejosari_putra_icon_icons.dart';
import '../../widgets/transaction_content.dart';
import 'pembelian/pembelian_list_screen.dart';
import 'penjualan/penjualan_list_screen.dart';

class _SalesData {
  _SalesData(this.item, this.sales);

  final String item;
  final double sales;
}

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late Animation _colorTween;

  @override
  void initState() {
    _colorAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: ColorPalette.primary).animate(_colorAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    _colorAnimationController.dispose();
    super.dispose();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 100);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    List<_SalesData> data = [
      _SalesData("Kulkas 2 Pintu", 35),
      _SalesData("TV 98 Inch", 28),
      _SalesData("Kipas Angin Cosmos", 24),
      _SalesData("Bor Kayu", 23),
      _SalesData("Chainsaw", 21),
      _SalesData("Microwave Top", 18),
      _SalesData("Freezer Cool", 12),
      _SalesData("Speaker Boom Active", 8),
      _SalesData("Lenovo Legion D412", 8),
      _SalesData("ASUS TUF A15", 6),
    ];

    Widget buildCta(
      MaterialColor iconColor,
      IconData icon,
      Function onPressed,
      String caption,
    ) {
      return Expanded(
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                iconColor: iconColor[800],
              ),
              onPressed: () => onPressed(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: iconColor[300],
                    ),
                    child: Icon(icon),
                  ),
                  Text(
                    caption,
                    style: Theme.of(context).textTheme.bodySmall?.apply(color: ColorPalette.neutral[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const CustomAppDrawer(),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
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
                      transform: Matrix4.translationValues(0, -(MediaQuery.of(context).size.height * 0.1), 0),
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        "assets/images/pattern.svg",
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: "assets/images/placeholder.png",
                                    image: "https://picsum.photos/250?image=9",
                                    height: 50,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Anda Bagas Aprianto",
                                      style: Theme.of(context).textTheme.labelLarge?.apply(
                                            color: Colors.white,
                                          ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            alignment: PlaceholderAlignment.middle,
                                            child: Container(
                                              margin: const EdgeInsets.only(right: 5),
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                color: ColorPalette.primary[300],
                                                borderRadius: BorderRadius.circular(500),
                                              ),
                                              child: Text(
                                                "Kasir",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.apply(color: ColorPalette.primary[800]),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Toko Cabang 1",
                                            style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Card(
                              margin: EdgeInsets.zero,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    buildCta(
                                      ColorPalette.success,
                                      RejosariPutraIcons.cart,
                                      () => Navigator.of(context).pushNamed(PenjualanListScreen.routeName),
                                      "Penjualan",
                                    ),
                                    buildCta(
                                      ColorPalette.primary,
                                      RejosariPutraIcons.shoppingBag,
                                      () => Navigator.of(context).pushNamed(PembelianListScreen.routeName),
                                      "Pembelian",
                                    ),
                                    buildCta(
                                      ColorPalette.error,
                                      RejosariPutraIcons.box,
                                      () {},
                                      "Barang",
                                    ),
                                    buildCta(
                                      ColorPalette.warning,
                                      RejosariPutraIcons.contacts,
                                      () {},
                                      "Kontak",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Catatan Keuangan",
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pushNamed(CatatanKeuanganScreen.routeName),
                                  child: Text(
                                    "Lihat Detail",
                                    style: Theme.of(context).textTheme.bodyMedium?.apply(color: ColorPalette.primary),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Card(
                              elevation: 3,
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const TransactionContent(
                                income: 8000000,
                                outcome: 25000000,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "Performa Bisnis",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 30),
                            Card(
                              margin: EdgeInsets.zero,
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "10 Penjualan Terbanyak",
                                      style: Theme.of(context).textTheme.labelMedium?.apply(color: ColorPalette.primary),
                                    ),
                                    Text(
                                      "Bulan Mei 2023",
                                      style: Theme.of(context).textTheme.bodySmall?.apply(color: ColorPalette.neutral[500]),
                                    ),
                                    const SizedBox(height: 20),
                                    SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      tooltipBehavior: TooltipBehavior(enable: true),
                                      series: <ChartSeries<_SalesData, String>>[
                                        ColumnSeries<_SalesData, String>(
                                          dataSource: data,
                                          xValueMapper: (_SalesData sales, _) => sales.item,
                                          yValueMapper: (_SalesData sales, _) => sales.sales,
                                          name: 'Sales',
                                          // Enable data label
                                          dataLabelSettings: const DataLabelSettings(isVisible: true),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: AnimatedBuilder(
                  animation: _colorAnimationController,
                  builder: (context, child) => AppBar(
                    elevation: _colorTween.value == ColorPalette.primary ? 5 : 0,
                    toolbarHeight: 80,
                    centerTitle: true,
                    backgroundColor: _colorTween.value,
                    title: Text(
                      "Rejosari Putra",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.apply(
                            color: Colors.white,
                          ),
                    ),
                    leading: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(RejosariPutraIcons.navigation),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        );
                      },
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(RejosariPutraIcons.alert),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
