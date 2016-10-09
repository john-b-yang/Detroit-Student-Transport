from firebase import firebase
import requests
firebase = firebase.FirebaseApplication('https://detroit-student-transport.firebaseio.com/', None)




result = firebase.get('/users', None)
# print result

# data = {'user_id': 'testUser', 'name': 'testing2', 'age': 1232,}
#
# new_user = firebase.post('/users', data)


tempData = {'name': 'newTestName', 'latitude': 46.705, 'longitude': 134.34}
temp = firebase.patch('https://detroit-student-transport.firebaseio.com/users/-KTayRqzDDrafzgV6GcV', data=tempData)

itWorks = firebase.get('/users', None)
print itWorks
print "okay so now we're doing just retrieving that one guy\n\n\n"

pleaseWork = firebase.get('/users', 0, {'user_id': 'testUser'})
print pleaseWork
