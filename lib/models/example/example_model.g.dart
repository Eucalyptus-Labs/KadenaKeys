// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExampleListResponse _$$_ExampleListResponseFromJson(Map<String, dynamic> json) => _$_ExampleListResponse(
      example: (json['example'] as List<dynamic>).map((e) => ExampleModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_ExampleListResponseToJson(_$_ExampleListResponse instance) => <String, dynamic>{
      'example': instance.example,
    };

_$_ExampleModel _$$_ExampleModelFromJson(Map<String, dynamic> json) => _$_ExampleModel(
      x: json['x'] as String,
      y: json['y'] as String,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$_ExampleModelToJson(_$_ExampleModel instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'link': instance.link,
    };
