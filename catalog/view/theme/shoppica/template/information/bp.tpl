<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
    <div id="nav" class="col-sm-3">
        <div class="list-group">
            <?php foreach ($informations as $information) { ?>
            <a data-idx="<?php echo $information['information_id']; ?>" class="list-group-item"><?php echo $information['title']; ?></a>
            <?php } ?>
        </div>
    </div>
    <div id="content" class="col-sm-9"></div>
  </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript"><!--
$('div.list-group').delegate('a', 'click', function(e) {
    var element = this;
    $('#content').html('<div class="well well-large well-transparent lead"><i class="fa fa-spinner fa-2"></i>加载中...</div>');
    $.ajax({
        url: 'index.php?route=information/information/agree&information_id=' + encodeURIComponent($(element).attr('data-idx')),
        dataType: 'html',
        complete: function() {
        },
        success: function(data) {
            var html = '';
            html += '<div class="modal-header"><h3 class="modal-title">' + $(element).text() + '</h3></div>';
            html += data;
            $('#content').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$(document).ready(function(){
    $('div.list-group a:first-child').click();
});
//--></script>