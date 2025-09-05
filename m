Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA92DBF47;
	Fri,  5 Sep 2025 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104940; cv=none; b=iFikMVVbc0Nt21aKNheWNNoY+wNMIQJyYqkHuAnGWLBOzFfe33ajnBCt7g++26EkLYCXK2Pn6Tm1xXAEI0EBkCJE/HW2Ir4KFEju3Z3HH11qG22BUxYIXRGe/840j2cQzmMo1DcXJHNmBwwcvcrJ6Y3nasGL4pieGR/bc859hCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104940; c=relaxed/simple;
	bh=v1/aZI/TQcrRgx3EkgXBjwi+OQqekt8Wp9Tatm9sXSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEetXETegEiLDd5/gW7Sq2vL4fBluFQIVDiOONPsPB5UqOhbDaefiL5Gnwmhub4g6nBwAW1Lujy/GFaAGEh1hhUZLMdVPGPax6kdeMCg3zgF35JKEKW8XeCAmiB75z7wtyIaZgNs+LR5prHkFeAPRRc+BKP4S0x+Y1+uAxYrlP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYGUrJOd; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYGUrJOd"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso1704836a12.0;
        Fri, 05 Sep 2025 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104938; x=1757709738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6k2XO/u4rw9tNtq8QvZtPWpWncSA1EsLr28+KKUfLE=;
        b=eYGUrJOdbILSn2ifXMJorWzd0/AdhMIfhwIRgxjKRKNjy48FsPuUA8oXm1b58EGDRs
         LKfBr8PJXUWCiLjMA14mYpHExTtISo4+QTOGQ7iMzBbIZCSl1YVILYBnl3lB8Wk4I11G
         JIZwktmykhrGi/8lsYIdgiBHkrRJlWaR/gyJAs8HLoSVnGWXLUkJ+sBNO3/k1qND5IyR
         luNs9dOlFHURwzTumbpUGzlwYiLdpBSCbHQfboDru/W9L7d4I8fuuHWaBVH7PcqTX8en
         zomeZFM8kcoGZBGle0QzKVDCtmlw3PPZ4wB6o/bXsiaoh5T+rctZaIwvhyeUeBNp13Xw
         rgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104938; x=1757709738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q6k2XO/u4rw9tNtq8QvZtPWpWncSA1EsLr28+KKUfLE=;
        b=DQ3UOciiXWBaTgFT+fu9sW1xa2bknDed01QHLTXde4KYDI3JfLVZ7JWopYaSlmQJy4
         K8sPIxh088UfY7quF2Uzc5d7LGR+Sm+SRNvJxjUlOpIomXZlL/ay0hUUA+y8W7ASBI7U
         lPrEsyjDY29jXGSTCABG3gCLAuLfTZU5Zl/ePBCI1Dpc7uVmPr7ngc8107g/mtMVBF0b
         FcCLSCZLkFi5ao3cDME/0DcG8TDl0+AsNzT0Z3C2x+pXr8MxoIU750pewRd0uyJnWq46
         ceKu7hu7p0DB3kKdUSfw6D6meoq16Nh61HmpVQoUpHGo3BRa1cKkxe7MBxSnt1MWWVMr
         4HRw==
X-Forwarded-Encrypted: i=1; AJvYcCVlmrCIBUa+PA7XI4zwsRsrYtGtIneHwn+pge6ckpxyKBVxLXy9MMpm8ZAtox2gCo89ktbcEPcOxM4y@vger.kernel.org
X-Gm-Message-State: AOJu0YySgCVPtyj4ubpuRg2Hd5pukD52a1xqmM6KzIwlSpgxP+73THVT
	ERyaH+dT4tK/sI5CztDdZ/uo1dOazI91FymwmufZAVvuza9tz/q6oSPDyPZjaj4c
X-Gm-Gg: ASbGnctGKyIAgpXCemB6iAH3dENrL/Pk0Z/0B0n+jiHPck+tGaHPZo1FrgGP4PimBaB
	6JvrzsszLyHmkafL2drqjE7GzXfN7Y+lRU814mPW/8ise6rJ2ydp5PPt7HTlJkviJmXjYgwtmKu
	1LHE8lRwHBc5RJxvHSoSXmdi4i9QHwI5yyOq2L6ycYpm8w8Uj+WKuCIVba0Cs3tJ3ZGpkjKRgXb
	dRbB4HblpeVEGPjuW+uZfo2cXQrZQdI0U4Kv5+7kb4tmYphKUIXiJ7+c97ySKDPk5FMiLo1+wO8
	9lFUilWXKu+f8pnvV10DJ8prfCywIIqtkD4gLzP2kTGJRZ62psOoxaZYV86qcelF9D0ieyy0SoD
	+oCu1yes1nQ6tLq2KbjiB/pfKuIurYHMEDODbscsg2fHOmg==
X-Google-Smtp-Source: AGHT+IH3/tEd9vIaG9sfCThnxj1drHH+nAEoqqRAqdOqy2sDAxhVD94RNeNAtdAj62b4Iuo27LgLjg==
X-Received: by 2002:a17:90b:4c0c:b0:32b:958a:51d4 with SMTP id 98e67ed59e1d1-32d43f98fa1mr228098a91.28.1757104938086;
        Fri, 05 Sep 2025 13:42:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d93317f0sm23539075a91.6.2025.09.05.13.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/17] hwmon: Introduce 64-bit energy attribute support
Date: Fri,  5 Sep 2025 13:41:53 -0700
Message-ID: <20250905204159.2618403-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many chips require 64-bit variables to display the accumulated energy,
even more so since the energy units are micro-Joule. Add new sensor type
"energy64" to support reporting the chip energy as 64-bit values.

Changing the entire hardware monitoring API is not feasible, and it is only
really necessary to support reading 64-bit values for the "energyX_input"
attribute. For this reason, keep the API as-is and use type casts on both
ends to pass 64-bit pointers when reading the accumulated energy. On the
write side (which is only useful for the energyX_enable attribute), keep
passing the written value as long.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.rst |  3 +++
 drivers/hwmon/hwmon.c                    | 16 +++++++++++-----
 include/linux/hwmon.h                    |  1 +
 include/trace/events/hwmon.h             | 10 +++++-----
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index e47fc757e63e..fcc61171f36e 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -159,6 +159,7 @@ It contains following fields:
      hwmon_curr		Current sensor
      hwmon_power		Power sensor
      hwmon_energy	Energy sensor
+     hwmon_energy64	Energy sensor, reported as 64-bit signed value
      hwmon_humidity	Humidity sensor
      hwmon_fan		Fan speed sensor
      hwmon_pwm		PWM control
@@ -288,6 +289,8 @@ Parameters:
 		The sensor channel number.
 	val:
 		Pointer to attribute value.
+		For hwmon_energy64, 'val' is passed as long * but needs
+		a typecast to s64 *.
 
 Return value:
 	0 on success, a negative error number otherwise.
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 1688c210888a..2e17f3a4c59b 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -426,18 +426,22 @@ static ssize_t hwmon_attr_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
 	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	s64 val64;
 	long val;
 	int ret;
 
 	ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
-			       &val);
+			       (hattr->type == hwmon_energy64) ? (long *)&val64 : &val);
 	if (ret < 0)
 		return ret;
 
-	trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
-			      hattr->name, val);
+	if (hattr->type != hwmon_energy64)
+		val64 = val;
 
-	return sprintf(buf, "%ld\n", val);
+	trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
+			      hattr->name, val64);
+
+	return sprintf(buf, "%lld\n", val64);
 }
 
 static ssize_t hwmon_attr_show_string(struct device *dev,
@@ -478,7 +482,7 @@ static ssize_t hwmon_attr_store(struct device *dev,
 		return ret;
 
 	trace_hwmon_attr_store(hattr->index + hwmon_attr_base(hattr->type),
-			       hattr->name, val);
+			       hattr->name, (s64)val);
 
 	return count;
 }
@@ -734,6 +738,7 @@ static const char * const *__templates[] = {
 	[hwmon_curr] = hwmon_curr_attr_templates,
 	[hwmon_power] = hwmon_power_attr_templates,
 	[hwmon_energy] = hwmon_energy_attr_templates,
+	[hwmon_energy64] = hwmon_energy_attr_templates,
 	[hwmon_humidity] = hwmon_humidity_attr_templates,
 	[hwmon_fan] = hwmon_fan_attr_templates,
 	[hwmon_pwm] = hwmon_pwm_attr_templates,
@@ -747,6 +752,7 @@ static const int __templates_size[] = {
 	[hwmon_curr] = ARRAY_SIZE(hwmon_curr_attr_templates),
 	[hwmon_power] = ARRAY_SIZE(hwmon_power_attr_templates),
 	[hwmon_energy] = ARRAY_SIZE(hwmon_energy_attr_templates),
+	[hwmon_energy64] = ARRAY_SIZE(hwmon_energy_attr_templates),
 	[hwmon_humidity] = ARRAY_SIZE(hwmon_humidity_attr_templates),
 	[hwmon_fan] = ARRAY_SIZE(hwmon_fan_attr_templates),
 	[hwmon_pwm] = ARRAY_SIZE(hwmon_pwm_attr_templates),
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 3a63dff62d03..886fc90b2d25 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -24,6 +24,7 @@ enum hwmon_sensor_types {
 	hwmon_curr,
 	hwmon_power,
 	hwmon_energy,
+	hwmon_energy64,
 	hwmon_humidity,
 	hwmon_fan,
 	hwmon_pwm,
diff --git a/include/trace/events/hwmon.h b/include/trace/events/hwmon.h
index d1ff560cd9b5..3865098f21f1 100644
--- a/include/trace/events/hwmon.h
+++ b/include/trace/events/hwmon.h
@@ -9,14 +9,14 @@
 
 DECLARE_EVENT_CLASS(hwmon_attr_class,
 
-	TP_PROTO(int index, const char *attr_name, long val),
+	TP_PROTO(int index, const char *attr_name, long long val),
 
 	TP_ARGS(index, attr_name, val),
 
 	TP_STRUCT__entry(
 		__field(int, index)
 		__string(attr_name, attr_name)
-		__field(long, val)
+		__field(long long, val)
 	),
 
 	TP_fast_assign(
@@ -25,20 +25,20 @@ DECLARE_EVENT_CLASS(hwmon_attr_class,
 		__entry->val = val;
 	),
 
-	TP_printk("index=%d, attr_name=%s, val=%ld",
+	TP_printk("index=%d, attr_name=%s, val=%lld",
 		  __entry->index,  __get_str(attr_name), __entry->val)
 );
 
 DEFINE_EVENT(hwmon_attr_class, hwmon_attr_show,
 
-	TP_PROTO(int index, const char *attr_name, long val),
+	TP_PROTO(int index, const char *attr_name, long long val),
 
 	TP_ARGS(index, attr_name, val)
 );
 
 DEFINE_EVENT(hwmon_attr_class, hwmon_attr_store,
 
-	TP_PROTO(int index, const char *attr_name, long val),
+	TP_PROTO(int index, const char *attr_name, long long val),
 
 	TP_ARGS(index, attr_name, val)
 );
-- 
2.45.2

