/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

// =====================================================================
// Schritt 5: Euer Profil
//
// Die Kopfzeilen sind schon ausgefüllt. Für jede Anforderung aus dem
// Aufgabenblatt steht unten eine auskommentierte Zeile mit dem Element.
// Entfernt die // und ersetzt TODO_Regel durch die Regel, die ihr
// gewählt habt. Eine Anforderung kann auch mehrere Zeilen brauchen.
//
// Wichtig: Hier stehen Regeln für alle Allergien, z. B. "criticality MS".
// Einen Wert setzt ihr im Profil nur, wenn er für jede Allergie immer
// gilt (Wert fixieren). Werte, die nur für eine bestimmte Patientin
// gelten, z. B. criticality #high, gehören ins Beispiel (beispiele.fsh).
//
// Regeltypen:
//   Kardinalität   * element 1..1
//   Must Support   * element MS
//   Binding        * element from $ValueSet (required)
//   Typ            * element[x] only dateTime
//                  * element only Reference(CHCorePractitioner)
//   Wert           * element = #code
//
// Nach jeder Änderung lokal prüfen:  sushi build .
// =====================================================================

Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie, wie sie in der Hausarztpraxis erfasst und auf der Notfallstation gelesen wird."

// Anforderung 1: nur Allergien gegen Arzneimittel
// Wert fixieren: gilt für jede Allergie in diesem Profil
* category 1..1
* category = #medication

// Anforderung 2: klinischer Status muss immer angegeben sein
* clinicalStatus 1..1 MS

// Anforderung 3: Codes aus der Schweizer Allergieliste
// extensible: fehlt ein passender Code, darf trotzdem etwas erfasst werden
* code 1..1 MS
* code from $ch-allergy-vs (extensible)

// Anforderung 4: Kritikalität ist für die Notfallstation wichtig
// Ist sie unbekannt, wird #unable-to-assess erfasst
* criticality 1..1 MS

// Anforderung 5: Beginn als Datum oder als ungefähres Alter
* onset[x] only dateTime or Age
* onset[x] MS

// Anforderung 6: erfasst von einer Ärztin oder einem Arzt
* recorder only Reference(CHCorePractitioner or CHCorePractitionerRole)
* recorder 1..1 MS

// Anforderung 7: Reaktionen erfassen können, wenn bekannt (nicht Pflicht)
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (extensible)

// Invariante: bestätigte Allergie braucht eine Reaktion
* obeys dg-allergy-1