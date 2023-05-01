// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_model.freezed.dart';
part 'example_model.g.dart';

@freezed
class ExampleListResponse with _$ExampleListResponse {
  factory ExampleListResponse({
    required List<ExampleModel> example,
  }) = _ExampleListResponse;

  factory ExampleListResponse.fromJson(Map<String, dynamic> json) =>
      _$ExampleListResponseFromJson(json);
}

@freezed
class ExampleModel with _$ExampleModel {
  factory ExampleModel({
    required String x,
    required String y,
    String? link,
  }) = _ExampleModel;

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);
}
