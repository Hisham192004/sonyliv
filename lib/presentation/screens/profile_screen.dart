import 'package:flutter/material.dart';
import 'package:sonyliv/presentation/screens/notificationscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Profile & Settings",
          style: TextStyle(fontSize: 20),
        ),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.person, color: Colors.white, size: 35),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Guest",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text("For personalized experience",
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text("Sign in"),
                ),
              ],
            ),
          ),
          _buildSettingItem(
  icon: CircleAvatar(
    radius: 30,
    backgroundColor: Colors.black,
    child: Image.asset(
      'assets/premium1.png',
      height: 400,
      width: 400,
    ),
  ),
  title: "Subscribe Now",
  subtitle: "Access our 400+ Premium shows & originals",
),
          const Divider(color: Colors.grey,indent: 10,endIndent: 10,thickness: 1),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text("Saved Videos",style: TextStyle(color: Colors.grey)),
          ),

          _buildSettingItem(
            icon: const Icon(Icons.add, color: Colors.white),
            title: "Watch List",
            subtitle: "View and manage your watchlist",
          ),
           const Divider(color: Colors.grey,indent: 10,endIndent: 10,thickness: 1),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             child: Text("Account & Activation",style: TextStyle(color: Colors.grey),),
           ),
          _buildSettingItem(
            icon: const Icon(Icons.live_tv_rounded, color: Colors.white),
            title: "Activate TV",
            subtitle: "Connect and manage TV settings",
          ),
           const Divider(color: Colors.grey,indent: 10,endIndent: 10,thickness: 1,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             child: Text("Settings & Support",style: TextStyle(color: Colors.grey)),
           ),
          _buildSettingItem(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            title: "Settings",
            subtitle: "Video quality, streaming, PIP mode & subtitles",
          ),
          _buildSettingItem(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            title: "Help Center",
            subtitle: "FAQ’s, terms & conditions and privacy policy",
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "Version: 8.4.6",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required Widget icon,
    required String title,
    String? subtitle,
  }) {
    return ListTile(
      leading: icon,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12))
          : null,
      trailing: const Icon(Icons.arrow_forward_ios,
          color: Colors.white, size: 16),
      onTap: () {},
    );
  }
}
