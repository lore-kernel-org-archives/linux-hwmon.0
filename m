Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F424A24
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979964; cv=none; b=Eq7j6HUGl0VdyG78C662/i4F5dIzJIwwQ27HUeJzz+ZuoOHGky1Q+ACubKUcyea64wLSNVWkSml+3sJfIIvIE/ULofoy9TGlvCQf3BnysOY1YRqrPX5ijQUFSn8FU2vyvMDVubyI3tl52GocUcOWT08IgLiT+tqktbITSzGlYMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979964; c=relaxed/simple;
	bh=91nFN2K9+IZgSswnkrAw0ZOUhCjvRKWrtpJoXyO2OEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoOYdTTp2A14wZxcQthGjVH7S1RtPd4hm5RGji1Prt6QmyJutRd2nlsAcZ2f9Wa5TuyCc6mheowYHmBSEgNawE7VTFnhMmNlXhzHBTiqXSINDwJjSZLhQZKABksKPimVS4qmyPNUc78VsBCF0H+tu38iC5wEgsFWGn2v1HcIfDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTzjhOsF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTzjhOsF"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-715abede256so955721b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979962; x=1725584762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjUQvob5m7HF1bspA9uScPU9vLm3Qnjtm1ZiyuXdQI4=;
        b=JTzjhOsFd7oskVjTVbSkf05XTt12ZYGrxYc4hHFilfKrfVHPVwrUun6IkVKFWLLFjX
         mzjsmvQEOwWqT2Qw6SbFV7Ld1jK1AGvFwFSavDHEOQrRYQjoe8u+i5ZF0EbZvnnEdFzG
         fT7VI4eRM0LX0DDEWIll3VPCqH155IMHXmeiiWmMJkEWF7V8wwN8In3QSAI72C0vsiS4
         krRoS/SRTyN+HrYYEjzEDCVILRJ/7FA90FGPXUn1cymzqGsci9yRKIaja06WkIzZUKzg
         NmGlSVvbgevpqc9bx5EoL98pW0LgE3g0f5H3PRP3jtZA5EcN3Crpo+UpcMg5THW+pH16
         O14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979962; x=1725584762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjUQvob5m7HF1bspA9uScPU9vLm3Qnjtm1ZiyuXdQI4=;
        b=NjJTyN+rDTV/9T6DKUYCL7Ga/r4bJ3Tmi6vrWJC3lxgbrND2+uvOv9m65BUiWC8eOl
         TA/gvaYL6BbaENwa8mjxAT1YANdfgahpPATQ3S+1n+zXXcIbAw617VR3PP09JBngelxk
         mwuTOe2ZKPldxCCV3X7boAEeCUqFeNITCCZDAZ3UXoq3Zmg/NEDyYPK+CEbCJbGcxg8x
         DNdc0JicJRaEy7kFSt9JjncYCHBh4JQEGQC/LRTQTpENbit3AXOQa1ibsqhfMbdk2ASX
         v7pnAkJIWnHolblcyduy1Zc1njbXlOp1snesciQJpXjtkoT3ClBtCi/MyIsRH8AUbzGo
         MjTw==
X-Gm-Message-State: AOJu0YwtYhgnh4CtkzHQj/5WB3/K4UtLhFPDPNt0klucfY6JC6Mw5l52
	VjDspiSUVwbqHiejmod4Lni+V25oGtc4MSh1NXyqh8jsQcLQOvz0qMHNQA==
X-Google-Smtp-Source: AGHT+IEs9xmRoKge/hC/8Zzqaf3RyAxoOgTn9aWmhvbF1MZ2FH4Vw5p+Aaktd5zsX2pszbAe+Wk51w==
X-Received: by 2002:a05:6a20:e617:b0:1ca:ccd1:4b33 with SMTP id adf61e73a8af0-1cce0fed420mr4786630637.7.1724979961578;
        Thu, 29 Aug 2024 18:06:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051553648fsm17140815ad.172.2024.08.29.18.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 02/14] hwmon: (ina2xx) Replace platform data with device properties
Date: Thu, 29 Aug 2024 18:05:42 -0700
Message-ID: <20240830010554.1462861-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-tree users of ina2xx platform data. Drop it and support
device properties instead as alternative if it should ever be needed.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/ina2xx.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index a6a619a85eb6..897657f8d685 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -30,13 +30,11 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/util_macros.h>
 
-#include <linux/platform_data/ina2xx.h>
-
 /* common register definitions */
 #define INA2XX_CONFIG			0x00
 #define INA2XX_SHUNT_VOLTAGE		0x01 /* readonly */
@@ -643,14 +641,8 @@ static int ina2xx_probe(struct i2c_client *client)
 	data->config = &ina2xx_config[chip];
 	mutex_init(&data->config_lock);
 
-	if (of_property_read_u32(dev->of_node, "shunt-resistor", &val) < 0) {
-		struct ina2xx_platform_data *pdata = dev_get_platdata(dev);
-
-		if (pdata)
-			val = pdata->shunt_uohms;
-		else
-			val = INA2XX_RSHUNT_DEFAULT;
-	}
+	if (device_property_read_u32(dev, "shunt-resistor", &val) < 0)
+		val = INA2XX_RSHUNT_DEFAULT;
 
 	ina2xx_set_shunt(data, val);
 
@@ -667,7 +659,7 @@ static int ina2xx_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
 
 	if (chip == ina226) {
-		if (of_property_read_bool(dev->of_node, "ti,alert-polarity-active-high")) {
+		if (device_property_read_bool(dev, "ti,alert-polarity-active-high")) {
 			ret = ina2xx_set_alert_polarity(data,
 							INA226_ALERT_POL_HIGH);
 			if (ret < 0) {
-- 
2.45.2

