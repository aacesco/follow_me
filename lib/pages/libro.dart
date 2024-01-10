class Libro{
  late String Id;
  late String Titolo;
  late String Autori;
  late String Editore;
  late String Descrizione;
  late String Copertina;

  Libro(this.Id, this.Titolo, this.Autori, this.Editore, this.Descrizione,
      this.Copertina);

  Libro.fromMap(Map<String, dynamic> mappa){
    Id = mappa['volumeInfo']['id'] == null ? '' : mappa['volumeInfo']['id'].toString();
    Titolo = mappa['volumeInfo']['title'] == null ? '' : mappa['volumeInfo']['title'].toString();
    Autori = mappa['volumeInfo']['authors'] == null ? '' : mappa['volumeInfo']['authors'].toString();
    Editore = mappa['volumeInfo']['publisher'] == null ? '' : mappa['volumeInfo']['publisher'].toString();
    Descrizione = mappa['volumeInfo']['description'] == null ? '' : mappa['volumeInfo']['description'].toString();
    try {
      Copertina = mappa['volumeInfo']['imageLinks'] == null
          ? ''
          : mappa['volumeInfo']['imageLinks']['thumbnail'].toString();
    } catch(ex){
      Copertina = '';
    }
  }
}