Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE83CF69B;
	Wed, 27 May 2026 10:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876643; cv=none; b=BAcQ3zbqh35vfFpNnwcoIzeJ5bezG+J8sdAt/Qff7V7m4QPmZEe6aYVjxyMjcKoN8PjyMYV1Uxqcx4fkxBnU2ivNnunSDpPtb8sWiwY2W5QnPLG7RqfPMtoNfHGrpbOpKC9y0omlAU+c38wHx1vE2beEtA22w4D0YQN1SnEZH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876643; c=relaxed/simple;
	bh=/Rm5g60pGTkDhMLaSW54NcYzkEqxzc+u89afTyG4kIs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=POpp9TBKhYASf/XhHrkrjSHLjdvjNMPiWQcXxcUZ0o0bQB7jnjbGGnLzbnX6Ux6iiVvapIvPi6xikx+GSvOMoG+Sp4AIEX2sYub6lo80hItDM/6ZITVDjW/gB/i9qF0gWp5Bq5ihub3FyQGXWjgeQTVBbYDH4nzokVH4PA2eOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=B+u1LE1N; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="B+u1LE1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779876626;
	bh=+hgixKQujfC9rsVTqvw9qKV3Fm/cWcZloWaIy4iCvNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B+u1LE1NcsOgutph052XNxfe68p6RNVRjTM+NI0wGlv3m+BbATYB9I56GIRsLpiid
	 7X6cNR4qWspryp9ce3YE/5Nha9liaNUMFwEuD6V8eaYhiYdawThTjMTDYVN5kdZfgi
	 f6ogmAL6uBo3lck4Vie+VbUZeqTLdQhREmVRrRIU=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 29704417; Wed, 27 May 2026 18:10:23 +0800
X-QQ-mid: xmsmtpt1779876624t0rog9cno
Message-ID: <tencent_C41E4EE8E6305D772246B899A9BA2011BC09@qq.com>
X-QQ-XMAILINFO: Nd44/NwdEDGN4zrpXD7eVjN2SXVKLC3CG0+26pUE2PYQCbO2S8Dzbge2pplFsG
	 M7ajZ6IsInDiJsfxX8J33s4pqpJzRISsTWfcIZLyVuQe86o0rRVl6ksdABtvfhxuAIRMpoxVYYER
	 lz/OSCXcdvu1ALEXeIcbxk527UbXDQcLn47edPWip7gyO95AYmZLQX8cOf+BuspIgzN0LJZpdHQj
	 0KwcX6IaJ8vm3fF9YpdT6IivHRpVEj0IiojqVRRjrOuayHJ5Ae3qMBpnjuGCIgMEG8Boy6MbuM6e
	 fpplV++GldSIUpPz8hIB9F5uJ5ihRFBAJHDZVomnGm1Tw73jkUsHccxB1HugrdS7B2JC9zpKan8J
	 Y/aL8mZvtYiN2Vvp3Acgl58ykOGV2Cf8fjD6JXspYeuFNhDxpU05UdbBGGynU3jY0hnAR3dS1os0
	 8I7TFTs8J1xklSIl1XFhcA8RVCAH56dxBXdBrKkp8avwfV8EJy6U7XnG9t1HgNVt2p7bOLC41rYd
	 ADha5ZwHt0C964m8FmcmJ0Cu8gRpTbdqt3N/9v4SDJrUfGZy/hUrEfLSbNioxh79wU7u1Bv1WUbo
	 9HCC4O11rOUfr6721AD7C830xGFwBt+zaoEMvTwaOTpR6Ng9/Y9F5OHY09E/4lz/9mrbIY//q7xC
	 ZQdIe0uGhjrfVTcB3JADDQDDq5A2DdILvcMdXMPB1YhupWzphaFkADrYE3Mty2N2ysL4YRCxm7xY
	 G0Act2Pb7Fmru6q10iIVrIwEFGNGkiGKHK43b7m2jIOuwFuKQNio7iCv7DcvjuaeLNyZyLQShdr9
	 01ed/0bGd2xcDz1gWi4KIFnxXEO9K4IvskyiHGeE16cFU3EnYPvya9U56UV/g1+tx3uh+ChWr5VR
	 /qtD3IeWgK8T0BufQGHRB3/qQbSkKlkxyNnwAb9/jab4CpnAd24OhQwX8Ino8xTdfp7fJt6O9nqb
	 cLUtt2QZSwNqhOV0mf9kzIU5naTeM4dx1g1i2ZwU20xQEM/Ix0RjgCl0iCWsLMZHy0TZ/o0nlYX9
	 2n+9FUDZFBW5CGCeM6DEyesx4w1y0f6h9EWbyplhgAoy42JnaFWYx+1SLwWmQ=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 2/4] hwmon: (gpd-fan): Initialize EC before registering hwmon device
Date: Wed, 27 May 2026 18:10:19 +0800
X-OQ-MSGID: <425b71ece3cbe9a940cbe30039a6c428ee2210b4.1779876412.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779876412.git.xiaopei01@kylinos.cn>
References: <cover.1779876412.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Move the gpd_init_ec() call to before devm_hwmon_device_register_with_info
in the probe function. With the previous ordering the hwmon device was
registered and exposed to userspace before the EC initialization
completes, creating a window where sysfs reads could return invalid values.

Some buggy firmware won't initialize EC properly on boot. Before its
initialization, reading RPM will always return 0, and writing PWM will have
no effect. So move gpd_init_ec to before hwmon device register.

Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwmon/gpd-fan.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 7284babd4f5c..745b3fb9e3a4 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, data);
 
+	gpd_init_ec(data);
 	hwdev = devm_hwmon_device_register_with_info(dev,
 						     DRIVER_NAME,
 						     data,
@@ -651,9 +652,6 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	if (IS_ERR(hwdev))
 		return dev_err_probe(dev, PTR_ERR(hwdev),
 				     "Failed to register hwmon device\n");
-
-	gpd_init_ec(data);
-
 	return 0;
 }
 
-- 
2.25.1

