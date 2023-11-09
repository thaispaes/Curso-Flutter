// notice that you have to add in the async keyword to be able to await a Future
Future<void> printWithDelay(String message) async {
  await Future.delayed(Duration(seconds: 1));
  print(message);
}

void main() {
  
  printWithDelay("this message is printed with delay");
  print("hey hi hello");
}