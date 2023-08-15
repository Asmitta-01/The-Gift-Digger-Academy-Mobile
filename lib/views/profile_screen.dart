import 'package:demo_tdgacademy/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:demo_tdgacademy/theme/app_theme.dart';

import 'package:demo_tdgacademy/images.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late ProfileController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = FxControllerStore.putOrFind(ProfileController());
  }

  Widget _buildSingleSetting(
      String setting, String subSetting, IconData icon, Color? color) {
    return Padding(
      padding: FxSpacing.y(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color),
          FxSpacing.width(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.titleSmall(setting, fontWeight: 600, color: color),
              FxSpacing.height(4),
              FxText.bodySmall(
                subSetting,
                fontWeight: 600,
                xMuted: true,
                fontSize: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProfileController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: LoadingEffect.getSearchLoadingScreen(context),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.x(20),
          child: Column(
            children: [
              Center(
                child: FxContainer(
                  onTap: () {
                    controller.goToEditProfile();
                  },
                  color: Colors.transparent,
                  paddingAll: 0,
                  borderRadiusAll: 4,
                  height: 100,
                  width: 100,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60)),
                        child: Image(
                          height: 100,
                          width: 100,
                          image: AssetImage(Images.learningProfile),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: FxCard(
                          paddingAll: 2,
                          borderRadiusAll: 4,
                          clipBehavior: Clip.none,
                          child: FxContainer(
                            paddingAll: 4,
                            borderRadiusAll: 4,
                            color: theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FxSpacing.height(20),
              FxText.bodyLarge(
                'Brayan Tiwa',
                fontWeight: 700,
              ),
              FxSpacing.height(20),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        FxText.bodyMedium(
                          '22',
                          fontWeight: 700,
                        ),
                        FxSpacing.height(6),
                        FxText.bodySmall(
                          'Cours',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        FxText.bodyMedium(
                          '15',
                          fontWeight: 700,
                        ),
                        FxSpacing.height(6),
                        FxText.bodySmall(
                          'Formateurs',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        FxText.bodyMedium(
                          '38',
                          fontWeight: 700,
                        ),
                        FxSpacing.height(6),
                        FxText.bodySmall(
                          'Amis',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              const Divider(),
              _buildSingleSetting('Preferences', 'Themes, Paramètres',
                  FeatherIcons.settings, theme.colorScheme.onBackground),
              const Divider(),
              _buildSingleSetting(
                  'Notification',
                  'Sonnerie, Message, Notification',
                  FeatherIcons.bell,
                  theme.colorScheme.onBackground),
              const Divider(),
              _buildSingleSetting('Aide', 'Contactez Nous',
                  FeatherIcons.messageCircle, theme.colorScheme.onBackground),
              const Divider(),
              _buildSingleSetting('A Propos', 'A propos de l\'application',
                  FeatherIcons.alertCircle, theme.colorScheme.onBackground),
              const Divider(),
              InkWell(
                onTap: () {
                  controller.logout();
                },
                child: _buildSingleSetting('Déconnexion', 'Terminer la session',
                    FeatherIcons.logOut, theme.colorScheme.primary),
              ),
            ],
          ),
        ),
      );
    }
  }
}
