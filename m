Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762844471A
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231410; cv=none; b=T4b3OZFaJdN9FEiqkK2VH2dhC1nYwqcxOawvY61WVVdedSXTw0677rOjbBFQGLfbycLdI0TNXt/i1TVSu0g8VnzDP252ACBHPvfALLxVLS2EioiHcf5Ub2aTpBSuWkZqYrlOulDgcTlKLTLcN5O3NcbfcngWlOKfCg4twQnPrPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231410; c=relaxed/simple;
	bh=vgQfvi+yC13NqVyawNzNE70kFPEC4ei33oSh78KY4r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4BlwnGN9kTV/pW+UtrvcS/YFwNz4tV6YTUGsr61PQSzMJXyqt6rkdmyIEX4lsgL1M768ZgIw10V1Fcia250amS/qzHKUOA3BtCyPHNLkiyFerqO3ewTmSDLB6yD67lxlU0xIV4Zc6HegG9ADWS6X7KanjfgVDfbOgfzYILWy1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NHXu+L8p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YFOKkunZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NHXu+L8p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YFOKkunZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787231407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lINEEJ3xppDZS4I+PwwVsfMXDswly1pvwvp6jcZunJ0=;
	b=NHXu+L8pxdQIun+bNTuwMnefMDQWJszOs4f0oI95JFuICl1kIm8twHFGCqcjqCO1yOQqWM
	0VlefgdIHtEEU7u6p2+tHQ7v77qMvD6LXUhjKUCCx/1GdalE/HZXhEYwW1OdBnJHhhPSwN
	WE4SNnR05UZSixQuX6QLKt5RH9hIx2o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-HG3q3t2NPN6X_905slPqsg-1; Thu, 20 Aug 2026 09:10:05 -0400
X-MC-Unique: HG3q3t2NPN6X_905slPqsg-1
X-Mimecast-MFC-AGG-ID: HG3q3t2NPN6X_905slPqsg_1787231405
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936d067836eso266128485a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787231405; x=1787836205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lINEEJ3xppDZS4I+PwwVsfMXDswly1pvwvp6jcZunJ0=;
        b=YFOKkunZEecQt4yJKEdusdieGlHqvHir3fUvHQAGIUjmjviNgzrhkFilQS/scq46CX
         68e736XB5e20vYc1qLCX5Tm9kDvk/IkMp1HtLZ+DQhB0k9XWmRgxVsBZUPDZKCh4GG94
         l51HySjgFXiHvD8pyi1M80aAFB1/IaQRJ/2hmHwrsPRQweyn9f+4zPkXwKYPt54p3aRf
         nL6y4a9tMlZ53WD8ZUVi+lZbYZB000N1d8nSSAdZFRSSX1/9bqj4S4qqdQt64ImbZBfU
         sPs4PqPUF1uXjYzv1ginMSTHTr+k1cCYlfJBWuPQi6erPvRCvmGD8D0uvuazfKEVh+d8
         a6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231405; x=1787836205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lINEEJ3xppDZS4I+PwwVsfMXDswly1pvwvp6jcZunJ0=;
        b=nroqlZYOuiruDHEyhzQgkWcKWkbh9V5merUdxIfFofubtgrNAR9CxuOplSZ90zKl6J
         EmDzcfVXZLqpZ81TpRN4vTEHmzMr8kHo4mBsGxnpEsdlu5Xfi9x17WFalhexTKC9RQDc
         Ci9lAQGEsskiG05i3qjAz38tOLl4Kru/iECug23pZWApuSuiXZT7adL49AMwVul4MA/5
         cwTuyuQ4YcnslL4VePLveN1zBEAmWPVcJQkR8HZvC+Ai3ZobAnDTo/xLc7wleAwrDwK2
         tXjQVMCVAXh1Lt3VSglPl7aSqR0zaO72SkYwWQ9vZ38f35gWDUGqyIaWwxph3FwOjIac
         /2qA==
X-Gm-Message-State: AOJu0YyEQHg/Zg2jLA/pYhcT1dlmcf8s+aCiMrLiQBRDSpc5srEX9v9B
	lBlI4/zAFz310cCakrtmsM9RgQEmcQvtemmF+Kfyq+1H1Wf8mQiJzJsOnbcbqhey/J6A8FsukCc
	BNN2RY5PRLHz7nkk4sruyI6q/IblccsLS4cDc4ik1BINupOBBYignhdcxd5foNggT
X-Gm-Gg: AR+sD12G1UznRfClc4xxNoVWBF0E5aLCEjfDA+KCUjNXyIfHVy9KOPAOukHKmfJHLIq
	LtqvtFqxxVM6ADU94rYolyZ80DN1dM1Ut/aKJYkt6isAb/+fkVY91fUf1aE8JtzpXLMUUkilfUw
	S9VbsbSKi8x/Qy5XJHjIwg6kGnueYM0xQq5Ab+oeW/AdPZf/y798HJgDCBD0EZMYl+Zm/o24khv
	M6keUcDpWzJA/6k6+wBiiODSeO9mWOMo5M8Z7cGnuyDTX1pdy8gNYmC8sOWqxd+1d6VStZTa5sK
	8pLMskirswBqh2U3W1f1wB5B/6zfqc6pxfbfwYV3mqoMNe/3EUewytQRuzI1FlHSf9rcz7pS8XN
	PGDs5QsS3fQT/W/07jkovV89Vo6uuaJat
X-Received: by 2002:a05:620a:28d3:b0:92e:4bc9:6ea9 with SMTP id af79cd13be357-9371e11093bmr1084088485a.0.1787231404982;
        Thu, 20 Aug 2026 06:10:04 -0700 (PDT)
X-Received: by 2002:a05:620a:28d3:b0:92e:4bc9:6ea9 with SMTP id af79cd13be357-9371e11093bmr1084077685a.0.1787231404459;
        Thu, 20 Aug 2026 06:10:04 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204ba087sm364217985a.21.2026.08.20.06.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:10:04 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Thu, 20 Aug 2026 06:09:24 -0700
Subject: [PATCH v2 4/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-4-fdce35abc41e@redhat.com>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lothar Felten <lothar.felten@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787231395; l=6599;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=vgQfvi+yC13NqVyawNzNE70kFPEC4ei33oSh78KY4r8=;
 b=vjhFRJgs5WRVjw6P7wcx/TldbJCkzsiNByLYu6BKRt6JKlqANd0OIY2M30a8U6yx3HuprgsHp
 +N/LbC3udRPAq9onzuhRXZqzn7QAMQI7rbl1PIdgyIoF7aVgZqpX3LM
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

INA2XX current limits are converted into shunt voltage limits internally
using the shunt resistor value. Once a current limit's corresponding
voltage limit is written to the hardware, shunt voltage and current
alarms are indistinguishable from each other.

This causes two issues:

1. in0/curr1 alarms may be unintentionally cleared by reading from the
   opposite input's alarm.

2. When a limit for either in0 (shunt voltage) or curr1 (current) is
   set, both of their alarms are triggered, and both of their limits
   read nonzero.

An example of this behavior on an INA231:

        # cd /sys/class/hwmon/hwmon0
        # head {curr1,in0}_input
        ==> curr1_input <==
        1713

        ==> in0_input <==
        2
        # echo 1800 >curr1_lcrit
        # head {curr1,in0}_lcrit_alarm
        ==> curr1_lcrit_alarm <==
        1

        ==> in0_lcrit_alarm <==
        0
        # head {in0,curr1}_lcrit_alarm
        ==> in0_lcrit_alarm <==
        1

        ==> curr1_lcrit_alarm <==
        0
        # head {in0,curr1}_lcrit_alarm
        ==> in0_lcrit_alarm <==
        1

        ==> curr1_lcrit_alarm <==
        1

This is because curr1 uses the same underlying masks
(INA226_SHUNT_*_VOLTAGE_MASK) as in0 on the hardware. As a result,
ina2xx_{curr,in}_read() both read the shunt voltage alarms/limits
without considering whether the voltage or current is currently set.

To fix this, track the active alarm type in ina2xx_data and guard
alarm/limit reads with a check that returns zero if the active alarm is
for a different type. The new field is initialized based on the
MASK_ENABLE register's set function, assuming voltage instead of current
when the shunt voltage mask is set.

After this fix, the alarms only read back 1 if their corresponding limit
is set:

        # echo 0 >curr1_lcrit
        # head {curr1,in0}_lcrit_alarm
        ==> curr1_lcrit_alarm <==
        0

        ==> in0_lcrit_alarm <==
        0
        # echo 9999 >curr1_lcrit
        # head {curr1,in0}_lcrit_alarm
        ==> curr1_lcrit_alarm <==
        1

        ==> in0_lcrit_alarm <==
        0
        # echo 9999 >in0_lcrit
        # head {curr1,in0}_lcrit_alarm
        ==> curr1_lcrit_alarm <==
        0

        ==> in0_lcrit_alarm <==
        1

Fixes: 4d5c2d986757 ("hwmon: (ina2xx) Add support for current limits")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/hwmon/ina2xx.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 74c4e3795ac4d..7e5b412ff47f2 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -157,6 +158,7 @@ struct ina2xx_data {
 	const struct ina2xx_config *config;
 	enum ina2xx_ids chip;
 
+	enum ina2xx_alert_type active_alert;
 	long rshunt;
 	long current_lsb_uA;
 	long power_lsb_uW;
@@ -441,6 +443,35 @@ static u32 ina2xx_alert_type_to_mask(enum ina2xx_alert_type alert)
 	}
 }
 
+static enum ina2xx_alert_type ina2xx_mask_to_alert_type(u32 mask)
+{
+	int top_bit = fls(mask & INA226_ALERT_CONFIG_MASK);
+
+	if (!top_bit)
+		return INA2XX_ALERT_NONE;
+
+	/*
+	 * Multiple bits may be set, with the highest-set function taking
+	 * precedence according to the datasheet. Shunt voltage masks are
+	 * assumed to map to voltage monitoring rather than current monitoring,
+	 * since the latter isn't directly implemented in the hardware.
+	 */
+	switch (BIT(top_bit - 1)) {
+	case INA226_SHUNT_OVER_VOLTAGE_MASK:
+		return INA2XX_ALERT_SHUNT_VOLTAGE_HIGH;
+	case INA226_SHUNT_UNDER_VOLTAGE_MASK:
+		return INA2XX_ALERT_SHUNT_VOLTAGE_LOW;
+	case INA226_BUS_OVER_VOLTAGE_MASK:
+		return INA2XX_ALERT_BUS_VOLTAGE_HIGH;
+	case INA226_BUS_UNDER_VOLTAGE_MASK:
+		return INA2XX_ALERT_BUS_VOLTAGE_LOW;
+	case INA226_POWER_OVER_LIMIT_MASK:
+		return INA2XX_ALERT_POWER_HIGH;
+	default:
+		return INA2XX_ALERT_NONE;
+	}
+}
+
 static int ina226_alert_limit_read(struct ina2xx_data *data, enum ina2xx_alert_type alert,
 				   int reg, long *val)
 {
@@ -449,6 +480,12 @@ static int ina226_alert_limit_read(struct ina2xx_data *data, enum ina2xx_alert_t
 	u32 mask;
 	int ret;
 
+	/* Avoid nonzero reads from inactive alerts caused by shared limit register */
+	if (data->active_alert != alert) {
+		*val = 0;
+		return 0;
+	}
+
 	ret = regmap_read(regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		return ret;
@@ -484,6 +521,7 @@ static int ina226_alert_limit_write(struct ina2xx_data *data, enum ina2xx_alert_
 				 INA226_ALERT_CONFIG_MASK, 0);
 	if (ret < 0)
 		return ret;
+	data->active_alert = INA2XX_ALERT_NONE;
 
 	ret = regmap_write(regmap, INA226_ALERT_LIMIT,
 			   ina226_alert_to_reg(data, reg, val));
@@ -492,9 +530,13 @@ static int ina226_alert_limit_write(struct ina2xx_data *data, enum ina2xx_alert_
 
 	if (val) {
 		mask = ina2xx_alert_type_to_mask(alert);
-		return regmap_update_bits(regmap, INA226_MASK_ENABLE,
-					  INA226_ALERT_CONFIG_MASK, mask);
+		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
+					 INA226_ALERT_CONFIG_MASK, mask);
+		if (ret < 0)
+			return ret;
+		data->active_alert = alert;
 	}
+
 	return 0;
 }
 
@@ -524,6 +566,15 @@ static int ina226_alert_read(struct ina2xx_data *data, enum ina2xx_alert_type al
 	u32 mask;
 	int ret;
 
+	/*
+	 * With alert latching, reading alerts from hardware also clears the
+	 * alert, so return early if the alert is inactive.
+	 */
+	if (data->active_alert != alert) {
+		*val = 0;
+		return 0;
+	}
+
 	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		return ret;
@@ -964,6 +1015,16 @@ static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
 
 	if (data->config->has_alerts) {
 		bool active_high = device_property_read_bool(dev, "ti,alert-polarity-active-high");
+		unsigned int mask_enable;
+
+		/*
+		 * Infer active alert from MASK_ENABLE in case it's already
+		 * configured (e.g., by a past probe or firmware)
+		 */
+		ret = regmap_read(regmap, INA226_MASK_ENABLE, &mask_enable);
+		if (ret < 0)
+			return ret;
+		data->active_alert = ina2xx_mask_to_alert_type(mask_enable);
 
 		regmap_update_bits(regmap, INA226_MASK_ENABLE,
 				   INA226_ALERT_LATCH_ENABLE | INA226_ALERT_POLARITY,

-- 
2.55.0

