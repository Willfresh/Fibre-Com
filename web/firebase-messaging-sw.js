importScripts('https://www.gstatic.com/firebasejs/9.0.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.0.2/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: 'AIzaSyBHU6MGS9SvHM81CcLnapEP3DMR2ZEIHiE',
  authDomain: 'fibre-bd-com-e7486.firebaseapp.com',
  projectId: 'fibre-bd-com-e7486',
  storageBucket: 'fibre-bd-com-e7486.appspot.com',
  messagingSenderId: '516556205461',
  appId: '1:516556205461:android:802d92370df85566f25a9c',
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  console.log('Received background message: ', payload);

  const { title, body } = payload.notification;

  self.registration.showNotification(title, {
    body: body,
    // Autres options de personnalisation de la notification (icône, son, etc.)
  });
});
