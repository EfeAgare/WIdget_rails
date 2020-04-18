window.addEventListener('load', () => {
  const element = document.querySelector('#create-widget-form');

  element.addEventListener('keypress', () => {
    $('.invalid-feedback').text('');
  }); 

  element.addEventListener('ajax:success', (event) => {
    const [data, status, xhr] = event.detail;
    if (data.message != 'Success') {
      $('.invalid-feedback.form-message').text(data.message).show();
      return;
    }
    $('.modal').hide();
    $('.modal-backdrop').hide();
  });

  element.addEventListener('ajax:error', (event) => {
    const [data, status, xhr] = event.detail;

  
    if (data.name) {
      $('.invalid-feedback.title').text(`Please enter a valid Title of length 5`).show();
    }

    if (data.description) {
      $('.invalid-feedback.description')
        .text(`Please enter a valid description greater than 20`)
        .show();
    }
  });
});
