from pymongo import MongoClient
import pprint

# Charger MongoClient à partir de pymongo,
# Ouvrir une connexion au conteneur Mongo avec l’objet MongoClient,
# Sélectionner la base food,
# Lire tous les documents de la collection fruits et les afficher dans la console,
# Lire le document ‘mango’ et l’afficher dans la console.

class DataAccess :
    __user = "root"
    __mdp = "pass12345"
    __serveur = "127.0.0.1"
    __port = "27017"
    __db_name = "DBLP"
    __collection_name = "publis"

    # méthode de classe
    @classmethod
    def connexion(cls) :
        #connexion à la base mongo
        cls.client = MongoClient(f"mongodb://{cls.__user}:{cls.__mdp}@{cls.__serveur}:{cls.__port}")

        # variable de classe qui représente la BDD
        cls.db = cls.client[cls.__db_name]
        # variable de classe qui représente la collection
        cls.publis = cls.db[cls.__collection_name]


    # méthode de classe
    @classmethod
    def deconnexion(cls) :
        #il suffit de fermer le client
        cls.client.close()

    # prend en paramètre un id et retourne le document JSON correspondant.
    @classmethod
    def get_publi(cls):
        publi = cls.publis.find_one()
        return publi


DataAccess.connexion()
test_resultats = DataAccess.get_publi()

# Compter le nombre de documents de la collection publis; 
nombre = DataAccess.publis.count_documents({})
# pprint.pprint(nombre)   # 19 000 u

# Lister tous les livres (type “Book”) ; 
livres = DataAccess.publis.find({"type":"Book"})
# for livre in livres:
#     pprint.pprint(livre['title'])

# Lister les livres depuis 2014 ; 
livres2014 = DataAccess.publis.find({"year" : {"$gte":2014}},{"title":1, "year":1})
# for livre in livres2014:
#     pprint.pprint(livre)

# Lister les publications de l’auteur “Toru Ishida” ; 
publi_TI = DataAccess.publis.find({"authors" : "Toru Ishida"},{"title":1, "authors":1})
# for publi in publi_TI:
#     pprint.pprint(publi)

# Lister tous les auteurs distincts ; 
auteurs = DataAccess.publis.distinct("authors")
# pprint.pprint(auteurs)


# Trier les publications de “Toru Ishida” par titre de livre ; 
publi_TI2 = DataAccess.publis.find({"authors" : "Toru Ishida"}).sort("booktitle")
# for publi in publi_TI2:
#     pprint.pprint(publi['title'])

# Compter le nombre de ses publications ; 
publi_TI3 = DataAccess.publis.count_documents({"authors" : "Toru Ishida"})
# pprint.pprint(publi_TI3)

# Compter le nombre de publications depuis 2011 et par type ; 
etape1 = {"$match" : {"year" : {"$gte":2011}}}
# Très important : le $ devant type
etape2 = {"$group": {"_id" :"$type", "count": { "$sum" :1}}}
nb2011 = DataAccess.publis.aggregate([etape1,etape2])
# for nb in nb2011:
#     pprint.pprint(nb)

# Compter le nombre de publications par auteur et trier le résultat par ordre croissant
etape1 = {"$unwind" : "$authors"}
etape2 = {"$sortByCount" : "$authors"}
nb_publi = DataAccess.publis.aggregate([etape1, etape2])
for i in nb_publi:
    print(i)


DataAccess.deconnexion()

