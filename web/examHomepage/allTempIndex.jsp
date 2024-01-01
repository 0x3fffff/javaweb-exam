<%@ page import="com.utils.ExamTemp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title><%=ExamTemp.indexTitle%></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../res/favicon.ico">
    <link href="../layui/css/layui.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
</head>
<body>

<div style="padding: 16px;">
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container" style="white-space:nowrap;">
        <!--        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>-->
        <!--        <button class="layui-btn layui-btn-sm" lay-event="getData">获取当前页数据</button>-->
        <button class="layui-btn layui-btn-sm" lay-event="editpwd" id="editpwd" style="position:Relative;left: 155px">修改个人密码</button>
        <button class="layui-btn layui-btn-sm" lay-event="addTemp" id="addTemp" style="position:Relative;left: 160px">添加<%=ExamTemp.item%></button>
        <button class="layui-btn layui-btn-sm" lay-event="reloadTemp" id="reloadTemp" style="position:Relative;left: 165px">刷新表单</button>
        <button class="layui-btn layui-btn-sm" lay-event="returnIndex" id="returnIndex" style="position:Relative;left: 170px">返回主页</button>
        <!--        <button type="button" class="layui-btn" id="uploadBtn">上传文件!</button>-->
        <div class="layui-input-wrap" style="position: absolute;top:5px;width: 300px;left: 72%">
            <input type="text" onkeydown="EnterKey()" id="searchtext" lay-affix="search"  lay-filter="search" lay-options="{split: true}" placeholder="搜索<%=ExamTemp.tid%>或<%=ExamTemp.tb%>…" class="layui-input">
        </div>

        <div class="layui-col-md6 layui-form layui-row layui-col-space16" style="position: absolute;top:5px;left: 45%;width: 200px">
            <select id="system">
                <option value="course" <%=("course".equals(ExamTemp.tableName)?"selected":"")%>>课程管理系统</option>
                <option value="warehouse" <%=("warehouse".equals(ExamTemp.tableName)?"selected":"")%>>仓库管理系统</option>
                <option value="part" <%=("part".equals(ExamTemp.tableName)?"selected":"")%>>零件管理系统</option>
                <option value="customer" <%=("customer".equals(ExamTemp.tableName)?"selected":"")%>>顾客管理系统</option>
                <option value="teacher" <%=("teacher".equals(ExamTemp.tableName)?"selected":"")%>>教师管理系统</option>
                <option value="book" <%=("book".equals(ExamTemp.tableName)?"selected":"")%>>图书管理系统</option>
            </select>
        </div>
        <button class="layui-btn layui-btn-sm" lay-event="switchSys" id="switchSys" style="position: absolute;left: 57%">切换</button>
<%--        <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="progress-bar-filter">--%>
<%--            <div class="layui-progress-bar" lay-percent="0%"></div>--%>
<%--        </div>--%>
<%--        <p id="size"></p>--%>
        <!--        <button class="layui-btn layui-btn-sm" id="dropdownButton">-->
        <!--            下拉按钮-->
        <!--            <i class="layui-icon layui-icon-down layui-font-12"></i>-->
        <!--        </button>-->
        <!--        <button class="layui-btn layui-btn-sm layui-bg-blue" id="reloadTest">-->
        <!--            重载测试-->
        <!--            <i class="layui-icon layui-icon-down layui-font-12"></i>-->
        <!--        </button>-->
        <!--        <button class="layui-btn layui-btn-sm layui-btn-primary" id="rowMode">-->
        <!--            <span>{{= d.lineStyle ? '多行' : '单行' }}模式</span>-->
        <!--            <i class="layui-icon layui-icon-down layui-font-12"></i>-->
        <!--        </button>-->
    </div>
</script>
<script type="text/html" id="barDemo">
    <div class="layui-clear-space">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" lay-event="more">
            更多
            <i class="layui-icon layui-icon-down"></i>
        </a>
    </div>
</script>
<script src="../layui/layui.js"></script>
<script>
    layer.open({
        type: 0,
        title: "提醒",
        shadeClose: true, // 点击遮罩区域，关闭弹层
        anim: 4, // 0-6 的动画形式，-1 不开启
        skin:'layui-layer-molv',
        content: "欢迎使用<%=ExamTemp.indexTitle%>！",
        btn: ['好的']
    });
    function EnterKey(event){
        event = event || window.event;
        if (event.keyCode == 13) {
            var value = $("#searchtext").val();
            if(!value){
                layer.msg('请输入搜索内容');
                return elem.focus()
            };
            // 搜索跳转
            layui.table.reload('test', {
                where: {
                    type : '1',
                    Str : value
                },
            });
            $("#searchtext").focus();
        }
    }
    layui.use(['table', 'dropdown','upload','layer'], function(){
        var table = layui.table;
        var dropdown = layui.dropdown;
        var upload = layui.upload;
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var loading; //加载层
        var fsize;


        form.on('input-affix(search)', function(data){  // 搜索
            var elem = data.elem; // 输入框
            var value = elem.value; // 输入框的值
            if(!value){
                layer.msg('请输入搜索内容');
                return elem.focus()
            };
            // 搜索跳转
            table.reload('test', {
                where: {
                    type : '1',
                    Str : value
                },
            });
        });
        // 创建渲染实例
        table.render({
            elem: '#test',
            url: '/GetAllTemp',
            method: 'post',
            request: {
                pageName: "page", // 页码的参数名称，默认：page
                limitName: "limit", // 每页数据量的参数名，默认：limit
            },
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            height: 'full-35', // 最大高度减去其他容器已占有的高度差
            css: [ // 重设当前表格样式
                '.layui-table-tool-temp{padding-right: 145px;}'
            ].join(''),
            cellMinWidth: 80,
            totalRow: true, // 开启合计行
            page: true,
            cols: [[
                {type: 'checkbox', fixed: 'left'},
                {field:'id', fixed: 'left', width:100, title: '<%=ExamTemp.tid%>'},
                {field:'b', width:300, title: '<%=ExamTemp.tb%>'},
                {field:'c', width:250, title: '<%=ExamTemp.tc%>'},
                {field:'d', title:'<%=ExamTemp.td%>', width: 300},
                {field:'e', title:'<%=ExamTemp.te%>', width: 300},
                {fixed: 'right', title:'操作', width: 134, minWidth: 125, toolbar: '#barDemo'}
            ]],
            done: function(res, curr, count, origin){
                fsize = res.massage;
                element.progress('progress-bar-filter', ""+fsize+"%"); //设置进度条进度
                var id = this.id;
                // 下拉按钮测试
                dropdown.render({
                    elem: '#dropdownButton', // 可绑定在任意元素中，此处以上述按钮为例
                    data: [{
                        id: 'add',
                        title: '添加'
                    },{
                        id: 'update',
                        title: '编辑'
                    },{
                        id: 'delete',
                        title: '删除'
                    }],
                    // 菜单被点击的事件
                    click: function(obj){
                        var checkStatus = table.checkStatus(id)
                        var data = checkStatus.data; // 获取选中的数据
                        switch(obj.id){
                            case 'add':
                                layer.open({
                                    title: '添加',
                                    type: 1,
                                    area: ['80%','80%'],
                                    content: '<div style="padding: 16px;">自定义表单元素</div>'
                                });
                                break;
                            case 'update':
                                if(data.length !== 1) return layer.msg('请选择一行');
                                layer.open({
                                    title: '编辑',
                                    type: 1,
                                    area: ['80%','80%'],
                                    content: '<div style="padding: 16px;">自定义表单元素</div>'
                                });
                                break;
                            case 'delete':
                                if(data.length === 0){
                                    return layer.msg('请选择一行');
                                }
                                layer.msg('delete event');
                                break;
                        }
                    }
                });

                // 重载测试
                dropdown.render({
                    elem: '#reloadTest', // 可绑定在任意元素中，此处以上述按钮为例
                    data: [{
                        id: 'reload',
                        title: '重载'
                    },{
                        id: 'reload-deep',
                        title: '重载 - 参数叠加'
                    },{
                        id: 'reloadData',
                        title: '仅重载数据'
                    },{
                        id: 'reloadData-deep',
                        title: '仅重载数据 - 参数叠加'
                    }],
                    // 菜单被点击的事件
                    click: function(obj){
                        switch(obj.id){
                            case 'reload':
                                // 重载 - 默认（参数重置）
                                table.reload('test', {
                                    where: {
                                        abc: '123456',
                                        //test: '新的 test2',
                                        //token: '新的 token2'
                                    },
                                    /*
                                    cols: [[ // 重置表头
                                      {type: 'checkbox', fixed: 'left'},
                                      {field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true, totalRowText: '合计：'},
                                      {field:'sex', title:'性别', width:80, edit: 'text', sort: true},
                                      {field:'experience', title:'积分', width:80, sort: true, totalRow: true, templet: '<div>{{= d.experience }} 分</div>'},
                                      {field:'logins', title:'登入次数', width:100, sort: true, totalRow: true},
                                      {field:'joinTime', title:'加入时间', width:120}
                                    ]]
                                    */
                                });
                                break;
                            case 'reload-deep':
                                // 重载 - 深度（参数叠加）
                                table.reload('test', {
                                    where: {
                                        abc: 123,
                                        test: '新的 test1'
                                    },
                                    //defaultToolbar: ['print'], // 重载头部工具栏右侧图标
                                    //cols: ins1.config.cols
                                }, true);
                                break;
                            case 'reloadData':
                                // 数据重载 - 参数重置
                                table.reloadData('test', {
                                    where: {
                                        abc: '123456',
                                        //test: '新的 test2',
                                        //token: '新的 token2'
                                    },
                                    scrollPos: 'fixed',  // 保持滚动条位置不变 - v2.7.3 新增
                                    height: 2000, // 测试无效参数（即与数据无关的参数设置无效，此处以 height 设置无效为例）
                                    //url: '404',
                                    //page: {curr: 1, limit: 30} // 重新指向分页
                                });
                                break;
                            case 'reloadData-deep':
                                // 数据重载 - 参数叠加
                                table.reloadData('test', {
                                    where: {
                                        abc: 123,
                                        test: '新的 test1'
                                    }
                                }, true);
                                break;
                        }
                        layer.msg('可观察 Network 请求参数的变化');
                    }
                });

                // 行模式
                dropdown.render({
                    elem: '#rowMode',
                    data: [{
                        id: 'default-row',
                        title: '单行模式（默认）'
                    },{
                        id: 'multi-row',
                        title: '多行模式'
                    }],
                    // 菜单被点击的事件
                    click: function(obj){
                        var checkStatus = table.checkStatus(id)
                        var data = checkStatus.data; // 获取选中的数据
                        switch(obj.id){
                            case 'default-row':
                                table.reload('test', {
                                    lineStyle: null // 恢复单行
                                });
                                layer.msg('已设为单行');
                                break;
                            case 'multi-row':
                                table.reload('test', {
                                    // 设置行样式，此处以设置多行高度为例。若为单行，则没必要设置改参数 - 注：v2.7.0 新增
                                    lineStyle: 'height: 95px;'
                                });
                                layer.msg('即通过设置 lineStyle 参数可开启多行');
                                break;
                        }
                    }
                });
            },
            error: function(res, msg){
                console.log(res, msg)
            }
        });

        var selectedFile; //选择的文件

        // 文件选择框变化事件
        $('#fileInput').on('change', function () {
            selectedFile = this.files[0];
            layer.msg('已选择文件['+ selectedFile.name +']');
            //console.log('Selected File:', selectedFile.name);
        });
        //复制到剪贴板
        function copyHandle(content){
            let copy = (e)=>{
                e.preventDefault()
                e.clipboardData.setData('text/plain',content)
                document.removeEventListener('copy',copy)
            }
            document.addEventListener('copy',copy)
            document.execCommand("Copy");
        }

        // 工具栏事件
        table.on('toolbar(test)', function(obj){
            var id = obj.config.id;
            var checkStatus = table.checkStatus(id);
            var othis = lay(this);
            switch(obj.event){
                case 'reloadTemp':
                    table.reload('test', {
                        where: {
                            type : '0',
                        },
                    });
                    break;
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(layui.util.escape(JSON.stringify(data)));
                    break;
                case 'getData':
                    var getData = table.getData(id);
                    console.log(getData);
                    layer.alert(layui.util.escape(JSON.stringify(getData)));
                    break;
                case 'editpwd':  //修改密码
                    layer.open({
                        type: 1,
                        area: ['500px', '220px'],
                        title: '修改密码',
                        shade: 0.6,
                        shadeClose: true,
                        maxmin: true,
                        anim: 0,
                        success: function (layero, index) {
                            // 使用AJAX加载另一个页面的内容
                            $.ajax({
                                url: 'editPwd.jsp',
                                dataType: 'html',
                                success: function (data) {
                                    // 将加载的另一个页面的内容插入到弹层中
                                    layero.find('.layui-layer-content').html(data);
                                },
                                error: function () {
                                    layer.alert('加载修改密码页面失败');
                                }
                            });
                        }
                    });
                    break;
                case 'addTemp':
                    layer.open({
                        type: 1,
                        area: ['500px', '320px'],
                        title: '添加',
                        shade: 0.6,
                        shadeClose: true,
                        maxmin: true,
                        anim: 0,
                        success: function (layero, index) {
                            $.ajax({
                                url: 'addTemp.jsp',
                                dataType: 'html',
                                success: function (data) {
                                    // 将加载的另一个页面的内容插入到弹层中
                                    layero.find('.layui-layer-content').html(data);
                                },
                                error: function () {
                                    layer.alert('加载页面失败');
                                }
                            });
                        }
                    });
                    break;
                case 'returnIndex':
                    window.open("../index.jsp","_self");
                    break;
                case 'LAYTABLE_TIPS':
                    layer.alert('自定义工具栏图标按钮');
                    break;
                case 'switchSys':
                    var system = $("#system").val();
                    $.ajax({
                        url: '/SwitchSys',
                        dataType: 'text',
                        type: 'post',
                        data:{"system":system},
                        success: function (data) {
                            if (data == "ok") {
                                layer.msg('切换成功！')
                            } else {
                                layer.alert("切换失败！请稍后重试!", {icon: 2});
                            }
                        },
                        error: function () {
                            layer.alert("切换失败！请稍后重试!", {icon: 2});
                        }
                    });
                    location.reload();
                    break;
            }
        });
        // 表头自定义元素工具事件 --- 2.8.8+
        table.on('colTool(test)', function(obj){
            var event = obj.event;
            console.log(obj);
            if(event === 'email-tips'){
                layer.alert(layui.util.escape(JSON.stringify(obj.col)), {
                    title: '当前列属性配置项'
                });
            }
        });

        // 触发单元格工具事件
        table.on('tool(test)', function(obj){ // 双击 toolDouble
            var data = obj.data; // 获得当前行数据
            // console.log(obj)
            if(obj.event === 'edit'){ // 编辑数据
                layer.open({
                    type: 1,
                    area: ['500px', '400px'],
                    title: '编辑信息',
                    shade: 0.6,
                    shadeClose: true,
                    maxmin: true,
                    anim: 0,
                    success: function (layero, index) {
                        // 使用AJAX加载另一个页面的内容
                        $.ajax({
                            url: 'editTemp.jsp',
                            data:{
                                "id":data.id,
                                "b":data.b,
                                "c":data.c,
                                "d":data.d,
                                "e":data.e,
                            },
                            dataType: 'html',
                            success: function (data) {
                                // 将加载的另一个页面的内容插入到弹层中
                                layero.find('.layui-layer-content').html(data);
                            },
                            error: function () {
                                layer.msg('加载注册页面失败');
                            }
                        });
                    }
                });
            } else if(obj.event === 'more'){
                // 更多 - 下拉菜单
                dropdown.render({
                    elem: this, // 触发事件的 DOM 对象
                    show: true, // 外部事件触发即显示
                    data: [{
                        title: '删除',
                        id: 'del'
                    }],
                    click: function(menudata){
                        var upwd;
                        var newName;
                        if(menudata.id === 'share'){
                            layer.prompt({title: '请设置提取码',value:'', formType: 0}, function(text, index){
                                //layer.close(index);
                                upwd=text;
                                layer.close(index);
                                //alert('您输入的密令：'+ pass +'；文本：'+ text);
                                // 分享文件
                                $.post("/ShareUFile", {fname:data.fname,upwd:upwd}, function(data, textStatus) {
                                    //data contains the JSON object //textStatus contains the status: success, error, etc
                                    console.log(data);
                                    if (data!="-1") {
                                        copyHandle("https://lslink.cc/?num="+data+"&pwd="+upwd+"&now=0"); //复制分享链接
                                        layer.open({
                                            type: 0,
                                            title: "提醒",
                                            shadeClose: true, // 点击遮罩区域，关闭弹层
                                            anim: 4, // 0-6 的动画形式，-1 不开启
                                            skin: 'layui-layer-molv',
                                            content: "上传成功！<br/> 包裹号为：" + data + "<br/>提取码为：" + upwd + "<br/>分享链接已复制到剪贴板!<br/>请您牢记！",
                                        });
                                    }else{
                                        layer.alert("分享失败！请稍后重试!",{icon: 2});
                                    }
                                    console.log(textStatus);
                                }, "text");
                            });
                            //layer.msg('查看操作，当前行 文件:'+ data.fname);

                        }  else if(menudata.id === 'rename'){
                            layer.prompt({title: '请输入新名字',value:data.fname, formType: 0}, function(text, index){
                                //layer.close(index);
                                newNamew=text;
                                layer.close(index);
                                //alert('您输入的密令：'+ pass +'；文本：'+ text);
                                // 分享文件
                                $.post("/ReNameUFile", {fname:data.fname,newName:newName}, function(data, textStatus) {
                                    //data contains the JSON object //textStatus contains the status: success, error, etc
                                    console.log(data);
                                    if (data == "ok") {
                                        layer.msg('重命名成功！')
                                    } else {
                                        layer.alert("重命名失败！请稍后重试!", {icon: 2});
                                    }
                                    console.log(textStatus);
                                }, "text");});
                        }else if(menudata.id === 'del'){
                            layer.confirm('确定要删除 ['+ data.b +'] 吗？', function(index){
                                obj.del(); // 删除对应行（tr）的DOM结构
                                $.post("/DelTemp", {id:data.id}, function(data, textStatus) {
                                    console.log(data);
                                    console.log(textStatus);
                                    layer.msg("删除成功!");
                                }, "text");
                                layer.close(index);
                                // 向服务端发送删除指令
                            });
                        }
                    },
                    align: 'right', // 右对齐弹出
                    style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
                })
            }
        });

        // 触发表格复选框选择
        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });
        // 触发表格单选框选择
        table.on('radio(test)', function(obj){
            console.log(obj)
        });

        // 行单击事件
        table.on('row(test)', function(obj){
            //console.log(obj);
            //layer.closeAll('tips');
        });
        // 行双击事件
        table.on('rowDouble(test)', function(obj){
            console.log(obj);
        });

        // 单元格编辑事件
        table.on('edit(test)', function(obj){
            var field = obj.field; // 得到字段
            var value = obj.value; // 得到修改后的值
            var data = obj.data; // 得到所在行所有键值
            // 值的校验
            if(field === 'email'){
                if(!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(obj.value)){
                    layer.tips('输入的邮箱格式不正确，请重新编辑', this, {tips: 1});
                    return obj.reedit(); // 重新编辑 -- v2.8.0 新增
                }
            }
            // 编辑后续操作，如提交更新请求，以完成真实的数据更新
            // …
            layer.msg('编辑成功', {icon: 1});

            // 其他更新操作
            var update = {};
            update[field] = value;
            obj.update(update);
        });

    });
function Logout(){
    window.open("/Logout","_self");
}

</script>
<%--<p style="position: absolute;top: 10px;left: 50%;font-size:20px;"><%=ExamTemp.indexTitle%></p>--%>
<%--<p style="position: absolute;top: 35px;left: 50%;font-size:17px;">欢迎管理员:<%=request.getSession().getAttribute("uname")%></p>--%>
<ul class="layui-nav layui-layout-left" style="left:-0%;background-color: #ffffff;top: 10px;z-index: 999">
    <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
        <a href="https://blog.csdn.net/qq_19655605" target="_blank" style="color: #000000">
            <img src="../res/lslogo.png" class="layui-nav-img">
            <%=request.getSession().getAttribute("uname")%>
        </a>
        <dl class="layui-nav-child">
            <dd><a href="https://www.lslink.cc" target="_blank">螺丝快传</a></dd>
            <dd><a href="http://ox3fffff.cn" target="_blank">个人主页</a></dd>
            <dd><a href="https://blog.csdn.net/qq_19655605" target="_blank">CSDN</a></dd>
            <dd><a href="#" onclick="Logout()">退出</a></dd>
        </dl>
    </li>
</ul>
</body>
</html>