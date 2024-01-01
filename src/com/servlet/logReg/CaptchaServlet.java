package com.servlet.logReg;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

@WebServlet("/captcha")
public class CaptchaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int width = 100;
        int height = 45;
        int captchaLength = 4;

        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = bufferedImage.createGraphics();

        // 设置背景颜色
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, width, height);

        // 设置边框
        graphics.setColor(Color.BLACK);
        graphics.drawRect(0, 0, width - 1, height - 1);

        // 生成随机字母数字组合
        String captchaText = generateRandomString(captchaLength);
        request.getSession().setAttribute("captcha", captchaText);

        // 设置字体和文本样式
        graphics.setColor(Color.BLACK);
        graphics.setFont(new Font("Arial", Font.BOLD, 24));
        graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // 绘制验证码文本
        graphics.drawString(captchaText, 20, 40);

        // 添加随机噪点
        addNoise(graphics, width, height, 20);

        // 添加干扰线
        addLines(graphics, width, height, 4);

        response.setContentType("image/png");
        OutputStream outputStream = response.getOutputStream();
        ImageIO.write(bufferedImage, "png", outputStream);
        outputStream.close();
    }

    private String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder randomString = new StringBuilder();

        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            randomString.append(characters.charAt(index));
        }

        return randomString.toString();
    }

    private void addNoise(Graphics2D graphics, int width, int height, int count) {
        Random random = new Random();

        for (int i = 0; i < count; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int color = random.nextInt(256); // RGB颜色

            graphics.setColor(new Color(color, color, color));
            graphics.fillRect(x, y, 2, 2);
        }
    }

    private void addLines(Graphics2D graphics, int width, int height, int count) {
        Random random = new Random();

        for (int i = 0; i < count; i++) {
            int x1 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int x2 = random.nextInt(width);
            int y2 = random.nextInt(height);

            graphics.setColor(Color.BLACK);
            graphics.drawLine(x1, y1, x2, y2);
        }
    }
}
