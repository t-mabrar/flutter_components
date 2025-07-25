import 'package:equatable/equatable.dart';

class DropdownButtonItem extends Equatable {
  final dynamic key;
  final String title;
  final Map<String, dynamic>? extraInfo;

  const DropdownButtonItem({
    required this.key,
    required this.title,
    this.extraInfo,
  });

  factory DropdownButtonItem.fromJSON(
    Map<String, dynamic> json,
    String keyParam,
    String titleParam,
  ) {
    return DropdownButtonItem(
      key: json[keyParam],
      title: json[titleParam],
      extraInfo: json,
    );
  }

  Map<String, dynamic> toJSON() => {
    'key': key,
    'title': title,
    'extra_info': extraInfo,
  };

  @override
  List<Object?> get props => [key, title, extraInfo];
}
