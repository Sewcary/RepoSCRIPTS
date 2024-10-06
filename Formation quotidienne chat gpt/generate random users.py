import urllib3
import json

def generate_random_users(number_of_users):
    # URL pour l'API randomuser.me avec le nombre spécifié d'utilisateurs
    url = f"https://randomuser.me/api/?results={number_of_users}"
    http = urllib3.PoolManager(cert_reqs='CERT_NONE')
    response = http.request('GET', url)

    if response.status == 200:
        #print(response.data)
        data = json.loads(response.data.decode('utf-8'))
        results = data.get('results', [])
        for user_data in results:
            user = { 'gender': user_data['gender'],
                    'title': user_data['name']['title'],
                    'first_name': user_data['name']['first'],
                    'last_name': user_data['name']['last'],
                    'email': user_data['email'],
                    'username': user_data['login']['username'],
                    'date_of_birth': user_data['dob']['date'],
                    'phone': user_data['phone'],
                    'nationality': user_data['nat'],
                    'street_number': user_data['location']['street']['number'],
                    'street_name': user_data['location']['street']['name'],
                    'city': user_data['location']['city'],
                    'state': user_data['location']['state'],
                    'country': user_data['location']['country'],
                    'latitude': user_data['location']['coordinates']['latitude'],
                    'longitude': user_data['location']['coordinates']['longitude'],
                    'password': user_data['login']['password'],
                    'postcode': str(user_data['location']['postcode'])
                    }
            print(user)
    else:
        print("Erreur lors de la récupération des données.")
     
        
generate_random_users(5)
