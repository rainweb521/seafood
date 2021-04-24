<#include "/classic/inc/layout.ftl"/>

<@layout user.name + "的产品">
<div class="row users-show">
    <div class="col-xs-12 col-md-3 side-left">
		<#include "/classic/inc/user_sidebar.ftl"/>
    </div>
    <div class="col-xs-12 col-md-9 side-right">
        <div class="panel panel-default">
            <div class="panel-heading">预购的产品</div>
            <@user_contents userId=user.id pageNo=pageNo>
                <div class="panel-body">
                    <ul class="list-group">
                        <#list results.content as row>
                            <li class="list-group-item" el="loop-${row.id}">
                                <a href="${base}/post/${row.id}" class="remove-padding-left">${row.title}</a>
                                <span class="meta">
                                   价格 ${row.price}
                                    <span> ⋅ </span>
                                    库存 ${row.num}
                                    <span>  </span>
<#--                                    <span class="timeago">${timeAgo(row.created)}</span>-->
                                </span>

                                <div class="pull-right hidden-xs">
                                    <#if owner>

                                        <a class="act_delete" href="javascript:void(0);" data-evt="buy" data-id="${row.id}" data-toggle="tooltip" title="确认下单">
                                            <i class="icon icon-plus"></i>
                                        </a>
                                        <a class="act_delete" href="javascript:void(0);" data-evt="trash" data-id="${row.id}" data-toggle="tooltip" title="删除产品">
                                            <i class="icon icon-close"></i>
                                        </a>
                                    </#if>
                                </div>
                            </li>
                        </#list>

                        <#if results.content?size == 0>
                            <li class="list-group-item ">
                                <div class="infos">
                                    <div class="media-heading">该类别下还没有内容!</div>
                                </div>
                            </li>
                        </#if>
                    </ul>
                </div>
                <div class="panel-footer">
                    <@utils.pager request.requestURI!'', results, 5/>
                </div>
            </@user_contents>
        </div>
    </div>
</div>
<!-- /end -->

<script type="text/javascript">
$(function() {
	// delete
	$('a[data-evt=trash]').click(function () {
		var id = $(this).attr('data-id');

		layer.confirm('确定删除此项吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
			jQuery.getJSON('${base}/post/delete/' + id, function (ret) {
				layer.msg(ret.message, {icon: 1});
				if (ret.code >=0) {
					location.reload();
				}
			});

        }, function(){

        });
	});

    $('a[data-evt=buy]').click(function () {
        var id = $(this).attr('data-id');

        layer.confirm('确定下单吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
            jQuery.getJSON('${base}/post/buy/' + id, function (ret) {
                layer.msg(ret.message, {icon: 1});
                if (ret.code >=0) {
                    location.href = "${base}/post/zhifu";
                }
            });

        }, function(){

        });
    });
	
	// edit
	$('a[data-evt=edit]').click(function () {
		var id = $(this).attr('data-id');
		window.location.href='${base}/post/editing?id=' + id;
	});
})
</script>
</@layout>