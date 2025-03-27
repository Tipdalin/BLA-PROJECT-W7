class Tomato {
  final String color;

  Tomato({required this.color});

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //   return other is Tomato && other.color == color;
  // }

  // @override
  // int get hashCode => color.hashCode;
}

main() {
  Tomato t1 = Tomato(color: "red");
  Tomato t2 = Tomato(color: "red");
  List<Tomato> tomatoes = [t1, t2];
  
  // Compare addresses of t1 and t2
  print(identical(t1, t2));
  print(tomatoes.contains(Tomato(color: "red")));
}