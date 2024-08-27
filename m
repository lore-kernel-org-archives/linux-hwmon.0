Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3619626AFA
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772905; cv=none; b=A5WQ1Bi5p3Wp5hT7aoymqtJXLYgIY1AzF2Bv2TSf/lal9GbMhs3+SzDIPUYnu0tVXSpvrvWTrOXKj8dkCMFJiibGvRPj59YZCSJ7oP/h6X4u/Z28ziJCGzLi0OHbNvXbRfZTMA6NCdaIluHx2xuB54N89lu4MoVIauFgoV64yws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772905; c=relaxed/simple;
	bh=GR999ATCFGzHTVLh/S/T3wP3m5hBIvXLK86oQnYhqIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYjEzbDp3L0Rt5Lgi0P/NwHHH2w6vyq72bx1W0BF/9CEQ9wzIyabzPkZYwSeNIU/XSKDWdGJGy+P/iPTgNAHA0vkY26bmj7dKG/di+lvoSJXeABU6tUnHSuMxXiSf9X9QpHQk35r/5cGs37Xcbar87FxAScERjR+DBjX+1KK8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inZPm9eZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inZPm9eZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20219a0fe4dso55932745ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772901; x=1725377701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iTKpaj6Gv0Ve05USrmRK649l9Ix4UjeH7sGMNvE0wU=;
        b=inZPm9eZsHfNNd4g4LlHtWgSJva79h29qQzlb56cXe8NwQGzwP4mxAlss2vzpJVJju
         84/7YVVnnvmR4ZNyoMbuITVwLFIImtMtYKrJCJe12qGK4qeCLLOewtRMKdEhnz30+dYu
         J/rmArnocLQpBWASTwq2EzsVcHz0LCOhrOkSsMePeZ9LHx83hxwKVO7fmdThOo1j8J/f
         pNzITw+3FAlL2BcD7CHzmBGLZVeKkcyvX5MmFSMH7ROVqSVZa3x6vojbMKd4nfDZs5jk
         gsazA/O2MJosvHOWpp6df9MEj4+xBvkNMGLJOEZKqxd3RTtDorPWPhdDWGH6KzBAYI3b
         gHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772901; x=1725377701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+iTKpaj6Gv0Ve05USrmRK649l9Ix4UjeH7sGMNvE0wU=;
        b=aNHWRHHXBAO+MMCszkr/+ydpmtSjvuYoQG8DdFqQwcF70Ya6B6PbRscdO+evC4qZmN
         DcENX+55qA2Wp/2501xtZI66ApuyXKdVUncBLiIgk/hMkuM/6sTzihJs+GNl8H5cl00u
         dsvpsQNxcFcVQJUjpq6Kv+8fmO8/sGI/EvvXK08xnV5ehnv+BPF2H11j4fjn6AtB0Eud
         HgnurtUrVqrRsgt9ruZVEejoHx7AIA6dryNoHlbva0swUX8zcsmton89szhJPEYINLFW
         fqh2eFfLUJIiJ2/pTEjMJcq1tjjj7di8pPyjzMpi+e4QmEishl5pHoccLiyww91Y9xC9
         lKGQ==
X-Gm-Message-State: AOJu0Yz/Rr8yXI6rbhlM6IaMnKo7YsnMU3IecnlXVEoEm8S08Vah6Kvo
	Bl2eMJcbq3hwe4/OTF4BnAMp539aFEt4V+U6L3FiNh6+rwEQqZLKwHeSEA==
X-Google-Smtp-Source: AGHT+IF8zIFB9yZsCJELOsfErMVskowdwfS451BOGpWFIGkToBY7lYP5P0VNOYIjl+Lf/itqX3oZRQ==
X-Received: by 2002:a17:902:d481:b0:204:e4cb:5636 with SMTP id d9443c01a7336-204e4cb59e7mr26572875ad.11.1724772901077;
        Tue, 27 Aug 2024 08:35:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dbf63sm85110145ad.176.2024.08.27.08.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/11] hwmon: (ina2xx) Reorder include files to alphabetic order
Date: Tue, 27 Aug 2024 08:34:45 -0700
Message-ID: <20240827153455.1344529-2-linux@roeck-us.net>
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

Simplify driver maintenance by reordering include files to alphabetic
order.

Whule at it, drop unnecessary / unused jiffies.h.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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

