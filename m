Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187B3B059F
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339787; cv=none; b=MBEOnt4zYWQIptjX3dSyMyrEQkAMx6hMwgZKpRfRYwb7O8QBJ0ieCUk/hpBIKFihqteo0CAxaWKHB6NO7h/OmY0b/Dls7+8e5Cp9jfHx38dSL00TE6yJG4iobyhZXwjtxUDrh6MTj18XpUeNfHLdBLBtRuJ0w9MY0BMC45gkBWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339787; c=relaxed/simple;
	bh=XtZXPG7bymtdgQgOx/GQhGl9xDSyPBtOCz482SuvDwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaFSh1Utc69bFkTWYZ6xoBIIjjN1H1EoLZWv3grbDDK/rU1hPnhqr20ehXNpeioIwHoAETeo7OVges0jqyFqE6d1AGhWGQKgyWybxnrKrkz58JWlGCpM2ZaEgWBhh4K7OyyZHur7cW+BG7NkPj2q9zjGuLe/98laT/vGeb8bG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c9zIxd+v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ajk0T6ym; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c9zIxd+v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ajk0T6ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785339785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKXDihrygB2BiIlNcFAnThBbMbU5BFjDzTI2N2xrxkI=;
	b=c9zIxd+vQ6y2eEFp0jyHd6lTn3A14TFYf8/cPS2r3cwLP5rFGdz/+V3msW7dBjCdSzafNe
	tafPZTjk6D/hqcFOEzePvhXbKwEHu3sibl5AR94D7JRXGuFLIBY5vGc5SqvfZPzFq/6Pz0
	Z0PO+bWRZJ5yUiAmC2H8QMlLTGicBN4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-ZXwrqgOGOFq3ZK1EfNJN8A-1; Wed, 29 Jul 2026 11:43:04 -0400
X-MC-Unique: ZXwrqgOGOFq3ZK1EfNJN8A-1
X-Mimecast-MFC-AGG-ID: ZXwrqgOGOFq3ZK1EfNJN8A_1785339783
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so73961cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785339783; x=1785944583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKXDihrygB2BiIlNcFAnThBbMbU5BFjDzTI2N2xrxkI=;
        b=ajk0T6ymfuLctvnnaalXEoDgKfGXtqFM+CqS7xT0myhQz97nyyRRAARE54aFV39IBW
         mGWWAU0PM0cQCaV0Je7QWikN986/D4P7YyHhivum5fVGqG2kr4Jh5Iuw3AAOtYAtH8UO
         H2k0naxjOHYwF2YA5Y4FXMUm2POI0ZzRDhP8J6oC+QTXmhXjTZDIxH4KVV+nbTdB5uGd
         EZwzgcF6Aj5PFmyJn9QgfykAsb3SwpZRbbR5eX9wmBV/P64+qQeINHFqOh0njVTR4+Sc
         xo3bOffRuWsL4kcRcicXHwaQgPjcR1064rwZFjwJo/zmh0N482Bxn741L8A247/rwzMd
         xErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339783; x=1785944583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKXDihrygB2BiIlNcFAnThBbMbU5BFjDzTI2N2xrxkI=;
        b=JZmkLrZJlWb91Hyp0WQWJcYBqIgc7qaAKmSo/vtAGtYNvzz+YbZMoPp1X8RppVXA0p
         bEz/1FWFDlwv4RGUHvDDkABJ+lKNwRrPxQ6WBDr3DedSM4VIeTVGJllK+HjJC7YupySV
         U5mtxPw5i/fm2to4na5wUdGtXO8prsQTltffxjlnY5pYwbEZMgrQdXQVymT5I9jTDLWQ
         075npaMe4CrRGcjYf+jriP3KSdL0O/ctYzh/0AtgXGn8ci33JoUdW1YN+28hSs+8+00F
         G9yqgn55d2Jfx2q1kIT7bRWQRY/FPwZClT3goe+lvmqrq+fREtdz2AvVXyt8jsR0niGw
         Ehlw==
X-Gm-Message-State: AOJu0Yx1KZCVtiKr+7sPtIWj9xmXlk52IuTwLqu5JN/8OsPz32OXB1bn
	bt0sJnj0zKySPSUTRN0ATWC8ymNf/ghPjCLJCNQe5WncG2fUTTk3bZFfZx7lYwJwLFL1P2sqBZr
	QJCjBV0Jfv1v3sUNPSLx90TAi1dODesMWWIRM7+GgX+xQJ5Fmo8h+GJ47zqJkoN+M/wRg0S4Fub
	IdkiNEHsark6sn73+18WUIDTAafnNVtwloDnMmFfecc9K7EiQ=
X-Gm-Gg: AR+sD11m0nxRVI1XoqmbhhAoIlJ/y+sjd9otffAy3f5WoVuixdFoaLdL6yj1tjfDyiz
	w4B2onE4UEOjiLHo7YUxPX0iDh8WCkXDEQlxdY756gEx/zSpCA5c9LKnmN3gskxQqWxv6MA6wqR
	IEEAFT/bZQuRET5QhlYdU8NPkcm/xhXgNGlhsZoypJkD4RZUlJ2UTq0JEsvQugrPkvJDiFYa40B
	kllQYlLH1/Pgh6p+D3WQRJ3UiKXhQviWYHfAaZEiYVl0Rx16ITGcp9oikxSl94MYB6dGnhCY31a
	ZB7GXtLdTV9w5MbAf9q4rAzn0imFgb0YZxeycDcUc1L57vsp0TemV0DVY1lMVAK/rnK+WfbXVon
	SB9/D6RLaCepNIX+s65/RlHcfUiaeNq/5
X-Received: by 2002:a05:622a:47cf:b0:51b:9873:e37b with SMTP id d75a77b69052e-52b2ace9dc7mr20747741cf.9.1785339783377;
        Wed, 29 Jul 2026 08:43:03 -0700 (PDT)
X-Received: by 2002:a05:622a:47cf:b0:51b:9873:e37b with SMTP id d75a77b69052e-52b2ace9dc7mr20747411cf.9.1785339782874;
        Wed, 29 Jul 2026 08:43:02 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2efcb4esm20749871cf.26.2026.07.29.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:43:02 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Wed, 29 Jul 2026 08:42:37 -0700
Subject: [PATCH 3/4] hwmon: (ina2xx) Track active alarm in ina2xx_data
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-3-349f7b2f1df8@redhat.com>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785339776; l=3219;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=XtZXPG7bymtdgQgOx/GQhGl9xDSyPBtOCz482SuvDwU=;
 b=HdUekbBY/PLKNZIWz9zdVvuDstMuCCr6FHT1YAOd1gNKQAVCfl8A2qC8xvuxyDpdyVTojM+/g
 7q8wewgEGsuDrnZnMBiLPhsSIhnBQJGqXUPwFC7/eiuPIhyZBs8EvPR
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

INA2XX current limits are converted into shunt voltage limits internally
using the shunt resistor value. Once a current limit's corresponding
voltage limit is written to the hardware, shunt voltage and current
alarms are indistinguishable from each other.

To allow distinguishing current and shunt voltage alarms, track the
active alarm type in ina2xx_data. The new field is initialized based on
the MASK_ENABLE register's set function.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/hwmon/ina2xx.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index beb851d87f787..8ba0dce1f9e31 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -157,6 +157,7 @@ struct ina2xx_data {
 	const struct ina2xx_config *config;
 	enum ina2xx_ids chip;
 
+	enum ina2xx_alert_type active_alert;
 	long rshunt;
 	long current_lsb_uA;
 	long power_lsb_uW;
@@ -441,6 +442,35 @@ static u32 ina2xx_alert_type_to_mask(enum ina2xx_alert_type alert)
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
@@ -492,9 +522,13 @@ static int ina226_alert_limit_write(struct ina2xx_data *data, enum ina2xx_alert_
 
 	if (val) {
 		mask = ina2xx_alert_type_to_mask(alert);
-		return regmap_update_bits(regmap, INA226_MASK_ENABLE,
-					  INA226_ALERT_CONFIG_MASK, mask);
+		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
+					 INA226_ALERT_CONFIG_MASK, mask);
+		if (ret < 0)
+			return ret;
 	}
+
+	data->active_alert = val ? alert : INA2XX_ALERT_NONE;
 	return 0;
 }
 
@@ -960,6 +994,12 @@ static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
 
 	if (data->config->has_alerts) {
 		bool active_high = device_property_read_bool(dev, "ti,alert-polarity-active-high");
+		unsigned int mask_enable;
+
+		ret = regmap_read(regmap, INA226_MASK_ENABLE, &mask_enable);
+		if (ret < 0)
+			return ret;
+		data->active_alert = ina2xx_mask_to_alert_type(mask_enable);
 
 		regmap_update_bits(regmap, INA226_MASK_ENABLE,
 				   INA226_ALERT_LATCH_ENABLE | INA226_ALERT_POLARITY,

-- 
2.55.0

