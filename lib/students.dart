class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void output() {
   for (var person in people) {
      print(person);
    };
  }
}
