
class FAQs {
  late int id;
  late String questionEn;
  late String questionAr;
  late String answerEn;
  late String answerAr;


  FAQs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionAr = json['question_ar'];
    answerEn = json['answer_en'];
    answerAr = json['answer_ar'];
  }
}