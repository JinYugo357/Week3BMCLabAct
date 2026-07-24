import 'dart:io';

void main() {
  bool running = true;

  while (running) {
    print('1 - Budget Tracker');
    print('2 - Grade Calculator');
    print('3 - Exit');
    stdout.write('Enter a number for your option: ');

    String? option = stdin.readLineSync()?.trim();

    switch (option) {
      case '1':
        BdgtTrckr();
        break;
      case '2':
        GrdCalc();
        break;
      case '3':
        running = false;
        print('I hope that I helped!');
        break;
      default:
        print('Invalid option...');
    }
  }
}

void BdgtTrckr() {
  stdout.write("Enter your monthly allowance as a decimal: ");
  double? allowance = double.tryParse(stdin.readLineSync()?.trim() ?? '');

  if (allowance == null || allowance <= 0) {
    print('Not a valid monthly allowance...');
    return;
  }

  print('How do you plan to spend for the following?');

  stdout.write("Food: ");
  double? food = double.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (food == null) {
    print('Not a valid number for Food...');
    return;
  }
  double percentFood = (food / allowance) * 100;

  stdout.write("Transportation: ");
  double? trnsport = double.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (trnsport == null) {
    print('Not a valid number for Transportation...');
    return;
  }
  double percentTransport = (trnsport / allowance) * 100;

  stdout.write("School Materials: ");
  double? mtrls = double.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (mtrls == null) {
    print('Not a valid number for School Materials...');
    return;
  }
  double percentMaterials = (mtrls / allowance) * 100;

  stdout.write("Others: ");
  double? othrs = double.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (othrs == null) {
    print('Not a valid number for Others...');
    return;
  }
  double percentOthers = (othrs / allowance) * 100;

  double totalExpenses = food + trnsport + mtrls + othrs;
  double remaining = allowance - totalExpenses;

  if (totalExpenses > allowance) {
    print("Warning: Your plan exceeds your allowance!");
  } else if (totalExpenses == allowance) {
    print("You are spending exactly your allowance. No savings left.");
  } else if (remaining >= allowance * 0.20) {
    print("Great! You are saving at least 20% of your allowance.");
  } else {
    print("You are within budget, but your savings are less than 20%.");
  }

  print('Your monthly allowance is: $allowance');
  print('Your total expenses are: $totalExpenses');
  print('Food: $food (${percentFood.toStringAsFixed(1)}%)');
  print('Transportation: $trnsport (${percentTransport.toStringAsFixed(1)}%)');
  print('School Materials: $mtrls (${percentMaterials.toStringAsFixed(1)}%)');
  print('Others: $othrs (${percentOthers.toStringAsFixed(1)}%)');
}

void GrdCalc() {
  stdout.write('How many quizzes did you take? ');
  int? numberOfQuizzes = int.tryParse(stdin.readLineSync()?.trim() ?? '');

  if (numberOfQuizzes == null || numberOfQuizzes <= 0) {
    print('Invalid number of quizzes');
    return;
  }

  List<double> quizScores = [];
  for (int i = 0; i < numberOfQuizzes; i++) {
    stdout.write('Enter your score in quiz ${i + 1}: ');
    double? n = double.tryParse(stdin.readLineSync()?.trim() ?? '');
    if (n == null) {
      print('Invalid number, using 0');
      n = 0;
    }
    quizScores.add(n);
  }

  double totalQuiz = 0;
  for (double n in quizScores) {
    totalQuiz += n;
  }

  double quizAverage = totalQuiz / numberOfQuizzes;

  stdout.write('Enter your Midterm Score: ');
  double? midTermScore = double.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (midTermScore == null) {
    print('Not a valid Midterm score.');
    return;
  }

  stdout.write('Enter your Finals Score: ');
  double? finalScore = double.tryParse(stdin.readLineSync()?.trim() ?? '');
  if (finalScore == null) {
    print('Not a valid Finals Score.');
    return;
  }

  double finalGrade = quizAverage * 0.30 + midTermScore * 0.30 + finalScore * 0.40;

  if (finalGrade >= 90) {
    print("Excellent, Aliah! Grade: A");
  } else if (finalGrade >= 80) {
    print("Very good, Aliah! Grade: B");
  } else if (finalGrade >= 70) {
    print("Good, Aliah! Grade: C");
  } else if (finalGrade >= 60) {
    print("Needs improvement. Grade: D");
  } else {
    print("At risk, Aliah. Grade: F");
  }
}