<%@ page import="com.utils.ExamTemp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改密码</title>
    <!-- 请勿在项目正式环境中引用该 layui.css 地址 -->
    <link href="../layui/css/layui.css" rel="stylesheet">
</head>
<body>
<!-- 给容器追加 class="layui-form-pane"，即可显示为方框风格 -->
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">密码：</label>
        <div class="layui-input-block">
            <input type="password" name="pwd" autocomplete="off" lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">重复密码：</label>
        <div class="layui-input-block">
            <input type="password" name="repwd" autocomplete="off"  lay-verify="required" class="layui-input">
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
            if (field.pwd != field.repwd){
                layer.alert("两次密码不一致！");
                return false;
            }
            $.ajax({
                url: '/EditUserPwd',
                dataType: 'TEXT',
                type:"POST",
                data:{
                    pwd:field.pwd,
                },
                success: function (data) {
                    if (data=='ok'){
                        layer.msg("修改成功！");
                    }else{
                        layer.msg("修改失败！");
                    }
                },
                error: function () {
                    layer.msg('修改失败!');
                }
            });
            return false; // 阻止默认 form 跳转
        });
    });
</script>

</body>
</html>