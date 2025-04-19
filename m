Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F7813B58B
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079254; cv=none; b=jmqglPcpjN7JW6DMfoiYW6mH1JF7QVW8vbrSDdVt59cYvtwcqn/yfj2FawG/P99btHyfnIbZI3QV/cbHYxrsRsBJ4u0woEHjMzg1vsarGI1gJbTmjk1XCsRTrM5IORx43DZTprSfK8drWczNFAU5tXrbGFmIG98+lwPRVbQVkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079254; c=relaxed/simple;
	bh=TLBAbTI7zcstXQHxV44gU+sClIVDKjxnzJg7wI1IuW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISc/uQt9Mj2iGAhKO0WR8APq07zzw3e8BK6/o36WjR7FMc86oIGTVaSQrdi18dPVQZRu2JeBssdwKa44L0VEpGgOidortFWGX6kHBzMXM3weduPZpOCD63LoGFihxeEUICYVnBIzxrcAF8HJxfG6psVV6M7OrnO7cDqkWPhPRTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXfSfKzv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXfSfKzv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2295d78b433so32361205ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 09:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745079252; x=1745684052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAHGpBToYY4toc68Tjylse9ue3Eb2BtPbXVv2of2QBM=;
        b=BXfSfKzvmh+cmvffJ2Hc8pLG3HKjPcaXZMsk4Az8ZaH1FtGpvuINoB/aWPYwqIDrpM
         ijymkI5xwxvf5MEn820k8662Pdz2Owvdy6G0ku0j2Tpxv+0EkdntAg5kY+unejwwpdSB
         PP4VJLV/gePeGiF9sH18H4hfiS2I88PBo1lhOr/ENEC8J+RBRFACum4uHASJ+JF0tKVV
         EeZxG3RFPWRSciSwbuJy8qwaVFjqKzLmF9hLlS9ZxGB1tHO1FtMCksWyJKbI/NImeAN7
         43WWLh4c7AQIyrXIzR7qnq+E7i+hHme3dIHBFQuVbOyFip7yyxx+w03OEJaJGzOm2rUd
         M+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745079252; x=1745684052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAHGpBToYY4toc68Tjylse9ue3Eb2BtPbXVv2of2QBM=;
        b=eGyLY62VkiJTKwfr0hjFHJGU1fXUaVo17Yi0yIYJabfQj/agK7pBr+AajdRDLv8svN
         OyDTUleHfPoI9aV8kK2lqnjjYOVInJlgLxbJtZIbew5BZFRarnVngJhhvfhKDQvvDdPu
         Tnrb1HlQQmScDYHHpJXX2qpDlPirK5pt8+/ZvH2vai4ZjOlFUtHCBdGFZ0wyOM4pp1IX
         GH+huhO9oAg1h+PTjx6gDm6BGjzb1FIWS8l5l7aQj1Nk7lfl/tsgFq12dcyjRwHE8dPG
         HjTXwG3bt0oHi/E8pHtxskUtViQRD32KMn9NPCMwxw7i/hUd5kymFxnJNedkhV+NWes6
         AqOQ==
X-Gm-Message-State: AOJu0YwdY/RAOuy7dlsXlVcgmwnDyeEh2yryTj7KnO7HL4F7uh7qcjMn
	gSLZn+ateBYolua9vtaEetGoAoZZbNKSJYnRQswR+F3AfWGKibMMKETWlQ==
X-Gm-Gg: ASbGncvHIKKKGhSrexyi34jChEvyFYE3SToQbAoRPpk5kG0i2shVS2OfoNYMaNbGELW
	BNl6u3zGmnVORr25zgDOE/dOSv7fEU1ayMS+ar62FFZCvsUr/ovzPRJ8IutfBzDR/+eN+CLb6eN
	AVau77jWfpLC87K0TWcI9iSaxxo/6wMbUb+O+J+RUJ9qcv/JJmNklzTeSgiNvAi2oxmDSOEu0d4
	gJ+sz3jCpPoh4O+Z3Py6cxZNdkvQYQwfNAK45zkIS4uI19MZ7AGZgqYLQlxD122tp7GPQH4qjVP
	JgnWHLYS2/ARMoOxcnAZdEEAKXA6W2FU7rEVezRE7u3pt3GgaspYIA==
X-Google-Smtp-Source: AGHT+IEFn4a8oI1YmmaUR9P1L07gdlSFhKbggEXmUqjWxRUaMwl4lQfQe9IqJfd3z9cm4N/fWiQmWw==
X-Received: by 2002:a17:902:ce8c:b0:21f:4b01:b978 with SMTP id d9443c01a7336-22c53607c5bmr95554955ad.36.1745079252031;
        Sat, 19 Apr 2025 09:14:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf31fasm35485585ad.61.2025.04.19.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:14:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yo-Jung Lin <leo.lin@canonical.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [RFT PATCH 5/5] hwmon: (spd5118) Add I3C support
Date: Sat, 19 Apr 2025 09:13:55 -0700
Message-ID: <20250419161356.2528986-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250419161356.2528986-1-linux@roeck-us.net>
References: <20250419161356.2528986-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add code to support instantiating SPD5118 compatible hub and SPD devices
connected to I3C controllers.

Note that protecting the I3C probe function against CONFIG_I3C is not
necessary even though it calls a function which is not available in this
case. The I3C registration and unregistration functions are protected with
IS_ENABLED(CONFIG_I3C), which causes the I3C probe function to be optimized
away if CONFIG_I3C is disabled.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
RFT: Compile tested only.

 drivers/hwmon/Kconfig   |  2 ++
 drivers/hwmon/spd5118.c | 51 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f91f713b0105..6ee302cccf48 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2259,7 +2259,9 @@ config SENSORS_INA3221
 config SENSORS_SPD5118
 	tristate "SPD5118 Compliant Temperature Sensors"
 	depends on I2C
+	depends on I3C || I3C=n
 	select REGMAP_I2C
+	select REGMAP_I3C if I3C
 	help
 	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
 	  compliant temperature sensors. Such sensors are found on DDR5 memory
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 5da44571b6a0..f68848b003fb 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -18,6 +18,7 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/i3c/device.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -705,6 +706,8 @@ static int spd5118_i2c_init(struct i2c_client *client)
  * which does reset the addressing mode. To prevent this from happening,
  * detect if 16-bit addressing is enabled and always use the currently
  * configured addressing mode.
+ *
+ * I3C always uses 16-bit addressing.
  */
 
 static int spd5118_i2c_probe(struct i2c_client *client)
@@ -770,7 +773,53 @@ static struct i2c_driver spd5118_i2c_driver = {
 	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
 };
 
-module_i2c_driver(spd5118_i2c_driver);
+/* I3C */
+
+static int spd5118_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_i3c(i3cdev, &spd5118_regmap16_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
+
+	return spd5118_common_probe(dev, regmap, true);
+}
+
+/*
+ * SPD5118 compliant devices do not have to support the GETPID command.
+ * It is unknown if those chips can be auto-detected on I3C busses. It may be
+ * necessary to instantiate SPD5118 devices on I3C through devicetree or by
+ * other explicit means. See Documentation/devicetree/bindings/i3c/i3c.yaml
+ * for details on how to instantiate I3C devices from devicetree.
+ * Device IDs are provided to enable association of devicetree entries with the
+ * driver. The Renesas entry was found in a driver from Nuvoton. A reference to
+ * the IDT ID was found in a devicetree file. The entries for Rambus and Montage
+ * Technology were guessed based on assigned MIPI IDs (https://mid.mipi.org).
+ * There is also a SPD5118 compliant EEPROM/Hub/Temperature sensor (S-34HTS08AB)
+ * from Ablic. The MIPI ID for this chip might be 0x0173 (Mitsumi) for Ablic's
+ * parent company, but that is unconfirmed.
+ */
+static const struct i3c_device_id spd5118_i3c_ids[] = {
+	I3C_DEVICE(0x01e0, 0x5118, NULL),	/* IDT */
+	I3C_DEVICE(0x0266, 0x5118, NULL),	/* Renesas */
+	I3C_DEVICE(0x03fa, 0x5118, NULL),	/* Rambus (unconfirmed) */
+	I3C_DEVICE(0x0433, 0x5118, NULL),	/* Montage Technology (unconfirmed) */
+	{ }
+};
+MODULE_DEVICE_TABLE(i3c, spd5118_i3c_ids);
+
+static struct i3c_driver spd5118_i3c_driver = {
+	.driver = {
+		.name = "spd5118_i3c",
+		.pm = pm_sleep_ptr(&spd5118_pm_ops),
+	},
+	.probe = spd5118_i3c_probe,
+	.id_table = spd5118_i3c_ids,
+};
+
+module_i3c_i2c_driver(spd5118_i3c_driver, &spd5118_i2c_driver);
 
 MODULE_AUTHOR("René Rebe <rene@exactcode.de>");
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
-- 
2.45.2

