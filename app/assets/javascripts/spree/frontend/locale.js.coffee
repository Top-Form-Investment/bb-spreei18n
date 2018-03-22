Spree.fetch_locales = ->
  $.ajax
    url: Spree.pathFor("locales"),
    success: (data) ->
      $('#main-nav-bar > .navbar-right').append(data)

$ ->
  $('#locale-select select').change ->
    $.ajax(
      type: 'POST'
      url: '/locale/set'
      data:
        locale: $(this).val()
    ).done ->
      window.location.reload()