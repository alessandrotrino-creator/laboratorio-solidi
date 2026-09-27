# CLAUDE.md — note per riprendere il lavoro

Queste note servono a Claude (o a chiunque sviluppi) per ripartire da dove ci si è fermati.
Ultimo aggiornamento: 27 settembre 2026.

## Chi e per cosa
- Committente: docente di matematica e scienze, scuola secondaria di primo grado. Lingua di lavoro: **italiano**.
- Pubblico: classe **terza media**. Uso: LIM in classe, lavoro autonomo, compiti a casa, esercitazione con autocorrezione.
- Repository: https://github.com/alessandrotrino-creator/laboratorio-solidi (i file si caricano dal sito di GitHub: sul PC del docente non c'è git).
- Link Artifact della prima fase: https://claude.ai/artifact/NuGRj9pU3FjFRb7FxiH9vC (privato, fermo alla versione del 26/09; la versione di riferimento è quella del repository).

## Decisioni già prese (non rimetterle in discussione senza chiedere)
- **Un solo file** `index.html`, nessun build. Three.js **r128** da cdnjs (UMD, globale `THREE`). Font da Google Fonts.
- Versione **offline** `laboratorio-offline.html` generata con `tools/crea-offline.ps1` (incorpora three.js e i font latin in base64). Va rigenerata dopo ogni modifica a `index.html`.
- Stile "pulito e colorato", pulsanti grandi, tema chiaro/scuro con token CSS su `:root`.
- Notazione da libro di testo italiano: divisione "`:`", moltiplicazione "`·`", virgola decimale, **numeri fissi** per l'apotema (0,289 · 0,5 · 0,688 · 0,866 · 1,207) e per i poliedri regolari. Arrotondamento a 2 decimali con "≈".
- π: selettore globale **simbolico** (48π) / **3,14**. Peso e solidi cavi negli esercizi usano sempre 3,14.
- Radici: il segno √ è disegnato con la **linea sopra tutto il radicando** (funzione `rad()`). Verificato a schermo dal docente: va bene.
- Esercizi: **solo autocorrezione**, nessuna raccolta dati. Serie da 10, 3 livelli, tolleranza 1% (minimo 0,02).
- Accessibilità: "Alta leggibilità" (Atkinson Hyperlegible) e "Semplificata". Viste Automatica / PC / LIM / Tablet / Smartphone (`body[data-dev]`, `body.touch`).
- **Eulero è stato TOLTO su richiesta** (scheda, tabella, "perché solo 5"). Restano, su richiesta del docente, i conteggi F/V/S nel laboratorio con il pulsante **F + V − S** che mostra la formula.
- Evidenziamenti nei composti: aree e volumi illuminano **superfici/pezzi**; misure lineari (apotemi, perimetri) disegnano un **segmento** con etichetta. Verificato dal docente: va bene.
- Disegno tecnico: proiezioni ortogonali col **metodo europeo** (PV in alto a sinistra, PL a destra = vista da sinistra, PO sotto, linea a 45° nel quadrante in basso a destra). Assonometrie richieste esplicitamente: **cavaliera, isometrica e monometrica** (monometrica con x/y a 30°/60° o 45°/45°, pianta in vera forma, misure reali). Tipi di linea UNI: continua grossa (in vista), tratteggiata (nascosti), mista tratto-punto (assi), continua sottile (richiamo/costruzione).
- **Metodo di costruzione** a scelta (scheda nel pannello, richiesta del docente): nelle proiezioni ortogonali il riporto pianta → profilo con *linea a 45°*, *squadra a 45°* (segmento per ogni punto) o *compasso* (archi centrati in O); nelle assonometrie le ellissi con *rombo/parallelogramma*, *8 punti* o *ovale a 4 centri* (solo isometrica); nella monometrica circonferenza col compasso. Stato: `DR.transfer`, `DR.ell`; funzioni `drEllMethod`, `drEllipseText`, `drEllipseConstruction`. Gli elementi del disegno possono essere segmenti (`d`), archi (`arc`) o punti (`dot`).
- Interfaccia del disegno: due pulsanti principali **"Proiezioni ortogonali" / "Assonometria"**; con "Assonometria" compare la scelta Cavaliera / Isometrica / Monometrica (richiesta del docente). Nelle proiezioni le scritte dei piani sono per esteso: "PV · prospetto", "PL · profilo", "PO · pianta", vicino all'incrocio dei piani (il docente dubitava che il PV fosse in alto a sinistra: lo è, ma la scritta era poco visibile).

## Mappa del codice (`index.html`, tutto dentro un'unica IIFE)

| Sezione | Contenuto |
|---|---|
| `<style>` | token colore, layout `.work`/`.stage`/`.panel`, esercizi, `.rad`, calcoli cliccabili, `.paper` e classi `dw-*` del disegno, viste per dispositivo |
| `S` / `savePrefs` | stato globale e preferenze in `localStorage` (`labsolidi-prefs`); `S.fvs` mostra F + V − S |
| `fmt`, `approx`, `rad` | numeri all'italiana e radice disegnata |
| `syncColors`, `PRESETS` | palette |
| `hull`, `buildPoly` | poliedri: involucro convesso, albero di sviluppo, apertura animata |
| `buildCylinder`, `buildCone`, `buildSphere` | solidi curvi e srotolamento |
| `SOLIDS` | ogni solido: `dims`, `build`, `elements`, `calc`, `note` |
| scena e UI laboratorio | `rebuild`, `refreshHelpers`, `labelSprite`, `renderCalc`, `renderHeader`, `selectSolid` |
| **MODULO 2 · ESERCIZI** | `GENS` (`lvl`, `cat`, `make()` → `text`, `hint`, `asks`, `sol`, `lab` oppure `co`), `CATS`, `EX`, `renderEx`, `verify`, `openInLab`, `openInCo` |
| `showView` | schede `solidi`, `esercizi`, `formule`, `composti`, `disegno` (+ ancore `#…`) |
| **MODULO 3 · FORMULE** | `makeViewer`, `attachOrbit`, `makeVessel`, `EXPS`, `expCubetti`, `expTravaso`, `expCavalieri` |
| **MODULO 4 · ROTAZIONE E COMPOSTI** | `ROT` (profili per `LatheGeometry`), `COMP` (`dims`, `legend`, `parts(d)` con chiave/pezzo/ruolo, `calc(d)` con `hl`, `segs(d)`), `CO`, `coBuild`, `coPaint`, `coDrawSeg`, `coCalc` |
| **MODULO 5 · DISEGNO TECNICO** | `drModel` (mesh chiusa del solido: poliedri da `SOLIDS.build`, curvi da geometrie three, composti dai `parts` con ruolo `surf`), `drAnalyze` (spigoli vivi e lisci), `drLines` (linee in vista/nascoste: campionamento degli spigoli + raggio verso l'osservatore contro i triangoli; contorni apparenti delle superfici curve), `drFeatures` (punti per le linee di richiamo, circonferenze per assi e rombi), `drBuildPO`, `drBuildAxo` (iso / mono / cav, passi per quote), `drRender` (SVG), `drTutorial` |
| viste per dispositivo | `detectDevice`, `applyDevice`, schermo intero |

Helper per le righe di calcolo: `L(label, sym, formula, sostituzione, valore, unità, pi)`, `M(...)` per risultati misti tipo 216 − 24π, `hlL(riga, ...chiavi)`, `NOTE(testo, ...chiavi)`.

## Come provare in locale
Sul PC del docente non ci sono né git né node. Per vedere la pagina nel pannello browser di Claude si può usare un piccolo server PowerShell (`System.Net.HttpListener` su `localhost:8765`) che serve la cartella del repository; aprire il file con `file://` dal pannello non funziona.

## Cose da fare / proposte aperte
1. Disegno tecnico: il docente deve ancora provarlo. Chiedergli riscontri su tutorial (ordine dei passi, lessico), quote (ora solo ingombro: larghezza, altezza, profondità) ed eventuali quote di dettaglio (raggio, apotema).
2. Disegno tecnico: possibili aggiunte, cioè sezioni, solidi di rotazione di `ROT` (oggi ci sono solidi del laboratorio e composti), solidi ruotati o inclinati rispetto ai piani.
3. Possibili estensioni già accennate: misure sullo sviluppo piano, sviluppo stampabile (scartate per ora).

## Nota tecnica per ripubblicare come Artifact di Claude
Il sistema Artifact aggiunge da solo `<!DOCTYPE>`, `<html>`, `<head>`, `<body>`: per ripubblicare, usare il contenuto interno (dalla riga `<meta charset>` fino all'ultimo `</script>`), senza quei tag.
