// To parse this JSON data, do
//
//     final problemModel = problemModelFromMap(jsonString);

import 'dart:convert';

List<ProblemModel> problemModelFromMap(String str) => List<ProblemModel>.from(json.decode(str).map((x) => ProblemModel.fromMap(x)));

String problemModelToMap(List<ProblemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProblemModel {
  final String title;
  final String problemStatement;
  final String timeComplexity;
  final String level;
  final String input;
  final String output;
  final Example example1;
  final Example example2;

  ProblemModel({
    required this.title,
    required this.problemStatement,
    required this.timeComplexity,
    required this.level,
    required this.input,
    required this.output,
    required this.example1,
    required this.example2,
  });

  factory ProblemModel.fromMap(Map<String, dynamic> json) => ProblemModel(
    title: json["title"],
    problemStatement: json["problemStatement"],
    timeComplexity: json["timeComplexity"],
    level: json["level"],
    input: json["input"],
    output: json["output"],
    example1: Example.fromMap(json["example-1"]),
    example2: Example.fromMap(json["example-2"]),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "problemStatement": problemStatement,
    "timeComplexity": timeComplexity,
    "level": level,
    "input": input,
    "output": output,
    "example-1": example1.toMap(),
    "example-2": example2.toMap(),
  };
}

class Example {
  final dynamic input;
  final dynamic output;

  Example({
    required this.input,
    required this.output,
  });

  factory Example.fromMap(Map<String, dynamic> json) => Example(
    input: json["input"],
    output: json["output"],
  );

  Map<String, dynamic> toMap() => {
    "input": input,
    "output": output,
  };
}
