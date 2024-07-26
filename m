Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E25145B00
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722032172; cv=none; b=VqtN1Uooj+LUBBHhriagrOwzWFGVt+5AJBTRwCtsvH92bTSonoyS/CcTMBvfnTETheWCLiuO2IXBLyoDew0LOoHjt6GBS67Ko3je6bxkeug9a1EZAkXJFwAfwf8kNbRVnmJPFzUzTzNEhtdxhzapZaQ8UH5nrGNvn522YplH5MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722032172; c=relaxed/simple;
	bh=MNGRWShIXSAPpetGWzn03TiUPTocpGetpbW5Ice8Sek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OqxPxQXXD9vO4VfS89Nm7/5VKNtl/gLlSex/r5y13SUkpLdyBpfx7NfXZ3LIUNTeEQ448Pozl8VpZjyOSsNsbVQal7cgXt+d/lWTDGvgiyCcvi5rmimhxLNg7+in2T9XaA9xKfRfgeqwrwTZMv1SBJ2pvmyoOtm/ZLBw8jnP3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bsfuk5+H; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bsfuk5+H"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ab34117cc2so958228a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722032170; x=1722636970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivmweaHNVSRGPcIiM3EZwCm2c3itWMgLKJURT/wMvE8=;
        b=Bsfuk5+HyzslR5IeC2fu6rDx/HgKdOPD9xyychfjBeYcjcrgwniJK3kMkdZf5Ou700
         wiz61gBhKlX4RqXLGTOmIy7adgf3E5bmAZAXYuQr/vjFq5KS9Cc7JMeQPE3+QtTIImOY
         i84U+N+POi/sBfbBC4SuePvviG/i/yFevrZTgmgIVT1OuFoEtvrzU2RpKEEAOx+rE9hh
         vmKyvkTKgLWLs9uizvYqk+U6CH5Eis7U9/bmL7FnWce47BOCERiQXtELPqX37BtkcH4q
         IV58Eb2StxzGINZhPEumkNDryfD2fHPp4j1kU5//lFKV890exQO+2/RMvwQmBXrfoilU
         fysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722032170; x=1722636970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivmweaHNVSRGPcIiM3EZwCm2c3itWMgLKJURT/wMvE8=;
        b=SBRehsPUKolsQZwE13LaX8XtdZjNtA2XXCBc0719D/nk3c5InQQqu866uJFvxsIyYh
         wEBkd6/QYXUEokPKJYSfGyXe383H3keoP4LQiGtTELV2a/WkSsoC5iVNGVUar4lB/BlP
         55ZdZDm8CEWqHG1GJpQh5D0Z7Wuip7roYdcb08ZTXdRa9lZp84mXMkhDDbuqQtSec/sj
         T+OMf+RFwXxtoKWqg/EEplOWbtwguZfxjuarVwUATx4jJgyaSnyL8nZg6GiduivXCIxo
         /gRRKoJI9vYvM+gb5yJOBCw+4KlRUGWXGODg1l+igiwdegU/UvCacwxR6YSeNzbOeRV1
         yCIg==
X-Gm-Message-State: AOJu0YzR5n2iL9fzMbeNQYlcMVFN7RXRHG8MWw4U//2hHYE0H3z2Uys8
	zEIWTKh+A1hjrB7Rr69gPV96TOyIwkU2kY+9P1/XQcxP4mya7XUTFGETIg==
X-Google-Smtp-Source: AGHT+IFs0MbDTS22UFHwi9yQqRlP20Z6jkc9h19Lfl6e6Eh9Crc/czqHcw8Bv7Qkke2l+YtDOopZhw==
X-Received: by 2002:a17:90b:350f:b0:2c9:5f45:5d2a with SMTP id 98e67ed59e1d1-2cf7e1c1a75mr1027045a91.12.1722032170113;
        Fri, 26 Jul 2024 15:16:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28df2b63sm3969289a91.42.2024.07.26.15.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 15:16:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/5] hwmon: (max1668) Use BIT macro
Date: Fri, 26 Jul 2024 15:16:00 -0700
Message-Id: <20240726221603.1190437-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726221603.1190437-1-linux@roeck-us.net>
References: <20240726221603.1190437-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bit macro to make the code easier to understand and reduce duplication.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max1668.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index f5b5cc29da17..83085ed0ae7e 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -6,6 +6,7 @@
  * some credit to Christoph Scheurer, but largely a rewrite
  */
 
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -172,7 +173,7 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%u\n", (data->alarms >> index) & 0x1);
+	return sprintf(buf, "%u\n", !!(data->alarms & BIT(index)));
 }
 
 static ssize_t show_fault(struct device *dev,
@@ -185,7 +186,7 @@ static ssize_t show_fault(struct device *dev,
 		return PTR_ERR(data);
 
 	return sprintf(buf, "%u\n",
-		       (data->alarms & (1 << 12)) && data->temp[index] == 127);
+		       (data->alarms & BIT(12)) && data->temp[index] == 127);
 }
 
 static ssize_t set_temp_max(struct device *dev,
-- 
2.39.2

