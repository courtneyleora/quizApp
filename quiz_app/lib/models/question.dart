class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  // Constructor
  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  // Factory method to create a Question from JSON
  factory Question.fromJson(Map<String, dynamic> json) {
    // Combine incorrect and correct answers
    List<String> options = List<String>.from(json['incorrect_answers']);
    options.add(json['correct_answer']);
    options.shuffle(); // Shuffle to randomize answer order

    return Question(
      question: json['question'],
      options: options,
      correctAnswer: json['correct_answer'],
    );
  }
}
