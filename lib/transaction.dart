class Transaction{
  String name;
  int age;
  DateTime date;
  Transaction({required this.name, required this.age, required this.date});

  @override
  String toString() {
    return 'Transaction{name: $name, age: $age, date: $date}';
  }
}