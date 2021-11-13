
class PageResponse<T> {
  List<T> content;
  bool last;
  int number;
  int size;

  PageResponse(this.content, this.last, this.number, this.size);
}