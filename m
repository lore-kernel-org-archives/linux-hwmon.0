Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8566619BA6;
	Mon, 20 Jan 2025 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737390349; cv=none; b=RO6RuCK5Xojs5Vpa62lyAi3NmNAu78IB54ly4cjyw1snqext5g0vKsF4nC31h9aYF32ofI+4/1nsK7tnDGOpTy+UI9sgcanEdQv35FZKrlRZLPkgU4xM96yCICFEPLX97+hKKTymIyzh3cXSMd4i744IrNHMJI5JHoBIFOj9VbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737390349; c=relaxed/simple;
	bh=aeN28AYVvGJfT3SDJFpY5CFpl9UwKe2s1HqNf6NCsic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tzj1ifme7r4RtcJoB1eZ6hi0pIPDVXj5MtFB+7858lT3dkptbv221b8ZAnr2Mtm1kKTWVCO2+VR/ezeNWF7RFqppPWXH9B2g2YC+7CH1xniN+Vn/ULMYykSzLK2ZuP5+qpF8KPTUcSDhT8tbLLGbZL9YLaAPGhUON+KALgMIdjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0AdYzjQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0AdYzjQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21649a7bcdcso78620075ad.1;
        Mon, 20 Jan 2025 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737390347; x=1737995147; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0jgmE9LRjptehlEX3Cg21VFrq0vt9UDGxmv6nHqI0s=;
        b=I0AdYzjQTqsaymve8QOhT6OnMi5Rnh4xr6JOjtHVvhxeDgHUD7EOFpSOqpj+t80nhM
         Lz8Ptx6MWLu00O/ZUWn5arsbv7cjtoMRwk8+OY/EDYSed18UefWw1UronWTAuTXfUgto
         9UqrMM+1uQPtqULXQvi3Te2L0bDuwZED1pZ7ysFW//hEr6IXIwZjEmDZ5eKKGC13mbjv
         zW3ToXMtCONWfMQQ6kJ/ptrGNVkMtUZ5aqiwpldWOyLm5un6El3o1P7sIe4H2Yah+wGM
         QGFl/aq5Z6YbAyV2hpoze0NQE133oQf+VCJoBWAS031x1w6SB4rM3GUSnYl1v2vQvYQG
         PH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737390347; x=1737995147;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0jgmE9LRjptehlEX3Cg21VFrq0vt9UDGxmv6nHqI0s=;
        b=ddcv8YCE54jd4ylQzfueCxOVQkenjliRU4FRuTRUPfpbAnwFGcdn3C8OiAVLIqyrOS
         GYVCJxS9fGj5+tc1hzpooJQDkROVozpiFB+k5i00JvR0+hWdSX7aZl+XW2MftWDB1597
         Y/gWuWyaKcQWA8/auC9fURtDIFqp9CNmwnaIFh/wic+NZh2N8jr456u2yntXTevZy3dU
         llQrOd6Jc++skEJLtRxkL8cvpUL1Ri2flgrq+j2ci07VSIqzMYueMNbdPtzFmmHvr8GC
         /umHNjuNK/Wg0UeyTESR4r5RZovvNR0Sz7hOOpF/BH56CChnAqUa4R/3+hspHaAHOv/w
         4IdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn0gH8+KZgEfRrFgJK9xr+b5QrN7LbLyd00CCOCZ6rw0kYa2hpoG97zIkRjNX2RJSBALfy/8TLQFd1bjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4tDkNEBCzzGaTXLvqPiriuMrrj0ld0rgPamcsxTHwjpBGrDA4
	pREdLnoO2WJOmbIZUBNpOhqV3bUiKsOGWaCAmmpP10LF5dsBNQHI
X-Gm-Gg: ASbGnctvhG5Fr9lFhMrpOghel8XPAD7GfaI7Kx89i4bU3Nft4k8bDJsEM1Vyqz3HWnf
	y1P5RJ1hqtrihAf3pfJhmbs0fAvY1ZhogqPwipVhFpsszapDWfT/C7c6TafTNl1sKwn7tZwQZHb
	2PCbuaEhzDZ4zGC4vZyV/qiCVjCxRdwPiOpAqeLx2BMaekhXjXqG3BpuUhgI+WC9qkEstqPw5a5
	eioENqNjtSW5BtpVuEarVTvzRaQccMBP9mEIHVCTV7paKepMv6eQkKqcYV6NqXADeGyVC+FSqZA
	76KqnfHaPhAR4FLyG6VKrDaAfwyGrd84GHKu3lxvA01Dwtg=
X-Google-Smtp-Source: AGHT+IEUAB/JtOqufEX4xMpy0u5fcS9TGCgU5WnMfvk5M8lGvbIYJ7C7bFCCuTJd30meh+bfTKATqw==
X-Received: by 2002:a05:6a20:12c8:b0:1e1:e2d9:307 with SMTP id adf61e73a8af0-1eb215ad783mr21732953637.33.1737390346565;
        Mon, 20 Jan 2025 08:25:46 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8e71sm7182418b3a.112.2025.01.20.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:25:46 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 21 Jan 2025 00:23:25 +0800
Subject: [PATCH] hwmon: ina238: Add support for shunt voltage scaling
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHx4jmcC/x2N0QqDMAwAf0XyvIBNGXT7lbGHro0akFSaTgTx3
 1f2eHDcnWBchQ2ewwmVdzEp2sHdBkhL1JlRcmegke6jI4dbaaIoGskHtOWrDfeytthNS3EVnTF
 EPz1y8pk+AXpoqzzJ8Z+83tf1A5zdMzN0AAAA
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737390344; l=3083;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=aeN28AYVvGJfT3SDJFpY5CFpl9UwKe2s1HqNf6NCsic=;
 b=jQa3Tvzwtek0zYRG3r/nIxhzKflWA+IyKGV0QHwXPxzobtUD8KTPOFXszABvXkO6hFQDJC5eu
 wvVPNgje9FTDo+y0Bw1PkA/Y09y1jtVnhjQ3WNbl/iZOwleqqOUnGwE
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=

The INA238 sensor reports shunt voltage with microvolt precision.
However, the hwmon driver currently exposes this value only in
millivolts via `in0_input`, which results in a loss of precision for
readings within the range of ±1 mV.

This patch introduces an `in0_scale` attribute to provide the scaling
factor applied to the shunt voltage reading. By exposing this attribute,
users can accurately interpret the in0_input values in microvolts,
preserving the sensor's full precision.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/hwmon/ina238.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 2d9f12f68d50..58737a0703dc 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -8,6 +8,7 @@
 
 #include <linux/err.h>
 #include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -108,8 +109,42 @@ struct ina238_data {
 	struct regmap *regmap;
 	u32 rshunt;
 	int gain;
+	long shunt_volt_scale;
 };
 
+static ssize_t shunt_volt_scale_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", data->shunt_volt_scale);
+}
+
+static ssize_t shunt_volt_scale_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+	long val;
+	int err;
+
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
+
+	data->shunt_volt_scale = val;
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR_RW(in0_scale, shunt_volt_scale, 0);
+
+static struct attribute *ina238_attrs[] = {
+	&sensor_dev_attr_in0_scale.dev_attr.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(ina238);
+
 static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
 {
 	u8 data[3];
@@ -197,8 +232,9 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 		regval = (s16)regval;
 		if (channel == 0)
 			/* gain of 1 -> LSB / 4 */
-			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) /
-			       (1000 * (4 - data->gain + 1));
+			*val = (regval * INA238_SHUNT_VOLTAGE_LSB *
+				data->shunt_volt_scale) /
+				(1000 * (4 - data->gain + 1));
 		else
 			*val = (regval * INA238_BUS_VOLTAGE_LSB) / 1000;
 		break;
@@ -603,9 +639,12 @@ static int ina238_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	/* Setup default shunt voltage scale */
+	data->shunt_volt_scale = 1;
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &ina238_chip_info,
-							 NULL);
+							 ina238_groups);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 

---
base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
change-id: 20250121-potin-ina238-shunt-voltage-scaling-8a3f9dc3d2b8

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

