# CLAUDE.md — note per riprendere il lavoro

Queste note servono a Claude (o a chiunque sviluppi) per ripartire da dove ci si è fermati.
Ultimo aggiornamento: 26 settembre 2026.

## Chi e per cosa
- Committente: docente di matematica e scienze, scuola secondaria di primo grado. Lingua di lavoro: **italiano**.
- Pubblico: classe **terza media**. Uso: LIM in classe, lavoro autonomo, compiti a casa, esercitazione con autocorrezione.
- Link Artifact pubblicato durante lo sviluppo: https://claude.ai/artifact/NuGRj9pU3FjFRb7FxiH9vC (privato, dell'account del docente).

## Decisioni già prese (non rimetterle in discussione senza chiedere)
- **Un solo file** `index.html`, nessun build. Three.js **r128** da cdnjs (build UMD, globale `THREE`). Font da Google Fonts.
- Stile "pulito e colorato", pulsanti grandi, tema chiaro/scuro tramite token CSS su `:root`.
- Notazione da libro di testo italiano: divisione con i due punti "`:`", moltiplicazione "`·`", virgola decimale, **numeri fissi** per apotema (0,289 · 0,5 · 0,688 · 0,866 · 1,207) e per i poliedri regolari. Arrotondamento a 2 decimali con "≈".
- π: selettore globale **simbolico** (48π) / **3,14**. Il peso negli esercizi usa sempre 3,14.
- Radici: il segno √ è disegnato con la **linea sopra tutto il radicando** (funzione `rad()`), richiesto esplicitamente.
- Esercizi: **solo autocorrezione**, nessuna raccolta dati. Serie da 10, 3 livelli. Tolleranza dell'1% (minimo 0,02).
- Accessibilità: interruttori "Alta leggibilità" (Atkinson Hyperlegible) e "Semplificata".
- Viste per dispositivo: Automatica / PC / LIM / Tablet / Smartphone (`body[data-dev]`, `body.touch`).
- **Eulero è stato TOLTO su richiesta** (scheda, tabella e attività "perché solo 5 poliedri"). Nel laboratorio restano solo i conteggi F/V/S sotto il nome del solido (al docente è stato chiesto se toglierli: nessuna risposta per ora).
- Negli evidenziamenti dei composti: aree e volumi illuminano **superfici/pezzi**, mentre misure lineari (apotemi, perimetri) disegnano un **segmento** con etichetta (correzione richiesta dal docente).

## Mappa del codice (`index.html`, tutto dentro un'unica IIFE)
Cercare questi commenti/nomi per orientarsi:

| Sezione | Contenuto |
|---|---|
| `<style>` | token colore su `:root` (+ dark), layout `.work`/`.stage`/`.panel`, esercizi, `.rad` (radice), calcoli cliccabili, viste per dispositivo |
| `S` / `savePrefs` | stato globale e preferenze salvate in `localStorage` (`labsolidi-prefs`) |
| `fmt`, `approx`, `rad` | formattazione numeri all'italiana e radice disegnata |
| `syncColors`, `PRESETS` | palette (basi, facce laterali 1/2, superficie curva) |
| `hull`, `buildPoly` | poliedri generici: involucro convesso, albero di sviluppo (ricerca casuale di uno sviluppo senza sovrapposizioni), animazione di apertura |
| `buildCylinder`, `buildCone`, `buildSphere` | solidi curvi e loro srotolamento |
| `SOLIDS` | definizione di ogni solido: `dims`, `build`, `elements` (segmenti evidenziabili), `calc` (righe di calcolo), `note` |
| scena del laboratorio | `renderer`, `cam`, `rebuild`, `refreshHelpers` (elemento evidenziato + `labelSprite`), `loop` |
| UI laboratorio | `renderPicker`, `renderDims`, `renderElements`, `renderCalc`, `renderHeader`, `selectSolid` |
| **MODULO 2 · ESERCIZI** | `GENS` (generatori: `lvl` 1-3, `cat`, `make()` → `text`, `hint`, `asks`, `sol`, `lab`), `EX`, `renderEx`, `verify`, `openInLab` |
| `showView` | cambio scheda: `solidi`, `esercizi`, `formule`, `composti` (+ ancore `#esercizi` ecc.) |
| **MODULO 3 · FORMULE** | `makeViewer` (visualizzatore 3D riutilizzabile con orbita, pinch e griglia), `attachOrbit`, `makeVessel` (vasi con acqua tagliata da un piano), `EXPS`, `expCubetti`, `expTravaso`, `expCavalieri` |
| **MODULO 4 · ROTAZIONE E COMPOSTI** | `ROT` (profili per `LatheGeometry`), `COMP` (ogni composto: `dims`, `legend`, `parts(d)` con chiavi/pezzi, `calc(d)` con `hl` = chiavi da illuminare, `segs(d)` = segmenti per etichetta di riga), `CO`, `coBuild`, `coPaint`, `coDrawSeg`, `coCalc`, esempio passo passo |
| viste per dispositivo | `detectDevice`, `applyDevice`, schermo intero |

Helper per le righe di calcolo: `L(label, sym, formula, sostituzione, valore, unità, pi)`, `M(...)` per risultati misti tipo 216 − 24π, `hlL(riga, ...chiavi)`, `NOTE(testo, ...chiavi)`.

## Cose da fare / proposte aperte
1. **Versione offline**: incorporare three.js r128 nel file (o in `vendor/`) e i font, per l'uso da chiavetta o senza rete.
2. **Esercizi su solidi di rotazione e composti** (livello Avanzato, tipici dell'esame).
3. Decidere se togliere anche i conteggi facce/vertici/spigoli nel laboratorio.
4. Il docente non ha ancora verificato a schermo ogni dettaglio delle ultime versioni: chiedergli un riscontro su allineamento del segno di radice e posizione dei segmenti evidenziati.
5. Possibili estensioni già accennate: misure sullo sviluppo piano, sviluppo stampabile (scartate per ora dal docente).

## Nota tecnica per ripubblicare come Artifact di Claude
Il sistema Artifact aggiunge da solo `<!DOCTYPE>`, `<html>`, `<head>`, `<body>`: per ripubblicare, usare il contenuto interno (dalla riga `<meta charset>` fino all'ultimo `</script>`), senza quei tag.
