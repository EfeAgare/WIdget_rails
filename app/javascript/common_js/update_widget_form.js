window.addEventListener('turbolinks:load', () => {
  const element = document.querySelector('#update-widget-form');
  if (element == null) {
    return
  }
  element.addEventListener('keypress', () => {
    $('.invalid-feedback').text('');
  });

  element.addEventListener('ajax:success', (event) => {
    const [data, status, xhr] = event.detail;
    if (data.message != 'Success') {
      $('.invalid-feedback.form-message').text(data.message).show();
      return;
    }
  });

  element.addEventListener('ajax:error', (event) => {
    const [data, status, xhr] = event.detail;
    console.log(data)
    if (data.name) {
      $('.invalid-feedback.name')
        .text(`Please enter a valid Title of length 5`)
        .show();
    }

    if (data.description) {
      $('.invalid-feedback.description')
        .text(`Please enter a valid description greater than 20`)
        .show();
    }
  });
});
