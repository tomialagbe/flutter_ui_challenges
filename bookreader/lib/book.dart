
class Book {

  String asset;
  String title;
  String author;

  Book(this.asset, this.title, this.author);

}

List<Book> books = [
  Book('assets/images/book1.gif', 'The Fault In Our Stars', 'by John Green and Rodrigo Corral'),
  Book('assets/images/book2.gif', 'Mr Mercedes', 'by Stephen King'),
  Book('assets/images/book3.gif', 'Panic', 'by Lauren Oliver'),
  //Book('assets/images/book4.gif', 'The 5th Wave', 'Rick Yancey')
];