# Laboratorio dei Solidi

Strumento interattivo di **geometria solida e disegno tecnico** per la scuola secondaria di primo grado (classe terza).
È una sola pagina web e funziona su PC, LIM, tablet e smartphone.

- **`index.html`**: versione online (più leggera, circa 200 KB). Richiede internet per la grafica 3D e i caratteri.
- **`laboratorio-offline.html`**: versione **offline** (circa 1,2 MB) con tutto incluso. Funziona senza internet: da chiavetta, dal registro o da Classroom.

## Cosa contiene

| Scheda | Cosa si fa |
|---|---|
| **Solidi** | 11 solidi in 3D da ruotare: cubo, parallelepipedo, **prisma** (base di 3, 4, 5, 6 o 8 lati; scelto il numero di lati si sceglie il poligono: triangolo equilatero, isoscele, rettangolo, scaleno; quadrato, rettangolo, rombo, parallelogramma, trapezio isoscele o rettangolo; pentagono regolare o "a casetta"; esagono regolare o allungato; ottagono regolare o smussato, con tutte le misure regolabili), piramide regolare (3, 4, 5, 6 o 8 lati), cilindro, cono, sfera, tetraedro, ottaedro, dodecaedro, icosaedro. Misure regolabili, **sviluppo piano animato** con le **linguette** a richiesta (spunta «Linguette»: servono per ricopiare lo sviluppo su carta e incollarlo; nei solidi curvi i dentini intorno ai cerchi); nei poliedri i pulsanti ◀ ▶ mostrano fino a 11 sviluppi diversi (tutti gli 11 del cubo e dell'ottaedro), partendo sempre dal principale; solidi e sviluppi sono allineati alla griglia a quadretti da 1 cm, così con «Dall'alto» le misure si contano sui quadretti; trasparenza, elementi evidenziati (altezza, apotema, raggio, diagonale…), formule passo passo, colori personalizzabili. Per i poliedri: numero di facce, vertici e spigoli con il pulsante **F + V − S**. |
| **Esercizi** | Serie di 10 esercizi con dati casuali su 3 livelli (Base, Medio, Avanzato), filtrabili per argomento, compresi **solidi di rotazione** e **solidi composti**. Correzione automatica, suggerimento, soluzione passo passo, pulsante per aprire il solido in 3D con le stesse misure. Nessun dato viene salvato o inviato. |
| **Formule** | 5 esperimenti di scoperta: volume con i cubetti, travaso piramide → prisma, travaso cono → cilindro, sfera di Archimede, principio di Cavalieri. La formula compare a esperimento concluso. |
| **Rotazione e composti** | *Solidi di rotazione*: una figura piana ruota intorno all'asse e genera il solido. *Solidi composti*: cilindro + due coni, cubo + due piramidi, prisma + due piramidi, cilindro + cono, casetta, cilindro + semisfera, cono gelato, cubo con foro. Parti separabili; toccando una riga dei calcoli si illumina sul modello la superficie, il volume o il segmento corrispondente; esempio passo passo. |
| **Disegno tecnico** | Per tutti i solidi, anche composti: **proiezioni ortogonali** (metodo europeo: PV, PO, PL, linea di terra, linea a 45°, linee di richiamo, quote), **assonometria isometrica**, **monometrica** (30°/60° o 45°/45°) e **cavaliera**. Spigoli nascosti tratteggiati, assi di simmetria con linea mista, foglio a quadretti. **Tutorial passo passo** del disegno, come in un'ora di tecnologia: un'azione per passo, lo strumento da usare, le misure da riportare e i punti indicati con le lettere (A, A′, A″) da seguire da una vista all'altra, ognuno trovato come incrocio di linee. Un tutorial a parte spiega come si preparano gli assi (o il foglio delle proiezioni). **Metodo di costruzione** a scelta: riporto delle misure con linea a 45°, squadra a 45° o compasso; ellissi con rombo, 8 punti o ovale a 4 centri. |

### Impostazioni (in alto)
- **Vista**: Automatica, PC, LIM, Tablet, Smartphone (su PC serve anche come anteprima).
- **π**: risultati con π simbolico (48π cm²) oppure con π = 3,14.
- **Alta leggibilità**: carattere Atkinson Hyperlegible, testo più grande (utile per DSA).
- **Semplificata**: solo formula e risultato; negli esercizi le formule utili sono sempre visibili.

## Come usarlo in classe
- **LIM**: vista "LIM" e "Schermo intero". "Nascondi risultati" copre i risultati con un "?" da scoprire uno alla volta.
- **Studenti**: link di GitHub Pages (vedi sotto) oppure il file `laboratorio-offline.html` su Classroom.
- Per aprire direttamente una scheda aggiungi al link `#esercizi`, `#formule`, `#composti` o `#disegno`.

## Pubblicarlo gratis con GitHub Pages
1. Nel repository: **Settings → Pages**.
2. "Build and deployment": **Deploy from a branch**, branch `main`, cartella `/ (root)`, **Save**.
3. Dopo un paio di minuti il laboratorio è online su `https://<tuo-utente>.github.io/<nome-repository>/`.

## File del repository
- `index.html` — il laboratorio (HTML, CSS e JavaScript in un unico file).
- `laboratorio-offline.html` — la stessa pagina con three.js e i caratteri inclusi.
- `tools/crea-offline.ps1` — rigenera la versione offline da `index.html`.
- `README.md` — questo file.
- `CLAUDE.md` — note di lavoro per riprendere lo sviluppo con Claude.

## Crediti
Grafica 3D con [Three.js](https://threejs.org/) r128 (licenza MIT). Caratteri Google Fonts: Baloo 2, Nunito, Atkinson Hyperlegible (SIL Open Font License).
