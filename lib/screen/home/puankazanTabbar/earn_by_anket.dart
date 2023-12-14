import 'package:flutter/material.dart';
import 'package:sokeun/model/survey_model.dart';
import 'package:sokeun/providers/survey_provider.dart';
import 'package:sokeun/screen/home/survey_question.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/utility/auth_utility.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TABS ANKET
class EarnBySurvey extends ConsumerStatefulWidget {
  const EarnBySurvey({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => EarnBySurveyState();
}

class EarnBySurveyState extends ConsumerState<EarnBySurvey> {
  late ApiService apiService;
  Future<SurveyModel?> survey() async {
    apiService = ApiService();
    final token = await AuthUtility.getToken();
    SurveyModel survey;
    try {
      var response = await apiService.post(
        "survey",
        {},
        token: token,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        survey = SurveyModel.fromJson(responseData);
        ref.read(surveyProvider.notifier).state = survey;
        showSnackBar(survey.message);
        return survey;
      } else if (response.statusCode == 401) {
        survey = SurveyModel.fromJson(response.data);
        showSnackBar(survey.message);
      } else {
        showSnackBar("Beklenmeyen bir hata oluşu.");
      }
    } catch (e) {
      print(e);
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: survey(),
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
              final survey = ref.read(surveyProvider);
              final surveyData = survey?.data ?? [];
              print("Kampanya: $survey");
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: surveyData.length,
                itemBuilder: (context, index) {
                  DateTime startDate =
                      DateTime.parse(surveyData[index].startDate ?? "");
                  DateTime endDate =
                      DateTime.parse(surveyData[index].endDate ?? "");
                  String formattedEndDate =
                      DateFormat('dd.MM.yyyy').format(endDate);
                  String formattedStartDate =
                      DateFormat('dd.MM.yyyy').format(startDate);
                  return Container(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height * 0.37,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "${surveyData[index].name}",
                                  style: const TextStyle(
                                      color: Color(0xFFCF152D),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Text(
                                "Puan:${surveyData[index].point}",
                                style: const TextStyle(
                                    color: Color(0xFFCF152D),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 9),
                          child: Divider(color: Color(0xFFCF152D)),
                        ),
                        Image.network(
                            'https://development.coneexa.com/${surveyData[index].image}',
                          ),
                        const Padding(
                          padding: EdgeInsets.only(top: 9),
                          child: Divider(
                            color: Color(0xFFCF152D),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Başlangıç / Bitiş Tarihi",
                                    style: TextStyle(
                                      color: Color(0xFFCF152D),
                                      // fontWeight: FontWeight.w600,
                                      // fontSize: 15,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SurveyQuestion(surveyData[index].id),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Ankete Başla",
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
    );
  }
}
