define wordpress::post  (
	$title,
	$content,
	$type = 'post',
	$publish = 'publish',
){

  wordpress::cli{ "create-post-$title-$type-$content": 
    command => "post create --post_type=${type} --post_status=${publish} --post_title='${title}' --post_content='${content}'"
  }

}