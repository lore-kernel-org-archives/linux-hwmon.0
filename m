Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F1A7E573
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Apr 2024 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714140820; cv=none; b=A7Xl6qcnfdfQol3eYEQiA2ni6gVIBeEQNvejyux7boBZUtdwdZlbZwNpzQ+pOS3QkCyzbVYDLgGZdWtBhSzCWogUYUi4vp7CCQpst2YuzewSoddzhBgpycYzYT42p0cu5EiCozV8w4SlM54fOmS5B4566mgM5yfcI2q8W+1Vb3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714140820; c=relaxed/simple;
	bh=3ssD+OIWsS3gT7i7OGgIKKBT1w0YvCt3AYbj+YHJiNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knCLg6WP/FxzdjfUiRenVhzENFg27UQ51c2C30uPF1p7htp4mXwehMU82obmaHFJnN20OhyIP4+A4WdO91jZz9kcTDo9sLHLeVOJG8GEx/LVJwhUkUFuc4s0Hs+B/KGzw6ZikghPDlgE/aEvh7CpmGOojSwMJ2W0fYogUz5n3ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKLD9Tta; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKLD9Tta"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so34055731fa.2
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Apr 2024 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714140817; x=1714745617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aBlLT6SsWXkh754ZOvifeyHIKGFWMXp1KynZMhFNmJc=;
        b=EKLD9TtaW2qC9kf8rwt1oRjRRoJ4q4heG0p8o09dAsbNYNnCKxDLcuZng0Gf4Afv4V
         aNUbw2uC59BEuYSvYnS7dCk1wn1ukUpMv9gJA+8yYjeiipbFcdGsItkWdEB03GSn7+K2
         uXqyKRbcFVpZqTS1Kn7UCrYxpmbU0JtrJWrZmx/lj111cuT7QMKch3AHueK9qtTS3Oun
         VnHU+XfDqE26VhNI+5vjMnYD27iR+2+IVSxlItmIF2GhGC7w/ffIDaN4kCk45X/gtGaJ
         gzq32CHOL/DFOCeG+BHPgxQ2P/3RntXwllbY9WBxKBMh37OSfZRyPt84AL39na8zi0eX
         e5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714140817; x=1714745617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBlLT6SsWXkh754ZOvifeyHIKGFWMXp1KynZMhFNmJc=;
        b=MQ8Gg53XfxZ3eCyaQdqzv5AGBTgHWNZJJZx9r8b7CHQ0XIK2h/VpReg5f8pOKijBIY
         B8jBCfcUq2p2tJl+PsdGCQRhqCk9/H8+OlgDxOUtqFPxHSzP9ou2eewwJKVyn3A89mkU
         B0HBfZX8nzmNver7c++lPidUx6lohL70L4mNZWIZR+cUyC1xgIp3Wzjho5lxx2xsNScg
         JNp4eI/0mCIVqPZA1thHz/dH60Ibe5GH4nDIgWNtywnP4sPCfdNWpJQkZC5e6mKM3OJ2
         oNy6coAnHKibkyKVV//+nSa0RAQTJfZPnlyTrXy97z88EKIxeXcvDNOl5Qb1NRxZ7o8W
         DqTg==
X-Forwarded-Encrypted: i=1; AJvYcCUbFGoS7RVwkRmjTDGmNvYPvA0wgRXr7+cAtz1G4ie5eVhPJVPk5YhMCEh+s8SpGQcpx2Xm7k0yJZqPPwPZKyY2vXM3QlgKy6eKpIg=
X-Gm-Message-State: AOJu0YzaMztmO2iYyMMgZW83eBxMGNG6C9mLKkcT3dLbywjvvxttcZ/o
	Iw4TFuuLoUvIRis1oS/3ohvysjhRr0N2HfW/2k1caK4sFKOOcDGA
X-Google-Smtp-Source: AGHT+IGkRFJ96ico3q2+VfiKET2yFUt4tBT1biFvBpPYLGTZ8IB4r1eA0UQOTDyiS+A00Zb/JHCKLQ==
X-Received: by 2002:a05:651c:230c:b0:2d8:6ca7:2165 with SMTP id bi12-20020a05651c230c00b002d86ca72165mr2080335ljb.46.1714140816545;
        Fri, 26 Apr 2024 07:13:36 -0700 (PDT)
Received: from lpm-pc.appeartv.lan (195-159-183-44.customer.powertech.no. [195.159.183.44])
        by smtp.gmail.com with ESMTPSA id e1-20020a2e9301000000b002de118decbbsm1144089ljh.53.2024.04.26.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 07:13:36 -0700 (PDT)
From: Lars Petter Mostad <larspm@gmail.com>
X-Google-Original-From: Lars Petter Mostad <lars.petter.mostad@appear.net>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: [PATCH] hwmon: (emc1403) Decode fractional temperatures.
Date: Fri, 26 Apr 2024 16:13:22 +0200
Message-ID: <20240426141322.609642-1-lars.petter.mostad@appear.net>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Decode all diode data low byte registers.

Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
---
 drivers/hwmon/emc1403.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index d370efd6f986..2b14db802f96 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -37,13 +37,43 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 {
 	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
 	struct thermal_data *data = dev_get_drvdata(dev);
-	unsigned int val;
+	unsigned int val, val_lowbyte;
 	int retval;
+	int idx_lowbyte;
+
+	switch (sda->index) {
+	case 0x00:
+		idx_lowbyte = 0x29;
+		break;
+	case 0x01:
+		idx_lowbyte = 0x10;
+		break;
+	case 0x23:
+	case 0x2a:
+	case 0x41:
+	case 0x43:
+	case 0x45:
+	case 0x47:
+		idx_lowbyte = sda->index + 1;
+		break;
+	default:
+		idx_lowbyte = 0;
+	}
 
 	retval = regmap_read(data->regmap, sda->index, &val);
 	if (retval < 0)
 		return retval;
-	return sprintf(buf, "%d000\n", val);
+
+	if (idx_lowbyte) {
+		retval = regmap_read(data->regmap, idx_lowbyte, &val_lowbyte);
+		if (retval < 0)
+			val_lowbyte = 0;
+	} else {
+		val_lowbyte = 0;
+	}
+
+	return sprintf(buf, "%d\n",
+		       (((val << 8) | val_lowbyte) * (u32)1000) >> 8);
 }
 
 static ssize_t bit_show(struct device *dev, struct device_attribute *attr,

base-commit: e723f6ca39fb54ae31f79b5af74fe8496308d4de
-- 
2.44.0

