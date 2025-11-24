Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B07313279
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003327; cv=none; b=BWggpyZW88zNvGa9b0UEdZ8hrn+LK5762lzxjtRzluxo2TAkn55tfFGeQhD9w40aM0YHhNFdtuzyKmb5og5/UzwExHclACklPtPaezvcnRNMkPU/lycY9VgQIbJK7s7A78+HvoAAjBOCc3vIZeHP1wE9KdJuEnHb9yyFV1zzyJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003327; c=relaxed/simple;
	bh=tEa7h/x+NQB8Ei+5+J+KpXoC1MggovtqZ+/otPK8FKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GyF+vI5WM4ILnh1paCdkocMYQCztbVKxhLj8qA8WGZEAUlD6R0+viCiFH1EggQTTRCm4+vr3URwD+pWzxg+o9PCuTfFCwPGW9rPoSL5sNliN7BYo52liYBnH4NtukEPoCUe4N7PJxDTOpU3es9PhBEa1Em4JvornSSPGdHxOWJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYmPQ7R6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYmPQ7R6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2958db8ae4fso45837675ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 08:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764003326; x=1764608126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0VZxvr00LrfhHZ4Jc0d9SO/xgub7hfnURhr5R9NPTc=;
        b=JYmPQ7R6Z7SAgC8x1IB2pz1cy/oYdfOGMAYdDtD3REfH+4wtj6pVfFEQtzWce6oGJG
         L0/UGbnT4YvOBZLd/wFfL+3DRiS4EzceUzEWgZaPY92MgETST/hqGvgEaxTxrQ2Allfg
         geXQ17Oi17NtR+XIj321Kjvx1yA0gcWWLnnBRdQnxRJMOMaRnrv/Xc20bF4vFiaTKL8o
         OtWtnyQLa5MK4Nj34iZ9g4MZSZEle01+/acoLNgRBCBH5XUNrAtIpwzUq6CvtQG2J8Al
         hzIxp5+7HrPVpda1dQAlQZ3PJqyW+Y2Kw5T6zFc/2rhtzlSwU6UYVHOWoKpmzYQe9Umy
         bx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003326; x=1764608126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0VZxvr00LrfhHZ4Jc0d9SO/xgub7hfnURhr5R9NPTc=;
        b=PyAdVcrpp1lJMdneOVrwOeBIdNBx4q7Uu6u70hG+IsERUUAFqdNSPruvycerqRRKwk
         ltUWmAsO5ar1OjsE/3IywUgdzShfNBJhBK8GOzipEu7VFNU8+ZH8TKEsR4dfMT+UXODI
         w7Qp0MHX7DmpKlTaRAWBVS8u42UxFXzVwjjz1zUXzEcrG+Ss2gQlv0CSWnzoXcCf5xcb
         ejSXtuo7jL9azOiFBWA/82cmtB47Th8UOskVbUKaFg6xiMZignDw87BiIJqG2S2egS6R
         srsbUUUwCQZS49mBkkbUf7+v3SP4NFEpFbtL9DcjdP77SwcJ2w5fWSdh9+VQwsFfZqpd
         nkIA==
X-Gm-Message-State: AOJu0Yzv+sCJX8NREZggjJ5+Bi4fKbc1rsVp0rvl9GTbtvyH7NAR3XGe
	izmzqxb3QzQ4r88SDJY6zriuAQWMrHOf6E+qVy8ZglEJ22+63zALNG6+ssqH060YA5I=
X-Gm-Gg: ASbGncuVD7oHAWQGgU5HvZgKBPTuvaiQWBgNCqq66bv1fqSTtzUJwzExa5N5bl5Fg0n
	gzsr8DsnXcCp6zRbeKNG/nd6tqHwswqNQjmC/DKNKRYiN5XgYizeGLTbMJmrf2yJlYFem6Q019A
	4OvkPeFezlpHqKLjxFVEDmxq/D50Ro7ybeXg1JWYAI1zeoj/64O6TK45RtuM1eATk4Gy12cfFYh
	LTSHQM2p9RF9x36OCyEkxj70OFnJpeR/1SHmpwO/zC5q+wqMR8Bv2V/A+Kpj8Cjp7egfJix2kOS
	fejOvwmF3diYxtpVBkcjNsR2nZb3TMu526nTRc9SBx6OMmHoJX/wpG2xCaMdEheSMJrZCWjU3oV
	hPHjR8CWYGPhm+irbFwLEAS0Md0HOttr5VKjQrnfrZuhLp+9oaz32Wx3HSY2izbET56jlSbNo7m
	viJPOujMo7m7NGwgeDCAE93aryuoEm3RcVGgt4LewyrDYheSOH0LdoxWfzetT092FJhR7T1h5/N
	g==
X-Google-Smtp-Source: AGHT+IH1WqnVe+MrHeU2cTkJDlOnvSRLWLAtSLQXguWKWbhTHI38iHR5TNlqRwQR9KBYXfyUulY+sA==
X-Received: by 2002:a17:90b:1e0e:b0:340:f05a:3ec2 with SMTP id 98e67ed59e1d1-34733f34135mr14657234a91.17.1764003325397;
        Mon, 24 Nov 2025 08:55:25 -0800 (PST)
Received: from 2045D.localdomain (234.sub-72-110-77.myvzw.com. [72.110.77.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm14181601a91.9.2025.11.24.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:55:25 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: steve.glendinning@shawell.net,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] hwmon: (emc2103) Add locking to avoid TOCTOU
Date: Tue, 25 Nov 2025 00:55:08 +0800
Message-ID: <20251124165508.4667-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions fan1_input_show and fan1_target_show check shared data for
zero before using it as a divisor. These accesses are currently
lockless. If the data changes to zero between the check and the
division, it causes a divide-by-zero error.

Explicitly acquire the update lock around these checks and calculations
to ensure the data remains stable, preventing Time-of-Check to
Time-of-Use (TOCTOU) race conditions.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/emc2103.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
index 60eddc7b0270..9b8e925af030 100644
--- a/drivers/hwmon/emc2103.c
+++ b/drivers/hwmon/emc2103.c
@@ -277,8 +277,10 @@ fan1_input_show(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct emc2103_data *data = emc2103_update_device(dev);
 	int rpm = 0;
+	mutex_lock(&data->update_lock);
 	if (data->fan_tach != 0)
 		rpm = (FAN_RPM_FACTOR * data->fan_multiplier) / data->fan_tach;
+	mutex_unlock(&data->update_lock);
 	return sprintf(buf, "%d\n", rpm);
 }
 
@@ -363,10 +365,12 @@ fan1_target_show(struct device *dev, struct device_attribute *da, char *buf)
 	struct emc2103_data *data = emc2103_update_device(dev);
 	int rpm = 0;
 
+	mutex_lock(&data->update_lock);
 	/* high byte of 0xff indicates disabled so return 0 */
 	if ((data->fan_target != 0) && ((data->fan_target & 0x1fe0) != 0x1fe0))
 		rpm = (FAN_RPM_FACTOR * data->fan_multiplier)
 			/ data->fan_target;
+	mutex_unlock(&data->update_lock);
 
 	return sprintf(buf, "%d\n", rpm);
 }
-- 
2.34.1

