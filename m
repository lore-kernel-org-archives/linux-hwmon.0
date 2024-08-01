Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA81198A10
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Aug 2024 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523769; cv=none; b=IpNJTrCy5zV4WHYIgRJUIWCA0X8/hDdcPAfrvIk19LTYH6fck4JKyLKMYGQpJNih5669DfiMmRwmntOczVWA2fQGzbKww/P0QL4pXMKO90Xmx3unfi582ju0iJnDtSOvaRbalQMFko5mnVFFNQZUatd5M68vIzw8Kj5Q96S+3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523769; c=relaxed/simple;
	bh=UR9xa6bVBt6OjVHZ2VXaCQw4f5DAkA1TE0HN0Rz/ZkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ujr9syK43LQ52QRjMOsJRQQ2Ndc0JHT5cfmjk9zOqM78AFfNVEH3EB9i0gxQ8Y9+P4wBsOunjkJHZcjIiLEpPX6GQ6LUJxH9Zt9bvTa4av/WUrqyXbJEBzfeFX9DvqL7nmyddiM+nZ5QokvtfQTucdOSPDhMc+4skxpGG7Lg3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH12gpCR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH12gpCR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc49c0aaffso53233485ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Aug 2024 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722523766; x=1723128566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoFYCzZprZgrFFcZ5xijm5hTD1LSeDYpkaNcO8pG47c=;
        b=WH12gpCROoFeSrONk80GOr7d7uxS+C5UIWfjUUP4xi90OPtHm6hk9apC9bsfvypQzb
         LDOAH9ojE4KAYJAQA+DAhzoINBDsnGvkgwMvbryfnMlWQW5BKe9S2x0H0nuW8hzYpMN9
         oZXibdAPxqFHFocNtwfuMK4GxbI38nAl29a/AjkkHrGckkw//BvTtk0DxWf6VGNI1qmA
         tjbSGSadLjLOKjqlmxRwj8q3LrN6cyrFlvclcAlCNdzitO/A3NuoFeyuGqq+p3Drz5FH
         YPFQu9AiqFtTFHGeoVRvGPRLsYaUbGpuEwNXKeiaJ5coVAusjQwF9Kq3gRHmJht0JVUm
         TX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523766; x=1723128566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SoFYCzZprZgrFFcZ5xijm5hTD1LSeDYpkaNcO8pG47c=;
        b=UGyCmARav2ssdZLYC85AZzahtpbVVHY2OWHaEMHGNWAfNTyPJRRJrXujgglD+eE3LN
         BOiI8eGYM0hEZvVJH9i5FLYolXntJeCfx3e+qIRP8acozPhS1hfLMAO642kSk7QUV34K
         qYdogGTpecGDCKQzlb/ogNxixezLdGCtYA7bkQHSroc+uqrU3lHOS7cSGRhRmaUubwkh
         3OhOYkdIDZ4ReLITPWoDJxAHyiAUjAK96FZ68VR8GfvDsLU69nivQKMgho/ucYnR7qFc
         IWBdNm2qYuqBQTtZa3SuL0KpvsBvi/UUfgzNQ4Vn5BT2tq1zmXfO5/2kudyJwhOzDh3V
         nHBw==
X-Gm-Message-State: AOJu0Yw779UN7ET95ZdOXR/FZJaEb+XJln8zFcgVTkmGuh/sg6GIJkJd
	jA5qXH8qdJUF2P8YZ3Rcmp/G96zlkJWFHs1/ApnO3XqxswepJsOxbNzDCA==
X-Google-Smtp-Source: AGHT+IF68RdXnZ8S9yTvFjvfiTtWYJkRbZEahaEh7cbCRVODiM3PmaHR3bkRAmDSLjf3p33faHbd+Q==
X-Received: by 2002:a17:902:da85:b0:1fb:a077:a846 with SMTP id d9443c01a7336-1ff57257ce7mr6375775ad.3.1722523766442;
        Thu, 01 Aug 2024 07:49:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c7ffecsm140982435ad.40.2024.08.01.07.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:49:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/6] hwmon: (lm92) Reorder include files to alphabetic order
Date: Thu,  1 Aug 2024 07:49:14 -0700
Message-Id: <20240801144918.6156-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801144918.6156-1-linux@roeck-us.net>
References: <20240801144918.6156-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify driver maintenance by reordering files to alphabetic order.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm92.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index e2d8c8afcbfa..b0179d72b779 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -27,15 +27,15 @@
  * with the LM92.
  */
 
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/i2c.h>
+#include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/err.h>
-#include <linux/mutex.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
 
 /*
  * The LM92 and MAX6635 have 2 two-state pins for address selection,
-- 
2.39.2

