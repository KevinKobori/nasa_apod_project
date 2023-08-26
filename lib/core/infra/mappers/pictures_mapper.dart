import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PicturesMapper {
  InfraException get exception => InfraException(InfraErrorType.invalidData);

  // /// External/Cache > Infra
  // Map<String, dynamic> fromJsonToMap(String source) => json.decode(source);

  // /// Infra > External/Cache
  // String fromMaptoJson(PictureModel model) =>
  //     json.encode(fromModelToMap(model));

  /// Infra > Data
  Result<List<PictureModel>, InfraException> fromMapListToModelList(
      List<Map<String, dynamic>> mapList) {
    try {
      final result = List<PictureModel>.from(mapList.map((map) =>
          PicturesMapper()
              .fromMapToModel(map)
              .whenSuccess((success) => success))).toList();
      return Success(result);
    } catch (_) {
      return Error(exception);
    }
  }

  /// Infra > Data
  Result<PictureModel, InfraException> fromMapToModel(
      Map<String, dynamic> map) {
    try {
      if (!map.keys.toSet().containsAll([
        'date',
        'explanation',
        'hdurl',
        'media_type',
        'service_version',
        'title',
        'url',
      ])) {
        return Error(exception);
      }
      return Success(PictureModel(
        date: map['date']!,
        explanation: map['explanation']!,
        hdurl: map['hdurl']!,
        mediaType: map['media_type']!,
        serviceVersion: map['service_version']!,
        title: map['title']!,
        url: map['url']!,
      ));
    } catch (_) {
      return Error(exception);
    }
  }

  /// Infra > Domain [REMOVE_THIS]
  Future<PictureEntity> fromMapToEntity(Map<String, dynamic> pictureMap) async {
    return await PicturesMapper().fromMapToModel(pictureMap).when(
          (pictureModel) async =>
              await PicturesMapper().fromModelToEntity(pictureModel).when(
                    (pictureEntity) => pictureEntity,
                    (infraException) => throw DomainException(
                        infraException.errorType.dataError.domainError),
                  ),
          (infraException) => throw DomainException(
              infraException.errorType.dataError.domainError),
        );
  }

  /// Infra > Presenter [REMOVE_THIS]
  Future<PictureViewModel> fromMapToViewModel(
      Map<String, dynamic> pictureMap) async {
    final result = PicturesMapper()
        .fromEntityToViewModel(await fromMapToEntity(pictureMap));
    return await result.when(
      (pictureViewModel) => pictureViewModel,
      (infraException) =>
          throw DomainException(infraException.errorType.dataError.domainError),
    );
  }

  /// Data > Domain
  Result<List<PictureEntity>, InfraException> fromModelListToEntityList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<PictureEntity>.from(pictureModelList.map(
          (pictureModel) =>
              PicturesMapper().fromModelToEntity(pictureModel).when(
                    (pictureEntity) => pictureEntity,
                    (infraException) =>
                        InfraException(infraException.errorType),
                  ))).toList();
      return Success(result);
    } catch (_) {
      return Error(exception);
    }
  }

  /// Data > Domain
  Result<PictureEntity, InfraException> fromModelToEntity(PictureModel model) {
    try {
      return Success(PictureEntity(
        date: model.date,
        explanation: model.explanation,
        hdurl: model.hdurl,
        mediaType: model.mediaType,
        serviceVersion: model.serviceVersion,
        title: model.title,
        url: model.url,
      ));
    } catch (_) {
      return Error(exception);
    }
  }

  /// Data > Infra
  Result<List<Map<String, dynamic>>, InfraException> fromModelListToMapList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<Map<String, dynamic>>.from(pictureModelList.map(
          (pictureModel) => PicturesMapper()
              .fromModelToMap(pictureModel)
              .whenSuccess((success) => success))).toList();
      return Success(result);
    } catch (_) {
      return Error(exception);
    }
  }

  /// Data > Infra
  Result<Map<String, dynamic>, InfraException> fromModelToMap(
      PictureModel model) {
    try {
      return Success(<String, dynamic>{
        'date': model.date,
        'explanation': model.explanation,
        'hdurl': model.hdurl,
        'media_type': model.mediaType,
        'service_version': model.serviceVersion,
        'title': model.title,
        'url': model.url,
      });
    } catch (_) {
      return Error(exception);
    }
  }

  /// Domain > Presenter
  Result<PictureViewModel, InfraException> fromEntityToViewModel(
      PictureEntity entity) {
    try {
      return Success(PictureViewModel(
        date: entity.date,
        explanation: entity.explanation,
        hdurl: entity.hdurl,
        mediaType: entity.mediaType,
        serviceVersion: entity.serviceVersion,
        title: entity.title,
        url: entity.url,
      ));
    } catch (_) {
      return Error(exception);
    }
  }

  /// Domain > Data
  Result<PictureModel, InfraException> fromEntityToModel(PictureEntity entity) {
    try {
      return Success(PictureModel(
        date: entity.date,
        explanation: entity.explanation,
        hdurl: entity.hdurl,
        mediaType: entity.mediaType,
        serviceVersion: entity.serviceVersion,
        title: entity.title,
        url: entity.url,
      ));
    } catch (_) {
      return Error(exception);
    }
  }

  /// Domain > Data
  Result<List<PictureModel>, InfraException> fromEntityListToModelList(
      List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureModel>.from(pictureEntityList.map(
          (pictureEntity) =>
              PicturesMapper().fromEntityToModel(pictureEntity).when(
                    (pictureModel) => pictureModel,
                    (infraException) =>
                        InfraException(infraException.errorType),
                  ))).toList();
      return Success(result);
    } catch (_) {
      return Error(exception);
    }
  }
}
