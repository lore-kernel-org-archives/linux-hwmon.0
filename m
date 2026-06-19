Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821337419D
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865151; cv=none; b=E8uJKqxWVLzfj5yX3TaUYm2amQwEZjtbt/NOYaFo+cffz+dem4oD9rXfdp6mPV97qRM0+n6qz1iVPKLaKKQOgWxgz+u8nrLqi24uefTZcGm+VFmVJbUW41FEy6v0yJuZcuHoWSG6pMgFMXDFaulKcf9XODaHaf6GfQRB+yMb1vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865151; c=relaxed/simple;
	bh=pcxqUZlO8MGRv0FW3547QBQLTAB5icx7KAfxmt0SUl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJ0JU6UQp38KLz9MJla1AIpnMsPlAJoQ6zFLrW4j1QZUVeZB0ZcYSl/Ex2XgCSeyZjVXi/Mkhrc6QRrfwL8D4gb6uj4v5Z/eWQJ9lNbTIXN37KJ6j8L3ZcpZAe24Q8ullHvZvM0wsDcofLgbQaevFfWFdtC+wRG/bwRd2jl1pqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF/oGjvw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF/oGjvw"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c07680fdd12so222148166b.3
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781865147; x=1782469947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyMuryT9zl7hjdm/ImZMOfZ3EaE5vQGx8t9LjYjY8FQ=;
        b=EF/oGjvwn4vyFlEwpJkTvPC8gYH9wi/wC2IMlzyQQQN7nnRtRXtVq/qfpUZlLMb2WO
         CIIuJ6SWzVvrfuRA+GZOH6LHYOWZBK3zoVu8YtgIYxfRNPoC9MMXuC9ll7NTaaQKaZGn
         WsBupX3NIYWUyGDIuTO33UVZv4hEw/mW9JFo4PwoTBw488DmqAw9VVpl8aj+nCU48Fnc
         xcG3XD2BWfJi0CcVfMJpyUU8Y3mZsThoSkVRKs/7Xg9G2LgIwxKuTUtSqQm0zEqmU7wi
         5SQ0dS/GlbHcukJDYrpUfPT4AXVEShaF9LQ9N+ri+awy5KWRYCNc7e1U2URG5Oiyvc6W
         UsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865147; x=1782469947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyMuryT9zl7hjdm/ImZMOfZ3EaE5vQGx8t9LjYjY8FQ=;
        b=HUxJdz13mVYXt2N1AamzxW8AxxPwTzAi7Kgsmaz587p9g1pt1WhzrmzrjPtU6mhNAP
         E55uhl8rnMmFnTvDE1qaxKm0P6fADyySrfBiQZmurmhKmsAkApFIBvl0m7KGK1ZAq15k
         Q7IEAo6e6AbxlMtP/mubwdC7FdAkJqoxzdAsHXe6vbr5BMoO6WLk8oTsLvXIzd/B5Gm6
         8xTucFXFvTd8u+HXK0togxj5gM7RFLfgbIQ7Dy9imJ6F7gpa8GYQX6zSA1qM4ELEhYd1
         RFr3YT3eMYIiMzTangS21YMfsTy1Lm/9Z1At8AoK10E9H1ByiRWHBpoWE1yP3Ybsl7Jn
         FTSA==
X-Gm-Message-State: AOJu0YyZU1/bLnjCuv93txnSXEeposyl44VwgxmSifl2AILTHNYVxEkR
	pe1m/DEIP/b+BTJZWMEYclWGmaOwrbGeaLxb/+U9AO9DqqQ44HzS71BK
X-Gm-Gg: AfdE7cnY2ZbXpeyUXOR0W8IAyFaApxrGVCQR+wvLSrBllrlq3gB7XQy4kdtjEt72LDW
	4g+epAgwvzoK3z71mnM4W7kYI1BOAV87sM58bHDksE4JtBzDqVuDg1+k2pcUQh+5EwY9tDR9vKj
	oLmX+WXsDCxwvLbuo3KJiEgtZ8F7zxXIWMt7OUZq5cfs6hdMu3ZA3im2Op6LmkRMUjLR+o+mrbQ
	XMvwOJhlo8WWE7FTQe2Bh7Z8kAkcuWZhmtGnCVY7hQdImEUtW0N4KlOViabZ9rAqkf8Y5A+/RW2
	PxqctPEsv+vuKFFG6ig4UGFCe6+q/F6wpMHL/Mh3+i0n/ToVVS53MFfAOlQX6IZBkU/VyXiQIlW
	tiCzLK0/0AS+t/6dmzQAy6BijzJqJut9jICZyL5JuBbdm/fPry1c0AHnQqp0UNlSqZ5NCIKSWhy
	KJ2gZujwpizJk1qD7E5iiwV9dv89xcx8lixw==
X-Received: by 2002:a17:907:3ea6:b0:bfe:ed06:565e with SMTP id a640c23a62f3a-c0b75a8f179mr98003366b.51.1781865146848;
        Fri, 19 Jun 2026 03:32:26 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cd59sm76702466b.16.2026.06.19.03.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:32:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] hwmon: (emc1403) Convert to use OF bindings
Date: Fri, 19 Jun 2026 13:31:52 +0300
Message-ID: <20260619103153.216444-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260619103153.216444-1-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonas Schwöbel <jonasschwoebel@yahoo.de>

Add OF match compatible table to be able to use this driver with Device
Trees.

Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/hwmon/emc1403.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 964a8cb278f1..ef1ccb40ed6c 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -16,6 +16,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
+#include <linux/mod_devicetable.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
@@ -659,14 +660,14 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
-	const struct i2c_device_id *id = i2c_match_id(emc1403_idtable, client);
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->chip = id->driver_data;
+	data->chip = (uintptr_t)i2c_get_match_data(client);
+
 	data->regmap = devm_regmap_init_i2c(client, &emc1403_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
@@ -682,10 +683,21 @@ static const unsigned short emc1403_address_list[] = {
 	0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
 };
 
+static const struct of_device_id emc1403_of_match[] = {
+	{ .compatible = "smsc,emc1402", .data = (void *)emc1402 },
+	{ .compatible = "smsc,emc1403", .data = (void *)emc1403 },
+	{ .compatible = "smsc,emc1404", .data = (void *)emc1404 },
+	{ .compatible = "smsc,emc1428", .data = (void *)emc1428 },
+	{ }
+
+};
+MODULE_DEVICE_TABLE(of, emc1403_of_match);
+
 static struct i2c_driver sensor_emc1403 = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "emc1403",
+		.of_match_table = emc1403_of_match,
 	},
 	.detect = emc1403_detect,
 	.probe = emc1403_probe,
-- 
2.53.0

