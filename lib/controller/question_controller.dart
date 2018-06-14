import 'package:quiz_api/quiz_api.dart';
class QuestionController extends HTTPController{
  var question=[
    "Who are you?", "Where are you from?", "What's is your purpose?"
  ];

  @httpGet
  Future<Response> getQuestions() async{
    return new Response.ok(question);
  }


  @httpGet
  Future<Response> getSingleQuestion(@HTTPPath("index") int index) async{

    if( index<0 || index> question.length){
      return new Response.notFound();
    }
      return new Response.ok(question[index]);
  }

}