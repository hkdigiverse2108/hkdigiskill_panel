class FaqModel {
  final int id;
  final String question;
  final String answer;
  final bool isFeatured;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    this.isFeatured = false,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'isFeatured': isFeatured,
    };
  }

  FaqModel copyWith({
    int? id,
    String? question,
    String? answer,
    bool? isFeatured,
  }) {
    return FaqModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }
}
