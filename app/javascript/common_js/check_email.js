
window.addEventListener('turbolinks:load', () => {
  const element = document.querySelector('#check-email-form');

  element.addEventListener('keypress', () => {
    $('.valid-feedback').text('');
  }); 

  element.addEventListener('ajax:success', (event) => {
    const [data, status, xhr] = event.detail;

    $('.valid-feedback.form-message').text(data.message).show();
    $('#check-email').val('')
    setTimeout(function(){ $('.valid-feedback.form-message').text(''), $('.check-email').val('') }, 8000);
    
  });

  element.addEventListener('ajax:error', (event) => {
    const [data, status, xhr] = event.detail;

    if (data.message) {
      $('.valid-feedback.form-message').text(data.message).show();
    }
  });
});
