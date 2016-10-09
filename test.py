from firebase import firebase
import requests
firebase = firebase.FirebaseApplication('https://detroit-student-transport.firebaseio.com/', None)



#this gets ALL users
result = firebase.get('/users', None)
print result
print "\n\n"


#this creates a NEW USER (2 in this case)
# data = {'name': 'testingOriginal', 'age': 20}
# secondData = {'name': 'secondTest', 'age': 30}
#
# new_user = firebase.post('/users', data)
# new_user = firebase.post('/users', secondData)
#
#
#
# #this UPDATES information on an EXISTING USER
# tempData = {'name': 'testingUpdated', 'newAttribute': 'look new info!'}
# temp = firebase.patch('users/-KTbLsVsw2kRxK1VtQ5Q', data=tempData)


#fetches data on a SPECIFIC user by key
specificUser = firebase.get('/users', '-KTbLsXptmi0XmHq9qfC')
print specificUser

#gets specific data from a specific user (three ways shown)
specificName = specificUser['name']
print specificName

specificNameTwo = specificUser.get('name', 0)
print specificNameTwo

specificAge = firebase.get('/users', '-KTbLsXptmi0XmHq9qfC')['age']
print specificAge


#still trying to get this type of thing to work but theoretically returns user from search
specificUserAfterSearch = firebase.get('/users', None, {'age': 20})
print specificUserAfterSearch
