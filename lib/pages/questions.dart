class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "How do you generally feel on a daily basis?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));

  list.add(Question(
    "Have you recently experienced changes in your mood or energy level?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));

  list.add(Question(
    "Have you noticed any changes in your appetite, sleep, or motivation?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));

  list.add(Question(
    "Do you have trouble concentrating or making decisions?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));
  list.add(Question(
    "Have you felt anxious, nervous, or restless recently?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));
  list.add(Question(
    "Do you have sad, depressed or suicidal thoughts?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));  list.add(Question(
    "Do you have any unusual sensations, such as hallucinations or thoughts of persecution?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));  list.add(Question(
    "Do you have a family history of mental disorders?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));  list.add(Question(
    "Have you recently experienced a stressful or traumatic event?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));  list.add(Question(
    "Do you have difficulty dealing with daily stress?",
    [
      Answer("always", true),
      Answer("sometimes", false),
      Answer("never", false),
    ],
  ));






  return list;
}