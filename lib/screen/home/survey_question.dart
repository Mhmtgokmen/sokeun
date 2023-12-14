import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sokeun/providers/survey_provider.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:sokeun/utility/auth_utility.dart';

class SurveyQuestion extends ConsumerStatefulWidget {
  const SurveyQuestion(this.surveyId, {super.key});
  final int? surveyId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SurveyQuestionState();
}

class _SurveyQuestionState extends ConsumerState<SurveyQuestion> {
  List<int?> selectedAnswersId = [];
  List<int?> selectedQuestionsId = [];
  late ApiService apiService;
  Future<void> surverAnswers(
    int? surveyId,
    List<int?> selectedAnswersId,
    List<int?> selectedQuestionsId,
  ) async {
    apiService = ApiService();
    final token = await AuthUtility.getToken();
    Map<String, dynamic> data = {
      "survey_id": surveyId,
      "questions_id": selectedQuestionsId,
      "answers_id": selectedAnswersId
    };
    try {
      var response = await apiService.post(
        "survey/result",
        data,
        token: token,
      );
      if (response.statusCode == 200) {
        showSnackBar(response.data['message']);
        //anket başarıyla tamamlandığında sayfa kapanacak
        // Navigator.pop(context);
      } else if (response.statusCode == 404) {
        showSnackBar(response.data['message']);
        // Navigator.pop(context);
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
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
    var ekranAyari = MediaQuery.of(context);
    var ekrangenisligi = ekranAyari.size.width;
    var ekranyukseklikayari = ekranAyari.size.height;
    final survey = ref.watch(surveyProvider)!.data;
    final selectedSurvey =
        survey!.firstWhere((data) => data.id == widget.surveyId);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Anket Soruları",
          style: TextStyle(
            color: Colors.red[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: selectedSurvey.surveyQuestions!.length,
                  itemBuilder: (context, index) {
                    final question = selectedSurvey.surveyQuestions![index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFCF152D),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            question.question ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: question.surveyQuestionOptions?.length,
                            itemBuilder: (context, optionIndex) {
                              final options =
                                  question.surveyQuestionOptions?[optionIndex];
                              final isSelectedAnswer =
                                  selectedAnswersId.contains(options!.id);
                              return Container(
                                margin: const EdgeInsets.only(top: 18),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFC1C1C1)),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      options.option ?? "",
                                      style: const TextStyle(
                                        color: Color(0xFFC1C1C1),
                                        fontSize: 16,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (isSelectedAnswer) {
                                            selectedQuestionsId
                                                .remove(question.id);
                                            selectedAnswersId
                                                .remove(options.id);
                                          } else {
                                            selectedQuestionsId
                                                .add(question.id);
                                            selectedAnswersId.add(options.id);
                                          }
                                          print(
                                              "Soru İD:${selectedQuestionsId}");
                                          print(
                                              "seçenek id:${selectedAnswersId}");
                                        });
                                      },
                                      child: Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFC1C1C1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: isSelectedAnswer
                                              ? const Color(0xFF6AC259)
                                              : Colors.transparent,
                                        ),
                                        child: Icon(
                                          Icons.done,
                                          color: isSelectedAnswer
                                              ? Colors.white
                                              : const Color(0xFFE92E30),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  width: ekrangenisligi / 1.2,
                  height: ekranyukseklikayari / 14,
                  child: InkWell(
                    onTap: () {
                      surverAnswers(widget.surveyId, selectedAnswersId,
                          selectedQuestionsId);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.red[800],
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bitir",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
