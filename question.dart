//The model for all food items in the game

class Question {
  final String picture;
  final String question;
  final String answer;

  const Question(
      {this.picture,
        this.question,
        this.answer,
      });

  Question.fromMap(Map<String, dynamic> data)
      : this(
    picture: data['picture'],
    question: data['question'],
    answer: data['answer'],
  );
}
