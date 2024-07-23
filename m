Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9CD53376
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 00:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721695933; cv=none; b=WBo0xo5MnojdDr5zQkA6/jKE2RFcYdRe+xnrtAVJGJ5zKohW5yLFBNvhVYM5VadedXXWheC2/o9v6b0oY4MShR5mH/V2KqTh1Lgk48lGQmnIyfXsDlTHbv7hQauAgObA8OhgGUBb/sCuV02jC3VQ//7slehck8+VNecjPfcd6xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721695933; c=relaxed/simple;
	bh=dngi2elumui10v1Wh156QB89NnKrnohxds5RfYG3Xic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JZsFt4SfoxpQi3B6RoiC+OvEsPIA27CgbPzrBqshOKrcFWkwK3UlGdzbpNxZOy7CZF9jMOEmri3Zzv/mXsLwtdj0zqVGUZFLWJfxH94zIV6OuxW3azv7tPzg6HggZmvRI1q42mW0JRYbgbWauJvf5MACV2j7VSsvYvTtnwTFlL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmhhjGbG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmhhjGbG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc65329979so853055ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 17:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721695930; x=1722300730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JfRQGxlDbMP9iZuZVNYBfc9gi38N9bubZDW+KY7goQ=;
        b=VmhhjGbG1tAnTj5/hs2M6SWu4dYjqD7opues/pPJJdAJS/6K+v4PAkWnBu7mIxEAvX
         SJ1BLKQ4G3MW8n4v5PhXTzyKgyNH/qoafkD4BFkovmrpPwAgWpqSxP/y29e6qC1hLL3x
         kSvHFIq5A34e84M9Zhawo7acmf4UOxbB3Rel4yqTQp4lkIB0v+/7cKZqzNY3DQUvEzrr
         MKs/mdYSyyiArs5nJRQwkkufD+PQsHngQlBMALFaTU8kxOxDj0OjKWrxwMAjQLyrRBoq
         5BqBHxdgJ4vX1nJnIEefAjkzRdQeUT46nTDpD1P4O/XLW4HFhHJka9BN2IEqNPUjI/qF
         bo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721695930; x=1722300730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JfRQGxlDbMP9iZuZVNYBfc9gi38N9bubZDW+KY7goQ=;
        b=r2PF8RteL+nitDK7+kzPyJLYV0/RwcvaTV1cr32nqthN/eXAHsL0m4UrnhX9fvi032
         W7JvR2y3YJjPN1YoSRPoumzOHq7OFDqB8ng7IddyCubzunhjCBe2YKnC9yQBD9OjrV+6
         qCcR3PoE1rDA5Tmqh4P8IoYdIGFFABFVdPGnFr3uCJwes3rdLeLfpkGt/OpoiBY43fLP
         2UcTxcN4q3m1aFX+xYxAu85PBBxTFF0PBJ8Tb9C458k7rtgaE0GrwcKVNEP0IEC/RYJt
         sL5Hw04fL+d5Ds8i/nhye6Y8xwjBM79I0SFyndiSuE809epnhI5oBzw3MP5B1OnuJiNF
         Fikw==
X-Gm-Message-State: AOJu0YyW2iRGB1OoxU7Lsp53/vbD3Jzke3KUfGjn+9AgxBnZduyAiCz/
	1ZBu1DYqTZ25Iz38bDaWdXvdb5Jgldfsd4r0u2QXmkZcVAXJXeoYXJnFSQ==
X-Google-Smtp-Source: AGHT+IHMzceHVYTvAgity1KaxUQApMTtN7GDvtytSol/pQDg5ZXCUTfhBqez8V6WnI39OvzhAPgJ6A==
X-Received: by 2002:a17:902:e746:b0:1fb:701b:7298 with SMTP id d9443c01a7336-1fd74573442mr90970085ad.32.1721695930104;
        Mon, 22 Jul 2024 17:52:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f2aaee0sm61489505ad.117.2024.07.22.17.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 17:52:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (max6697) Reorder include files
Date: Mon, 22 Jul 2024 17:51:59 -0700
Message-Id: <20240723005204.1356501-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723005204.1356501-1-linux@roeck-us.net>
References: <20240723005204.1356501-1-linux@roeck-us.net>
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
 drivers/hwmon/max6697.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 20981f9443dd..6745d311dcf2 100644
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
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/slab.h>
 
 #include <linux/platform_data/max6697.h>
 
-- 
2.39.2

