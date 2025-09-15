Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5333828B7DA
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Sep 2025 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956113; cv=none; b=TW93UzGUwCzE8lboHvPCuuTf3CtP+KHREOy5N6NIMBJtSx9ReWiv2KnvIiBeIAd+yRIY1BLIa689aqTKpGuQ1JAjIY0TCRkGHVkESaVElNJut/6D/CKIeiG2cZtfldqLXxQhqSM2qhW1QcXEyzilKgFxcG4vPjLDoAduCffmeNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956113; c=relaxed/simple;
	bh=rA4oK+tFvW8saRL9hHBWOdi/CnB5VOu9oSDReal5vCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVlXvH4/X1OfQQdMbuk3edm7VM/7NUj2NsOySuPqvaE+/bMXKwtCXIVbCDf1d/PDv+tCrMhZWUGFn5tQqN848G0Z9G9BMHLYbmvmnC9eCqDYk6/bUV0yb51LwTjBTYR5/B4JpYf9/fnvUNY2fZo9evmJCd3xopWzNOWHaCeqa64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOZnr5NZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOZnr5NZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e9ca387425so1325369f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Sep 2025 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757956110; x=1758560910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTwPZWRgNpDnHLSxSyIw8mfUUJjFauT8ZlfWIgp35xc=;
        b=MOZnr5NZlIxwnaNr/KbfScNKHPoF1Opi7eap+hhPKSKLBW3GMWL0I5nM9Bq7ptQaIj
         B3sni41yzCZs9LJTmm5+Ojfo+UQHT5JK7uBNL1wVYRLsgI6q64vIav7CvyRxGhwkUiTA
         YV8O9TI6KjuvTAGcj19p3Ua3JKVKe/dz4AiKUeIXtRc8Hq+yIAzbKufuU1pZV5Oyxw3o
         dbs0w6j9rFV2duREM0vglTQYzhGV+0PryTbDCpW6vO9UAxzlifdkv7m91QbcRYSGIzxO
         vJxFLxKw3wTLym9jBp2BgwkAs73Eu1rA19i9DJsLKgC1xA4zIYvDQH9lS1ghCiw3FIqL
         8ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757956110; x=1758560910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTwPZWRgNpDnHLSxSyIw8mfUUJjFauT8ZlfWIgp35xc=;
        b=mq5RUVFwhU+G+nDSvU+rY6aLc2iL7tgXMsxvrOihqTwUFsWh1EtRjXgiBX7D+gyuBz
         5l170NtIOwQWYSXrSSGa1zZNctT/GFFZ2pWgwypMPTUvt7au+Nf5iU+5heRES7G3R0/L
         ruRpMuu+GY5CydLImvHDpbOaPiLQDGK+CISSTQ8aQPXUm6+msdhVWBcHs8xuMtPo7dkD
         1huIvKiqzYkPJEggqNLBt4BV+F4l/mm25wtAHXXzYQejoyu/WPJ9BvZ9KvaEUo+gLkAj
         JQNIQHzWHqwWE6S8FyOByl6jCrD44OMdPGwS8OMACfzrlWMIfCzRVY3ws19oVDJK1xa3
         yAdw==
X-Gm-Message-State: AOJu0YxhtZmx7Q9dWqvIxI9vE+1pk3/yWPySX2sF1gc1+j9Vx8StydVH
	Rn6dx9cQhWNdUrVCTA1z+GKuviBugT4CEs/3OvHfA1X43Uv4GzBuZOvL
X-Gm-Gg: ASbGnct2WW/BjXmQCR8P00OP+10DET4ZCt9ZrGJZjNfr4DgDtHx4YuQGB2T9RSYk4HP
	yskMLsBxbXbaLMgADVj79JMD5oJHPCrLKvcd8UuQ0xOyoULdvWhHtDuvRwYQLLlF37HfMzW1lKy
	3aSCebj+pys2q2h7zvtFEpYXinQyk8Xfydfl6VI/UVkxPtGX4p/79XhQiJ/ENM+qbpZADVCrkks
	PTLqRxHY0ZKwpVuQ5yvP4kcnGm03HDQ0mGXScTd/PPL1EZM3pXq9hdA1aZx270CMj5om4I5xUFH
	v0IjCn19CCsveMfkm5LJaz2gBmijrYQI8ovCPcZWPJQVmmGfvc64IFZVzZGaVdw9b58iIWR6DLa
	Ag57ZL/BcD+QSR5N0igtQHd8qcZwgj6X3Y1dyP31dyENmSnYpRM+92fqvDjGPZfjuStSzDJKqXg
	68H+wOj1Kur3BvHOo=
X-Google-Smtp-Source: AGHT+IFQFB1yQv+PaaUN5xBVG5IUrILWHiptNJo5/OGWy19Dj4NndkhYy6WTLYjr/FAFLigfT/gdGg==
X-Received: by 2002:a05:6000:1acb:b0:3e5:d2f1:403d with SMTP id ffacd0b85a97d-3e7659e981fmr13510546f8f.36.1757956109456;
        Mon, 15 Sep 2025 10:08:29 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.80.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7d369ea3bsm13146383f8f.0.2025.09.15.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 10:08:28 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: [PATCH 2/2] hwmon: tmp102: Add support for TMP110 and TMP113 devices
Date: Mon, 15 Sep 2025 20:08:19 +0300
Message-ID: <20250915170819.126668-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915170819.126668-1-flaviu.nistor@gmail.com>
References: <20250915170819.126668-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TMP110 and TMP113 temperature sensors are software compatible
with TMP102 sensor but have different accuracy (maximum error).

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/hwmon/tmp102.rst | 21 +++++++++++++++++++++
 drivers/hwmon/Kconfig          |  4 ++--
 drivers/hwmon/tmp102.c         |  4 ++++
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/tmp102.rst b/Documentation/hwmon/tmp102.rst
index b1f585531a88..3c2cb5bab1e9 100644
--- a/Documentation/hwmon/tmp102.rst
+++ b/Documentation/hwmon/tmp102.rst
@@ -11,6 +11,22 @@ Supported chips:
 
     Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp102.html
 
+  * Texas Instruments TMP110
+
+    Prefix: 'tmp110'
+
+    Addresses scanned: none
+
+    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp110.html
+
+  * Texas Instruments TMP113
+
+    Prefix: 'tmp113'
+
+    Addresses scanned: none
+
+    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp113.html
+
 Author:
 
 	Steven King <sfking@fdwdc.com>
@@ -27,5 +43,10 @@ operating temperature has a minimum of -55 C and a maximum of +150 C.
 The TMP102 has a programmable update rate that can select between 8, 4, 1, and
 0.5 Hz. (Currently the driver only supports the default of 4 Hz).
 
+The TMP110 and TMP113 are software compatible with TMP102, but have different
+accuracy (maximum error) specifications. The TMP110 has an accuracy (maximum error)
+of 1.0 degree, TMP113 has an accuracy (maximum error) of 0.3 degree, while TMP102
+has an accuracy (maximum error) of 2.0 degree.
+
 The driver provides the common sysfs-interface for temperatures (see
 Documentation/hwmon/sysfs-interface.rst under Temperatures).
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d6769288a76e..a5626277c95e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2341,8 +2341,8 @@ config SENSORS_TMP102
 	depends on I2C
 	select REGMAP_I2C
 	help
-	  If you say yes here you get support for Texas Instruments TMP102
-	  sensor chips.
+	  If you say yes here you get support for Texas Instruments
+	  TMP102, TMP110, TMP113 sensor chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp102.
diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 376e0eac8cc1..0df245d220d7 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -312,12 +312,16 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tmp102_dev_pm_ops, tmp102_suspend, tmp102_resume
 
 static const struct i2c_device_id tmp102_id[] = {
 	{ "tmp102" },
+	{ "tmp110" },
+	{ "tmp113" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp102_id);
 
 static const struct of_device_id __maybe_unused tmp102_of_match[] = {
 	{ .compatible = "ti,tmp102" },
+	{ .compatible = "ti,tmp110" },
+	{ .compatible = "ti,tmp113" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tmp102_of_match);
-- 
2.43.0

