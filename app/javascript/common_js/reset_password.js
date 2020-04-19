
window.addEventListener('load', () => {
  const element = document.querySelector('#reset-password-form');

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

  
    if (data.username) {
      $('.invalid-feedback.email').text(`Please enter a valid email`).show();
    }

    if (data.password) {
      $('.invalid-feedback.password')
        .text(`Please enter a valid password with minimum lenght of 8`)
        .show();
    }
  });
});
