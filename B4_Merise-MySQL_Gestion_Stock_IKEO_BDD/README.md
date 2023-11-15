# Merise et MySQL : Gestion des Stocks IKEO avec une BDD (Brief n°4)
Les usines IKEO veulent informatiser leurs systèmes de facturations.

## 1) Dictionnaire de données 
<img src='./images/Dictionnaire_de_donnees.png' width='85%'></br>

## 2) Les dépendances fonctionnelles (DF) 
Après étude du dictionnaire, voici les DF trouvées :
- **Sites_production**</br>
Id_usine -> nom_usine, adresse, id_ville</br>
Id_ville -> nom_ville</br>
- **clients**</br>
Id_client -> type_client, nom_client, adresse_client, id_ville, id_pays</br>
id_type_client -> type_client</br>
Id_pays -> nom_pays</br>
-  **produits**</br>
Id_produit -> nom_produit, ref_produit, description_produit, etat_produit, id_liste_usine</br>
Id_liste_usine -> usine</br>
- **factures**</br>
Id_factures -> numéro_facture, date_facture, nom_client, coordonnee_client, produit_quantite</br>
Id_coordonnee_client -> nom_client, adresse_client, id_ville,</br>
Id_produit_quantite -> nom_produit, quantité</br>
Id_date -> date</br>
</br></br>
## 3) Le schéma entité-association (MCD) 
<img src='./images/schema_entite_association_MCD.png' width='70%'></br>

## 4) Le MLD 
1. 	**usines** ( *id_usine, nom_usine, adresse, nom_ville, id_ville* )
2. 	**clients** ( *id_client, nom_client, id_type_client, adresse, id_ville* )
3. 	**villes** ( *id_ville, nom_ville, id_pays* )
4. 	**pays** ( *id_pays, nom_pays* )
5. 	**type_clients** ( *id_type_client, type_client* )
6. 	**produits** ( *id_produit, nom_produit, ref_produit, description_produit, id_etat* )
7. 	**etats_produits** ( *id_etat, abandonné* )
8. 	**fabrique** ( *id_usine, id_produit* )
9. 	**factures** ( *id_facture, numero_facture, id_date, id_client, id_facture* )
10. **apparaitre** ( *id_facture, id_produit, quantité* )
11. **dates** ( *id_date, date* )
</br>
</br>


## 5) Le schéma de la base créée 
<img src='./images/schema_BDD_creee.png' width='75%'></br>

## 6) Les requêtes SQL 
<img src='./images/requetes_SQL1.png' width='50%'></br>
<img src='./images/requetes_SQL2.png' width='50%'></br>
<img src='./images/requetes_SQL3.png' width='50%'></br>
<img src='./images/requetes_SQL4.png' width='50%'></br>