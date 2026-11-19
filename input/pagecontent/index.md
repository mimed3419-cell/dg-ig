### Use Case

Eine Hausarztpraxis erfasst die Arzneimittelallergien ihrer Patientinnen und Patienten strukturiert und mit Codes. Eine Notfallstation liest diese Daten und muss rasch und zuverlässig erkennen, gegen welches Arzneimittel eine Allergie besteht, wie gefährlich sie ist und welche Reaktionen bekannt sind. So kann im Notfall ein gefährliches Medikament vermieden werden.

### Scope

**Dieses IG deckt ab:**

* Allergien und Unverträglichkeiten gegen **Arzneimittel**, erfasst von einer Ärztin oder einem Arzt
* Klinischer Status, Kritikalität, Beginn (als Datum oder als ungefähres Alter) und bekannte Reaktionen
* Codes aus der Schweizer Allergieliste (CH Term), mit der Möglichkeit, auch ohne passenden Code etwas zu erfassen

**Bewusst nicht abgedeckt:**

* Allergien gegen Nahrungsmittel, Umweltstoffe oder biologische Substanzen
* Von Patientinnen oder Angehörigen selbst erfasste Allergien
* Der Austausch der Daten (z. B. Server-Schnittstelle oder Dokumente)

### Artefakte

* [DG Arzneimittelallergie](StructureDefinition-dg-medication-allergy.html): Profil auf Basis von CH Core AllergyIntolerance. Es legt fest, welche Angaben eine Arzneimittelallergie enthalten muss, damit die Notfallstation sie zuverlässig auswerten kann.
* [Penicillin-Allergie von Anna Muster](AllergyIntolerance-PenicillinAllergieAnna.html): Beispiel einer bestätigten Penicillin-Allergie mit hoher Kritikalität und Nesselsucht als Reaktion, erfasst von Dr. med. Sara Keller.
* Invariante **dg-allergy-1**: Eine bestätigte Allergie muss mindestens eine Reaktion dokumentieren.

### Abhängigkeiten

Dieses IG baut auf [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/) auf.

### Autorin

Cleusia Adão Martins

<p style="font-size:smaller">Erstellt im Lab des Moduls Data Standards in Healthcare, ZHAW, HS26. Kein offizieller Standard.</p>