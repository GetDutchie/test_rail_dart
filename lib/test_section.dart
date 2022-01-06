import 'package:test_rail/src/test_rail_http_client.dart';
import 'package:test_rail/test_rail.dart';

class TestSection {
  final int? depth;
  final String? description;
  final int? displayOrder;
  final int id;
  final String? name;
  final int? parentId;
  final int? suiteId;

  TestSection({
    this.depth,
    this.description,
    this.displayOrder,
    required this.id,
    this.name,
    this.parentId,
    this.suiteId,
  });

  factory TestSection.fromJson(Map<String, dynamic> json) => TestSection(
        depth: json['depth'],
        description: json['description'],
        displayOrder: json['display_order'],
        id: json['id'],
        name: json['name'],
        parentId: json['parent_id'],
        suiteId: json['suite_id'],
      );

  static Future<TestSection> get(int sectionId) async {
    final response = await TestRail.instance.client
        .request('/get_section/$sectionId', RequestMethod.get);
    return TestSection.fromJson(response);
  }

  Map<String, dynamic> get asJson => {
        'depth': depth,
        'description': description,
        'display_order': displayOrder,
        'id': id,
        'name': name,
        'parent_id': parentId,
        'suite_id': suiteId,
      };
}
