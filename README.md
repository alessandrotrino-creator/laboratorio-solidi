# Laboratorio dei Solidi

Strumento interattivo di **geometria solida** per la scuola secondaria di primo grado (classe terza).
È una sola pagina web: si apre con un doppio clic su `index.html` e funziona su PC, LIM, tablet e smartphone.

> Serve una connessione a internet: la grafica 3D (Three.js) e i caratteri vengono scaricati da CDN.
> Una versione completamente offline è tra le cose da fare (vedi sotto).

## Cosa contiene

| Scheda | Cosa si fa |
|---|---|
| **Solidi** | 11 solidi in 3D da ruotare: cubo, parallelepipedo, prisma e piramide regolari (base di 3, 4, 5, 6 o 8 lati), cilindro, cono, sfera, tetraedro, ottaedro, dodecaedro, icosaedro. Misure regolabili con i cursori, **sviluppo piano animato**, trasparenza, elementi evidenziati sul solido (altezza, apotema, raggio, diagonale…), formule passo passo con sostituzione dei numeri, colori personalizzabili. |
| **Esercizi** | Serie di 10 esercizi con dati casuali su 3 livelli (Base, Medio, Avanzato), filtrabili per argomento. Correzione automatica, suggerimento, soluzione passo passo, pulsante per aprire il solido nel laboratorio. Nessun dato viene salvato o inviato. |
| **Formule** | 5 esperimenti di scoperta: volume con i cubetti, travaso piramide → prisma, travaso cono → cilindro, sfera di Archimede, principio di Cavalieri. La formula compare solo a esperimento concluso. |
| **Rotazione e composti** | *Solidi di rotazione*: una figura piana ruota intorno all'asse e genera il solido (rettangolo, triangolo rettangolo sul cateto e sull'ipotenusa, semicerchio, trapezio rettangolo sulla base maggiore e sulla minore). *Solidi composti*: cilindro + due coni, cubo + due piramidi, prisma + due piramidi, cilindro + cono, casetta, cilindro + semisfera, cono gelato, cubo con foro cilindrico. Le parti si possono separare; toccando una riga dei calcoli, la superficie, il volume o il segmento corrispondente si illumina sul modello; c'è anche un esempio passo passo. |

### Impostazioni (in alto a destra)
- **Vista**: Automatica, PC, LIM, Tablet, Smartphone (su PC serve anche come anteprima).
- **π**: risultati con π simbolico (48π cm²) oppure con π = 3,14.
- **Alta leggibilità**: carattere Atkinson Hyperlegible, testo più grande (utile per DSA).
- **Semplificata**: solo formula e risultato, senza passaggi intermedi; negli esercizi le formule utili sono sempre visibili.

Le preferenze restano salvate nel browser di chi usa la pagina.

## Come usarlo in classe
- **LIM**: scegli la vista "LIM" e usa "Schermo intero". Il pulsante "Nascondi risultati" copre i risultati con un "?" da scoprire uno alla volta.
- **Studenti**: condividi il link di GitHub Pages (vedi sotto) oppure il file `index.html` su Classroom o sul registro.
- Per aprire direttamente una scheda si può aggiungere al link `#esercizi`, `#formule` o `#composti`.

## Pubblicarlo gratis con GitHub Pages
1. Nel repository vai su **Settings → Pages**.
2. In "Build and deployment" scegli **Deploy from a branch**, branch `main`, cartella `/ (root)`, poi **Save**.
3. Dopo un paio di minuti il laboratorio sarà online all'indirizzo `https://<tuo-utente>.github.io/<nome-repository>/`, da dare agli studenti.

## File del repository
- `index.html` — tutto il laboratorio (HTML, CSS e JavaScript in un unico file).
- `README.md` — questo file.
- `CLAUDE.md` — note di lavoro per riprendere lo sviluppo con Claude: decisioni prese, struttura del codice, cose da fare.

## Crediti
Grafica 3D con [Three.js](https://threejs.org/) r128 (licenza MIT). Caratteri Google Fonts: Baloo 2, Nunito, Atkinson Hyperlegible.
