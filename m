Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7257339A066
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331088; cv=none; b=Nyn9PIS5cLE/LGM3Q57XXUBzYn/vMxSBEEHEjcWDofUirkbygthVzGO9b44azr4T64WvrNKC7arcdD4QC7+Xyns7gsuow4F6yOXehLmiRoQQ/xeoZE4ppJI9Lv15l8sjpkmV6fkhNBFwju8qnvJI9NZzJYLW3njoB4pMUPZ+bec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331088; c=relaxed/simple;
	bh=PfJdO4qZKMrQy9HLdqNKoZDedvOaQriZ65f34VumLow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Skrrr5oc2Or6sFR6itGz2jYVfE06XaojIP1vXPbLR1mcSY6xl7CCSr9cyCo90nAMTV9GzP24Zt3A5N0AGEsFlyrly9FRM+Bxve9YTozhCU7lkc2Hdlvztpg0s5tS0ZcAmhC2PF0zbBc+uRCk14bn1vunJpNoX18+kgkLCPxnJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq5D4CCv; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq5D4CCv"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d9916deb14so6550155eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776331085; x=1776935885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sW/91EsGRNq3hWYMm0v2lx1nlfjXVYbBn7pqndVOpPI=;
        b=Mq5D4CCvUfZEI8Ekv/Lbq1Lakfy3wLuTPGDDab2gy1PUloV4HboYiglAF2HdJudqdi
         Ni4NkppENcpPhwBYumR9jiY7xNdkZXxcoFeXbkb+a3wCz7hmqPUnM/EY/pYvBNlhTxcT
         +jlbVRWPevW5+YyroEtl1Oxx9QBF/Y+jnq1o9TQgdas/jeJyzX+uYqkjAjTJnt94hoUZ
         FkRcRtLcoh5VyfiaadR12CUf2ja4Wsv4eMHzV/Lwf8gG9nsakBptaPK6EQMv5iRaJZg3
         eccCGoKZdzJ/+aPVpKlEDe3HXjGZDC/f/jR7V2qOcqYMiHYiihObjTYERYplW76Nes4k
         OkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331085; x=1776935885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW/91EsGRNq3hWYMm0v2lx1nlfjXVYbBn7pqndVOpPI=;
        b=aoaG9wIltGEDQuB/CQrpZqpJ/SCvrfgiu+vWD8VGqW40NfxnLZuvcVdxJI+LDoekGA
         xfLQVrHkwvTKjVYdV4y5bigu+UFt8xxjt6Dw4rx/1OTG0HYRBI3SZXdxw9S6+RbmwIq7
         Bn/p0/Umx1FVSgZcYbWE0N2xnA2xNtGiJ3Wy+fq66xEi5NFGBWI5OnoIwH/6ii2j6mKu
         P9UgoFHgHa2Y4fza8Yq0LKIYX2PTnyEuxFGfn4YHpHsoSVUifEqDUYGVJHYwjIQ5Qji/
         b+UsFGVfFJczFEQLEVGgyuDVRS43bxN0iR/sE658uXS2+oFBfNSg2cEniv1T6O8Clrvh
         Vh7g==
X-Gm-Message-State: AOJu0Yzm7ZtbKREV3i7UP9e5ufvrol4Q1Zu4QyUSf/8BJclM/n6KYAum
	ZncDGQKT4kolQ7R212BS5vVWHnlBxS4lWqTPQh/z+aEUj3UjaZls7sg7
X-Gm-Gg: AeBDieuhCdOU6V+PWwTwDW0oLC43fsiOdwQuZhQtWD8SmcnUMjM8w+8XiIRCJ+ikoWT
	jRP6jEcfdXHa/b3+L7xnAP6EJG1Ez7Ut1/DyzoSQziXOqfJXftuGVfva45/TRrnUu+0ABIgtdUv
	R7ejKdep+HHMexF8gHOPw4xr38lgwGTbE9LyA10VWFM8W9iOXxT+NlGAdhoKac058SybvJ6e43y
	UczNzsjulArom2pfkDsIro3aiWPvs5uGzSr5S2Xs7I3tVuCvC5vxLKLllUncYpQd3BJyZi0cqDO
	2Pj+dDKwRLf16de8Hg1QUzljpd43bWSwGhX6UH3LM2LL+il+vnY6eRxFM+PK1sDSt4UacAyjGrC
	AjbEwRSNgh1hXiHpwRQ8U7ExvE1oN2C3/o3SlYOOiBdR/QruoirzF2YBXrclXC5fhNIjNScNPx2
	QNd0RXA2UjahPp3CGUsCH57x1mIi45t+/UN4p+BMuMR2eFMDIdfRXZt+L6C1WKZNJ6wQE/jTYA3
	gCQcUj5iMGA3P5f5zY/pQeDET4ic2JoLJayGnosuv2yUMnfA37w6/zxSZvRuhSlFfUWeDz/qae1
	nX73hpTKJSZv1e5MrTuZILs=
X-Received: by 2002:a05:7300:5721:b0:2d9:6373:ace9 with SMTP id 5a478bee46e88-2d96373b21bmr10016149eec.8.1776331085284;
        Thu, 16 Apr 2026 02:18:05 -0700 (PDT)
Received: from 2045L.localdomain (49.sub-75-226-46.myvzw.com. [75.226.46.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8482asm6591216eec.15.2026.04.16.02.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:18:04 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 1/3] hwmon: (adm1031) Convert macros to functions to avoid TOCTOU
Date: Thu, 16 Apr 2026 17:17:52 +0800
Message-ID: <20260416091754.310-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros TEMP_OFFSET_FROM_REG, FAN_FROM_REG, and
AUTO_TEMP_MAX_FROM_REG evaluate their arguments multiple times. When
used in lockless code accessing shared driver data, this can cause
Time-of-Check to Time-of-Use (TOCTOU) races. In the case of
FAN_FROM_REG, it can also result in a divide-by-zero error.

Convert those macros to static functions so that their arguments are
always evaluated only once.

Check the remaining conversion macros in the driver as well. Keep them
unchanged because they either do not evaluate arguments multiple times
or are only used from locked code paths.

Link: https://lore.kernel.org/linux-hwmon/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 49dc9efed05a ("hwmon: (adm1031) Add sysfs files for temperature offsets")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
While learning the hwmon driver code, I found a few more potential
TOCTOU problems in drivers still using the older non-_with_info() APIs.
Fix them.
---
 drivers/hwmon/adm1031.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index 343118532cdb..0551f815233d 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -203,16 +203,24 @@ static struct adm1031_data *adm1031_update_device(struct device *dev)
 #define TEMP_FROM_REG_EXT(val, ext)	(TEMP_FROM_REG(val) + (ext) * 125)
 
 #define TEMP_OFFSET_TO_REG(val)		(TEMP_TO_REG(val) & 0x8f)
-#define TEMP_OFFSET_FROM_REG(val)	TEMP_FROM_REG((val) < 0 ? \
-						      (val) | 0x70 : (val))
 
-#define FAN_FROM_REG(reg, div)		((reg) ? \
-					 (11250 * 60) / ((reg) * (div)) : 0)
+static int temp_offset_from_reg(int val)
+{
+	return TEMP_FROM_REG(val < 0 ? val | 0x70 : val);
+}
+
+static int fan_from_reg(int reg, int div)
+{
+	if (!reg)
+		return 0;
+
+	return (11250 * 60) / (reg * div);
+}
 
 static int FAN_TO_REG(int reg, int div)
 {
 	int tmp;
-	tmp = FAN_FROM_REG(clamp_val(reg, 0, 65535), div);
+	tmp = fan_from_reg(clamp_val(reg, 0, 65535), div);
 	return tmp > 255 ? 255 : tmp;
 }
 
@@ -235,9 +243,10 @@ static int FAN_TO_REG(int reg, int div)
 #define AUTO_TEMP_OFF_FROM_REG(reg)		\
 	(AUTO_TEMP_MIN_FROM_REG(reg) - 5000)
 
-#define AUTO_TEMP_MAX_FROM_REG(reg)		\
-	(AUTO_TEMP_RANGE_FROM_REG(reg) +	\
-	AUTO_TEMP_MIN_FROM_REG(reg))
+static int auto_temp_max_from_reg(int reg)
+{
+	return AUTO_TEMP_RANGE_FROM_REG(reg) + AUTO_TEMP_MIN_FROM_REG(reg);
+}
 
 static int AUTO_TEMP_MAX_TO_REG(int val, int reg, int pwm)
 {
@@ -426,7 +435,7 @@ static ssize_t auto_temp_max_show(struct device *dev,
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n",
-		       AUTO_TEMP_MAX_FROM_REG(data->auto_temp[nr]));
+		       auto_temp_max_from_reg(data->auto_temp[nr]));
 }
 static ssize_t
 auto_temp_max_store(struct device *dev, struct device_attribute *attr,
@@ -559,7 +568,7 @@ static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
 	struct adm1031_data *data = adm1031_update_device(dev);
 	int value;
 
-	value = trust_fan_readings(data, nr) ? FAN_FROM_REG(data->fan[nr],
+	value = trust_fan_readings(data, nr) ? fan_from_reg(data->fan[nr],
 				 FAN_DIV_FROM_REG(data->fan_div[nr])) : 0;
 	return sprintf(buf, "%d\n", value);
 }
@@ -577,7 +586,7 @@ static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n",
-		       FAN_FROM_REG(data->fan_min[nr],
+		       fan_from_reg(data->fan_min[nr],
 				    FAN_DIV_FROM_REG(data->fan_div[nr])));
 }
 static ssize_t fan_min_store(struct device *dev,
@@ -679,7 +688,7 @@ static ssize_t temp_offset_show(struct device *dev,
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n",
-		       TEMP_OFFSET_FROM_REG(data->temp_offset[nr]));
+		       temp_offset_from_reg(data->temp_offset[nr]));
 }
 static ssize_t temp_min_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
-- 
2.43.0

