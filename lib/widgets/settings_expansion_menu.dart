import 'package:flutter/material.dart';

class SettingsExpansionMenu
    extends StatefulWidget {
  const SettingsExpansionMenu({super.key});

  @override
  State<SettingsExpansionMenu> createState() =>
      _SettingsExpansionMenuState();
}

class _SettingsExpansionMenuState
    extends State<SettingsExpansionMenu> {
  //Ayarları kontrol eden değişkenler
  bool notificationsEnabled = true;
  bool darkMode = false;
  bool fingerPrintEnabled = false;
  bool autoSync = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: const Text("Bildirimler"),
          leading: const Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
          children: [
            SwitchListTile(
              inactiveTrackColor: Colors.red,
              activeColor: Colors.green,
              title: Text("Bildirimleri Aç"),
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              inactiveTrackColor: Colors.red,
              activeColor: Colors.green,
              title: Text(
                "Otomatik Senkronizasyon",
              ),
              value: autoSync,
              onChanged: (value) {
                setState(() {
                  autoSync = value;
                });
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text("Tema"),
          leading: Icon(Icons.color_lens),
          children: [
            SwitchListTile(
              inactiveTrackColor: Colors.red,
              activeColor: Colors.green,
              title: const Text("Karanlık Mod"),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text("Güvenlik"),
          leading: Icon(Icons.security),
          children: [
            SwitchListTile(
              inactiveTrackColor: Colors.red,
              activeColor: Colors.green,
              title: const Text(
                "Parmak izi ile giriş",
              ),
              value: fingerPrintEnabled,
              onChanged: (value) {
                setState(() {
                  fingerPrintEnabled = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
