Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BD84A32
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979976; cv=none; b=Kj0FUQNBk3EnjfkR9zJRU7gIWR54e+JscLhDFSjyqPyERC+cXBJLfDo5kF4Rklc6ImLJ19Agi7AAi7MCAklWlQDMNltKxWIngdZ2jjw3KTV3KWN9obOQcbnHG3ZWDHN4ZnFt6eyGy7gEKlU7JcGMsGj8gENmBBX0Kp/Yp3e6BH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979976; c=relaxed/simple;
	bh=evgTo3G8HFa3vMDJb4jvAZpDkYMznjQ0/qlROQkKLd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0LKa8uCJzxKWzhtIBLVKR1c96mHaXslLgPEh+9l+ocGGfCus8M53rEvoyLGsuCDMSHGL9Q9onxR8Pbkn1BJjs6mcopfKRcfxbwxT6TRUfWAboRxBcJOVrAn8YiIJQ4rB5EouN4NXCpqmhmZ+MkhKn1kl8WcrfNpMXBazFnxzfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EI7X/TCa; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EI7X/TCa"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5dfa315ffbdso640177eaf.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979974; x=1725584774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ip9lb1dzBg+M+liXuOQfjKjvsJ11zulJlOJNZdprdCA=;
        b=EI7X/TCa0AECVXlfI6OrrEurUKtyrULBkogU1neSAh0UFqpA6ih9ErWDikweM4XiJY
         BStfuoiU+eGvcI802GGk3Z65Ylif5wgt+3a3FSiNOQnCWk2nHSJL3QM1kDuT7DDNHsW/
         alfYh1/EmcFrvEXpSeDrNTIzMiKZkpjeMcYwAFcccfX/2H+HiON/C4mgY7tnQffykQBF
         fcwEmusaY5Xs/enPWJShkgI+lsR5BFzNpKqam/UizHo+bPR37CinfQlR23Z+Kh0FZ/kR
         FtmXzwdzEVcQZCRjko1GLAYPjU1YOKYX0OQLF5wLgoQ87uiXw3ZhCbMJavje88VyIfAu
         u8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979974; x=1725584774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ip9lb1dzBg+M+liXuOQfjKjvsJ11zulJlOJNZdprdCA=;
        b=AcFIkYQDql42RAmCpMd2NAHqqd2YtndGC4c7VFFN2PIuMlQTMR9XAasdGuVT2eXx6U
         5B0+q8W+p+08vD8AvCL4UWl4tQlV0wXc+Na+lKhwRHVZY6yXYXaSTKPE9tkXGIi5AmQb
         jKxDyGSGOzQPPZXVa4hVi9Ka2VzzAIKggzljeUvHb+YXbtxksk0WxJ2Vk6KsPSUnqqso
         achvNStTdhRrdD7raW+cCCn0O8PnZhslYU1w8UK7cItVs2FOMeOWrzlWuErrG83LsvAi
         IPTe2ESQ8gwuM09XRHBTAhIBXgBqvKJRA9Ptz+dwEBHabroVKeNKpY/iFvegPldVi8fa
         0y4w==
X-Gm-Message-State: AOJu0YywhmWN9W/84zhDIxmc5lMkhPA+phCfrTkcdEE9ZL1eYnsJQHOl
	/A7vKIt0rCtPYwESHu+1nYCh0zfMDdHKf4PZjF72e5OzEwHnPBAC1yZDGg==
X-Google-Smtp-Source: AGHT+IH+ONRJBuFSOVVmlbtkmAHUcYy1teNX7Rwajw9Dl8agA/lQzrhdF+7dlw5A4bWWnx6fRoKgjg==
X-Received: by 2002:a05:6358:50ca:b0:1ac:f2a5:e79e with SMTP id e5c5f4694b2df-1b603c4430dmr584212955d.16.1724979973692;
        Thu, 29 Aug 2024 18:06:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a5872sm1732130b3a.67.2024.08.29.18.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 09/14] hwmon: (ina2xx) Set alert latch
Date: Thu, 29 Aug 2024 18:05:49 -0700
Message-ID: <20240830010554.1462861-10-linux@roeck-us.net>
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

Alerts should only be cleared after reported, not immediately after the
alert condition has been cleared. Set the latch enable bit to keep alerts
latched until the alert register has been read from the chip.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Moved patch after consolidation patch to keep it simple
    Set latch bit once when initializing the chip and keep it active

 drivers/hwmon/ina2xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index a9e3b23445b4..98338b7e7437 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -67,6 +67,7 @@
 
 #define INA226_READ_AVG(reg)		FIELD_GET(INA226_AVG_RD_MASK, reg)
 
+#define INA226_ALERT_LATCH_ENABLE	BIT(0)
 #define INA226_ALERT_POLARITY		BIT(1)
 
 /* bit number of alert functions in Mask/Enable Register */
@@ -640,8 +641,10 @@ static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
 	if (data->chip == ina226) {
 		bool active_high = device_property_read_bool(dev, "ti,alert-polarity-active-high");
 
-		regmap_update_bits(regmap, INA226_MASK_ENABLE, INA226_ALERT_POLARITY,
-				   FIELD_PREP(INA226_ALERT_POLARITY, active_high));
+		regmap_update_bits(regmap, INA226_MASK_ENABLE,
+				   INA226_ALERT_LATCH_ENABLE | INA226_ALERT_POLARITY,
+				   INA226_ALERT_LATCH_ENABLE |
+						FIELD_PREP(INA226_ALERT_POLARITY, active_high));
 	}
 
 	/*
-- 
2.45.2

