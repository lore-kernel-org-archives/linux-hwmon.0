Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4533DDDB5;
	Wed, 27 May 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876641; cv=none; b=u9ksxgyDtWSW35Q4f5RDwW3YUT/SfMKdwbNs2E8+vJ5ydJyvuWIoTp5N89hixPiMsdOP0+AQwfoaDxUCv18dX70m4gAfrg3zOuzuY0D3CoAoRWAMTPNptbg2rbEkvAE8AspRl1BXg77IBBUl4tAe/xdgEiPGq6tTVDevE7m5z54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876641; c=relaxed/simple;
	bh=t1MwICBEd7yk4vaezTIkn4695NaP91TclHGtzLszkQc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ZyhqMkNAM/vFJOfmze0b99y1qAgKgMP8DtX9PuojIh8OzyTBLLj/Hh0hub5QZsBe1lbK1Q58FCEGAK03hdquRo2mJkQIqMcWWTYOg+5iE31qoTBeX4NbDUa5j4HH5EhgZYqpADyuI45wtUNVBBs0/8YDHRlyXESdOoZJ4jEn40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=t8G5dzpp; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="t8G5dzpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779876624;
	bh=XSrT3ToxrcxlMSgwKcPjagCMS2CI2QDdIAERO6v5Dqg=;
	h=From:To:Cc:Subject:Date;
	b=t8G5dzppIw6VHuCpJrONcSOIyUT4YSrx9nODm90AOu3sptN4TJjnE/rhoEAXiNveV
	 bEb0Op8AL5iTgn7j9Doi22kcCTDGSsS7RelCGGzfv6w1SeK5L0m3r7WQj4cdEEByS1
	 8kBvc+QN5vV9EWfcGe1umxRMxj68MmWAHJe2yY8I=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 29704417; Wed, 27 May 2026 18:10:23 +0800
X-QQ-mid: xmsmtpt1779876623taug326f4
Message-ID: <tencent_D01DBC324E22E6A05DA32244B807A89A2109@qq.com>
X-QQ-XMAILINFO: MpzImNZj21ow2G2ubb7yyyALCfryVvsVg/JJVX//QkBGsV87M2Oep6MnWawFwz
	 SwHb3YzTJ/JmP4jrA9U427uYROEHFuXVqlbFm67f8nEzOlwFMRTWYxGmuNyMDwDtnw5KT5M5PvUB
	 1UBhmyNO1NyjkDDTnpIzn1MNdmJRSDO8FD+ORs5/8+wnNnunWHIWHCmbtFaSkug+RbV2ZsvFDq27
	 iEA0fbMuXGLxru2dIWEyJmdbKaxEy1J2YUiHLX7UBPq8T8fwWPeZea8Sm6NYhdwfKpLKHb+SVWgF
	 XltA1HRWd/xh1ydWyyWnISEG8FOoy+qn63hCQ7kCIuEXhUB9SrMxPsGZhhJ5feUOecL7TjfENg1z
	 IX0WsDNvsW2AnMDWaY2CDn9F3J7XHNPZ3LZ6YuIsyRJRtgT/j9lWIxYaamaIL6IgCUEZ8D8XEz+u
	 sl2D8Zrs/JdzKKFsPhu/lJPaQ16qIG/8Zz4WgOE39m+AGDR5489PCnAr2sUz2VSHzIGpLVawkOXJ
	 /K+7y1aM+J1aQSwa+5tyK+b0p/AnHLg3jU0KF/IexivDvwlmcWjg/Tg54G0vr34XZoBbyWL21sVM
	 Q6pZhNOI/yIWfuLidnH7oi/NUpnHi8S+aLr/JXxoxohROLNo5LdN+dz3YLhkUWrAW1/IgmPi95Rs
	 1RcUc1VxwFmobBR7s9gq0vcgMYyKqd5xKhFaiOAEc4uYaoBiKHX5SAFMeD1nqOc7tVFsbknYKMgq
	 O0YyHyjzIgYx9rtqndjffs8XDz8iTjtiNSJDwTbhRc1rz8UK4UFHYFHM3sfh+bB0EgOCMr5p5J01
	 niGDXpqhcmBsuuniutOb2BB4V3TTWwtfI5FNZxQkv4de5WmfBiTS3JakggGk7a1YrhVln1EakykN
	 HVe8bRep9kC/TlNUFYvKP4xQ70eaL7Y2OBAvjBymli6dSu0KSKYMfku15fuUrnBSmmwh0VBveTWH
	 CSV52Q4HNhosQ7Uu3zGo1J51R2iOZ6JgKNkd+62idcV3+zO5Klv0aHR4M/6k8ol9KgqsGvruAwlk
	 wveIunZvooJxnKdM4j+ygvxIZXeG4=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 0/4] some cleanup and fix in gpd-fan
Date: Wed, 27 May 2026 18:10:17 +0800
X-OQ-MSGID: <cover.1779876412.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

some cleanup and fix in gpd-fan

Pei Xiao (4):
  hwmon: (gpd-fan): drop global driver data and use per-device
    allocation
  hwmon: (gpd-fan): Initialize EC before registering hwmon device
  hwmon: (gpd-fan): upgrade log level from warn to err for platform
    device creation failure
  hwmon: (gpd-fan): fix race condition between device removal and sysfs
    access

 drivers/hwmon/gpd-fan.c | 226 ++++++++++++++++++++++------------------
 1 file changed, 125 insertions(+), 101 deletions(-)

-- 
2.25.1

