function LoadMore($selector) {
    this.url = $selector.data('more');
    this.page = $selector.data('page');
    this.size = $selector.data('size');
    this.append = $selector.data('append');
    this.timeOut = 5000;
    this.dbSize = 2; 
    this.noMore = false;
    this.isLoading = false;
    this.db = [];
}

LoadMore.prototype.loadData = function () {
    var $this = this;
    $this.isLoading = true;

    $.ajax({
        url: $this.url,
        data: {
            "page": $this.page,
            "size": $this.size
        },
        type: 'POST',
        dataType: 'text',
        success: function (text) {
            if (text && text.trim().length > 0) {
                $this.isLoading = false;
                $this.page++;
                $this.db.push(text.trim());
            } else {
                $this.noMore = true;
            }
        }, error: function () {

        }
    });
};
LoadMore.prototype.timerTask = function () {
    var $this = this;
    var st = setInterval(function () {
        if ($this.noMore) {
            clearInterval(st);
        }
        if ($this.isLoading || $this.db.length >= $this.dbSize) {
            return;
        }
        $this.loadData();
    }, 100);
}

LoadMore.prototype.load = function (callback) {
    var $this = this;
    //有数据直接返回
    if ($this.db.length > 0) {//有数据
        $($this.append).append($this.db.shift());
        return;
    }

    //全部完成直接返回
    if ($this.noMore) {
        callback.nodata();
        return;
    }
    //没数据等待
    callback.before();
    var t = new Date().getTime();
    var si = setInterval(function () {
        var i = new Date().getTime();
        if ((i - t) >= $this.timeOut) {//超时-停止循环-失败
            clearInterval(si);
            callback.error();
            return;
        }
        if ($this.db.length > 0) {//有数据-停止循环-成功
            $($this.append).append($this.db.shift());
            clearInterval(si);
            callback.success();//成功
            return;
        }
    }, 500);

}
var loadMoreMap = {};

$(function () {
    $.initLoadMore = function ($selector) {
        $selector.find('[data-more]').each(function () {
            var $this = $(this);
            loadMoreMap[$this.data('more')]=null;
            var m = new LoadMore($this);
            m.timerTask();

            loadMoreMap[$this.data('more')] = m;
        });
    };
    $.initLoadMore($('body'));

    $('body').on("touchend", '[data-more]', function (e) {
            var $this = $(this);
            loadMoreMap[$this.data('more')].load({
                before: function () {
                    $this.addClass('gray').html('<i class="icon-loading"></i>加载中...');
                },
                nodata: function () {
                        var $div='';
                        if(loadMoreMap[$this.data('more')].page>=11){
                            $this.removeClass().addClass("loading").show().html("10分钟后将推荐更多用户~");
                            $div='<div class="mend_btn"><a href="/v20/search.html">更改征友条件，查看更多推荐</a></div>';
                            $this.append($div);
                        }else
                        {
                            var h=location.href;
                            if(h.indexOf("index")!=-1)
                            {
                                $this.removeClass().addClass("loading").show().html("没有更多了,放宽征友条件试试~");
                                $div='<div class="mend_btn"><a href="/v20/search.html">修改征友条件</a></div>';
                                $this.append($div);
                            }else{
                                $this.removeClass().addClass("loading").show().html("没有更多了");
                            }

                        }

                },
                success: function (data) {
                    $this.data('active', false).removeClass('gray').html('点击查看更多');
                },
                error: function () {
                    $this.data('active', false).removeClass('gray').html('加载失败,点击重新加载')
                }
            });
        }
    )
});