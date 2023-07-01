// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final String category;
  final int totalQuestions;
  final String timer;
  final List<Map<String, Object>> questions;
  Question({
    required this.category,
    required this.totalQuestions,
    required this.timer,
    required this.questions,
  });
}

List<Question> q = [
  Question(
    category: 'Physics',
    totalQuestions: 25,
    timer: '',
    questions: [
      {
        "q1":
            "A force F a applied on the upper pulley as shown in the figure if F =3t",
        "imageUrl": "image",
        "options": {
          "a": "1 sec",
          "b": "1.66 sec",
          "c": "2 sec",
          "d": "None of these"
        },
        "ans": "a"
      }
    ],
  )
];

class QuestionModel {
  String? question;
  Map<String, String>? answers;
  QuestionModel(this.question, this.answers);
}

List<QuestionModel> questions = [
  QuestionModel(
    'Kinetic energy of electron, proton and -particle is given as k, 2k and 4k respectively then which of the following gives the correct order of de-Broglie wavelength of electron, proton and -particle?',
    {
      "1": 'λp > λ > λe',
      "2": 'λ > λp > λe',
      "3": 'λe > λp > λ',
      "4": 'λe > λ > λp',
    },
  ),
  QuestionModel(
      "If the height of a tower used for LOS communication is increased by 21%. The percentage change in range is",
      {
        "1": '5%',
        "2": '10%',
        "3": '15%',
        "4": '12%',
      }),
  QuestionModel(
      "On a planet  (mass density) is same as that of earth while mass of planet is twice than that of earth. Ratio of weight of a body on surface of planet to that on earth is equal to?",
      {
        "1": '1',
        "2": '(2)^1/3',
        "3": '(2)^–1/3',
        "4": '2',
      }),
  QuestionModel(
      "Find the radius of the orbit corresponding to the 4th excited state in Li++. (a0 is the radius of first orbit in H-atom)",
      {
        "1": '25/3 a0',
        "2": '16/3a0',
        "3": '25a0',
        "4": '12a0',
      }),
  QuestionModel(
      " A ray undergoes refraction at boundary of a medium such tha incident angle is 45° while refraction angel is 30°. Wavelength and frequency of incident ray are λ1 and λ1 while for refracted ray are λ2 and λ2, then",
      {
        "1": 'λ',
        "2": '5λ',
        "3": '2λ',
        "4": '4',
      }),
  QuestionModel(
      " In an EM wave ratio of average electric field and magnetic field energy density in a region of wave is equal to",
      {
        "1": '2e0/u0C^2',
        "2": 'C^2e0/u0',
        "3": '1:1',
        "4": 'e0/2u0C^2',
      }),
  QuestionModel(
      "Assertion (A): Earth has atmosphere and moon doesn’t.Reason (R): Escape speed on moon is less than that of earth.",
      {
        "1":
            '(A) and (R) are correct and (R) is the correct explanation of (A)',
        "2":
            '(A) and (R) are correct but (R) is not the correct explanation of (A)',
        "3": '(A) is true, but (R) is false',
        "4": '(A) and (R), both are false',
      }),
];
