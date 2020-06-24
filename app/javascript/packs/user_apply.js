$(function() {
  $('body').on('click', '#apply_job #submit_job', function () {
    let url = $(this).data('url');
    let profile_id = $('#profile_id').val();
    let post_id = $('#post_id').val();
    $.ajax({
      method: 'POST',
      dataType: 'script',
      url: url,
      data: {
        authenticity_token: $('meta[name="csrf-token"]').attr('content'),
        profile_id: profile_id,
        post_id: post_id
      },
      error: function() {
        alert(I18n.t('apply_error'));
      },
    });    
  });
})
