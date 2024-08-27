Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165D1C6F49
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772913; cv=none; b=R6AKd8vce0xBmXm5dOQRz78zXKVHvww6yokPuX2jDb/7ACWIE2j/FrOYhSwgsmKTwJ6NIR31O7IJVudCCiB1sj2lwXLMT9SZeLmCPwRwWegkGQMcIOwLYxafblASlQc9RGnwIpzC3KmkGnthKjv9pKKs4Ilh3Nt3RQAjnXxrI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772913; c=relaxed/simple;
	bh=ba3Yn0owiYZo8cZOJ6s3E24eC6i144xAg+9hPLo23LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXmZzps+eSR/wSSRA/AvqpZsiP3GLld1VLSdfw2baUHzQcoZN53UyEL6yfmNzdESDv9vFQrqcknR3ftN4Y+E3PtDMKf+pLV7mMfXzlRuTCJ3X3c+Jk9VnIaQYyoBmJRbMjf+k8aImUtD3tzhNPzY5JpM+yGK9Bf9ZzYgkZDE8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE2uC8hu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE2uC8hu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc47abc040so49146385ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772911; x=1725377711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji4VkH3Wjf3aRSLR2EtWFne/rxYWA9ViEjpidP8oJq8=;
        b=dE2uC8huEmcP77XlmtPundw1WNiL17kbnTZlrEH1Xtx1ADXSd3+KhOBkcmhdZbUG8g
         WTYow0SxYtKo/OzLLUrVTQ6cpkI/BCC3AGrArGhKpcT/kNF56KPIlUs+cajIMfWF2Ggo
         3Q/tJR0x/qrkTUDOIUEs0jFvpDAdKcAt8LbUlDnft6XpFwU2BU/WQAH96YpbIl9hi1eA
         7QAqQ4l8KvLwXpDBVa4tx2P60DyFyUQ98v9JiSG3MZFoIeJ5WXdrOkKEYd4TC7YrfSM7
         rBy8kSebq5wZIRXC5DOYbIrxP2N4bdaAisrzq4ThC9b7d5CvnZ6juT73LSbCKT+zVw3O
         JGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772911; x=1725377711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ji4VkH3Wjf3aRSLR2EtWFne/rxYWA9ViEjpidP8oJq8=;
        b=YE4kQaravLHac2LjxMs/39HdHMwVIfh5I0d28wQiNG2AD2gEMCndrdpJaa1mo/tXKF
         FGiac+K3L1fhBH/hEE+wouCf45yK+UGc8+dWZ9FVwuO2H3HBM9cb1iz1OdED+27FpV8k
         QaJPy2twpSo64Dv7XZV9J46ccHF4iUoYq74LBjI1OL5fcokA0+SLOW5PjkUiZuLL9Lrz
         cYPn/jsWSEtprPuWnnuyjxOAZkQs9ykvYyFOAuodJqZbyTcHWsCatA6THItTEynhyVpP
         1am03k6mCq41nutTleda5SbzOHbL+ZHZZGRkCJ7oKAyS4S2RaDMJIz9jQXXuhbpY/ceU
         f0Cg==
X-Gm-Message-State: AOJu0Ywv8Jyp0DIXygTBE4iE1LWeyVeLY+Ujk0fCD7sqYtM2kf9hGRAL
	7LcK6+/hoN//sK7r+tktL9F6jlgybDirpJFQO4+b4Cx/CPBWmYOEDQ6ihA==
X-Google-Smtp-Source: AGHT+IHeDcRReBPwUSQtQ2vG2SqTY8eumnAVSrIignYOt7t8Ygz5K6Fz2R7sr8UCUoX4z3mYRItLBA==
X-Received: by 2002:a17:902:c401:b0:203:a0ea:6266 with SMTP id d9443c01a7336-203a0ea6d13mr133084195ad.12.1724772910814;
        Tue, 27 Aug 2024 08:35:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557e7f4sm84683765ad.70.2024.08.27.08.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/11] hwmon: (ina2xx) Set alert latch when enabling alerts
Date: Tue, 27 Aug 2024 08:34:51 -0700
Message-ID: <20240827153455.1344529-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827153455.1344529-1-linux@roeck-us.net>
References: <20240827153455.1344529-1-linux@roeck-us.net>
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
 drivers/hwmon/ina2xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index f7d78588e579..9016c90f23c9 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -67,6 +67,7 @@
 
 #define INA226_READ_AVG(reg)		FIELD_GET(INA226_AVG_RD_MASK, reg)
 
+#define INA226_ALERT_LATCH_ENABLE	BIT(0)
 #define INA226_ALERT_POLARITY_MASK	BIT(1)
 #define INA226_ALERT_POL_LOW		0
 #define INA226_ALERT_POL_HIGH		1
@@ -440,7 +441,7 @@ static ssize_t ina226_alert_store(struct device *dev,
 	 */
 	mutex_lock(&data->config_lock);
 	ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
-				 INA226_ALERT_CONFIG_MASK, 0);
+				 INA226_ALERT_CONFIG_MASK | INA226_ALERT_LATCH_ENABLE, 0);
 	if (ret < 0)
 		goto abort;
 
@@ -451,8 +452,8 @@ static ssize_t ina226_alert_store(struct device *dev,
 
 	if (val != 0) {
 		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
-					 INA226_ALERT_CONFIG_MASK,
-					 attr->index);
+					 INA226_ALERT_CONFIG_MASK | INA226_ALERT_LATCH_ENABLE,
+					 attr->index | INA226_ALERT_LATCH_ENABLE);
 		if (ret < 0)
 			goto abort;
 	}
-- 
2.45.2

