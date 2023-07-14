
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');

const firebaseConfig = {
    apiKey: "AIzaSyC7MWQaFiIRYKgNInERo4Vw51uHCBPTH6Y",
    authDomain: "ehmobile-d464c.firebaseapp.com",
    databaseURL: "https://ehmobile-d464c-default-rtdb.firebaseio.com",
    projectId: "ehmobile-d464c",
    storageBucket: "ehmobile-d464c.appspot.com",
    messagingSenderId: "235411455375",
    appId: "1:235411455375:web:f1b887096735861ed29ffa",
    measurementId: "G-43065ELB3R"
  };

  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();

  messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
      body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });