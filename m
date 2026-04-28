Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634923E6DCA
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374604; cv=none; b=T7/uor2j6h9ZxqZH2dBMMbWJFE5v7pHFJ0n8x27sIcuRIzgvdqr2l0WZxMoouvRl2s/G0QRMxph1XJmwqOEx27jgwtOdDQ7TS/o2h+YOZFSKjGL/zxY5yccymRz5JnCfSzxL8SvygUYH+oPSDv4rNkU+UUyN8Vw9p1HH0GkYwzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374604; c=relaxed/simple;
	bh=VUFpOgb6S22ZcG0ANMgf/zXh1YJTmhZ2B8aJFv/OheI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=jjpMbCAF39248l0tfeGScvepeIpKPZ9QsR1vPacjS2C5k58ONmJv7kWWJi29ULuoCr56y9OZmBkl6/fOtWjpmDG40WH+uvbJbPLl68FMbpFwdVikm8+7cxBUf3NAEPbIQtOSF5RPYOOtIPlHxAy5F5sd1kPuDrT5BD0/9ETnDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpE9Mr+9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpE9Mr+9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b24fdac394so107102055ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 04:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777374599; x=1777979399; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pef3OD46TxOIUwH98qFLaQm0kXcNlzkOoDkRUMv4zcQ=;
        b=bpE9Mr+9kPex17SnYTc+31S1kPOmtnzzUr9ZOOMUpKn75yxdTigfDBfgerrBWeBqWO
         8/DpLFJuiucMOKkWZPcC+XP5m2e/Ib66Z3oZefHQACewYjXJvMB5NR0p2yDfnMls76A0
         O2cbS4B/NT7MAJsivU/8wOMM24r7mqiSsTHpGj4p+ZyrmeRBGZ82/j830l0E55Wplv5B
         OtFKIXjoGZLjmzR9TzFFb9Y+D60Uy18FZubDP7g0fpf0iZWrzRa3d5P3Le9gpQSoYind
         LswGgB/raTb/sxi/cma0FOOmlSVV3PVkJ9+AfcjFa+2xZ0avwN4LRVA7iOhR1Hip/4zu
         1lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374599; x=1777979399;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pef3OD46TxOIUwH98qFLaQm0kXcNlzkOoDkRUMv4zcQ=;
        b=PvSyzt1lcvE9HMdCzlqjYMlVmhCFccZ+FG17nmmcirOjUPqeOUj5c0wSoApeL7dwao
         1+9GGWmf7n/Z1RckG/3uTl9wpw3IUJqflzk3PItbgH5F0/Gjygci8kxCUdbyGY5wyLgu
         m2KuefGY5FlMWllou8O8dDd0uwe8jLwoI2N4IxMA7CsQBuCoBeP8dEVKV+g0WmOsl3Zc
         YE2Cd0ACPDUPqZqnI+3BtNd0lDqJ8KHaJYMtoLDjg5AXRN8OY5tFwSZ63ZTVZhW3sVsj
         JCfMYkRG4ppDtxGn0hHJ4NBwvMy070aVpDqHh5wIMBj04ZJi3zUvQqKCC0JNPgI81iFq
         VKpA==
X-Forwarded-Encrypted: i=1; AFNElJ+CQxm6sqKkFtZGFioo4HpelRQSnVfBuWcJ5ma7xKwhvFYexyjOf9yupL6VeYmZINHz4vHrfx8No0BokA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw18XuwIsyRE36q8n4osNObUhjCXN6yZ1fYNm82Mc8OKVk37ne8
	2+XXMgEsp0jtnQnF80QpUMJXe70y95BslPSaONPRsLFro/oXDW9Mo79G
X-Gm-Gg: AeBDieuWDQknEJHQd07j6ZcPII8jrZx78gvY76j9RSeHQfMQqjpIPpcpYALCCdLuip3
	jIHjqDjwM57pdw7HeEdG2CFNaZb0L9OYNufNVbvBhTRrT3l5Dpk6rOx7LLH6jN76G6C2JFUxq75
	DnUNWEE/9XsxjiNC0MpWh0fC4HFO+xA/sOaOYK+vSYCLMQWjXylW33s8FxuQUaFE0xQHYPXY94a
	BefQHv3380kADbwH+KVm4+CwHWCA7KGSFY9cIBqEciDVFbRwLiJ750vuYb07G3SYQxegZrLgW0V
	G82qaom9Dd+WYZ3UZfAm066G+kGU6gBPrMj0dz0YuT9KmEmV8c+eBPDA5HgsMSGYpGhWUe3R6lw
	g7jmBxb57IoiTeHq4P2U4BKDAhQk4ARGD8i6RwCN45AYKbdDQmrAFpSGm4bFXl/a7L7H6mXtgUw
	KpXqF4s7EVvvqdXf/CMnzuj1m4Z1MXRxj5+2g2ePyHlCCvo9xNfTBXEzI1hsoV2bF0J03ks1QuT
	Q==
X-Received: by 2002:a17:903:4b0c:b0:2b7:9ed0:4f92 with SMTP id d9443c01a7336-2b97c4b78fcmr27558045ad.32.1777374599397;
        Tue, 28 Apr 2026 04:09:59 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa93bd4sm22828885ad.23.2026.04.28.04.09.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:09:59 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v6 4/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Tue, 28 Apr 2026 19:09:29 +0800
Message-Id: <1777374569-59233-5-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add support for the GXCAS GXHT30 humidity and temperature sensor.
The GXHT30 is software compatible with the Sensirion SHT30.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 6437568aaf73..f52114c13edb 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -934,6 +934,7 @@ static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
 	{"sht85", sht3x},
+	{"gxht30", sht3x},
 	{}
 };
 
@@ -948,6 +949,7 @@ static const struct of_device_id sht3x_of_match[] = {
 	{ .compatible = "sensirion,sts31", .data = (void *)(uintptr_t)sts3x },
 	{ .compatible = "sensirion,sts32", .data = (void *)(uintptr_t)sts3x },
 	{ .compatible = "sensirion,sts35", .data = (void *)(uintptr_t)sts3x },
+	{ .compatible = "gxcas,gxht30", .data = (void *)(uintptr_t)sht3x },
 	{ }
 };
 
@@ -965,5 +967,6 @@ module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
+MODULE_AUTHOR("Zaixiang Xu <zaixiang.xu.dev@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

