import 'package:dio/dio.dart';

Future main() async {
  Response response;
  Dio dio = Dio();
  response = await dio.get("/test?id=12&name=wendu");
  print(response.data.toString());
  // 请求参数也可以通过对象传递，上面的代码等同于：
  response =
      await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
  print(response.data.toString());

  //发起一个 POST 请求:
  response = await dio.post("/test", data: {"id": 12, "name": "wendu"});

  //发起多个并发请求:
  response =
      (await Future.wait([dio.post("/info"), dio.get("/token")])) as Response;

  //下载文件:
  response = await dio.download("https://www.google.com/", "./xx.html");

  //以流的方式接收响应数据：
  var url = "";
  Response<ResponseBody> rs = await Dio().get<ResponseBody>(
    url,
    options: Options(responseType: ResponseType.stream), //设置接收类型为stream
  );
  print(rs.data.stream); //响应流

  //以二进制数组的方式接收响应数据：
  Response<List<int>> rs2 = await Dio().get<List<int>>(
    url,
    options: Options(responseType: ResponseType.bytes), //设置接收类型为bytes
  );
  print(rs2.data); //二进制数组

  //发送 FormData:
  FormData formData = FormData.fromMap({
    "name": "wendux",
    "age": 25,
  });
  response = await dio.post("/info", data: formData);

  //通过FormData上传多个文件:
  FormData.fromMap({
    "name": "wendux",
    "age": 25,
    "file": await MultipartFile.fromFile("./text.txt", filename: "upload.txt"),
    "files": [
      await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
      await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
    ]
  });
  response = await dio.post("/info", data: formData);

  //监听发送(上传)数据进度:
  response = await dio.post(
    "http://www.dtworkroom.com/doris/1/2.0.0/test",
    data: {"aa": "bb" * 22},
    onSendProgress: (int sent, int total) {
      print("$sent $total");
    },
  );
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}
