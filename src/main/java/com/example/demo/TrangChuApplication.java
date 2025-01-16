package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;

@SpringBootApplication
public class TrangChuApplication {

	public static void main(String[] args) {
		SpringApplication.run(TrangChuApplication.class, args);

		// Mở trình duyệt Chrome sau khi ứng dụng khởi động
		openChrome("http://localhost:8080/trang-chu/trang-chu");
	}

	private static void openChrome(String url) {
		// Đường dẫn đến shortcut của Chrome trên Desktop (cần kiểm tra đường dẫn chính xác)
		String chromePath = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"; // Đảm bảo đường dẫn này chính xác
		String[] cmd = {"cmd.exe", "/c", "\"" + chromePath + "\"", url};

		try {
			Process process = new ProcessBuilder(cmd).start();
			System.out.println("Chrome is opened with URL: " + url);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Failed to open Chrome browser");
		}
	}
}
