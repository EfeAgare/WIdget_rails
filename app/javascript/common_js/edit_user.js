window.addEventListener('load', () => {
  const element = document.querySelector('#edit-user-form');

  element.addEventListener('ajax:success', (event) => {
    const [data, status, xhr] = event.detail;
    if ((data.message = 'Success')) {
      $('.invalid-feedback.form-message')
        .text('Profile updated successfully')
        .show();
    }
  });

  element.addEventListener('ajax:error', (event) => {
    const [data, status, xhr] = event.detail;
    if (data.message != 'Success') {
      $('.invalid-feedback.form-message').text(data.message).show();
    }
  });
});
