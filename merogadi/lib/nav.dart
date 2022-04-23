import 'package:flutter/material.dart';
import 'package:merogadi/about.dart';
import 'package:merogadi/contactus.dart';
import 'package:merogadi/favourite.dart';
import 'package:merogadi/terms_and_cond.dart';
import 'package:share_plus/share_plus.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff18203d),
            ),
            accountName: const Text(
              'Merogadi',
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: const Text('www.merogadi.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/logo.jpg",
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
              size: 24,
            ),
            title: const Text(
              'Favorites',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FavCenter())),
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              size: 24,
            ),
            title: const Text(
              'Share',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () async {
              const weburl =
                  'https://play.google.com/store/apps/details?id=com.facebook.katana';

              await Share.share('Merogadi on Playstore\n $weburl');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.call,
              size: 24,
            ),
            title: const Text(
              'Contact us',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactUs())),
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.quiz_sharp,
          //     size: 24,
          //   ),
          //   title: const Text(
          //     'FAQ',
          //     style: TextStyle(fontSize: 18),
          //   ),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: const Icon(
              Icons.info,
              size: 24,
            ),
            title: const Text(
              'About',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUs())),
          ),
          ListTile(
            leading: const Icon(
              Icons.description,
              size: 24,
            ),
            title: const Text(
              'Terms and Condition',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TermsCond())),
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.settings,
          //     size: 24,
          //   ),
          //   title: const Text(
          //     'Settings',
          //     style: TextStyle(fontSize: 18),
          //   ),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          const Text(
            'Developed By Bibek Shrestha',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
