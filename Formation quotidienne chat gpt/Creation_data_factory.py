# Script de Création d'un Data Factory dans Azure

# Importation des bibliothèques nécessaires depuis Azure SDK pour Python
from azure.identity import ClientSecretCredential
# ClientSecretCredential est utilisé pour l'authentification auprès d'Azure en utilisant un client ID, un secret et un ID de locataire

from azure.mgmt.resource import ResourceManagementClient
# ResourceManagementClient permet de gérer les groupes de ressources Azure

from azure.mgmt.datafactory import DataFactoryManagementClient
# DataFactoryManagementClient permet de gérer les Data Factories Azure

from azure.mgmt.datafactory.models import *
# Importation des modèles nécessaires pour créer et gérer les objets Data Factory

def print_item(group):
    """Imprimer une instance d'objet Azure."""
    print("\tNom: {}".format(group.name))
    print("\tId: {}".format(group.id))
    # Vérifie si l'objet a un attribut 'location' et l'imprime si présent
    if hasattr(group, 'location'):
        print("\tEmplacement: {}".format(group.location))
    # Vérifie si l'objet a un attribut 'tags' et l'imprime si présent
    if hasattr(group, 'tags'):
        print("\tTags: {}".format(group.tags))
    # Vérifie si l'objet a un attribut 'properties' et appelle la fonction print_properties si présent
    if hasattr(group, 'properties'):
        print_properties(group.properties)

def print_properties(props):
    """Imprimer les propriétés d'un groupe de ressources."""
    # Vérifie si les propriétés existent et si elles ont un état de provisionnement, puis les imprime
    if props and hasattr(props, 'provisioning_state') and props.provisioning_state:
        print("\tPropriétés:")
        print("\t\tÉtat de provisionnement: {}".format(props.provisioning_state))
    print("\n\n")

# ID de l'abonnement Azure
subscription_id = '1de1c601-a1fc-4be0-b44f-bdb33bb4c6a9'

# Noms du groupe de ressources et du Data Factory
rg_name = 'RG_COOKBOOK'
df_name = 'ADF-COOKBOOK2'

# Informations d'authentification
credentials = ClientSecretCredential(
    client_id='',
    client_secret='',
    tenant_id=''
)

# Paramètres du groupe de ressources et du Data Factory
rg_params = {'location':'francecentral'}
df_params = {'location':'francecentral'}

# Créer le client de gestion des ressources
resource_client = ResourceManagementClient(credentials, subscription_id)

# Créer le client de gestion de Data Factory
adf_client = DataFactoryManagementClient(credentials, subscription_id)

# Créer le Data Factory
df_resource = Factory(location='francecentral')
df = adf_client.factories.create_or_update(rg_name, df_name, df_resource)

# Imprimer les détails du Data Factory
print_item(df)

