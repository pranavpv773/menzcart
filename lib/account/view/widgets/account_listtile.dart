import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_circle_right_outlined),
    );
  }
}

class AcountUserSection extends StatelessWidget {
  const AcountUserSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: kWhite,
      child: Column(
        children: const [
          AccountListTile(
            title: 'Orders',
            subtitle: 'Check your order status',
            icon: Icons.wallet_giftcard_rounded,
          ),
          AccountListTile(
            title: 'Help',
            subtitle: 'Help regarding your purchases',
            icon: Icons.live_help_outlined,
          ),
          AccountListTile(
            title: 'Wish List',
            subtitle: 'Your Most Loved Items',
            icon: Icons.favorite_border_outlined,
          ),
        ],
      ),
    );
  }
}
