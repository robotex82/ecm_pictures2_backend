take_snapshot = (attribute_name) ->
  Webcam.snap (data_uri) ->
    console.log attribute_name
    snapshot_container = $("[name='snapshots-for-#{attribute_name}']").first()
    img_name = "webcam-snapshot-for-#{attribute_name}"
    img_taken_at = Date.now()
    snapshot_container.append('<div class="col-xs-12 col-sm-6 col-md-4 col-lg-2"><img data-taken-at="'+img_taken_at+'" data-attribute-name="'+attribute_name+'" name="'+img_name+'" class="img-responsive thumbnail webcam-snapshot" src="'+data_uri+'"/><span class="glyphicon glyphicon-ok overlay" style="display: none;" /></div>')

$ ->
  $('[data-webcam-toggle=true]').each (index) ->
    button = $(@)
    button.on 'click', ->
      camera_container_name = $(@).data('attribute-name')
      camera_container = $("[name='webcam-for-#{camera_container_name}']").first()
      console.log camera_container
      camera_container.css('width', '640px')
      camera_container.css('height', '480px')
      Webcam.attach(camera_container.attr('id'))
      false

$ ->
  $('[data-webcam-trigger=true]').each (index) ->
    button = $(@)
    button.on 'click', ->
      attribute_name = $(@).data('attribute-name')
      take_snapshot(attribute_name)
      false

$ ->
  $('.webcam-snapshots').on 'click', 'img.webcam-snapshot', (e) ->
    multiple = $(@).parent().data('multiple')
    multiple = true
    console.log multiple
    attribute_name = $(@).data('attribute-name')
    taken_at = $(@).data('taken-at')
    raw_image_data = $(@).attr('src')
    hidden_tag = '<input type="hidden" name="'+attribute_name+'[]" data-taken-at="'+taken_at+'" class="webcam optional" value="'+raw_image_data+'">'
    console.log $("input[name='#{attribute_name}[]']")
    if multiple && (existent = $("input[name='#{attribute_name}[]']")).length
      console.log('Removing already existent tags')
      existent.remove()
      $(@).parent().parent().find('span').hide()
    if (existent = $("input[name='#{attribute_name}[]'][data-taken-at='#{taken_at}']")).length
      console.log('Removing already existent tag')
      existent.remove()
      $(@).parent().find('span').hide()
    else
      console.log('Adding hidden tag')
      $(@).after(hidden_tag)
      $(@).parent().find('span').show()