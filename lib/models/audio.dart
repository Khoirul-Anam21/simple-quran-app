import 'package:hive/hive.dart';

part 'adapters/audio.g.dart';

@HiveType(typeId: 0)
class Audio extends HiveObject{
  Audio({
    this.primary,
    this.secondary,
  });
  @HiveField(0)
  String? primary;

  @HiveField(1)
  List<String>? secondary;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        primary: json["primary"],
        secondary: List<String>.from(json["secondary"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": List<dynamic>.from(secondary!.map((x) => x)),
      };
}
