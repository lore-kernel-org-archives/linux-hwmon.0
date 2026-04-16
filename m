Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED4366823
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776330509; cv=none; b=TQc0hA7VcBJ/2ctlt5FlPsXAoOepsur2nTc6s3VQ4R7zzLVvXaaBVVfZOruiXEQESv90mes8yJEr7EQwgkHNtNwlwFEjS9FMKb7jcITArC6SaNszqTX6XmMrjzZadqDeeAqAbSNS1wtWVmUweYjfVAPUY5ZgKEXNK+5YTRwG1BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776330509; c=relaxed/simple;
	bh=yHskqd2Ai3Lbh145M3VvhDPFWxxoTMFnZIs4xmZHBBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpT3QHb25db44G5adiWJpKqP2E7zLCuVdJS8HFv8CxFwPhtoJU1IgSeU0mg7eyEZMtNYJl543R7Bi03TEwSgmZFciQK3iLY6nLUuJM7/SmLjc0Hmn1MM+ND+njpexye6+dS3d0dNk+ldAWhzHGjM4zTkIGZ9Dp1u0qESDZJ86JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUPp8alN; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUPp8alN"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c555f886dso305901c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776330507; x=1776935307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHuDfpuVmFl5QLVcH12tE5gb+wugwJKCStG8y559P1s=;
        b=RUPp8alNJ1CvVt0Bj6j7uP5F1VsRv9fnBH2zkrk2jFBT3i4IclzkOOievlyLTqBEHZ
         lU8txR8WRdvzBqhDRxKAbxwLTAyyjOigX7CKSTS+vln7OmV0pcR83NR+gQsSyfegkn87
         V7hft6vp8p4lvZpdjybG/+LAJykJio9qoecbs+2zEaT4YtYemMyuHADOV9WBWj3jEv0t
         4AdlsJiw3SXS0/N8xOQ28nCfCDrJU11xufSaSJ3vQW2N4ttluU0St06ur1cJ3Jq9vZo4
         lA4dw0j+vQNwunhrwNkQplNT9dcQ16yLpYeE4/Zj8UZtdlL4/HOaN5AR16FMMc562Xv6
         ungw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776330507; x=1776935307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHuDfpuVmFl5QLVcH12tE5gb+wugwJKCStG8y559P1s=;
        b=mQAeMh0GcEfKuhfBW/KIlt38yBVBHxH4tRB+AaJ+pdOZW74p3TSIAwU3GWz1+lekGr
         L6/sGAfYbjx/1GLHJRffe7tIJQdkfFja1BAiZFNOk1yo2o/fpdbYmc+pSlfLZdg6ISWA
         dxkhGq9F+8OggsQCohz49sFy6hPpDSt55gPSdllY5ClY+MPhlmiRGyyAxwyigpH3feay
         RciMr3rAniMTOc9goJWRB+1uULtATmGRrqJtdLpgGl/qWMQ7Y+K8p9Eq/RdzKOJd80kx
         ndJtKQDKvXPChT9nAX1l5ufgsLHY700hZZelZ9F3U3WchhTY9cybeDDC+InffLdCBLW1
         6IAQ==
X-Gm-Message-State: AOJu0YyWNptF8ptNNqciszOmF+PWMEvpdHLdg1HNgH3WzHdYuWdrWIEM
	dbUt1+iwLKalOnGauoInpTg1MMt3IEbNhRb2c6qUUbOtDsuOTFZKCe+c
X-Gm-Gg: AeBDietTjUKxLJRQtd14edRC1J2gkw5fqgg3aQ2xBmiXhvemHBYuwG34Z1KFFau2u9W
	AcI+1eROJEfDTddyoE5CHKbCGieCgnzRfVvAgUC9NI83HOetNtEs5qRl87uFV+ZAqgWIacGX9kq
	pN2d8Fq8sWrFHLDJplZbWODHRmD3BZwDDcKkr2+499OqBMvsqM+Q6LIpl3s50C42Ie+34Awcnp5
	c7PFZl5EYOj5YDK+1A4MxCcFOSDjBaTlT4rNz0BliXX36txuDUqurJe1dS/dMXsJSG9L4DOFCfe
	Z+As9VnfnkuDEt/6a2CuSY/vP69sUzKPJT/Kftt0z66iIla8yoTCxD2znIyk0l8IRNcfJ7X4vf8
	tKkdSjbrMiudK/GIfQDi4x2EU37SJE0w3fD9JiJ0Ue+sOXrEXX0kba5w6IR0FgEhdHM5MWtP8V9
	QTVqghPLoZdHEbVlOvZNL5JDXDHIT+Ssk+0Dm3PKoplKUWIfE24KLsGWfoc+y7V5qN9JEp1NuMT
	bh0METQbKs6uVfWol0IOly42Nxh9CwyNajNzdy4mVCyGD7NTvaG9avMrUkjkmOjc2PQBNWWxbCd
	htQj0ZXCN+SsrPwWjthcNYw=
X-Received: by 2002:a05:7022:f9d:b0:119:e56b:c75c with SMTP id a92af1059eb24-12c34f069edmr14207733c88.33.1776330506815;
        Thu, 16 Apr 2026 02:08:26 -0700 (PDT)
Received: from 2045L.localdomain (49.sub-75-226-46.myvzw.com. [75.226.46.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a8496sm5185955c88.10.2026.04.16.02.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:08:26 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 1/2] hwmon: (lm63) Convert macro to function to avoid TOCTOU
Date: Thu, 16 Apr 2026 17:07:51 +0800
Message-ID: <20260416090752.97392-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro FAN_FROM_REG evaluates its argument multiple times. When used
in lockless code accessing shared driver data, this can cause a
Time-of-Check to Time-of-Use (TOCTOU) race and potentially a
divide-by-zero error.

Convert the macro to a static function so that the register value is
evaluated only once.

Check the other conversion macros in the driver as well. Keep them
unchanged because they either do not evaluate arguments multiple times
or are only used from locked code paths.

Link: https://lore.kernel.org/linux-hwmon/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
While learning the hwmon driver code, I found a few more potential
TOCTOU problems in drivers still using the older non-_with_info() APIs.
Fix them.
---
 drivers/hwmon/lm63.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 035176a98ce9..da132b267c58 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -109,8 +109,14 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
  * adapted accordingly.
  */
 
-#define FAN_FROM_REG(reg)	((reg) == 0xFFFC || (reg) == 0 ? 0 : \
-				 5400000 / (reg))
+static int fan_from_reg(int reg)
+{
+	if (reg == 0xFFFC || reg == 0)
+		return 0;
+
+	return 5400000 / reg;
+}
+
 #define FAN_TO_REG(val)		((val) <= 82 ? 0xFFFC : \
 				 (5400000 / (val)) & 0xFFFC)
 #define TEMP8_FROM_REG(reg)	((reg) * 1000)
@@ -333,7 +339,7 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm63_data *data = lm63_update_device(dev);
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index]));
+	return sprintf(buf, "%d\n", fan_from_reg(data->fan[attr->index]));
 }
 
 static ssize_t set_fan(struct device *dev, struct device_attribute *dummy,
-- 
2.43.0
