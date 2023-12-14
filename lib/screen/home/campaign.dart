import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sokeun/model/campaign_model.dart';
import 'package:sokeun/providers/campaign_provider.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/utility/auth_utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// KAMPANYALAR SAYFASI

class CekilisPageScreen extends ConsumerStatefulWidget {
  const CekilisPageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CekilisPageScreenState();
}

class CekilisPageScreenState extends ConsumerState<CekilisPageScreen> {
  late ApiService apiService;
  Future<CampaignModel?> campaign() async {
    final token = await AuthUtility.getToken();
    apiService = ApiService();
    CampaignModel campaign;
    try {
      var response = await apiService.post(
        "campaign",
        {},
        token: token,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        campaign = CampaignModel.fromJson(responseData);
        ref.read(campaignProvider.notifier).state = campaign;
        // showSnackBar(campaign.message);
        return campaign;
      } else if (response.statusCode == 401) {
        campaign = CampaignModel.fromJson(response.data);
        showSnackBar(campaign.message);
      } else {
        showSnackBar("Beklenmeyen bir hata oluştu.");
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kampanyalar",
          style: TextStyle(
            color: Colors.red[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: campaign(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.white,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                )),
              );
            }
            return Consumer(
              builder: (context, ref, child) {
                final campaign = ref.read(campaignProvider);
                final campaignData = campaign?.data ?? [];
                print("Kampanya: $campaign");
                return ListView.builder(
                  itemCount: campaignData.length,
                  itemBuilder: (context, index) {
                    DateTime startDate =
                        DateTime.parse(campaignData[index].startdate ?? "");
                    DateTime endDate =
                        DateTime.parse(campaignData[index].finishdate ?? "");
                    String formattedStartDate =
                        DateFormat('dd.MM.yyyy').format(startDate);
                    String formattedEndDate =
                        DateFormat('dd.MM.yyyy').format(endDate);
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFCF152D),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Text(
                              "${campaignData[index].title}",
                              style: const TextStyle(
                                  color: Color(0xFFCF152D),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 9),
                            child: Divider(color: Color(0xFFCF152D)),
                          ),
                          Image.network(
                            'https://development.coneexa.com/${campaignData[index].image}',
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 9),
                            child: Divider(
                              color: Color(0xFFCF152D),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "Başlangıç / Bitiş Tarihi",
                                      style: TextStyle(
                                        color: Color(0xFFCF152D),
                                      ),
                                    ),
                                    Text(
                                      "$formattedStartDate / $formattedEndDate",
                                      style: const TextStyle(
                                        color: Color(0xFFCF152D),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    _showCustomAlert(context,
                                        campaignData[index].description);
                                  },
                                  child: const Text(
                                    "Kampanya Detayı",
                                    style: TextStyle(
                                        color: Color(0xFFCF152D),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

void _showCustomAlert(BuildContext context, String? content) {
  Alert(
    context: context,
    title: 'Kampanya Detayı',
    type: AlertType.none,
    style: AlertStyle(
      backgroundColor: Colors.white,
      titleStyle: TextStyle(
        color: Colors.red[600],
        fontWeight: FontWeight.bold,
      ),
    ),
    content: SizedBox(
      height: MediaQuery.of(context).size.height * 2 / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            content ?? "",
            style: const TextStyle(color: Colors.black,fontSize: 13),
          ),
        ],
      ),
    ),
    buttons: [
      DialogButton(
        color: const Color(0xFFCF152D),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Geri Dön",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  ).show();
}
