class TestAttachment {
  final int id;

  TestAttachment({required this.id});

  factory TestAttachment.fromJson(Map<String, dynamic> json) {
    return TestAttachment(id: json['attachment_id']);
  }

  Map<String, dynamic> get asJson => {
        'attachment_id': id,
      };
}
