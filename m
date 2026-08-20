Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81842446826
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231420; cv=none; b=V78ug1vejediG90mnZPZ+B7lB8NrsAB8Zji+log5BWXhO6B8IYim+VxUkrGY2TiRDvdsKwCuoGTwHCf6fwYlvFrYL1zsNFrfV174BTtvJFhC46um2MwsYKOgyGKZ6yUkPOK7hvekbUpXua/XZ9WiMafjZjJELoLaWgIBDlcOd/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231420; c=relaxed/simple;
	bh=taGfuHStS0ThjG6UJrCo4jVzDX9qbsj9mHxTnwiiLkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pF9sutu+0GfRdON7dwljBv1Btgx+TlEk5VjzJ1rb4JksoY4VUffyaXovUs125OAeeoj3a99xwfHhkyqmHI3XboFU+hitE2/xz9lXgiOaCI2OGnIFH02CZwkiBb47+1A6x+rho7E55tI21YSiGP/wQlBaQiR9RAOX+sm5Qnr9ryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVFJO9dz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nWGGfOZS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVFJO9dz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nWGGfOZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787231417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yx44r2tBFVRVz1CszXpLBOBK3iXDrxNQXxexA2NClh0=;
	b=jVFJO9dzxrpM1S4kWajVpatj5BagMEkgXHnAdd24NIjcWWEPp53GVO6lMVU9Gu5SsYK2dM
	G8HWbJpjlJ6kDKTBT0LXc/L4YHEgXJ/VN6QxzwXxy8Zo5ulgDvmNuIRh/jLOVLwb4//xAf
	uyCANxYviObA5FlJBWj/bNc2HF+e9G4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-yA0IVkxROD-DWgvGNu8JMA-1; Thu, 20 Aug 2026 09:10:03 -0400
X-MC-Unique: yA0IVkxROD-DWgvGNu8JMA-1
X-Mimecast-MFC-AGG-ID: yA0IVkxROD-DWgvGNu8JMA_1787231402
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9368f2b7b2bso235052885a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787231402; x=1787836202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx44r2tBFVRVz1CszXpLBOBK3iXDrxNQXxexA2NClh0=;
        b=nWGGfOZSuPBWtrYPhQtrp/5VMYGUFr4QgimFJfE84AnrU0a3kNFuzrr4awF69/UJXZ
         03k8RmRvyoImcwlW6U34MhzbGrcUPTBIj0q/SP6MP2IQoUEZm8dWJZMWOWRW010Fny/1
         56VltcSpKylKF4WXa9Z1QG5Nnuoj22gbRzkTBvUTH2pOmvVgBULglmb/jbyWqTE1F0sw
         P1co+dMT8u4lVJSkGK/gz3S4Me6lWH+CoiOuoR2dfKUfOs9TDyxQkjDFraroIt/S9QKt
         J130BkU1BhT3l87sLWY0lO4aygOLMmlZH0lrkZyypZ9hVH/Ib/U98udYj+QfZkQDSaug
         ezvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231402; x=1787836202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx44r2tBFVRVz1CszXpLBOBK3iXDrxNQXxexA2NClh0=;
        b=jal57UrwfBahZADik0Nd9IJq0IhQdiDsEjE0OxuSxT67ovJ9T0LqcXlzRS9UjcSZMe
         ZtjuXbZZOQn1zDI+Hrwkb1VpqLo8JH55FgVbxh8U//uBkCUn9oZbYDPHvbN52Jtk4jP8
         SMAkHPnUoFMVuhzl1p641cBvS7DmB2Y63AeEx6gOJOBUZ5WxnOVdSiWObUuqY7SvSYiy
         xCU5TpGyMKW9rZ4MTcDrRvI/oBdoqVfJ5qbTZqN41rzb3A3RdyEAvuDCbYbZasjEzxYv
         4+4n4i02fvafRVPGw2TvObcbh0U5gfBs7U5QyGjG8ccIId7Btra4QzA1f+PNpeYkahhk
         9j3g==
X-Gm-Message-State: AOJu0YzFhT5gYjN8i6c+2tvVwRnlFoo1K3akqnMgQ+bpiiI6ldKF/35u
	nIvaXeAbjbzUBj7j3/Uvvc+l1DzE9VIzPc/hKn7mB2t6NZkXSAHfjrRgY6Vjo3g6OejuLwVOst6
	9z9X9v+hyjfN/CNCjD4Jdpbl4uOZnN3oHOfJJp3NM/pOmyHL6gv5qeizpY9HBi9sC
X-Gm-Gg: AR+sD126XibmooNUKfCvN/vlUJBjXJbrGCpN+LOnCRr6xS639ZyrYz0s5nTLBg2mmLB
	n8WzYOsbWmSHToLp8zUi2OYeCqHTCeGCP+eeVLPay9eId+x1nc5V0iyi+T+etqA4bSEFvm+JPyj
	bAnAoUGjj850TqQyzitwK6A1SJ5jfJY8KCmmuNaQZCv/BrDZtlPNvzF0ouIXbttNKCHyz6YilGN
	ckdMZ5xfHiIJ3NTYegdvfMQ/JZ8O/tBsIPJApXEjFBIFfkCETj3ij36lMXF1BkZryi3IAtpKbp3
	FdMvCRe6jDkuSCgw+QLrN17GepZfPmDIemOSuTebEmS+6Wy2wne8PDv8q1DKayneefTKNw3+ZjD
	FIcNIQpKXaJDDKUKTazZEVZFA082rdZuU
X-Received: by 2002:a05:620a:4054:b0:930:adac:1e99 with SMTP id af79cd13be357-9371e43fc62mr1112275185a.38.1787231401769;
        Thu, 20 Aug 2026 06:10:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:930:adac:1e99 with SMTP id af79cd13be357-9371e43fc62mr1112266385a.38.1787231401144;
        Thu, 20 Aug 2026 06:10:01 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204ba087sm364217985a.21.2026.08.20.06.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:10:00 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Thu, 20 Aug 2026 06:09:22 -0700
Subject: [PATCH v2 2/4] hwmon: (ina2xx) Parameterize ina2xx_data in
 ina226_alert_read()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-2-fdce35abc41e@redhat.com>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lothar Felten <lothar.felten@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787231395; l=2501;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=taGfuHStS0ThjG6UJrCo4jVzDX9qbsj9mHxTnwiiLkw=;
 b=cGM+XryZWLP3Uv7Q5l/8S2Gp1A+um9S4xRHcHYauOb62udkecJWctaHXat89w+qsiijJOIVFg
 1U/N2luR3obBIhb2TUYXWLjMLQAOa8LIwoXshk7fM02MGlM1GXgUAif
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

Mirror ina226_alert_limit_read/write and use struct ina2xx_data instead
of struct regmap in ina226_alert_read's parameters.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/hwmon/ina2xx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index f6c63ce1ef193..c56e42432673f 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -476,12 +476,12 @@ static int ina2xx_chip_read(struct device *dev, u32 attr, long *val)
 	return 0;
 }
 
-static int ina226_alert_read(struct regmap *regmap, u32 mask, long *val)
+static int ina226_alert_read(struct ina2xx_data *data, u32 mask, long *val)
 {
 	unsigned int regval;
 	int ret;
 
-	ret = regmap_read_bypassed(regmap, INA226_MASK_ENABLE, &regval);
+	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		return ret;
 
@@ -516,9 +516,9 @@ static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long *val)
 		return ina226_alert_limit_read(data, over_voltage_mask,
 					       voltage_reg, val);
 	case hwmon_in_lcrit_alarm:
-		return ina226_alert_read(regmap, under_voltage_mask, val);
+		return ina226_alert_read(data, under_voltage_mask, val);
 	case hwmon_in_crit_alarm:
-		return ina226_alert_read(regmap, over_voltage_mask, val);
+		return ina226_alert_read(data, over_voltage_mask, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -573,7 +573,7 @@ static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
 		return ina226_alert_limit_read(data, INA226_POWER_OVER_LIMIT_MASK,
 					       INA2XX_POWER, val);
 	case hwmon_power_crit_alarm:
-		return ina226_alert_read(data->regmap, INA226_POWER_OVER_LIMIT_MASK, val);
+		return ina226_alert_read(data, INA226_POWER_OVER_LIMIT_MASK, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -615,9 +615,9 @@ static int ina2xx_curr_read(struct device *dev, u32 attr, long *val)
 		return ina226_alert_limit_read(data, INA226_SHUNT_OVER_VOLTAGE_MASK,
 					       INA2XX_CURRENT, val);
 	case hwmon_curr_lcrit_alarm:
-		return ina226_alert_read(regmap, INA226_SHUNT_UNDER_VOLTAGE_MASK, val);
+		return ina226_alert_read(data, INA226_SHUNT_UNDER_VOLTAGE_MASK, val);
 	case hwmon_curr_crit_alarm:
-		return ina226_alert_read(regmap, INA226_SHUNT_OVER_VOLTAGE_MASK, val);
+		return ina226_alert_read(data, INA226_SHUNT_OVER_VOLTAGE_MASK, val);
 	default:
 		return -EOPNOTSUPP;
 	}

-- 
2.55.0

