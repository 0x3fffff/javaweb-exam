<%@ page import="com.utils.ExamTemp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改信息</title>
    <link href="../layui/css/layui.css" rel="stylesheet">
</head>
<body>
<!-- 给容器追加 class="layui-form-pane"，即可显示为方框风格 -->
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.tb%></label>
        <div class="layui-input-block">
            <input type="text" name="b" autocomplete="off" placeholder="请输入" lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.tc%></label>
        <div class="layui-input-block">
            <input type="text" name="c" autocomplete="off" placeholder="请输入" lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.td%></label>
        <div class="layui-input-block">
            <input type="text" name="d" autocomplete="off" placeholder="请输入" lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><%=ExamTemp.te%></label>
        <div class="layui-input-block">
            <input type="text" name="e" autocomplete="off" placeholder="请输入" lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" align="center">
        <button class="layui-btn" lay-submit lay-filter="demo2">添加</button>
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
                url: '/addTemp',
                dataType: 'text',
                type:"POST",
                data:{
                    "b":field.b,
                    "c":field.c,
                    "d":field.d,
                    "e":field.e,
                },
                success: function (data) {
                    layer.msg("添加成功！");
                },
                error: function () {
                    layer.msg('添加失败');
                }
            });
            return false; // 阻止默认 form 跳转
        });
    });
</script>

</body>
</html>