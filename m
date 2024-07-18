Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFE4376F5
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 03:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273983; cv=none; b=KIJAiBa7HMW5yVuGgV+WqFtlfMCqfC/n+d8zRNBnkW6MzjDA1eDg2CG/p6XN7o91QwZ9dcpCw3s87ZngarFVnM/N5B00wACaws81gnpBYYXDSPxbxbzSFSiNeboQzA8MidTUj5nWVdIWpKNL+1H9FvlHyABhUKR7aDyywyBib3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273983; c=relaxed/simple;
	bh=GNDiW0+GJXij673+KU7H7ynI48GkMPJSU84i5l5aW5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tgxxI+GPvn0qZflBhnC/NA8Ozbg7DEh+CNbXlFChNhIPmyl9dFcwWtPD+B6WD9K+AePtHTqKPzddq6QifiONAwYUvZaE7QD/s7LddYDq6q1i1662xFxxWUsk+PPNyAOt81CFVDtuVV0BKKlppbOY09YtuF5ShcH6XOt+6S8vANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idywjrMy; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idywjrMy"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-708bf659898so167123a34.2
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 20:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273980; x=1721878780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF4XxHS390yRURmyVH/W1GTZ/aUx5MCavuLnoSaN6lc=;
        b=idywjrMyTnmDqn1hyWkM/TkYBqwMe4I2SILSe5Mis/g5V57uOWX/s1USBH2DEjqHJQ
         VnjdnYOoCiopDvFrgWCl0k1giHVdmXgbdyEVvnf5kCll6CLNFNvQE8FEQch+UMw4fbrh
         /2L6FMplu9Xqzazs2R/QnnhfLGBdI3speV2wnc58Y6pCFjV4kYN/fvL4L0hT18Pzh5R7
         s9hhUjbcMRqMhPQcT3pfpWIaMG5Th7cU0aRZwAlI/2qFv4J08fF9yqKyTH1nMbY5z9Rm
         20AcWvPGHNVdUpd9xwkvPIqoOaD9nBnc1zWloFkD+M7Tdb8oxxRgUI98tuoK6II5azdK
         GOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273980; x=1721878780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EF4XxHS390yRURmyVH/W1GTZ/aUx5MCavuLnoSaN6lc=;
        b=oyFjOSPY8ytP+EJp6FyB4mxFUkdzOuJy+ie8sP68yFw33PsYGeH750Wiy+k6VaCzi0
         tkOJgwwkxe2akyZy89Kn5WIfcCZVufndNLF38K5T27+TWFEZHUeKXeJRp4j9a/gVFhAV
         yUVZqXHkerN1XYi60ZyAtRR0uid5/0GDOeDVba5h0wjFBVxPq2BFRa2V0HWZsIt7PG+t
         PiY+PJ7kEoa8J+L/4302OWm+MCtfxMq8m04LN4Zdizd17G1Kd4j/93f8WSX+3ByMud2s
         CDHcsiGhKx7D4AR5FDDTYFgGYB33rBvnSq9VQi/n7RXpC9VZftizYPVRPwRm2RSR6nmo
         zOdg==
X-Gm-Message-State: AOJu0Yypupka6pgN10oWGwcmhtRNb36s0KPkBcElqd309x36ZfnESCTt
	xAoMJQxuz6Ck4L/NRplKyUjNrRG0GiwG+42pOMfMXx9fSIrl2oIh2FJhZw==
X-Google-Smtp-Source: AGHT+IHBMchzZZxqItYeRnYgnGxSWWpstrmhE1PclPfAkX6rB7/DJjvUIQSpYlrqDPeVBmMGZjHK7w==
X-Received: by 2002:a05:6830:3143:b0:6fa:732b:862e with SMTP id 46e09a7af769-708e37961f1mr4732954a34.9.1721273980198;
        Wed, 17 Jul 2024 20:39:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca758fsm8903450b3a.162.2024.07.17.20.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:39:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (lm95234) Reorder include files to be in alphabetic order
Date: Wed, 17 Jul 2024 20:39:30 -0700
Message-Id: <20240718033935.205185-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718033935.205185-1-linux@roeck-us.net>
References: <20240718033935.205185-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alphabetic include file order simplifies maintenance and makes it easier
to add or remove files.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95234.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index 9a7afdb49895..0c509eed6a01 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -8,14 +8,14 @@
  * Copyright (C) 2008, 2010 Davide Rizzo <elpa.rizzo@gmail.com>
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
+#include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/sysfs.h>
 
-- 
2.39.2

