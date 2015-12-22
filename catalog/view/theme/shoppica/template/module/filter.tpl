<?php
    $chosedGroup = array();
    $childFilters = array();
?>
<div class="panel panel-default">
  <div class="panel-heading">
      <?php echo $heading_title; ?>
      <div class="chosen-container chosen-container-multi">
          <ul class="chosen-choices" id="chosed_filters">
          <?php foreach ($filter_groups as $filter_group) { ?>
              <?php
                foreach ($filter_group['filter'] as $filter) {
                    if (in_array($filter['filter_id'], $filter_category)) {
                        array_push($chosedGroup, $filter_group);
                        $childFilterName='';
                        foreach ($filter['child_filters'] as $childFilter) {
                            if (in_array($childFilter['filter_id'], $filter_category)) {
                                $childFilterName .= '->' . $childFilter['name'];
                            }
                        }
              ?>
              <li class="search-choice" filterId="<?php echo $filter['filter_id']; ?>"><span><?php echo $filter_group['name'] . '：' . $filter['name'] . $childFilterName; ?></span><a class="search-choice-close"></a></li>
              <?php
                    }//end if
                }//end foreach
              ?>
          <?php } ?>
          </ul>
      </div>
  </div>
  <div class="list-group" id="filter-items">
    <?php
       foreach ($filter_groups as $filter_group) {
            if(!in_array($filter_group, $chosedGroup)){
    ?>
    <div class="list-group-item">
    <span class="filter-item-title"><?php echo $filter_group['name']; ?></span>
    <?php
        foreach ($filter_group['filter'] as $filter) {
            if(sizeof($filter['child_filters']) > 0) {
                $childFilters[] = array('parent_filter_id'=>$filter['filter_id'],'child_filters'=>$filter['child_filters']);
            }
    ?>
    <span class="filter-item" haschild="<?php echo (sizeof($filter['child_filters']) > 0) ? 'true' : 'false'; ?>" filterId="<?php echo $filter['filter_id']; ?>">
        <?php if(isset($filter['thumb'])) { ?>
        <img src="<?php echo $filter['thumb']; ?>" title="<?php echo $filter['name']; ?>" alt="<?php echo $filter['name']; ?>">
        <?php } else { ?>
        <?php echo $filter['name']; ?>
        <?php } ?>
    </span>
    <?php } ?>
    </div>
    <?php
            }//end of if(!in_array())
        }
    ?>

      <?php
        foreach ($childFilters as $childFilter) {
      ?>
      <div class="list-group-item child-filter" style="display: none" id="child-filter-<?php echo $childFilter['parent_filter_id']; ?>">
        <span class="filter-item-title">型号</span>
        <?php
        foreach ($childFilter['child_filters'] as $temp) {
        ?>
          <span class="filter-item" parentFilterId="<?php echo $childFilter['parent_filter_id']; ?>" filterId="<?php echo $temp['filter_id']; ?>">
          <?php echo $temp['name']; ?>
          </span>
      <?php } ?>
      </div>
      <?php } ?>

  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];
	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});

$('#chosed_filters').delegate('li', 'click', function(e) {
    e.preventDefault();
    $(this).remove();
    filter = [];
    $('#chosed_filters li').each(function(element) {
        filter.push($(this).attr('filterId'));
    });
    location = '<?php echo $action; ?>&filter=' + filter.join(',');

});
$('#filter-items').delegate('.filter-item', 'click', function(e) {
    e.preventDefault();
    filter = [];
    if($(this).attr('haschild') && 'true' == $(this).attr('haschild')) {
    } else {
        $('#chosed_filters li').each(function(element) {
            filter.push($(this).attr('filterId'));
        });
        if($(this).attr('parentFilterId')) {
            filter.push($(this).attr('parentFilterId'));
        }
        filter.push($(this).attr('filterId'));
        location = '<?php echo $action; ?>&filter=' + filter.join(',');
    }

});

$("span.filter-item").hover(
    function () {
        if($(this).attr('haschild') && 'true' == $(this).attr('haschild')) {
            $('div.child-filter').each(function(){
            $(this).hide();
            });
            $("#child-filter-" + $(this).attr('filterId')).show();
        }
    },
    function () {
    }
);

$("div.child-filter").hover(
        function () {
        },
        function () {
            $(this).hide();
        }
);

//--></script>
