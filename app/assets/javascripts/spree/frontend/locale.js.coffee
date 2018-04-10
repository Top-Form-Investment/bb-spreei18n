Spree.fetch_locales = ->
  $.ajax
    url: Spree.pathFor("locales"),
    success: (data) ->
      $('#main-nav-bar > .navbar-right').append(data)

$ ->
  $('#locale-select select').change ->
    $.ajax(
      type: 'POST'
      url: $(this).data('href')
      data:
        locale: $(this).val()
        authenticity_token: $('#locale-select input[name="authenticity_token"]').val()
    ).done ->
      window.location.reload()