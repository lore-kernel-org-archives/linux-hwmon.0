Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B86A01E
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721170864; cv=none; b=b+1KW2AIiUPusWqtOSnn+h61MYgZjrfFWjpj8G0unciF8AXArfIBYEYxgslT5AV5Q0SC7lb9oTLAPRhiMCk7RmQ/Ij5hbhM/KtfDVD6WCa/CGgDkUx2jKkp8sA5zKSZZGqArpw3h5hQuEn2/W9hY0D01iNT9uUWaJsErCS5CLeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721170864; c=relaxed/simple;
	bh=GOlEHnyUoF59EnIaOqz8h1goXcGRS5L4vAtiGCgCsIM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BwY8WqTxsXIa/OlMQxePpC1YPRzxbCsdbzrM84YcMq4xJ20vLfX4688x4NxYKlCk9t6y/SkkvqdmI1l7OsE6qUVlt3tbvs4zgLKpG/Q1DWxOqjAd4ZNrv2SQE1Y/tB7/WGopq78+fxUieqvMqKmAl+GTS/LJ4A41eAOeMedOgIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kv8kQdJD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kv8kQdJD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70b5117ae06so4406737b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 16:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721170862; x=1721775662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36VPYYbZzj8FPEQTnHRvuJaCAQi9X4RzJKfeP9NlBXI=;
        b=kv8kQdJD35UdN1K3cdIbX0n9leCQ4+q3pi4Vn4D4ImMHHbdSNQU95RddZLHF2QOS10
         qgCuIBULrqv1zmJLvs3ojmSCJKDGeXDxIwRRfyqov1MBbje1k2+JyaNI9syQwubwTVji
         tIFRPHjBOgWYkhQ99VLPQJK0RgzQ8ptPkBTR37czSL+htkGcxeHhjB6yfVgIwTM548t5
         wqJu+XmSYLhjWy2ngD7C8zSD2j4w5baLrfdJLQEe1BDNLCDYHoKP5eRzi5jkvKEZETO3
         s400glkeQW9zTEE9g1KuIy4aoKannK05deb1uhFBVAaABb53HKXtXtF5JlbFQIiPPEtv
         Cwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721170862; x=1721775662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=36VPYYbZzj8FPEQTnHRvuJaCAQi9X4RzJKfeP9NlBXI=;
        b=kDWhAFx9PUJPMsBFr0mBezV0WgEACavgvjToAvwNkiQo53w1OGOROACFeLBRHsHNWT
         Tvjblj+BcHkDmE9x6XdNbrPahMn3oZ53zQOPfChnUY1nAbRPW53HcnweTCwdZPIgI8LH
         XrTsydfB2QTpG9AgHiU1Rf8asgcOKmyJgb9nsAerpFzk5Qbu6rvlCxpF7dyKIMCPoapx
         8f10Emdcb6x/8avYiNWdoqpgMFqWhWpIm/CwdwtTX3ybQHwcObwTh9lo6k/a1drftcP6
         6/YrnrRF06tIMP2k9R5XRfgpCi8sgyFxNH7yJeaBlRqsnJPhzIhlqWaoO+/QRlTwehXW
         +chw==
X-Gm-Message-State: AOJu0Yzm9xyYEa6tl47+0K2SIf5BWECmGCfU3CA0/FxwjsKPOxj2hM/M
	SvYFZqtvAr/j6qjOG41HdIjuh3u+HPA5gEzAoA8G3TWzA0TUFbrcp+Aulg==
X-Google-Smtp-Source: AGHT+IF7hmuaXme0anRSsY4skxOFbtJicS6TadEfoHSsi1A4fsa90y40FZIJFgVyXlpdM0o10dzokA==
X-Received: by 2002:a05:6a00:b43:b0:70a:f40e:f2c7 with SMTP id d2e1a72fcca58-70c2e9b331fmr5098353b3a.24.1721170861971;
        Tue, 16 Jul 2024 16:01:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca7865sm6876207b3a.158.2024.07.16.16.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 16:01:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/6] hwmon: (tmp464) Use multi-byte regmap operations
Date: Tue, 16 Jul 2024 16:00:48 -0700
Message-Id: <20240716230050.2049534-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716230050.2049534-1-linux@roeck-us.net>
References: <20240716230050.2049534-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use multi-byte regmap operations where possible to reduce code size
and the need for mutex protection.

No functional changes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp464.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/tmp464.c b/drivers/hwmon/tmp464.c
index 3ee1137533d6..0a7c0448835b 100644
--- a/drivers/hwmon/tmp464.c
+++ b/drivers/hwmon/tmp464.c
@@ -147,11 +147,11 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
 {
 	struct tmp464_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
-	unsigned int regval, regval2;
+	unsigned int regs[2];
+	unsigned int regval;
+	u16 regvals[2];
 	int err = 0;
 
-	mutex_lock(&data->update_lock);
-
 	switch (attr) {
 	case hwmon_temp_max_alarm:
 		err = regmap_read(regmap, TMP464_THERM_STATUS_REG, &regval);
@@ -172,26 +172,27 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
 		 * complete. That means we have to cache the value internally
 		 * for one measurement cycle and report the cached value.
 		 */
+		mutex_lock(&data->update_lock);
 		if (!data->valid || time_after(jiffies, data->last_updated +
 					       msecs_to_jiffies(data->update_interval))) {
 			err = regmap_read(regmap, TMP464_REMOTE_OPEN_REG, &regval);
 			if (err < 0)
-				break;
+				goto unlock;
 			data->open_reg = regval;
 			data->last_updated = jiffies;
 			data->valid = true;
 		}
 		*val = !!(data->open_reg & BIT(channel + 7));
+unlock:
+		mutex_unlock(&data->update_lock);
 		break;
 	case hwmon_temp_max_hyst:
-		err = regmap_read(regmap, TMP464_THERM_LIMIT[channel], &regval);
+		regs[0] = TMP464_THERM_LIMIT[channel];
+		regs[1] = TMP464_TEMP_HYST_REG;
+		err = regmap_multi_reg_read(regmap, regs, regvals, 2);
 		if (err < 0)
 			break;
-		err = regmap_read(regmap, TMP464_TEMP_HYST_REG, &regval2);
-		if (err < 0)
-			break;
-		regval -= regval2;
-		*val = temp_from_reg(regval);
+		*val = temp_from_reg(regvals[0] - regvals[1]);
 		break;
 	case hwmon_temp_max:
 		err = regmap_read(regmap, TMP464_THERM_LIMIT[channel], &regval);
@@ -200,14 +201,12 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
 		*val = temp_from_reg(regval);
 		break;
 	case hwmon_temp_crit_hyst:
-		err = regmap_read(regmap, TMP464_THERM2_LIMIT[channel], &regval);
+		regs[0] = TMP464_THERM2_LIMIT[channel];
+		regs[1] = TMP464_TEMP_HYST_REG;
+		err = regmap_multi_reg_read(regmap, regs, regvals, 2);
 		if (err < 0)
 			break;
-		err = regmap_read(regmap, TMP464_TEMP_HYST_REG, &regval2);
-		if (err < 0)
-			break;
-		regval -= regval2;
-		*val = temp_from_reg(regval);
+		*val = temp_from_reg(regvals[0] - regvals[1]);
 		break;
 	case hwmon_temp_crit:
 		err = regmap_read(regmap, TMP464_THERM2_LIMIT[channel], &regval);
@@ -239,8 +238,6 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
 		break;
 	}
 
-	mutex_unlock(&data->update_lock);
-
 	return err;
 }
 
-- 
2.39.2

