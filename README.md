# HtmlCallVideoExeMiddlePlugin
html页面调用播放器应用程序中间件（采用Adobe air程序作为中间件）

个人项目需求：
	播放HTML页面中的视频（avi、mp4、flv, rmvb)

方案选择：
	一、直接使用H5播放器，但是H5播放器目前支持的格式中常用的只有MP4（Pass）
	二、视频统一转换成MP4格式，这种方式比较耗时，而且仅适用于视频上传的情况可以转换视频流格式，开发周期长
	三、直接使用Adobe的OSMF视频框架开发一个视频播放器，后来发现在播放 avi 格式的时候不知道什么原因导致视频加载不出来，没有找到答案
	四、直接从页面调用本地安装的播放器程序，虽然不是很好的解决方案，但总体来讲要比前三个方案好一点，至于方案三种不能加载avi视频流问题会继续找原因。
	
HTML调用播放器方式：
	Url Protocol
	
中间件：
	Adobe air应用程序
	
调用逻辑：
	1、HTML页面中点击视频，通过UrlProtocol方式调用 air应用程序（MiddlePlugin.exe：下称中间件）
	2、中间件获取到传递的视频地址，把视频地址写入到 middlePlugin.bat 批处理文件中
	3、中间件在写完批处理文件后调用 middlePlugin.vbs程序，在vbs 程序中调用 .bat文件来打开播放器
	
尝试的调用逻辑及排除的原因：
	方式一：
		使用Url Protocol方式直接调用视频播放器
		排除原因：
			1、视频播放器接收到的视频地址中会存在Url Protocol的协议头（Url Protocol协议头是自己定义的，比如在该插件中是“videoPlayer://”）这时候播放器是识别不了视频地址的
			2、使用Url Protocol方式调用时视频地址中存在中文时会被encode编码，视频播放器也是别识别的
	
	方式二:
		Url Protocol直接调用批处理或vbs文件，在批处理或vbs脚本打开播放器
		排除原因：
			1、Url Protocol访问时提交的的参数中包含中文会被encode，如果路径中有空格处理起来就比较麻烦，个人对批处理和vbs脚本不是很懂
	最后选择了一个自己比较熟悉的AdobeAir应用来处理视频地址问题

中间件开发环境：
	IDE: FlashBuilder 4.7
	SDK: Apache Flex 4.14.0
	videoPlayer：KMPlayer

目录结构说明：
	src：air中间件程序源码
	MiddlePluginTest：生成的测试程序

使用说明：

	打开 MiddlePluginTest/videPlayerTestPage.html, 修改视频超链接<a href="videoPlayer://http://127.0.0.1/3.MP4">videoPlayer 测试</a>中的视频地址“http://127.0.0.1/3.MP4”
	

