Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0AF399D0C
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783853677; cv=none; b=LScOJ/W/9kwJsLKIJ9htbSTBGLFN4po8HgEhSSdY71iLUoagpOrEwWuFvW59+5gIxcO9CHPg6JeYne7JDXQnGsAapRFqi8+WhlMdKn9+D2lPbEL90yCOxo2jxzJWDy8+eUc4072on4pwCKjXXmCVO/Fh2edLuUsAu2h2Ph6tfLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783853677; c=relaxed/simple;
	bh=j6Ac1+9xjFQcX8W7IuNFo9sRaMciGfY+tjxe7+sby2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mRa/ksfsogX23DzJTiN3lOtIOJNyxxXb8u3lsA1ygoPKbp7Q4tApRhMephXcoNQfDan+/JJWBaR+ykGYw6j6sv+73uGA0p/5IM9O8qb+24CjK9B9m94Pw72kS7wPQmLLBBar7XEeyo//SWiPp4uqLmF36uEEifLIQf9YjZp6F24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieqdkgHL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieqdkgHL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so8029465e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 03:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783853674; x=1784458474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLToWjQ1/iiZRq9lrRBbAbPAkf+vsqxoSBzC/se2lq4=;
        b=ieqdkgHLTkquVp/Q0t9oHtXQf+Nxym+GIJOHc+XEG1x1VD766ip2MfHvRhMhRqoTZN
         YHbCcvYA1RugrsTCHWh9d8ljTTtGJEV/l0iYXrowEu8PJUK3hr/y24wSNMrrUSeqHCSX
         mD719QwIPfkBJRFLQCmn2gzLigkMeBb38uudTia+CCQqDfrJAIRte+T25b9I3p3Rk6pz
         Rhq13tFO1FlpyPOCy14JSZ3FBzaUv1If53F4ryRplDwfqpiJ8GsHuj3++BgdvBSmqlG+
         NWGVlWq5yLTAcubwkvsOanCfCvRUhuOZbLkC56TvTC6V4G+Av+EiRuwPZfc/4FXnFxbj
         0/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783853674; x=1784458474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLToWjQ1/iiZRq9lrRBbAbPAkf+vsqxoSBzC/se2lq4=;
        b=iaz5ozpnP8hcPmNLGrhFjSEtS/NZaPWbvrwj5QneDjqQxO+9AmnSlMfe46QamBYjqD
         GjeO3TfuHx7RQlFc0DTBNcTtVzuBeReBral86EbRWqz4de0Sd6eXFxdeC2wzh8QlkQ3e
         s0M4TaaanQ8VNngMKO6jgPv2gUPR5CPEFXzqPm9QEk22mPo/D8DEJavlXAJBdSFDe/Sx
         CNe8ib2EuXqD4A5pbywYi5C+tZ0GSBmcceAmb1z2soHmr4xqHEtqF2YVpArNMvQnFlQ4
         d4s9pKRfOMKMFc+8PxVILgcpX8CBgZpgSjBHw20GnYmjyh4jcnXUw0iWD/FcptC3DZO3
         tHTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpto/f6zKg2PX3MlF29M03AQ7natDyueiuRYGXXLE/xNwnDWM0UpGGJ8O/AyT7xEskBHm7EMUouwIZa6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWq4+WFoplekeCKO9nLIBSkzb6CUEYx8FJvKNuqtx84/cIWVC
	d11kZ8cqsRbBcQOfS/Wckr9NAkS6f4g8DItaCQ0vhkpRyimBLUoWwNCv95K2xA==
X-Gm-Gg: AfdE7cn1utaIGAm5Ma/LpvQiI1BF2a0qIcnyA1YSLXTbLj8wIoV6LQ/F2KCP9xFDX33
	Am34eQI2L5WJ+8a1Fw5oFY+fcqHUHaJOd+7/1LHnNNLJH3cbfCaHYq5ctZOeE1fbiOeX+CuXUia
	HstxZkuJUX8oDG5wsxUNwO7UJfiBhh6hYXhemsjv33o7UTlY8kZhrShNk7WE6k0oZ8jBPrSF1zK
	vEMo2DfY2wBbRqUJvXjtfi5ZPpRlgjQrNsfFksDXPmB2oQ6eJCWjLqIJV1i1gVQaQcn8eG4ijmR
	MlfjCWBBuWnqzxbpHJObHuc9QbF5YqEj1mLclQt34E0L5mp69H3igINl7RrrVsung1mrNFB6Eey
	6d+3kE2sb09FjjkVxsEt1e1Yf95iy86UEbSCEXQmWVtM8PCDYgfgY6vmG4XUrDrusOHJleENJ7O
	FKmQoHXZ3KiRqPLeYZxSgBw/f8G9t0UFY=
X-Received: by 2002:a05:600c:3e0d:b0:493:e97b:3b9c with SMTP id 5b1f17b1804b1-493f88317d5mr52762295e9.29.1783853673865;
        Sun, 12 Jul 2026 03:54:33 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f25b23b7esm21079195f8f.18.2026.07.12.03.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:54:33 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) fix EC read intervals
Date: Sun, 12 Jul 2026 12:54:13 +0200
Message-ID: <20260712105422.920360-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Take INITIAL_JIFFIES into account when setting up next update time.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
---
 drivers/hwmon/asus-ec-sensors.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..4746c3718664 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -1009,7 +1009,7 @@ struct ec_sensors_data {
 	/* sorted list of unique register banks */
 	u8 banks[ASUS_EC_MAX_BANK + 1];
 	/* in jiffies */
-	unsigned long last_updated;
+	u64 next_update;
 	struct lock_data lock_data;
 	/* number of board EC sensors */
 	u8 nr_sensors;
@@ -1278,13 +1278,12 @@ static int get_cached_value_or_update(const struct device *dev,
 				      int sensor_index,
 				      struct ec_sensors_data *state, s32 *value)
 {
-	if (time_after(jiffies, state->last_updated + HZ)) {
+	if (time_after64(get_jiffies_64(), state->next_update)) {
+		state->next_update = get_jiffies_64() + HZ;
 		if (update_ec_sensors(dev, state)) {
 			dev_err(dev, "update_ec_sensors() failure\n");
 			return -EIO;
 		}
-
-		state->last_updated = jiffies;
 	}
 
 	*value = state->sensors[sensor_index].cached_value;
@@ -1402,6 +1401,7 @@ static int asus_ec_probe(struct platform_device *pdev)
 	if (!ec_data)
 		return -ENOMEM;
 
+	ec_data->next_update = INITIAL_JIFFIES;
 	dev_set_drvdata(dev, ec_data);
 	ec_data->board_info = pboard_info;
 
-- 
2.55.0

