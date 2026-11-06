class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void output() {
    for (var person in people) {
      print('${person['id']}: ${person['first']} ${person['last']} ${person['email']}');
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field, String value) {
    people.removeWhere((person) {
      return person[field] == value;
    });
  }

  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }
}
