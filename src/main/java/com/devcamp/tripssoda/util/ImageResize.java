package com.devcamp.tripssoda.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

public class ImageResize {
    /* 파일 정보와 리사이즈 값 정하는 메소드 */
    public static void thumbnailResize(String path, String fileName) throws IOException {
        File file = new File(path + File.separator + fileName);  //리사이즈할 파일 경로
        InputStream inputStream = new FileInputStream(file);
        Image img = new ImageIcon(file.toString()).getImage(); // 파일 정보 추출

        System.out.println("사진의 가로길이 : " + img.getWidth(null)); // 파일의 가로
        System.out.println("사진의 세로길이 : " + img.getHeight(null)); // 파일의 세로
        /* 파일의 길이 혹은 세로길이에 따라 if(분기)를 통해서 응용할 수 있습니다.
         * '예를 들어 파일의 가로 해상도가 1000이 넘을 경우 1000으로 리사이즈 한다. 같은 분기' */
        int width = 500; // 리사이즈할 가로 길이
        int height = 330; // 리사이즈할 세로 길이

        if(img.getWidth(null)>500) {
            BufferedImage resizedImage = resize(inputStream, width, height);
            // 리사이즈 실행 메소드에 값을 넘겨준다.
            ImageIO.write(resizedImage, "jpg", new File(path + File.separator + "resized" + fileName));
            // 리사이즈된 파일, 포맷, 저장할 파일경로
            file.delete();
            return;
        } return;
    }

    /* 리사이즈 실행 메소드 */
    public static BufferedImage resize(InputStream inputStream, int width, int height)
            throws IOException {

        BufferedImage inputImage = ImageIO.read(inputStream);  // 받은 이미지 읽기

        BufferedImage outputImage = new BufferedImage(width, height, inputImage.getType());
        // 입력받은 리사이즈 길이와 높이

        Graphics2D graphics2D = outputImage.createGraphics();
        graphics2D.drawImage(inputImage, 0, 0, width, height, null); // 그리기
        graphics2D.dispose(); // 자원해제

        return outputImage;
    }
}
