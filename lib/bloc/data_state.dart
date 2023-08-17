
abstract class DataState<T> {
   T? data;
   // ignore: deprecated_member_use
   RequestError? error;
   DataState({this.data,this.error});
}


class DataIntial<T> extends DataState<T>{
    DataIntial():super();
}
class DataWaiting<T> extends DataState<T>{
    DataWaiting():super();
}

class DataSuccess<T> extends DataState<T>{
    DataSuccess({required T data}):super(data: data);
}

class DataError<T> extends DataState<T>{
    DataError({required RequestError error}):super(error: error);
}


class RequestError{
  int? statusCode;
  String? message;
  RequestError({required this.statusCode,required this.message});
}