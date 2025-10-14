Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B0D2FF65A
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455529; cv=none; b=tfFnqZe1Mz9PRu27csz39o9rpuCl+v5GfRx7jxU3aMTaqVEozS3TvTGZvXultLSGNOqQS/SO3w0R0D6aTYBcG6lXzMtdreuaAMeG7R9lPmOOVq0ay6KGWxUqu7744KrKv6kJF+ugFoEGop8LmYTpd5VqJ6fiQDQSCtj9ZhNFqhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455529; c=relaxed/simple;
	bh=UwLxiXs3hRM2HH97Mt497qbhX0g4Rs2Xwlf9tDQcEdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmoBSFdtB3r3hF3V2ZJCP2N/5DkSJT/GhYeihlUMu4dl5V+BF7+NabXVDSh+Q8qf7ilbqnuRfM1N80yf7IHF3Qdy5OEGshCWnca7zasbtLOTRoxOU58SGEu/Scg2IncKotFkc6xn6G7vJM57nv0zNgI5N16BT27mE4qzZrCEHUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2FAdAud; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2FAdAud"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-781251eec51so4546521b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455527; x=1761060327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8s9Srofr0p7Xmy6EM4M2PIuqgDb3XS6DzPduVQTnbAM=;
        b=g2FAdAudQ3fh0XvedigOT6KewcscdWV74RkkAlH2Ovs2hYN2KBfCD+3uduVD76GI8v
         Ak3eK8LCPVYNHCUcNVSiesfyqnTSd0he9AT+MIS3PBZnx1fV0hIfa4Vhc+N42MEliH03
         gXpCx5revVXcT885oWYk1crVvi9eXYsfaJCSwxo1g3TWJF+JblZ747c20/OPnfd1jik+
         lGKLJZG8YGagN+k+NztzqX96Ue3J0MeEFOO2F43pIbuS7TOvhhC7MIE3dhDSh0IzzU1v
         +VCVKcyBSWiJoZQ1dlZZlK8XFNGxMNLBdWsWu/TfdxyWzKTglG/ziKX0bAU2n9P1HeHj
         hkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455527; x=1761060327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8s9Srofr0p7Xmy6EM4M2PIuqgDb3XS6DzPduVQTnbAM=;
        b=Q2zruXWZtNubcSSJo1ur/zCB7vowan/7BY1CrF/Vb5P6pXBmq41ZiDTA53QgwGm+KG
         6ZSQlX/GqiQoWSJUZOD7V9dH9uMfKe3Q+dGFmgpD61bUAk827YPcdout4MNz1bV6afIg
         EmqzRso9rO68MDAOs05+/5a/LWQT6GTlWkrahLqfhvRkZlELdhYRwn1ICsCvTOw7O2Dp
         +Sb2V9Df9HInocAnyEGhmbTy9jaZnJ3AvUjQzxBT65vU0KfEIz2oKwtkvL0v/k/+hUaJ
         yuonvj/IbVYMxTaqDSqkoA445PNDE7XG9MwFct0KyOxUkrrs2aEevfSXBGCn7Dx4GWQ7
         2naQ==
X-Gm-Message-State: AOJu0Yx3b9RUK/W/ei6BYKJ4S6Y7SZLn8vgw9PiwKPUEM/jVEBGwCxSp
	W2UDHqOjZ58LDCYT6wuvyR8mPtCRNc4l7ZKeox9gB70avRpj3KXNwFocjHtJew==
X-Gm-Gg: ASbGnctf7OTACVUust5JYwm/4Oc6GiXyKeJC1Ley5ce7ZHdDsEapVm90AGjXFhiqHu0
	mXLNDf80B6DX/36XtgPmQ0sjJ5GPX9asM1A6bcpLyrI2P/46l+5RBHi3qc3DaXuL5Q9tcemYSor
	vt4zpkG9ge/T1tbRrf5YOf4aZy55AxWzl5OFJ21UYcOlVQW+Z1evOcrQj8aPw/lS3kN6BWcGk2C
	n4OMUwHTwQ2WYT2vERKntUpUeSrIbEzXpzAKVNb335QTgwI+atMkjI4jMS7tfqK5jYwbH5Bd+Rz
	891MoFC4um2af7ZAW2oC8KAdr7zMMD1/I6VOk4MzgDgfGlC5sFLt8eL0TJBlb9ooqKu/QAnWn5t
	V0oKstG4CXa9soWbD44BJHlm0OlAXlYIRBX4KHU87i8IWIvSOpmMtk8A9R/A//ruv
X-Google-Smtp-Source: AGHT+IG4ZmzlcWXFkwcYiDAwOyeErju6+lf6rJbqjNVqZDQw/4SB5Jr495ij8CIAS9SnFP9Dn5gj6Q==
X-Received: by 2002:a05:6a20:9389:b0:263:616e:b62a with SMTP id adf61e73a8af0-32da8122b3bmr33901825637.13.1760455526957;
        Tue, 14 Oct 2025 08:25:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67acd88c77sm9387930a12.34.2025.10.14.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/20] hwmon: (tmp464) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:00 -0700
Message-ID: <20251014152515.785203-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp464.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/hwmon/tmp464.c b/drivers/hwmon/tmp464.c
index 0f629c6d7695..98f2576d94c6 100644
--- a/drivers/hwmon/tmp464.c
+++ b/drivers/hwmon/tmp464.c
@@ -13,7 +13,6 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -92,7 +91,6 @@ struct tmp464_channel {
 
 struct tmp464_data {
 	struct regmap *regmap;
-	struct mutex update_lock;
 	int channels;
 	s16 config_orig;
 	u16 open_reg;
@@ -172,19 +170,16 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
 		 * complete. That means we have to cache the value internally
 		 * for one measurement cycle and report the cached value.
 		 */
-		mutex_lock(&data->update_lock);
 		if (!data->valid || time_after(jiffies, data->last_updated +
 					       msecs_to_jiffies(data->update_interval))) {
 			err = regmap_read(regmap, TMP464_REMOTE_OPEN_REG, &regval);
 			if (err < 0)
-				goto unlock;
+				break;
 			data->open_reg = regval;
 			data->last_updated = jiffies;
 			data->valid = true;
 		}
 		*val = !!(data->open_reg & BIT(channel + 7));
-unlock:
-		mutex_unlock(&data->update_lock);
 		break;
 	case hwmon_temp_max_hyst:
 		regs[0] = TMP464_THERM_LIMIT[channel];
@@ -345,8 +340,6 @@ static int tmp464_write(struct device *dev, enum hwmon_sensor_types type,
 	struct tmp464_data *data = dev_get_drvdata(dev);
 	int err;
 
-	mutex_lock(&data->update_lock);
-
 	switch (type) {
 	case hwmon_chip:
 		err = tmp464_chip_write(data, attr, channel, val);
@@ -359,8 +352,6 @@ static int tmp464_write(struct device *dev, enum hwmon_sensor_types type,
 		break;
 	}
 
-	mutex_unlock(&data->update_lock);
-
 	return err;
 }
 
@@ -658,8 +649,6 @@ static int tmp464_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	mutex_init(&data->update_lock);
-
 	data->channels = (int)(unsigned long)i2c_get_match_data(client);
 
 	data->regmap = devm_regmap_init_i2c(client, &tmp464_regmap_config);
-- 
2.45.2

