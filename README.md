# timeware_test

Progetto test per Timeware

## Scelte progettuali
Ho utilizzato Bloc perché lo trovo lo state manager più scalabile su grandi progetti, anche se per progetti così piccoli poteva essere usato qualcosa di più rapido. Ho strutturato l'app seguendo le linee guida della clean architecture, pattern che si presta bene su app molto grandi anche se un po' verboso a volte, ma è quasi unicamente utilizzato nei progetti molto grandi. Ho suddiviso l'app per feature per una migliore schematizzazione. Avrei anche suddiviso le singolo feature in singoli package a se stanti per evitare di commettere degli errori.
Le API, non mettendo a disposizioni immagini (almeno per quel che vedo) e non essendo io un designer, mi sono limitato a riportare le informazioni essenziali come richiesto, con una UI molto basica e sicuramente migliorabile sotto ogni punto di vista

### Dipendenze
- **get_it**: Package per fare dependency injection in maniera rapida e facile
- **bloc**: State Manager abbastanza versatile e molto scalabile (magari overkill per un progetto così picoclo)
- **flutter_bloc**: Di supporto per il package precedente per essere integrato al meglio in Flutter
- **go_router**: Usato per la navigazione, sia web che mobile
- **dio**: Usato per le richieste di rete e per la gestione dell'interceptor (log e aggiunzione token)
- **json_annotation**: Utile per la serializzazione e deserializzazione degli oggetti in json
- **flutter_widget_from_html**: Alcune delle descrizioni date dalle api vengono date in HTML, quindi usato per il parsing

### Dipendenze Dev
- **json_serializable**: Utile per la serializzazione e deserializzazione degli oggetti in json
- **build_runner**: Indispensabile per la code generation di json_serializable e json_annotation

### Istruzioni per l'uso
Per avviare l'app, bisogna specificare la variabile d'ambiente `API_TOKEN` in questo modo `flutter run --dart-define=API_TOKEN=${tuoToken}` inserendo il proprio token per far funzionare le API.
Per fare il login, basta premere sul pulsante accedi, senza necessariamente inserire email o password
