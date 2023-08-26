import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../apod.dart';

void main() {
  late PictureDatasource pictureDatasource;
  late PictureRepository pictureRepository;
  late RemoteLoadPicturesUseCase sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    pictureDatasource = PictureDatasource(httpClient);
    pictureRepository = PictureRepository(pictureDatasource);
    url = ApodTest.faker.internet.httpUrl();
    sut = RemoteLoadPicturesUseCase(
      picturesRepository: pictureRepository,
      url: url,
    );
  });

  test('Should call HttpClient with correct values', () async {
    final data = <Map<String, dynamic>>{};

    httpClient.mockRequestSuccess(data);

    await sut.loadLastTenDaysData();

    ApodTest.verify(() => httpClient.request(method: 'get', url: url));
  });

  test('Should return pictures list on 200 with valid data', () async {
    final data = ApodResponsesFactory().generateValidApodObjectMapList();

    final matcher = List<PictureEntity>.from(data.map((map) => PicturesMapper()
        .fromMapToModel(map)
        .whenSuccess((model) => PicturesMapper()
            .fromModelToEntity(model)
            .whenSuccess((entity) => entity)))).toList();

    httpClient.mockRequestSuccess(data);

    final result = await sut.loadLastTenDaysData();

    final actual = result.when((success) => success, (error) => error);

    expect(actual, matcher);
  });

  test(
      'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    httpClient.mockRequestSuccess(
        ApodResponsesFactory().generateInvalidApodObjectMapList());

    final result = await sut.loadLastTenDaysData();

    final actual = result.when((success) => success, (error) => error);

    expect(
        actual,
        predicate((e) =>
            e is DomainException && e.errorType == DomainErrorType.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient not returns 200', () async {
    httpClient.mockRequestError(ApodResponsesFactory().generateNotFoundError());

    final result = await sut.loadLastTenDaysData();

    final actual = result.when((success) => success, (error) => error);

    expect(
        actual,
        predicate((e) =>
            e is DomainException && e.errorType == DomainErrorType.unexpected));
  });
}
