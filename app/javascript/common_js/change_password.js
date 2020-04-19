
window.addEventListener('load', () => {
  const element = document.querySelector('#change-password-form');

  element.addEventListener('keypress', () => {
    $('.invalid-feedback').text('');
  }); 

  element.addEventListener('ajax:success', (event) => {
    const [data, status, xhr] = event.detail;

    $('.invalid-feedback.form-message').text(data.message).show();
    $('#current_password').val('')
    $('#new_password').val('')
    setTimeout(function(){ $('.invalid-feedback.form-message').text('') }, 4000);
    
  });

  element.addEventListener('ajax:error', (event) => {
    const [data, status, xhr] = event.detail;

    if (data.message) {
      $('.invalid-feedback.form-message').text(data.message).show();
    }

    if (data.password) {
      $('.invalid-feedback.password')
        .text(`Please enter a valid password with minimum lenght of 8`)
        .show();
    }
  });
});
