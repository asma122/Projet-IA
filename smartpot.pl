% Directive pour éviter l'avertissement concernant arrosage/2
:- discontiguous arrosage/2.
:- dynamic saison_actuelle/1.  % Permet de modifier dynamiquement la saison

% Définition des plantes et de leurs caractéristiques
plante(cactus, grasse, faible, faible, hiver).
plante(ficus, tropicale, moyen, élevé, toute_saison).
plante(orchidee, fleurie, élevé, élevé, été). 
plante(basilic, aromatique, moyen, moyen, été).
plante(aloevera, grasse, faible, faible, toute_saison).
plante(rosier, fleurie, élevé, moyen, printemps).

% Indique l'humidité actuelle du sol pour chaque plante
humidite_sol(cactus, faible).
humidite_sol(ficus, élevée).
humidite_sol(orchidee, élevée). 
humidite_sol(basilic, moyen).
humidite_sol(aloevera, faible).
humidite_sol(rosier, moyen).

% Fréquence d'arrosage selon le type et les besoins en eau 
arrosage(Plante, 'tous les 10 jours') :- plante(Plante, grasse, faible, _, _).
arrosage(Plante, 'tous les 5 jours')  :- plante(Plante, grasse, moyen, _, _).
arrosage(Plante, 'tous les 7 jours')  :- plante(Plante, grasse, élevé, _, _).
arrosage(Plante, 'tous les 2 jours')  :- plante(Plante, tropicale, élevé, _, _).
arrosage(Plante, 'tous les 4 jours')  :- plante(Plante, tropicale, moyen, _, _).
arrosage(Plante, 'tous les 10 jours') :- plante(Plante, tropicale, faible, _, _).
arrosage(Plante, 'tous les 7 jours')  :- plante(Plante, aromatique, moyen, _, _).
arrosage(Plante, 'tous les 5 jours')  :- plante(Plante, aromatique, faible, _, _).
arrosage(Plante, 'tous les 3 jours')  :- plante(Plante, fleurie, élevé, _, _).
arrosage(Plante, 'tous les 7 jours')  :- plante(Plante, fleurie, moyen, _, _).

% Alertes en fonction des conditions d'humidité
alerte(Plante, 'Risque de maladie')        :- plante(Plante, _, _, élevé, _), humidite_sol(Plante, élevée).
alerte(Plante, 'Risque de sécheresse')     :- plante(Plante, _, _, _, _), humidite_sol(Plante, faible).
alerte(Plante, 'Risque de gel')            :- plante(Plante, _, _, _, hiver), humidite_sol(Plante, faible).
alerte(Plante, 'Risque de déshydratation') :- plante(Plante, _, _, faible, _), humidite_sol(Plante, faible).
alerte(Plante, 'Risque de moisissure')     :- plante(Plante, tropicale, _, élevé, _), humidite_sol(Plante, élevée).

% Précautions selon le type de plante
precaution(Plante, 'Evitez l\'exposition directe au soleil'):- plante(Plante, fleurie, élevé, _, _).
precaution(Plante, 'Evitez l\'excès d\'eau')                 :- plante(Plante, grasse, faible, _, _).
precaution(Plante, 'Evitez les endroits trop humides')       :- plante(Plante, grasse, faible, faible, _).
precaution(Plante, 'Placez-la dans un endroit chaud et lumineux') :- plante(Plante, tropicale, _, _, _).
precaution(Plante, 'Protégez-la contre les vents forts')     :- plante(Plante, fleurie, _, _, _).
precaution(Plante, 'Assurez-vous que le sol soit bien drainé') :- plante(Plante, aromatique, _, _, _).
precaution(Plante, 'Réduisez l\'arrosage en hiver pour éviter le gel') :- plante(Plante, grasse, faible, faible, hiver).
