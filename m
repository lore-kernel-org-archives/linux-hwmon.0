Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5CB1534FB
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749495; cv=none; b=C/Qy46x+YP1s0YYB3S0Y52hCvgQUpF+oJVP5/NMD0dPr7IroqJX3vz8mYXtBNHY6sRrBhmg0D4bcczNP1/Q/8RXGjZqVog4iL86+QllmG0C6vCAVozDUaWZ2YiDqB4tbl+WvPUQ2oiql4LQuNlpvgfKuaFdABManuK3miid4ZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749495; c=relaxed/simple;
	bh=qJxEgjuaJ6bKizQPmwo4X1GMOI3sLhPDKHcmv72BvYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XXYWApmyAIhjijDJ8SDmYjgJHS4TgMDGJDpRNbUXE5vgD2LyDMbaNF6Kl/IiEnveIwAEw1CkP7aKKJdwKn4iK0y4/DlZ9ocHDMnPv7Gx8MUVuubAyJvFuw4xc+swq5NFiU9kWcPtO/izvnM9jPFkPise8WxL5C7Re4b2p6WENGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndYievDR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndYievDR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc2a194750so7477585ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721749492; x=1722354292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yczTxzzP213qs13IEO7htHgc+xi58Njt+so/aWX45oU=;
        b=ndYievDRBHu7dkZVR9qiPcdlCCReOPnZChHGW8ww/k9jHVf18wWfALeoMrOJMo0Jes
         pJ1VlEJ4qZXc1vT3/KAqKdLV/2xsFb+OVRB+vL4V1YgA8F+F+Vo28xowx7pjhZkWXoPv
         oNGJTLoOKYFhc2wxVyMQwN3GSmME/OLoKyV0F3EMoH0eVmc4sGzIT/FfUhEltg2e9nFS
         NQoBlemG6AO3HXA0xxju79qSahTlFbrxCEqJ8Ck333klbqO057LViTTXkniMMvLA9itt
         IFDblAnyNCGdWeFwudh4N/7GdaQ4ttEDbRBoUlTZy0dXBMKTQmzQDl1Te6OHgN62WWnn
         rywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749492; x=1722354292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yczTxzzP213qs13IEO7htHgc+xi58Njt+so/aWX45oU=;
        b=qQzKfbtL6kd3oNrB/or3m9rhXXKqY2Iy7PACW5Q+x9RuDp62X5jaBnjkgb6ePqBfo7
         RCAMuSMZzWqVCdQfb8rWnhnl3nMsrrQCmlBzVVAFSJEhR0HwedU6mHvoF9YDrszqhLs9
         5ovuVLlvyq8eXN3po3RDBO0q/y/hLL7VfPL6Ei0xuIND2RpcnNSths8rlKQp0bUUixmZ
         PhiMTD0XjdXTCW6E5OjEXjar5t4s6xQ01wylBjrXlBYZszIXyMgWghm4huW5Q4nJDgkS
         Rolk0TH7WOGeQkybRT6Wg/uFS0mKRxasxnz0BwU7AXGfynn6lkugPnfTfeZycCiPbdUi
         JSxw==
X-Gm-Message-State: AOJu0YwrT/NOxwAXmZbu8bTDD6Ylo9UUpS6dkIvRTb5Ka4fpZveBtZoW
	RNVCnVqzusi13nxa1u2mMJ0b1aYjMu7vlZxcowm8VVVZjjnoRTdExYnVUA==
X-Google-Smtp-Source: AGHT+IEgcB9c/himrRBNff2jXXTcY7C1Ezt+GKRKXdyX28LJNT8yWLAGzhraiK92LfGrQN3UJq+cqg==
X-Received: by 2002:a17:903:1d1:b0:1fb:8890:16b4 with SMTP id d9443c01a7336-1fdd2200409mr1759615ad.48.1721749491891;
        Tue, 23 Jul 2024 08:44:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d2a66d1efsm3349379b3a.102.2024.07.23.08.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:44:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/6] hwmon: (max6697) Reorder include files
Date: Tue, 23 Jul 2024 08:44:42 -0700
Message-Id: <20240723154447.2669995-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723154447.2669995-1-linux@roeck-us.net>
References: <20240723154447.2669995-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder include files to alphabetic order to improve maintainability.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Really alphabetical order

 drivers/hwmon/max6697.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 20981f9443dd..9a2a21230c7d 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -6,16 +6,16 @@
  * Copyright (c) 2011 David George <david.george@ska.ac.za>
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
 #include <linux/of.h>
+#include <linux/slab.h>
 
 #include <linux/platform_data/max6697.h>
 
-- 
2.39.2

