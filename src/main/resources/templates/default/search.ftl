<#include "/default/inc/layout.ftl"/>

<@layout "搜索:" + kw>

<div class="row streams">
    <div class="col-xs-12 col-md-9 side-left">
        <div class="panel panel-default">
            <div class="panel-heading">
                <ul class="list-inline topic-filter">
                    <li class="popover-with-html">
                        搜索: ${kw} 共 ${results.totalElements} 个结果.
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="panel-body remove-padding-horizontal">

                <ul class="list-group row topic-list">
                    <#list results.content as row>
                        <li class="list-group-item ">
                            <a class="reply_count_area hidden-xs pull-right" href="#">
                                <div class="count_set">
                                    <span class="count_of_votes" title="阅读数">${row.views}</span>
                                    <span class="count_seperator">/</span>
                                    <span class="count_of_replies" title="回复数">${row.comments}</span>
                                    <span class="count_seperator">/</span>
                                    <span class="count_of_visits" title="点赞数">${row.favors}</span>
                                    <span class="count_seperator">|</span>
                                    <abbr class="timeago">${timeAgo(row.created)}</abbr>
                                </div>
                            </a>
                            <div class="avatar pull-left">
                                <@utils.showAva row.author "media-object img-thumbnail avatar avatar-middle"/>
                            </div>
                            <div class="infos">
                                <div class="media-heading">
                                <#--<span class="hidden-xs label label-warning">${row.channel.name}</span>-->
                                    <a href="${base}/post/${row.id}">${row.title}</a>
                                </div>
                            </div>
                        </li>
                    </#list>

                    <#if !results?? || results.content?size == 0>
                        <li class="list-group-item ">
                            <div class="infos">
                                <div class="media-heading">该类别下还没有内容!</div>
                            </div>
                        </li>
                    </#if>
                </ul>
            </div>

            <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                <@utils.pager request.requestURI!"" + "?kw=${kw}", results, 5/>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-md-3 side-right">
        <#include "/default/inc/right.ftl" />
    </div>
</div>
</@layout>

