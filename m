Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335772;
	b=NW84G49zrQ/TUCdBONC2+ABDtFeB5VkudVCRgtGPat3Vj2XmKzC0WH+ZrPdF6b1TTphJ
	 ncHzBP4EuOAymx+GlHxHwsOnP55RdZqZrZT8h/kzGK2mwCUQwgZRUlssKF8eEXrUtMgie
	 /rr4IGdr2aniTaHYalqZEsxWwEIj/I4v5mUbe1+3HuGNM6TTaa14DexS4vDp8PkUOFRt2
	 8yKzuvHwdK5g/CpNOgg2/pcpEkr2l8wqzKj7GrlW0df1KbUbaAM9FojCjcXXFWM1A0rLM
	 l49nl+moNlvfuWbcIZZIR9+WNvSMQ0kpZOcsF4pPbJedwOIj0nbDRz+Pi4+U6WU90Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335772;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=KFkbQUeiaR9OE+kglIAnQ7cKsA1vHxFejS1T9bP3fv4=;
	b=Hw+U3e+p5kh4B+poqRm7tGZJTjeiHbTTn9xeDMEB0Sp/rXdfeVH/qu/qyns5Hw6Heuy6
	 D/aXDbr2VpfAZOiPGnR7/P6kcEU1bglNcEQpZ8TNm00E8vdZaAIShnQB7Muc9cArBibUT
	 BvWH8DTRw0PYdSw/8hhAjvlaVqKG3dGeV/vJqaTmAQ4T3koof76W2ssYQrBmq4lwxxh7B
	 iSac/q2SaDhNJOzUe/G8WgQM2VwYv1nzj1PY/plgtJ8hrFoU4bvyY4agsGIxbGIvWsFbQ
	 A1ITHlmT8qYogivrynKASbY1yetNKEv0WIHyXlUiSFj323EiOGz+aYpzuYgxjtHoJdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vU1fbFxa;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427C606A332
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5427C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vU1fbFxa
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id QmPmxG7Ysyb4YQqhYx0vEk; Tue, 10 Nov 2026 18:36:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qqg5xsdyudRrRQqg5xQXXU; Tue, 10 Nov 2026 18:34:41 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af363c1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=1mODraI_J-1gEp4YBd4A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=KFkbQUeiaR9OE+kglIAnQ7cKsA1vHxFejS1T9bP3fv4=; b=vU1fbFxaWsoq
	BDH1kNLpPzrLZKlospoiSqDl0dThWXqfQoGqLYdPB/u58ok0qgcUO1pcTnZL8jvkeh+tmLkJa02S/
	sd5EvI5/hmRRxw2gTVOxllE0WuzDe9NUR5CC6rBuwuHWQ7ZG3WjIf4uUbqAkTBFyy2/yETqReyF5J
	dIHLF5r3aEfD9p730RHP3wZTilLD+FxEt+LrTzBIZIgA+pWpdJggwGU9uck8HI0xO879XWUhYF5Aw
	J+QjeUceBEIub2q1l5UNat+qPqWwSp1ETyLh0vm0hBJHaprN+FihvHJSx/64bHf1p6CM5PbsaMDRk
	q55yXzozGbrFrO6lF/buhA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52528 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqg5-00000003Pa9-0CgF;
	Wed, 11 Nov 2026 00:04:41 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/10] hwmon: (emc2305) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:25 -0800
Message-ID: <20261110183434.181711-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110183434.181711-1-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQqg5-00000003Pa9-0CgF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52528
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHwe/EcwIq4475WM9yx6j/9+/qwXBz+5LVa90ADDz7UL7eeOu7H5E72sv22q4/b54jHqJVTMu9Rud/aMWyfdzwTNStzLAKJYjn4HoPo64YFkWWlvijbp
 pLTlaZ7Efm+ZGB9V6i3sf+9H9wjPmCPHcP3mq6msDwXDwExFyECdBnoM+2FEXT1oXTuE3tasne4PpMpIAHCJFDtjOxeabA0DDVno3qOcrKCcd+DDDwM8U4cp

There are no in-tree users of emc2305_platform_data. Active PWM channel
count is detected from the chip product ID register, and per-channel PWM
and thermal cooling parameters are configurable via devicetree child
nodes.

Move EMC2305_PWM_MAX into the driver, drop platform data support, and
remove the unused platform_data header file.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/emc2305.c               | 44 +++++----------------------
 include/linux/platform_data/emc2305.h | 28 -----------------
 2 files changed, 8 insertions(+), 64 deletions(-)
 delete mode 100644 include/linux/platform_data/emc2305.h

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 434e70e76f5f..4eee52ae38ca 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -9,7 +9,6 @@
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/platform_data/emc2305.h>
 #include <linux/thermal.h>
 #include <linux/pwm.h>
 #include <linux/of_device.h>
@@ -20,6 +19,7 @@
 #define EMC2305_FAN_MAX			0xff
 #define EMC2305_FAN_MIN			0x00
 #define EMC2305_FAN_MAX_STATE		10
+#define EMC2305_PWM_MAX			5
 #define EMC2305_DEVICE			0x34
 #define EMC2305_VENDOR			0x5d
 #define EMC2305_REG_PRODUCT_ID		0xfd
@@ -627,7 +627,6 @@ static int emc2305_probe(struct i2c_client *client)
 	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
 	struct emc2305_data *data;
-	struct emc2305_platform_data *pdata;
 	int vendor;
 	int ret;
 	int i;
@@ -657,43 +656,16 @@ static int emc2305_probe(struct i2c_client *client)
 
 	pwm_childs = emc2305_probe_childs_from_dt(dev);
 
-	pdata = dev_get_platdata(&client->dev);
+	data->max_state = EMC2305_FAN_MAX_STATE;
+	data->pwm_separate = false;
+	for (i = 0; i < EMC2305_PWM_MAX; i++)
+		data->pwm_min[i] = EMC2305_FAN_MIN;
 
 	if (!pwm_childs) {
-		if (pdata) {
-			if (!pdata->max_state || pdata->max_state > EMC2305_FAN_MAX_STATE)
-				return -EINVAL;
-			data->max_state = pdata->max_state;
-			/*
-			 * Validate a number of active PWM channels. Note that
-			 * configured number can be less than the actual maximum
-			 * supported by the device.
-			 */
-			if (!pdata->pwm_num || pdata->pwm_num > EMC2305_PWM_MAX)
-				return -EINVAL;
-			data->pwm_num = pdata->pwm_num;
-			data->pwm_output_mask = pdata->pwm_output_mask;
-			data->pwm_polarity_mask = pdata->pwm_polarity_mask;
-			data->pwm_separate = pdata->pwm_separate;
-			for (i = 0; i < EMC2305_PWM_MAX; i++) {
-				data->pwm_min[i] = pdata->pwm_min[i];
-				data->pwm_freq[i] = pdata->pwm_freq[i];
-			}
-		} else {
-			data->max_state = EMC2305_FAN_MAX_STATE;
-			data->pwm_separate = false;
-			data->pwm_output_mask = EMC2305_DEFAULT_OUTPUT;
-			data->pwm_polarity_mask = EMC2305_DEFAULT_POLARITY;
-			for (i = 0; i < EMC2305_PWM_MAX; i++) {
-				data->pwm_min[i] = EMC2305_FAN_MIN;
-				data->pwm_freq[i] = base_freq_table[3];
-			}
-		}
-	} else {
-		data->max_state = EMC2305_FAN_MAX_STATE;
-		data->pwm_separate = false;
+		data->pwm_output_mask = EMC2305_DEFAULT_OUTPUT;
+		data->pwm_polarity_mask = EMC2305_DEFAULT_POLARITY;
 		for (i = 0; i < EMC2305_PWM_MAX; i++)
-			data->pwm_min[i] = EMC2305_FAN_MIN;
+			data->pwm_freq[i] = base_freq_table[3];
 	}
 
 	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "emc2305", data,
diff --git a/include/linux/platform_data/emc2305.h b/include/linux/platform_data/emc2305.h
deleted file mode 100644
index 76043a97f975..000000000000
--- a/include/linux/platform_data/emc2305.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __LINUX_PLATFORM_DATA_EMC2305__
-#define __LINUX_PLATFORM_DATA_EMC2305__
-
-#define EMC2305_PWM_MAX	5
-
-/**
- * struct emc2305_platform_data - EMC2305 driver platform data
- * @max_state: maximum cooling state of the cooling device;
- * @pwm_num: number of active channels;
- * @pwm_output_mask: PWM output mask
- * @pwm_polarity_mask: PWM polarity mask
- * @pwm_separate: separate PWM settings for every channel;
- * @pwm_min: array of minimum PWM per channel;
- * @pwm_freq: array of PWM frequency per channel
- */
-struct emc2305_platform_data {
-	u8 max_state;
-	u8 pwm_num;
-	u8 pwm_output_mask;
-	u8 pwm_polarity_mask;
-	bool pwm_separate;
-	u8 pwm_min[EMC2305_PWM_MAX];
-	u16 pwm_freq[EMC2305_PWM_MAX];
-};
-
-#endif
-- 
2.45.2

