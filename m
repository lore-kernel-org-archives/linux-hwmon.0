Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A8FBF0
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722177445; cv=none; b=XFcbXsRb1iQgYmCSeFVGE15ft4W0Uh5akTWmAayUG042GAogrtU0I/Dk+m88XRmyQsin0jfwkv9WlisSvHGWO1RszwNdTBTEk/Swi64/l93ZjTfj97MNheCJ7g9TMWEhYa6OfRQyUDbpVLidCN8L0JjklfbKSTyLRf92cP+RfsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722177445; c=relaxed/simple;
	bh=arPK8z4osZOJ66+zmf2iDu5FU8JX6t/XcMoQsOaJf7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pJrSOjzLFgY8ptovQBT3bdRQ4v1TbHbs4jvV7LCUE65nrZh24ygyAFo1t0ANDEuAgrbs0x4TXT/ugrp8xpAVCmDX/4hILvlkeZiU5zzyr5BOxL/Qw/uNeveEj1QEQJQiCTGX7U6P7Tjzu4v6Gqe7BgSZkbb7G/fyDI8aF5kQxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H529uApO; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H529uApO"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5d5b850d969so1707746eaf.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722177442; x=1722782242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjC7NxrTuEs6NU7ZGsMPtI2pd8QR0ZFJN3vXQzYe3qs=;
        b=H529uApOd3iG/JpduyE7e+iGqiFeyDeDeY8A0VvDhg+6Ry9lfm12GTnS5Kw4EeL4VM
         CVmno5OvaXQ0G7rs7phCHSAHnxWbVPJfidInvQ/EKv5UWZntPfsD6/QGJgk8a9WpbZYq
         WWtmrzLCZx8fLP5NywXwU8Sp1led/JMCUWTfiTAE5nWfEofhpSLPxOQ/cilbed3rUHWJ
         kWfubdwKPhTLOoFYpAFiYeep5TzL66EbBXRpO1uE6qwrwZLxLNvw6G9kUM1iI8XzYiEb
         CxepNyB5Bd7yW/Zo2+MCSEBMi17yAArdWdQA1PmghqTsUC/TOF8FvS6tcT6rLA7IBPXH
         Bp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722177442; x=1722782242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjC7NxrTuEs6NU7ZGsMPtI2pd8QR0ZFJN3vXQzYe3qs=;
        b=NQk9t0uyb0FTvxwq966fQypy9VnAASoYoObA5IrW6FcVCxscHKiomjd6wWp+ntUtS0
         zTCAFZkWGOlm8IFTcYV+qwnAN8fqI4Ew+HPE6EVFy5YFqpuIYBRTRxfigMYSb06cWV4a
         smhouCyako3G2xkiUH1lRij93JpNP9ACspliqdMecdaXmebKpIxWR/P7QR9at7ICxiD7
         pDrfBB5SRAZPywJ25KbB/rdpgPc4YZVKI1LePAbpxoSDGUgOd2NHxqRHDccgLrxk/4Zp
         WBXQs/y4/GekWVbqR12G54x8qzPMuP+Gj69Kb1LS5JLtJUR6u/1+NO8x7Y/R6PcZBslk
         6EBw==
X-Gm-Message-State: AOJu0YwjtVxwhgOKO/jsjgkiMUK/jfzwnP1Sd8DeZLRlysk287VLF843
	kjq9UJGDoOFJDHjG/oduUC0WA8vo7vS4V2iasYu7Dm9y2FE9z4TPqAtBdg==
X-Google-Smtp-Source: AGHT+IGEk9kmiTEm2GTQcs8kGRQSdh5xbVv55V20rom0jvqDr81nQ0iyOakYXCYU3Tcq42rWqZLBRg==
X-Received: by 2002:a05:6358:7245:b0:1aa:c9ba:4336 with SMTP id e5c5f4694b2df-1adb2423087mr577089455d.3.1722177442509;
        Sun, 28 Jul 2024 07:37:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f817f5a2sm4841733a12.24.2024.07.28.07.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:37:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/7] hwmon: (max1619) Reorder include files to alphabetic order
Date: Sun, 28 Jul 2024 07:37:10 -0700
Message-Id: <20240728143715.1585816-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240728143715.1585816-1-linux@roeck-us.net>
References: <20240728143715.1585816-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify maintenance by reordering include files to alphabetic order.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max1619.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 464f4c838394..8eb7d04bd2f5 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -12,15 +12,15 @@
  *   http://pdfserv.maxim-ic.com/en/ds/MAX1619.pdf
  */
 
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/jiffies.h>
-#include <linux/i2c.h>
+#include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 
 static const unsigned short normal_i2c[] = {
-- 
2.39.2

