
window.addEventListener('turbolinks:load', () => {
  const element = document.querySelector('#reset-password-form');

  element.addEventListener('keypress', () => {
    $('.invalid-feedback').text('');
  }); 

  element.addEventListener('ajax:success', (event) => {
    const [data, status, xhr] = event.detail;
    
    $('.invalid-feedback.form-message').text(data.message).show();
    $('.reset-email').val('')
    setTimeout(function(){ $('.invalid-feedback.form-message').text('') }, 8000);
  });

  element.addEventListener('ajax:error', (event) => {
    const [data, status, xhr] = event.detail;

    if (data.message) {
      $('.invalid-feedback.email').text(`Please enter a valid email`).show();
    }
  });
});
