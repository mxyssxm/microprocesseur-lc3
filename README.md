# LC-3 – Architecture & Assembleur (Logisim)

## Description
Ce projet consiste à concevoir et implémenter une **architecture simplifiée de processeur LC-3** à l’aide de **Logisim**, ainsi qu’à développer et tester plusieurs **programmes en assembleur LC-3**.  
L’objectif est de comprendre le fonctionnement interne d’un processeur : décodage des instructions, exécution, accès mémoire et mise à jour des flags.

---

## Objectifs du projet
- Comprendre l’architecture interne d’un processeur LC-3  
- Implémenter le **datapath** et le **contrôle** dans Logisim  
- Gérer les instructions mémoire et arithmétiques  
- Programmer et tester des fonctions en **assembleur LC-3**

---

## Fonctionnalités implémentées

### Architecture (Logisim)
- Registres **R0 à R7**
- **PC**, **IR**, **ALU**
- Accès et écriture en mémoire (RAM)
- Mise à jour des **flags NZP**
- Instructions supportées :
  - `ADD`, `AND`
  - `LD`, `LDR`, `ST`, `STR`
  - `BR`, `JMP`, `LEA`

### Programmes en assembleur
- **index** : calcule en `R0` l’adresse de la première apparition d’un caractère (code dans `R2`) dans une chaîne
- **strcpy** : copie une chaîne source vers une chaîne destination
- **strncpy** : copie une chaîne avec une limite de caractères

Fichiers fournis en :
- `.asm` : version lisible en assembleur
- `.mem` : version chargable dans la RAM Logisim

---

## Organisation du projet
```text
/
├── logisim/
│   └── lc3.circ          # Circuit principal Logisim
│
├── asm/
│   ├── index.asm
│   ├── strcpy.asm
│   └── strncpy.asm
│
├── mem/
│   ├── index.mem
│   ├── strcpy.mem
│   └── strncpy.mem
│
└── README.md
