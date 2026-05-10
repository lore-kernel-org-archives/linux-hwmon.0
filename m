Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9A27B353
	for <linux-hwmon@vger.kernel.org>; Sun, 10 May 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778405159; cv=none; b=MDrc0wHNoG5mzfezYl+sGxXagc4D58WcdEPTpBydFXXjcWY27Y+AUvb7wE7azOsvSs64KZEdGNCukVkOpTERqQcuGuvo01jwtMfh4be1QFLaAaY9bqTZXNKnpycP9vx4lRP66syGTp7wI+OqimzBqZ/lruuP/2h0fzmA1rGon7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778405159; c=relaxed/simple;
	bh=dpdVTx41iIysc5tnvXBU8fwGwC8V1KL/kQPJnPRlnfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jgl4pAbQc6W/PBfr/aaxRcNtR5mSeGJ/gnV36aDguVyQR8ViXixa/yB90Jo/WPV0haLsJsIpRmcXKptmhF7Mfdx/mmUhOnGVEmbZdCQfovJePVmaHM7QAB0gj6Uo0sIIV0sLfd1/J1T8rH9jLA/9dsZpiGa9fmk9ngh9RMZNtsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drMg0Js7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drMg0Js7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d146705b4so41123645e9.3
        for <linux-hwmon@vger.kernel.org>; Sun, 10 May 2026 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778405155; x=1779009955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cCS7f+FiULjxANbc1RhKB9rAzG42EvRdG5ND6rK93Y=;
        b=drMg0Js748Y6FY7MadwZGaDFfVgduQQ0FLVTjJ4vB4A5IIpnNMzpvS3xib85mQx6am
         Ib5pmMuyquke8M+vVud2Vi5GM1/6JLxsrrz0LB8PQeOpKDdQhAvLmeMM58exIGPXBJDJ
         SLxzwBJBijSBN2leaS2xgX64uRPyigGj9O/q5WtPhUv65q2TeE1sHws/xQfm+LPIM4SJ
         vH8lD1wGwtzdQD801gB3T7PmBFtkKJU078flKBtzJ0mqZc3wj8QzJHYNw6YF9rx/HOUb
         1hcUxAsFCCMnTKL4lvzx714TuKm0yLP8/zilCZwwinbJTbO2XCcBbwrk6jX07FA+sq7w
         eDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778405155; x=1779009955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cCS7f+FiULjxANbc1RhKB9rAzG42EvRdG5ND6rK93Y=;
        b=IMQwC5jECNUtT9kAIPnJIRp48K5OxhMwL6RmtohgW2iZowp9PTIgF2vL8mftcUPmIO
         k+qHb+mdADb1uH/5GUZOr6oWr6qOLhozM3kKVkVjM5mtxQam8npx1CJoBc5F5xZa5mO5
         R4QbBspO//ogiq98i4g9fnQt1pEm6mSWVGXOvJ/D+6M4XEvBqF5I2Ps9U2JgqFgD3Fdg
         7Po1BH6dai/8dWLfx/iezMZ4WNu7gqusV/j50B6PXf7jPUQwJzGw6Om67sORuJM40j4m
         OnPLQv+wIsVfBhoBEhQ9oeEdlR+/uA4rFmFLm+RccatGKWROIXhrDiabfNxMmV1NVqPG
         ZJOA==
X-Forwarded-Encrypted: i=1; AFNElJ/wdnPc1nM6/jFfUHV3VLLil3wJmoad1quzP7LiKOQ3LKXy66r3nvgp3Ts8PCCqok1FrGIvKAKVG2v+Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4KwFetpWaZCzpTJB+n+iracnGx8y29J3mg+OHqvBW4RbTetpz
	fmOmykRN50toWHzdG6dEb3sTONDzbq+NrtIug9k/qAjQnfsEpMPkw7IsJLblcY0g
X-Gm-Gg: Acq92OFQfaY9drNYZKDScUKdgH693pKatXDnDuDVNva/WCaKiIPRPDnkTHpZYMjt9Ru
	tfDlCZ1YTQsrJANAA/z66TFBc17P2zVTKRjvw4md8I6rC2S349YmeyIuCUkvinmLknaq+Rd2rf2
	vGXgUftqQgK3QTtq51+IKfBa/gdLvDzf4CflpRYuHYiCFNqqImzn4hKA1Y2bMbfSoTyHmMdKa5F
	L4RMnJrwT0Fj0brDsT3n50v1Uv/IA2LjXmkCvRT0Fy/wjUxODpuAI0HUdWd6u7DzCgfrJb/jOzD
	azUrPwqopXl7wxDxRh9DdPGSmykLs1EJiBeKTGnx+3xUjqJDZOzFY+W0VtH0NbBEbUVj+mpAiie
	c22LPM41XUfqzmMo7aEZfqBBkv5S8eX9eiLQihXfujwWEY+oRQ+1Q7vMoF315CbVeI5lASkSXSC
	/AVtKnkezKuoZnUp1Zyhpkh6qic2YCwKNGw7gpZSocuMt9sp5iLhfR9zfVUW+cgdTqqQBFZ4K9
X-Received: by 2002:a05:600c:34cd:b0:48e:707f:cdfd with SMTP id 5b1f17b1804b1-48e707fce07mr93118135e9.2.1778405155077;
        Sun, 10 May 2026 02:25:55 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm105763075e9.5.2026.05.10.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:25:54 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] hwmon: (tmp102) Use device_property_read_string API
Date: Sun, 10 May 2026 12:25:43 +0300
Message-ID: <20260510092543.12352-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace of_property_read_string() with the preferded
device_property_read_string() in the probe function to
read the device label property, improving the driver
compatibility since this method is not limited to
Device Tree only.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v3:
- Remove of_match_ptr() as identified in:
https://sashiko.dev/#/patchset/20260509112417.51164-1-flaviu.nistor@gmail.com?part=1
- Link to v2: https://lore.kernel.org/all/20260509121511.60601-1-flaviu.nistor@gmail.com/
Changes in v2:
- Add/remove include files suggested by Guenter Roeck.
- Link to v1: https://lore.kernel.org/all/20260509112417.51164-1-flaviu.nistor@gmail.com/

 drivers/hwmon/tmp102.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 3aa1a3fbeaa9..055ee7fe6351 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -15,7 +15,8 @@
 #include <linux/jiffies.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 
 #define	DRIVER_NAME "tmp102"
 
@@ -313,7 +314,7 @@ static int tmp102_probe(struct i2c_client *client)
 	if (!tmp102)
 		return -ENOMEM;
 
-	of_property_read_string(dev->of_node, "label", &tmp102->label);
+	device_property_read_string(dev, "label", &tmp102->label);
 
 	i2c_set_clientdata(client, tmp102);
 
@@ -408,7 +409,7 @@ MODULE_DEVICE_TABLE(of, tmp102_of_match);
 
 static struct i2c_driver tmp102_driver = {
 	.driver.name	= DRIVER_NAME,
-	.driver.of_match_table = of_match_ptr(tmp102_of_match),
+	.driver.of_match_table = tmp102_of_match,
 	.driver.pm	= pm_sleep_ptr(&tmp102_dev_pm_ops),
 	.probe		= tmp102_probe,
 	.id_table	= tmp102_id,
-- 
2.43.0

