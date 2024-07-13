Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E861DFE3
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jul 2024 21:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720906449; cv=none; b=Ts+vMaxalELdfwnZO6lOawkGz3vAsl5iVq4w5AltHcuuwBWpW9zUkdhI3WNykUZnWBTh1VwLdi1BPjVXKM6xhCjurOLeNOJbmeeL3K26lw9JbeaEgCNLwXxAduGbw8e1P+yu1t8b2SgjGFz7qv8OY7R0lvhoTSETjzxuJaRCq1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720906449; c=relaxed/simple;
	bh=4bXOes5nthMnZ956W1D/3+2Gp1CGv/t8SWeFIPteo7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KBwaTpVRgrxCtIm8ly8h0TqrxAb7B7+T6vXFQiktG+rp83em0I0sGquwe3AB5d3B/EwiF005ZkrOwvK3LOlCobxvr6CQ/JJrwnN+xsAJLc8+0s70g3Fq6VXwmwzGATWrr8odNb0mR9WBoP6NpaCPOl4OGCnx3xaZm8Jr27XYvfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbykQ9+t; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbykQ9+t"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70af81e8439so2751061b3a.0
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Jul 2024 14:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720906446; x=1721511246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CnRHxWzyGeGfo+AcjA6iVliyPyD6y//d9SYyvcX+Juw=;
        b=WbykQ9+t8++Vq3SXQnxwk9V3cxC42YwvhGseSUG1U3qPm0X5O/pw/U167HI0UWjB0c
         isNX3cv60UxtNClGALFtgvYNUtojAf6Scr2xYnpeIzusIIp0ygD3up9lpLoM5ptLlChg
         AMY+MWwLCtlxaKYW/qIqFqc2KJOJxeFa9HMs4oUW3XIlMtO6cPmmGvtuwcu7jg3snl/g
         QUaEf3YrDWGwIIblTFJAmhY45HjEjr8ejBJwZ7g6izJN/Jl3afFRFue+3Wf6d8dqN++Z
         g0kdcLbLvJH3eFjLpgCQlOnAD1coCkrNBbJMu6wMGSBB+aeqyfO94dqFHQn8sMVvtTct
         exlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720906446; x=1721511246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnRHxWzyGeGfo+AcjA6iVliyPyD6y//d9SYyvcX+Juw=;
        b=H/ddWeO+ts5fH2MEJdVyfIKL06kyw9ypck9G0JL1Mcrwr4OSjuT1N6Tjz3CRNDgpm4
         l85HK48FY6Ghs4c67UHawPd8RU3+d28NR+aOdYTdakeAE7Oi2mcVBQFZ+H43cngn9kC6
         pi8/Kpx07VNyqViYYwYLFaLSFqdYgmI+cruvm5lzOCIWSworABqq3P5vKts/IssjfZaS
         YKPIeBanFmI4no6U+svR9MLoQHwr3xTgmRmqLipKYT+ZwGfR/vPmbjkc5C2mBrayE6Zp
         dRs9ON6eZEjL1OFDT6vQXjHwBe0nfT4lAdlPllmI8K6etR/6hkujjPwir4TEmhJMqa/p
         NDzw==
X-Gm-Message-State: AOJu0YzOl3ufuX6654v9l7Vm2wXJT86Zfd6A4jeS2SzfZrOflVSfKwVK
	M7oCcko6QI45fvDms5Bcui1ar0iAqwJiS1ggZsv6JZb1uspyyHG6U8wmxQ==
X-Google-Smtp-Source: AGHT+IEDLmEp+M6pS/6X+6iTk9bhh3U5TfILj84GAbwNOIY0et/FvKHhjkJJ1m3OBEf2t8gb/rxu1g==
X-Received: by 2002:a05:6a00:1493:b0:705:c0a1:61d8 with SMTP id d2e1a72fcca58-70b434f31e7mr18488526b3a.4.1720906446110;
        Sat, 13 Jul 2024 14:34:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c974sm1693598b3a.10.2024.07.13.14.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 14:34:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (max6697) Fix swapped temp{1,8} critical alarms
Date: Sat, 13 Jul 2024 14:34:01 -0700
Message-Id: <20240713213402.1085599-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The critical alarm bit for the local temperature sensor (temp1) is in
bit 7 of register 0x45 (not bit 6), and the critical alarm bit for remote
temperature sensor 7 (temp8) is in bit 6 (not bit 7).

This only affects MAX6581 since all other chips supported by this driver
do not support those critical alarms.

Fixes: 5372d2d71c46 ("hwmon: Driver for Maxim MAX6697 and compatibles")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6697.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index b28b7b9448aa..1111b2ea55ee 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -428,14 +428,14 @@ static SENSOR_DEVICE_ATTR_RO(temp6_max_alarm, alarm, 20);
 static SENSOR_DEVICE_ATTR_RO(temp7_max_alarm, alarm, 21);
 static SENSOR_DEVICE_ATTR_RO(temp8_max_alarm, alarm, 23);
 
-static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 14);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 15);
 static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 8);
 static SENSOR_DEVICE_ATTR_RO(temp3_crit_alarm, alarm, 9);
 static SENSOR_DEVICE_ATTR_RO(temp4_crit_alarm, alarm, 10);
 static SENSOR_DEVICE_ATTR_RO(temp5_crit_alarm, alarm, 11);
 static SENSOR_DEVICE_ATTR_RO(temp6_crit_alarm, alarm, 12);
 static SENSOR_DEVICE_ATTR_RO(temp7_crit_alarm, alarm, 13);
-static SENSOR_DEVICE_ATTR_RO(temp8_crit_alarm, alarm, 15);
+static SENSOR_DEVICE_ATTR_RO(temp8_crit_alarm, alarm, 14);
 
 static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 1);
 static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 2);
-- 
2.39.2

