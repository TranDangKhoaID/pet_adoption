import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:pet_adoption/screens/setting/component/avatar_card.dart';
import 'package:pet_adoption/screens/setting/component/setting_tile.dart';
import 'package:pet_adoption/screens/setting/component/support_card.dart';
import 'package:pet_adoption/service/auth_service.dart';
import 'package:pet_adoption/storage/app_shared.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarCard(
                  name: AppPreferences.instance.getFullName().toString(),
                  email: AppPreferences.instance.getEmail().toString(),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: [
                    SettingTile(
                      title: "Tài khoản",
                      icon: CupertinoIcons.person_fill,
                    ),
                    SettingTile(title: "Mục yêu thích", icon: Icons.favorite),
                    SettingTile(
                      title: "Đăng xuất",
                      icon: Icons.logout,
                      onTap: () => AuthService().signOut(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: [
                    SettingTile(
                      title: "Chia sẽ ứng dụng",
                      icon: CupertinoIcons.share,
                    ),
                    SettingTile(
                      title: "Chính sách bảo mật",
                      icon: Icons.privacy_tip,
                    ),
                    SettingTile(
                      title: "Các điều khoản và điều kiện",
                      icon: Icons.bookmark,
                    ),
                    SettingTile(
                      title: "Cộng đồng",
                      icon: CupertinoIcons.person_3_fill,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //const SupportCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
