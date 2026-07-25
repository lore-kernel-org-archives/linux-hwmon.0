Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCEF31E821
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784966286; cv=none; b=cA13cW3CNC2Lh4QEmtCwBRJnTqUYyXQpVPpIKF5vqvnpgI4vZPe7tJ/symrLPTxm00asigLmRLpJldHy2zoLbft177UUondmFF+saBeV4QZdccpSMlg8yprmroLllyPRBqyYa33ZObem+l0ORAqex+TMIm1fccmkUu3KfDD0oxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784966286; c=relaxed/simple;
	bh=GBfYRg1dSGCxKgBXdmj46o3wF7a4v1JmPokLDI3D1kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXBWyz0tqr3ojYwrpHUu84yGZr28zYbWZ6B9oOoNR3YC8OOjqCGLFFJeKWwrKaXwuWJk3A9BtPBysxDtv3zJfTaCZPgEjEa704sEJU9w+NUoymSdAcjGIQ2BjG1y2C9c5oCViQJzA7uLSeBiQbs89G2byLr3xOkhKVSpvHDDjRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drpUU8Ki; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drpUU8Ki"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so863988a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 00:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784966284; x=1785571084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdEtCsqT40GTjeVuS9d5nlFaI9E5tTtZ+16MX1GFoNw=;
        b=drpUU8Ki3OG+kQmSaiBFfYuEdtCUKbpPGSoE4hJaTsFlmD/h+tG+EKvFzIcMvOvOV9
         k8cK5zN+0sSTzWb57Tom0ztPWzd+kwK1tEj99RINF055kD57TXP3dUtqOv/TMBoaBsRU
         7aNxUeFU30JBnsyBj70VPuouUhohoFmOfVq604zOClUjIZKoctLGx/ZZ5OktrKtWkk/M
         NzX1egLE9vokveMA/PhFuc6YCYJqkmSZbqXgMoNMWJXToNfwVxlv3TMRfdd+JhJGtBB+
         vVf0+fa3/beHkpmoC6m56IOFsSgevWZQPwClS8J8wNlg1M8E/ABTx+U7ci0hnyPcq89U
         OqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784966284; x=1785571084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdEtCsqT40GTjeVuS9d5nlFaI9E5tTtZ+16MX1GFoNw=;
        b=ImxJ0LhBqQPRyY03dgLgdfSorFVPYgELvGDA0Bk9uyy4Cr/EoVGt9gwdidM7/83VQ3
         QxmZITCLsDS3QGEe8y6El2bwglA+j8ZKpB3+LdhpMN52zVDekirTKaA8XT3l4cWtMaPp
         qIfShsosJP5DVOuiFCFZqJzksC+szdkQiFM1s4Nb9MCb7+RFJts990dMu6SvyYZx3Ykk
         EH9tVRS/8r7YpmDB8C5hiVOXuVJ2ZU7X01CVhEATmSrLaf9fa9G2O5akK2wrt1hYccvd
         psZqDXEy5387Jq2ie7gEYiIEauSYwqaS5js+ypDgARTdBmNniHEgfUI491gTG5GivaAO
         UIlA==
X-Gm-Message-State: AOJu0YwvTkx974FLofSx/Uf5fTQ9Sd5sKSoecjUHc1SZRlRFOwyM5/cm
	89DaYPQkUO6U/KEBu6GVhYA8Rflc/BJtfeQIU5kXHB0FMLQwc1IZJXsCIOei2w==
X-Gm-Gg: AR+sD11nvrKPT7RC4Q2ztFx/J8lR3+qoPGgYkgvwL6SoIk7NX5sVwr89bh34ELQ0XRH
	+IFP4Txc1DC5KiKszuZWFHuZeAzQHOxSc8ZSDM3xliZZuGsDawGBy/LlmoeZMwOowM/56YSxJ4Y
	/zfEImtaH+w11MJnY8oV6u+iw3Y9b1M53Ui8cBtrSrEI88hxvgbXXi1lhzK/D3ifUf7FXoVVXmh
	0lbIPot4sliBoKpyK8eqtOhnHinPkFQv5G+tOg96QQmnvckvI/I1e0RiupviqriIvc7TZ6zTVOX
	fPtN4FGo+ngxGztr0/2qRhV2GG1nuy/8hdjYkA2txYj1Pk/JGoToc5qDzmPkE2n44tRt8WJYFIC
	jTubw47/o2XirmEMHQuqIECx5zcGnGkV46NbA9nReBvK5Xhs85iyjr5bejfbS5RDBhrATY/GAZc
	wHrR1FulBjGmayE+BwgbnQCFO+KQ==
X-Received: by 2002:a05:6a20:244e:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c67e0dbc72mr1438620637.74.1784966283537;
        Sat, 25 Jul 2026 00:58:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm12905894eec.2.2026.07.25.00.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 00:58:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6] hwmon: (ina2xx) Fix various overflow issues
Date: Sat, 25 Jul 2026 00:58:00 -0700
Message-ID: <20260725075800.346566-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports several integer overflow problems in the ina2xx driver
caused by unbounded multiplications and inadequate types for intermediate
calculations.

Specifically:
- In ina2xx_get_value(), the return type is changed from int to long.
  Intermediate calculations for current are now performed using 64-bit
  types to prevent 32-bit integer overflow before the division by 1000.
- When calculating power in ina2xx_get_value() and
  sy24655_average_power_read(), interim values are cast to u64 and clamped
  to LONG_MAX. This prevents overflow when regval or accumulator_24 is
  multiplied by power_lsb_uW.
- In ina226_alert_to_reg(), the clamping logic is rewritten using min_t().
  This safely avoids integer overflows when scaling user-provided values
  for shunt voltage, bus voltage, power, and current limits.

Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: ab7fbee452be ("hwmon: (ina2xx) Fix various overflow issues")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v6: Replaced some instances of clamp_val() with min_t()
    Simplified commit message
    Fixed even more overflow issues reported by Sashiko in v5
v5: Relaxed clamping when writing the INA2XX_CURRENT alert limit
v4: Fixed another clamping issue when reading INA2XX_CURRENT
v3: Fixed additional problems in INA2XX_CURRENT handling
    (avoid possible 64-bit divide operation and overflow when using
     DIV_ROUND_CLOSEST)
v2: Fixed several additional overflow conditions reported by Sashiko
    after v1

 drivers/hwmon/ina2xx.c | 61 ++++++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index c4742e84b999..449a72c6b40b 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -266,30 +267,34 @@ static u16 ina226_interval_to_reg(long interval)
 	return FIELD_PREP(INA226_AVG_RD_MASK, avg_bits);
 }
 
-static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
-			    unsigned int regval)
+static long ina2xx_get_value(struct ina2xx_data *data, u8 reg,
+			     unsigned int regval)
 {
-	int val;
+	s64 val64;
+	long val;
 
 	switch (reg) {
 	case INA2XX_SHUNT_VOLTAGE:
 		/* signed register */
-		val = (s16)regval >> data->config->shunt_voltage_shift;
-		val = DIV_ROUND_CLOSEST(val, data->config->shunt_div);
+		val = DIV_ROUND_CLOSEST((s16)regval >> data->config->shunt_voltage_shift,
+					data->config->shunt_div);
 		break;
 	case INA2XX_BUS_VOLTAGE:
-		val = (regval >> data->config->bus_voltage_shift) *
-		  data->config->bus_voltage_lsb;
-		val = DIV_ROUND_CLOSEST(val, 1000);
+		val = DIV_ROUND_CLOSEST((regval >> data->config->bus_voltage_shift) *
+					data->config->bus_voltage_lsb, 1000);
 		break;
 	case INA2XX_POWER:
-		val = regval * data->power_lsb_uW;
+		val = min_t(u64, (u64)regval * data->power_lsb_uW, LONG_MAX);
 		break;
 	case INA2XX_CURRENT:
 		/* signed register, result in mA */
-		val = ((s16)regval >> data->config->current_shift) *
+		val64 = (s64)((s16)regval >> data->config->current_shift) *
 		  data->current_lsb_uA;
-		val = DIV_ROUND_CLOSEST(val, 1000);
+		if (val64 < 0)
+			val64 = -DIV_ROUND_CLOSEST_ULL(-val64, 1000);
+		else
+			val64 = DIV_ROUND_CLOSEST_ULL(val64, 1000);
+		val = clamp_val(val64, LONG_MIN, LONG_MAX);
 		break;
 	case INA2XX_CALIBRATION:
 		val = regval;
@@ -378,27 +383,29 @@ static int ina2xx_read_init(struct device *dev, int reg, long *val)
  */
 static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
 {
+	long limit;
+
 	switch (reg) {
 	case INA2XX_SHUNT_VOLTAGE:
-		val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
-		val *= data->config->shunt_div;
-		val <<= data->config->shunt_voltage_shift;
-		return clamp_val(val, 0, SHRT_MAX);
+		val = min_t(long, val, DIV_ROUND_CLOSEST(SHRT_MAX, data->config->shunt_div));
+		return min_t(long, (val * data->config->shunt_div) << data->config->shunt_voltage_shift,
+			     SHRT_MAX);
 	case INA2XX_BUS_VOLTAGE:
-		val = clamp_val(val, 0, 200000);
-		val = (val * 1000) << data->config->bus_voltage_shift;
-		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
-		return clamp_val(val, 0, USHRT_MAX);
+		val = min_t(long, val, 130000);
+		return min_t(long,
+			     DIV_ROUND_CLOSEST((val * 1000) << data->config->bus_voltage_shift,
+					       data->config->bus_voltage_lsb),
+			     USHRT_MAX);
 	case INA2XX_POWER:
-		val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
-		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
-		return clamp_val(val, 0, USHRT_MAX);
+		val = min_t(long, val, LONG_MAX - data->power_lsb_uW);
+		return min_t(long, DIV_ROUND_CLOSEST(val, data->power_lsb_uW), USHRT_MAX);
 	case INA2XX_CURRENT:
-		val = clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
+		limit = (LONG_MAX - (data->current_lsb_uA / 2)) / 1000;
+		val = min_t(long, val, limit);
 		/* signed register, result in mA */
 		val = DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
-		val <<= data->config->current_shift;
-		return clamp_val(val, SHRT_MIN, SHRT_MAX);
+		limit = SHRT_MAX >> data->config->current_shift;
+		return (u16)(min_t(long, val, limit) << data->config->current_shift);
 	default:
 		/* programmer goofed */
 		WARN_ON_ONCE(1);
@@ -537,6 +544,7 @@ static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *va
 	u8 template[6];
 	int ret;
 	long accumulator_24, sample_count;
+	u64 val64;
 
 	/* 48-bit register read */
 	ret = i2c_smbus_read_i2c_block_data(data->client, reg, 6, template);
@@ -555,7 +563,8 @@ static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *va
 		return 0;
 	}
 
-	*val = DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+	val64 = (u64)DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
+	*val = min_t(u64, val64, LONG_MAX);
 
 	return 0;
 }
-- 
2.55.0

