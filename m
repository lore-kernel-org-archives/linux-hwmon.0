Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908D455182
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339785; cv=none; b=C+ghHfhhhBMJCkjrdQyYllS5XsnolMk/yH4lv60Xw42fZTF8ubuovvLAtCsFyUDNLqjRd4SQagXGpsh1Dnevr0NBpT2VEiD8gwjJK/iXYJwI8EU9wmYJAlyPkOb7QS0wwR1VNHwlKt8oWutmwwfsaI1mKzMxQTDVCs4d0PIr+lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339785; c=relaxed/simple;
	bh=Ph/cH8Z1IJ0+nf0pF+vlXWzWVk4z2Rt+4OmGq12AxcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZL8jG+Y6jUoy+gTmMCD2zq191V0qGaQwqI5SZZhWYA0rJU61XFDKG9gba3Uhvpv3c3NWq8bmQQuubu9baZyh5WzjJGWxu1FoGqoNQSZZlk3+SWvoNinCG7cttVWmS0yywKLayqQKGsAFHylppISSRyioti/rXel0gXn2UtiH6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aqN+mSnk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I5btUSfX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aqN+mSnk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I5btUSfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785339783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HzuDlUDQxyQVgFGB6JjQUaBAKCFH6aDQTyKHFBmQvk=;
	b=aqN+mSnkKMNRTLz16sGSVA3Z+c/oyb8vbKjCdf8RANnZmAbTkgOE1lyfwKqQI3d1dbX6C/
	vv/HLU+b7s6eR6NmAVMHAMnBNr3okZh93CjVmyv095snsp+H95xnpipy3fIuYzZfuBqbY5
	uZmEbz0t8V4I/h1n9esMUHO2TCSFbzE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-AnyaQs8bMZy1O0-cCdDzig-1; Wed, 29 Jul 2026 11:43:01 -0400
X-MC-Unique: AnyaQs8bMZy1O0-cCdDzig-1
X-Mimecast-MFC-AGG-ID: AnyaQs8bMZy1O0-cCdDzig_1785339781
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so13030921cf.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785339781; x=1785944581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HzuDlUDQxyQVgFGB6JjQUaBAKCFH6aDQTyKHFBmQvk=;
        b=I5btUSfXDGpHYLvn4N5siROrXFPdhikTWzfocK/GTnzPSYKLq300Ujs8qtxRcuy08f
         u8YudNZ0BVAYUVsDhze0JictvoKrQP+NAixxkhWV055zg43bbeyVIhMgHGdlnzJf31gh
         agfcudEB+NUtTtLJvn8BXr1Ek0Lk5zS3Ugy7ylGllWNcNf42CbUh6LkQafNC0yG+wVtJ
         py5VsdwlMc7OMT6lYqrNgFfuzhPZHfyTQ3TlMwYT6HttrP3Tst2hIiH5MNn6JIjDCWil
         Imi28y6BF65VIgwQ9T+nSmu5UTIw+K5wVf+CNW8M3HkROsLNouhhX6JmgBv0E5RI2hLH
         sMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339781; x=1785944581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HzuDlUDQxyQVgFGB6JjQUaBAKCFH6aDQTyKHFBmQvk=;
        b=SFLHSqBNKAxBzivObyJgoA+vRyhx5SrPKFy4ROgpm5h/MrE3/dA6Ca5NfISWpVTCTV
         eV+WEHFVXiPnXeGBCa4qrTGdN/08a3dfMP/RzYGGP+VDH5l6abfWN/HzHAAb3fQ/Krig
         oWmkOSMZXqu4VMbE3+MUsab7VOYbtXovKWjZQy4PyuplsGvK7U6EOgNHg32RdiDnHp4U
         6jCbq6tRA+VzQgjzgLgYKgZGQ131UHXHPqGHHSuufpJEGDxu09W91NQg1M/eh7/YDcj4
         FnganEaWp1HMT91R2kpblo0kFDD2zUdVTb4ApNCAhfLXLPDZhP1v0egaPP0DYhMKn+oB
         iMQg==
X-Gm-Message-State: AOJu0YwpRsWPcLjHyryRSzdnhI3Ciom0g4e/8nJ1+wAHnh8f48rGYM/t
	4qBtKfnZ1gVOQfIRhxNlr83iKLZ6L74AtvkRwEpMFaBPFuev36a1dq1w3eNhedc4VNwbe7J06Q3
	RzG2fBoQpR5q9nybIEc9sa3/RcqA8GUMDf0q+G+5Fl665heVJECf4gswhiOa4r7GVkweK0HcxUc
	USHc98l++GJBYnPf1LC/ItStN+1Jdip8BKEQTpNsGDQXwIC8M=
X-Gm-Gg: AR+sD12gGCX48zVKk3XN13gvce6hJ3vbLYO9plE7ro5GJd7PcoPRtIfRCwvQE7MYKA3
	LPN/SANrYuYlLmVDKw1rKP2FezlXrEafVL/01BK8da/vJIz8OSi567y88M0QtboePrtlcIMuoEZ
	sPaJk+xHwX3vuwg8Wwap2/mfNY381tCtaA0tyHlyszKUVx6WIrO89tB0DyJa/+2Uwu99zuOK/zT
	4HWjBj9zWg+PYoAPtLi5pLyxe7RufNgC0uW93fywuymz63TULyE24+x/ZTafAPWlNsvQxQQnJKs
	zq2x14er4B8PudSTO6c3Io3sJXtYcUJZ5D38J2sI16Z5GpO6E7vdKH3W6lLG6at69X6WwUIMk3n
	Uipoo/h5lsjPtKnij0Kv/6tvMyRrBMRUx
X-Received: by 2002:a05:622a:13d0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-529d7169fa3mr69254641cf.39.1785339780611;
        Wed, 29 Jul 2026 08:43:00 -0700 (PDT)
X-Received: by 2002:a05:622a:13d0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-529d7169fa3mr69254151cf.39.1785339779910;
        Wed, 29 Jul 2026 08:42:59 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2efcb4esm20749871cf.26.2026.07.29.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:42:59 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Wed, 29 Jul 2026 08:42:35 -0700
Subject: [PATCH 1/4] hwmon: (ina2xx) Replace regmap in ina226_alert_read()
 with ina2xx_data
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-1-349f7b2f1df8@redhat.com>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785339776; l=2500;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=Ph/cH8Z1IJ0+nf0pF+vlXWzWVk4z2Rt+4OmGq12AxcU=;
 b=2V3rx+8lP5NxYiXkxLLVwlO8dE5PTOncEV5IMTy+J8oTogG/vUQ36TVfp1vNMwiPdmsW+Xge6
 7lP8Xrd1AQBA8Oukv5aDilu4c6lG/OAqiOGB9b3plXHldMPSdX2NSoB
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

Accept a struct ina2xx_data instead of a struct regmap in
ina226_alert_read() to mirror ina226_alert_limit_{read,write}().

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/hwmon/ina2xx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index c4742e84b999d..911bf32e8f215 100644
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

