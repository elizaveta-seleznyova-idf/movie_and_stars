abstract class Mapper<I, Output> {
  Output call(I params);
}

abstract class MapperTwoParams<InputParams, InputParamsTwo, Output> {
  Output call(InputParams params, InputParamsTwo paramsTwo);
}