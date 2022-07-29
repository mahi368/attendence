App.messages = App.cable.subscriptions.create(
  'FeedChannel',
  {
    received: function(data) {
      document.getElementById('students').innerHTML += '<table><td>' + data.enrollment_number + '</td><td>' + data.first_name + " " + data.last_name + '</td></tr></table>';},
  },
);