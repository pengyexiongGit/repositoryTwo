<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/mystyle.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <style type="text/css">
        body {padding-top:55px;}
    </style>
</head>
<body>
<!--导航条  -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <!--定义在容器顶部  -->
    <div class="container-fluid">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- Brand and toggle get grouped for better mobile display -->
        <!-- 头部信息 -->
        <div class="navbar-header" >
            <a class="navbar-brand glyphicon glyphicon-globe" href="#" id="menu-toggle">
                金科有限公司产品管理系统
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active "><a href="#" class="glyphicon glyphicon-shopping-cart">&nbsp公司简介 <span class="sr-only">(current)</span></a></li>
                <li><a href="#" class="glyphicon glyphicon-grain">&nbsp管理团队</a></li>
                <li><a href="#" class="glyphicon glyphicon-sunglasses">&nbsp员工风采</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle glyphicon glyphicon-text-color" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">产品介绍 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" class="glyphicon glyphicon-cloud">云计算</a></li>
                        <li><a href="#" class="glyphicon glyphicon-th">云应用</a></li>
                        <li><a href="#" class="glyphicon glyphicon-info-sign">云服务</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" class="glyphicon glyphicon-cloud-upload">大数据</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" class="glyphicon glyphicon-cloud-download">数据挖掘</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>


            <!-- 右边的    导航 按钮 -->
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">系统设置 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="javascript:void(0)" onclick="quiteSystem()">退出系统</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- ============================导航结束==================================-->


<!--=========栅格布局 ==============-->
<div class="row">
    <div class="col-md-3">

        <a class="list-group-item" data-addtab="userMenu" data-target="#tabs" data-url="http://www.baidu.com">
            员工菜单管理
        </a>
        <!-- tree 的插件 -->
        <div id="treeDiv"></div>
    </div>

    <div class="col-md-9">
        <!--   选项卡    -->
        <!-- Nav tabs -->
        <ul id="tabs" class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#home" aria-controls="home" role="tab" data-toggle="tab">欢迎</a></li>
        </ul>
        <!-- 选项卡  内容 -->
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" style="" class="tab-pane active " id="home"><font color="blue" size='5'>欢迎您，尊敬的用户:<font color='red' size='5'>${user.nickname }</font>欢迎您使用金科产品管理系统</font>&nbsp;&nbsp;<font color='blue' size='5'>您最近登录时间为：${user.showTime }</font></div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(function (){

        /* 选项卡高度 */
        // $.addtabs({iframeUse:true})
        $.addtabs({iframeHeight:870});

        $.ajax({
            url:"<%=request.getContextPath()%>/product/queryTree.do",
            type:"post",
            dataType:"json",
            success:function (tree){
                //渲染树插件 treeview()
                $("#treeDiv").treeview({
                    //data属性 树节点信息 json数组
                    data: tree,
                    //tree默认展开的节点级别默认为2
                    levels: 0,
                    //含有子节点的图标
                    collapseIcon:'glyphicon glyphicon-star-empty',
                    //没有子节点的图标
                    emptyIcon:'glyphicon glyphicon-usd',
                    //背景颜色
                    //backColor: 'green'
                    //是否显示复选框
                    showCheckbox:true,
                    //是否允许选中多个节点
                    //multiSelect:true,
                    //启用节点的超链接功能默认为false,节点需指定href属性
                    enableLinks:true,
                    //事件当节点选中时
                    onNodeSelected:function(event,node){
                        //动态向 nav-tabs 导航标签添加tab选项卡
                        //addTabs方法  add() 添加tab  close()关闭tab  closeAll() 关闭全部tab
                        if(null !=  node.url){
                            $.addtabs.add({
                                id:node.id,
                                title:node.text,
                                url:"<%=request.getContextPath()%>/"+node.url,
                            })
                        }

                    }
                })


            }
        });


    })

    //退出系统
    function quiteSystem(){
        $.ajax({
            url:"<%=request.getContextPath()%>/login/quiteUser.do",
            type:"get",
            success:function(){
                location.href="<%=request.getContextPath()%>/login.jsp"
            },
            error:function(){
                alert("退出系统错误！");
            }
        })
    }

</script>




</body>
</html>