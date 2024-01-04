<%@ page import="com.utils.ExamTemp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改信息</title>
    <!-- 请勿在项目正式环境中引用该 layui.css 地址 -->
    <link href="../layui/css/layui.css" rel="stylesheet">
</head>
<body>
<!-- 给容器追加 class="layui-form-pane"，即可显示为方框风格 -->
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.tid%></label>
        <div class="layui-input-block">
            <input type="text" name="id" autocomplete="off" disabled value='<%=request.getParameter("id")%>' lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.tb%></label>
        <div class="layui-input-block">
            <input type="text" name="b" autocomplete="off" placeholder="请输入" value='<%=request.getParameter("b")%>' lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.tc%></label>
        <div class="layui-input-block">
            <input type="text" name="c" autocomplete="off" placeholder="请输入" value='<%=request.getParameter("c")%>' lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.td%></label>
        <div class="layui-input-block">
            <input type="text" name="d" autocomplete="off" placeholder="请输入" value='<%=request.getParameter("d")%>' lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.te%></label>
        <div class="layui-input-block">
            <input type="text" name="e" autocomplete="off" placeholder="请输入" value='<%=request.getParameter("e")%>' lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" align="center">
        <button class="layui-btn" lay-submit lay-filter="demo2">确认</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>


<%--<script src="../layui/layui.js"></script>--%>
<script>
    layui.use(['form'], function(){
        var form = layui.form;
        var layer = layui.layer;
        // 提交事件
        form.on('submit(demo2)', function(data){
            var field = data.field; // 获取表单字段值
            console.log(field);

            $.ajax({
                url: '/EditTemp',
                dataType: 'text',
                type:"POST",
                data:{
                    "id":field.id,
                    "b":field.b,
                    "c":field.c,
                    "d":field.d,
                    "e":field.e,
                },
                success: function (data) {
                    layer.msg("编辑成功！请刷新表单");
                },
                error: function () {
                    layer.msg('编辑失败');
                }
            });
            return false; // 阻止默认 form 跳转
        });
    });
</script>

</body>
</html>