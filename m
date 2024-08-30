Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D49F1D1317
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979962; cv=none; b=iWUZdzJxIjF6ZFvkXm3fOmyQH/M4lFoV7XgF0ZJsLaMhxYaNdzAElJBW2D1cTI0Z7Kz0hhnwIISfgKsWQQU7iTx1XSnT7BP1p08dmzHkddPY3qnTYXlezmO/0cwCVhbmvIm4JEq9fnW7yN+olo3LHpSrbyy4Tss3LfiKS36Qg8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979962; c=relaxed/simple;
	bh=L6FrXn6RXQWwb5kt7DYhZLmzxyBpeo9KMXSas4GPsQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XDIqLTi6lQa4mP4ngNhwSuN7LDcYRVYkbGY2ialENdVJUx7qsF6vYrOrWQriXTnCWl1wWf60XobAUITvlqX5mVYyL2ndYU1Z2TA09P1UtKBN51W8Lzb01Vxtv+KKFCFvF1FcF/SMHnbcs0Ak3G7dDfsBc78gKtFBY32zMZGbwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB045/QZ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB045/QZ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7143165f23fso1040027b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979960; x=1725584760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrnwwCZWGbJxQ4hO3t/7VjizGZWjaacREYJ5w+I9hxM=;
        b=TB045/QZZvqB4J1nIay8Kf3O6Yr3YaS1vKquXfTpd5SY0WsVSfXAQcdYxDezMcv0/P
         xqJm/wk4d2Z/A/YUbj9CA8ZCdmvXsta57ch+cLHBH1/Gokp79SKpGU7QsiGxtF4tg0U3
         Qg/hrfL+7BZImzWGzg0PaPR6RL8Kgtl1uNosNY1UrPD7tw1qEjnDfypZ4WTQi0nTjptO
         QWmRvp+ZzJqILRPyTO3r5aQdvpe7YcCZNgRVH+TXnu5yAKEq1Yu3+5kduIxve+M9X3lA
         1JG3s5Bdw2jL81lTvPUJi4H1SzC/8FbCV1GZe/sK8B2cXd48OmDHJTLAZsn9amn1N5VS
         tt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979960; x=1725584760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zrnwwCZWGbJxQ4hO3t/7VjizGZWjaacREYJ5w+I9hxM=;
        b=mGFu4UoFnAaebiCJqgQlNoz6KvY+F+bvHAYNXWOd1QjljQNovkOJprjfYogkuk9Rq+
         Il/nQ9ZraUuypXkFyx36pj6xcrBre3u9WxALzFJiz3Fx1/Laaxf6fLxgYIX5mNRteYyv
         oiwD1mE/mFo+QfmKwKkY/br80x5ah8/jAG7exj4l7qsK1BwKrLJBbkn66JLRyKjww9In
         U1Bf46pCYS9a/ErUZGpX6dqlVtcM7Yrtduy4wynkpidFuxgsCwHEH27tU7iLO1wnTpZi
         IAuqz1LbxsqtAk1HVcRhxZUEptxgAQqQnpKyzpTfHWg132un1ARZr9Z1xPGdA84JnqzB
         91lg==
X-Gm-Message-State: AOJu0YxrVD6n0cq1liqGfwH5ZXiSK3IOtBNRoNCxwylAy9Na01AuvkIN
	iK7zBZRC5aJkbeC2gkybk/8fCtpwWJZTndXv//9BsjDjacE6q1TUOEUfgw==
X-Google-Smtp-Source: AGHT+IHriRlZG/vgxtFmQBWUnqN+9SkUiASpX5Cq/fJO6wYjBZb+BM+9ja4RTSpgmAyWLJ+edMTfdQ==
X-Received: by 2002:a05:6a20:a823:b0:1cc:e4a9:915b with SMTP id adf61e73a8af0-1cce4a99169mr2566006637.47.1724979959898;
        Thu, 29 Aug 2024 18:05:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576c90sm1733629b3a.2.2024.08.29.18.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:05:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 01/14] hwmon: (ina2xx) Reorder include files to alphabetic order
Date: Thu, 29 Aug 2024 18:05:41 -0700
Message-ID: <20240830010554.1462861-2-linux@roeck-us.net>
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

Simplify driver maintenance by reordering include files to alphabetic
order.

Whule at it, drop unnecessary / unused jiffies.h.

No functional change.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/ina2xx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 9ab4205622e2..a6a619a85eb6 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -22,19 +22,18 @@
  * Thanks to Jan Volkering
  */
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
+#include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/slab.h>
-#include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/jiffies.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
-#include <linux/delay.h>
-#include <linux/util_macros.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/util_macros.h>
 
 #include <linux/platform_data/ina2xx.h>
 
-- 
2.45.2

