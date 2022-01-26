class Links {
  final String? next;
  final String? prev;

  Links({
    this.next,
    this.prev,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      next: json['next'],
      prev: json['prev'],
    );
  }

  Map<String, dynamic> get asJson => {'next': next, 'prev': prev};
}
