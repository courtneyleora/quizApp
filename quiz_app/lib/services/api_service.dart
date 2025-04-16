import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question.dart';

class ApiService {
  // Fetches a list of trivia questions from the Open Trivia Database
  static Future<List<Question>> fetchQuestions() async {
    final url = Uri.parse(
      'https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Parse the question data into a list of Question objects
        List<Question> questions =
            (data['results'] as List)
                .map((questionData) => Question.fromJson(questionData))
                .toList();

        return questions;
      } else {
        throw Exception('Failed to load questions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching questions: $e');
    }
  }
}
