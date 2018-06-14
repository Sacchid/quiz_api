import 'harness/app.dart';

Future main() async {
  TestApplication app = new TestApplication();

  setUpAll(() async {
    await app.start();
  });

  tearDownAll(() async {
    await app.stop();
  });

  test("get all questions", () async{
    var request =  app.client.request("/questions");
    expectResponse(
        await request.get(), 200,
        body: allOf([
          hasLength(greaterThan(0)),
          everyElement(endsWith("?"))
    ]));
  });
  
  test("return single question test", () async{
    var request =  app.client.request("/questions/1");
    expectResponse(await request.get(), 200);
    
  });

  test("return single question test", () async{
    var request =  app.client.request("/questions/100");
    expectResponse(await request.get(), 404);

  });
}
