Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34A2D8385
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 01:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777599060; cv=none; b=UbbL2JbmQDwsFDjPNTaYHD5m1D/z6JCrpPuJjb0qDqq4XcMAd4LDTwBe1cmZUBJ8oJndkXRd4oIsjexKUf/tcbPexF51SDeGfDXi+UdJH02f39nKqzTsFlQAHAz37KHMljQ1knoQhPsqCRul4KjyXQv8uRqdsJvZeNZeukpCUeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777599060; c=relaxed/simple;
	bh=7qy/6diB9xyAfFMxIppzX8sJUPMNDDpo4udoaNTWtrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBaMYiOFvmvKPHAo2I3dKbLp7/JusJlkptT1KEX4xPBISB6ot5dw4faQqyaHHJBXTK2/2lkIsCxBC5hLTLznmzh65mjWODfMlPwaRLJYOM2X2+U/YSHl9TrIf2TD3YYNhujpjMF0jASP/78hBnkBu9CEu9JNflZKAQe2vzheWrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qN9Os57V; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qN9Os57V"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82418b0178cso834842b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777599059; x=1778203859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RT8BCQz7kJsQZujZUfQDImb7/MEbQoNtAc/Me2J6gjs=;
        b=qN9Os57V77eRmMmSJ0+Yaa5RWefp6HhNQUFQC3HMii92j+grjvgc09wl39jSDRWR/s
         ledmbv0AzjxG639izI7CiuvyjQQOAghD7414gznY81gcZiMFS/lgvQOaJY1ClQkuw9OS
         UPq57Xz/AhZo3ScJpqdX4GDNW7/Y9Gm+VsbB44OrMeg2FxqVWRIP3d9Qhhj1+lcAiiTd
         8E888LdXpLGo/1N8Spo0XdLD/mOOhOAJygvo0NyRFYJAs5OET2vlTqVtPGYn9Ne5IB9z
         XcmxUkHr7Dp1e455umm2Av+ZZamTg6tfX2+zJjtE7DaxVafgDpmCTf1HFMXDrwpk6ZUu
         0MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777599059; x=1778203859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RT8BCQz7kJsQZujZUfQDImb7/MEbQoNtAc/Me2J6gjs=;
        b=BvUCaJ1oNppUso1dv9EqAO4JWpsNcs8CwODwBFZV2jf9c9y8EPT5MzrwJbmYLCPWwQ
         J/UtinGbxtEyUkcInvvB+7kPSgWPHZWJpKhqHnI3KRXQKwDmImtgw5XXhSquh/DTqYOX
         IIbxUE+97rA7FENOevhE6JCEAHM8zDh0/HfxUwHWMGZn8fpUxZ1woncu3mR8KY9KkJbR
         4euDcYyuKRU2/6e70XJZ2CepjVBsX2V+wPVp2cD3LKYC0Ylj0rPtEtTaMcyXODftoE9j
         8D1FBuxaC1QTXf+LbulzgYkSxCcY8hWAGkb+PzYt5qFei+6iqTIsfh2T4LCBX2BW9es6
         lqUw==
X-Gm-Message-State: AOJu0YyFJzu7T5x2X9JP+Kj0+MWWHlTNKohekhCrHDuwXoEfkZOACItu
	TEdKS1fMHU68FrOqasja4Wp7ttgXOkMlMYq6/xvX2UQoEPbaUNMceyCN
X-Gm-Gg: AeBDieuPZ9bnXBOLTF3jb/n2NLkpzyp5ZL8iFphvWY9oNDQLzqx3Ueqi7pz/710ha4n
	U4VmL1JE/UNB0QHKJrU3YkCPE/M6gMCxKIxPJbU3m41JzFlr8npom1kx/s4tsjcp5sk2f+VMwo5
	sGTtIYt/fncIC8bRqiJ3Hj5a7bb13YpWx+mEbAhhqXQzPezgl5Kag9Mqj7XFBD18iXWWkPmsi2v
	v4DPwGPR7y0PtWMTN88ltxGH8pIer1Tixos7KGNjihvH53p1PIE180A2PdyIJTC6MYY/W88KMEi
	1WSjEkok8cGMYT8Lo0dZNNr/8ESUFhJ50AGXoYQvbhYxi/76o4AqMyH3rx/TJzWnzW/toLpPlZ7
	+6IN39zN4GOY5qcZ3xZRPlWCVcMGqCA+Aql/czv94Krq80A7YD+uCVmJoL6eKxF93mis/yQDwWD
	vffs2WxcujFXoe7T5C8uZFqU65j9lNvestoTnoPsK2HbSQGZAcwbJdo9eMjmKN3uV5JilEzFRAz
	SJwRg==
X-Received: by 2002:a05:6a00:4f82:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-834fdccead2mr5471807b3a.48.1777599058719;
        Thu, 30 Apr 2026 18:30:58 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158a8432sm1014523b3a.20.2026.04.30.18.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 18:30:58 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v4 2/3] hwmon: (ads7871) Convert to hwmon_device_register_with_info
Date: Fri,  1 May 2026 07:00:42 +0530
Message-ID: <20260501013044.22756-3-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501013044.22756-1-tabreztalks@gmail.com>
References: <20260501013044.22756-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ads7871 driver from the legacy hwmon_device_register() to the
modern hwmon_device_register_with_info() API. This migration simplifies
the driver by using the structured hwmon_channel_info approach and
prepares the codebase for the transition to a shared DMA-safe buffer.
While at it, fix checkpatch violations.

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 75 ++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 15104d9b2b733..3ee04719eefd9 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -56,7 +56,6 @@
 #include <linux/init.h>
 #include <linux/spi/spi.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <asm/unaligned.h>
@@ -67,6 +66,16 @@ struct ads7871_data {
 	struct spi_device *spi;
 };
 
+static umode_t ads7871_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	if (type == hwmon_in && attr == hwmon_in_input)
+		return 0444;
+
+	return 0;
+}
+
 static int ads7871_read_reg8(struct spi_device *spi, int reg)
 {
 	int ret;
@@ -94,19 +103,20 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
 static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
 {
 	u8 tmp[2] = {reg, val};
+
 	return spi_write(spi, tmp, sizeof(tmp));
 }
 
-static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
-			    char *buf)
+static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
 	struct ads7871_data *pdata = dev_get_drvdata(dev);
 	struct spi_device *spi = pdata->spi;
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	int ret, val, i = 0;
-	uint8_t channel, mux_cnv;
+	int ret, raw_val, i = 0;
+	u8 mux_cnv;
 
-	channel = attr->index;
+	if (type != hwmon_in || attr != hwmon_in_input)
+		return -EOPNOTSUPP;
 	/*
 	 * TODO: add support for conversions
 	 * other than single ended with a gain of 1
@@ -136,39 +146,34 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 	}
 
 	if (mux_cnv == 0) {
-		val = ads7871_read_reg16(spi, REG_LS_BYTE);
-		if (val < 0)
-			return val;
+		raw_val = ads7871_read_reg16(spi, REG_LS_BYTE);
+		if (raw_val < 0)
+			return raw_val;
+
 		/*result in volts*10000 = (val/8192)*2.5*10000*/
-		val = ((val >> 2) * 25000) / 8192;
-		return sysfs_emit(buf, "%d\n", val);
+		*val = ((raw_val >> 2) * 25000) / 8192;
+		return 0;
 	}
 
 	return -ETIMEDOUT;
 }
 
-static SENSOR_DEVICE_ATTR_RO(in0_input, voltage, 0);
-static SENSOR_DEVICE_ATTR_RO(in1_input, voltage, 1);
-static SENSOR_DEVICE_ATTR_RO(in2_input, voltage, 2);
-static SENSOR_DEVICE_ATTR_RO(in3_input, voltage, 3);
-static SENSOR_DEVICE_ATTR_RO(in4_input, voltage, 4);
-static SENSOR_DEVICE_ATTR_RO(in5_input, voltage, 5);
-static SENSOR_DEVICE_ATTR_RO(in6_input, voltage, 6);
-static SENSOR_DEVICE_ATTR_RO(in7_input, voltage, 7);
-
-static struct attribute *ads7871_attrs[] = {
-	&sensor_dev_attr_in0_input.dev_attr.attr,
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in6_input.dev_attr.attr,
-	&sensor_dev_attr_in7_input.dev_attr.attr,
+static const struct hwmon_channel_info * const ads7871_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT,
+			   HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT),
 	NULL
 };
 
-ATTRIBUTE_GROUPS(ads7871);
+static const struct hwmon_ops ads7871_hwmon_ops = {
+	.is_visible = ads7871_is_visible,
+	.read = ads7871_read,
+};
+
+static const struct hwmon_chip_info ads7871_chip_info = {
+	.ops = &ads7871_hwmon_ops,
+	.info = ads7871_info,
+};
 
 static int ads7871_probe(struct spi_device *spi)
 {
@@ -203,10 +208,10 @@ static int ads7871_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	pdata->spi = spi;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, spi->modalias,
-							   pdata,
-							   ads7871_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, spi->modalias,
+							 pdata,
+							 &ads7871_chip_info,
+							 NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.43.0

