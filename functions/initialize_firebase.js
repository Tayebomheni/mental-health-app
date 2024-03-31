  const admin = require('firebase-admin');
const serviceAccount = require('C:\Users\PC\Downloads\firebasekey.json');
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: 'gs://signin-b0256.appspot.com',
});
const ml = admin.machineLearning();