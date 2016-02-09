remove_overlays = (elements) ->
  $(elements).removeClass('selected')

add_overlay = (element) ->
   element.parent().toggleClass('selected')

take_snapshot = ->
  Webcam.snap (data_uri) ->
    $('#snapshots').append('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-2"><img class="img-responsive thumbnail" data-onclick-copy-data-to="#ecm_pictures_picture_image_base64" src="'+data_uri+'"/><span class="glyphicon glyphicon-ok overlay" /></div>')

$ ->
  $('[data-camera-toggle=true]').each (index) ->
    button = $(@)
    button.on 'click', ->
      camera_container = $(@).data('camera-target')
      $(camera_container).css('width', '640px')
      $(camera_container).css('height', '480px')
      Webcam.attach(camera_container)
      false

$ ->
  $('[data-capture-picture=true]').each (index) ->
    button = $(@)
    button.on 'click', ->
      take_snapshot()
      false

$ ->
  $('#snapshots').on 'click', '[data-onclick-copy-data-to]', (e) ->
    source = $(@)
    source.on 'click', ->
      target_id = $(@).attr('data-onclick-copy-data-to')
      target = $(target_id)
      # raw_image_data = source.attr('src').replace(/^data\:image\/\w+\;base64\,/, '')
      raw_image_data = source.attr('src')
      target.val(raw_image_data)
      remove_overlays($(@).parent().parent().find('.selected'))
      add_overlay($(@))
      e.preventDefault