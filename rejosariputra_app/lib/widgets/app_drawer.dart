import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rejosariputra_app/values/colors.dart';
import 'package:rejosariputra_app/view/home/pembelian/pembelian_list_screen.dart';
import 'package:rejosariputra_app/view/home/penjualan/penjualan_list_screen.dart';

import '../values/rejosari_putra_icon_icons.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: Text(
                'Beranda',
                style: Theme.of(context).textTheme.labelLarge?.apply(color: ColorPalette.primary),
              ),
              selected: true,
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(RejosariPutraIcons.cart),
              title: Text('Penjualan', style: Theme.of(context).textTheme.labelLarge),
              onTap: () {
                Navigator.of(context).pushNamed(PenjualanListScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(RejosariPutraIcons.shoppingBag),
              title: Text('Pembelian', style: Theme.of(context).textTheme.labelLarge),
              onTap: () {
                Navigator.of(context).pushNamed(PembelianListScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(RejosariPutraIcons.box),
              title: Text('Produk', style: Theme.of(context).textTheme.labelLarge),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(RejosariPutraIcons.contacts),
              title: Text('Kontak', style: Theme.of(context).textTheme.labelLarge),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person_outlined),
              title: Text('Profil', style: Theme.of(context).textTheme.labelLarge),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: Text('Keluar', style: Theme.of(context).textTheme.labelLarge?.apply(color: ColorPalette.error)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
