import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String jsonString = '''
    {
      "admin_settings": {
        "id": 1,
        "admin_user_id": 1,
        "website": null,
        "facebook": null,
        "twitter": null,
        "instagram": null,
        "youtube": null,
        "linkedin": null,
        "logo": "uploads/app-settings/65449bf5cac1b.png",
        "favicon": "uploads/app-settings/65449bf5cb0a7.png",
        "banner": "uploads/app-settings/65449bf5cb455.jpg",
        "banner_title": "HİKAYEMİZ",
        "banner_subtitle": "1963 Dünyada en saygın değirmen teknolojisini geliştiren İsviçreli Bühler makinelerini ve teknolojisini kullanarak kurduğu 60 ton kapasiteye sahip ilk değirmeni ile ismini aldığı Söke’de üretime başladı",
        "store_title": "Söke Un",
        "email": null,
        "phone": null,
        "address": null,
        "mail_host": null,
        "mail_port": null,
        "mail_username": null,
        "mail_password": null,
        "mail_encryption": null,
        "mail_from_address": null,
        "mail_from_name": null,
        "ios_app_version": null,
        "ios_app_link": null,
        "android_app_version": null,
        "android_app_link": null,
        "about": null,
        "terms": null,
        "privacy": null,
        "created_at": "2023-11-03T07:06:29.000000Z",
        "updated_at": "2023-11-03T07:06:29.000000Z"
      }
    }
  ''';

class AdminSettings {
  int id;
  int adminUserId;
  String? website;
  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;
  String? linkedin;
  String logo;
  String favicon;
  String banner;
  String bannerTitle;
  String bannerSubtitle;
  String storeTitle;
  String? email;
  String? phone;
  String? address;
  String? mailHost;
  String? mailPort;
  String? mailUsername;
  String? mailPassword;
  String? mailEncryption;
  String? mailFromAddress;
  String? mailFromName;
  String? iosAppVersion;
  String? iosAppLink;
  String? androidAppVersion;
  String? androidAppLink;
  String? about;
  String? terms;
  String? privacy;
  DateTime createdAt;
  DateTime updatedAt;

  AdminSettings({
    required this.id,
    required this.adminUserId,
    required this.website,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.youtube,
    required this.linkedin,
    required this.logo,
    required this.favicon,
    required this.banner,
    required this.bannerTitle,
    required this.bannerSubtitle,
    required this.storeTitle,
    required this.email,
    required this.phone,
    required this.address,
    required this.mailHost,
    required this.mailPort,
    required this.mailUsername,
    required this.mailPassword,
    required this.mailEncryption,
    required this.mailFromAddress,
    required this.mailFromName,
    required this.iosAppVersion,
    required this.iosAppLink,
    required this.androidAppVersion,
    required this.androidAppLink,
    required this.about,
    required this.terms,
    required this.privacy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdminSettings.fromJson(Map<String, dynamic> json) {
    return AdminSettings(
      id: json["id"],
      adminUserId: json["admin_user_id"],
      website: json["website"],
      facebook: json["facebook"],
      twitter: json["twitter"],
      instagram: json["instagram"],
      youtube: json["youtube"],
      linkedin: json["linkedin"],
      logo: json["logo"],
      favicon: json["favicon"],
      banner: json["banner"],
      bannerTitle: json["banner_title"],
      bannerSubtitle: json["banner_subtitle"],
      storeTitle: json["store_title"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      mailHost: json["mail_host"],
      mailPort: json["mail_port"],
      mailUsername: json["mail_username"],
      mailPassword: json["mail_password"],
      mailEncryption: json["mail_encryption"],
      mailFromAddress: json["mail_from_address"],
      mailFromName: json["mail_from_name"],
      iosAppVersion: json["ios_app_version"],
      iosAppLink: json["ios_app_link"],
      androidAppVersion: json["android_app_version"],
      androidAppLink: json["android_app_link"],
      about: json["about"],
      terms: json["terms"],
      privacy: json["privacy"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  @override
  String toString() {
    return 'AdminSettings{id: $id, adminUserId: $adminUserId, website: $website, facebook: $facebook, twitter: $twitter, instagram: $instagram, youtube: $youtube, linkedin: $linkedin, logo: $logo, favicon: $favicon, banner: $banner, bannerTitle: $bannerTitle, bannerSubtitle: $bannerSubtitle, storeTitle: $storeTitle, email: $email, phone: $phone, address: $address, mailHost: $mailHost, mailPort: $mailPort, mailUsername: $mailUsername, mailPassword: $mailPassword, mailEncryption: $mailEncryption, mailFromAddress: $mailFromAddress, mailFromName: $mailFromName, iosAppVersion: $iosAppVersion, iosAppLink: $iosAppLink, androidAppVersion: $androidAppVersion, androidAppLink: $androidAppLink, about: $about, terms: $terms, privacy: $privacy, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

final adminSettingsProvider = FutureProvider<AdminSettings>((ref) async {
  await Future.delayed(Duration(seconds: 2)); // Simülasyon amaçlı bir gecikme
  Map<String, dynamic> jsonData = json.decode(jsonString);
  return AdminSettings.fromJson(jsonData['admin_settings']);
});