Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522A230C15E
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778949864; cv=none; b=Bw5ELiSDmEHhanT1ULXt0PnwedOIfwO2ASdoIj3ygLodcGD7w5efW8PcjbVKTyc3lvVc+D1eMijvgE1fFtp2F5AvbrEjWWUg4x/KL/EhXxfg8vB4IlWhfXQroSaAFsmVmyMDm/RT122TbclC0LTpOQ9/ql1bhMDTUqr+YZwVEb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778949864; c=relaxed/simple;
	bh=yssAK4VZj7m+QibjE6uDAgh8Jz2lLAenuz0X3lFWrAA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JjffctWCRPX7WfZnnixt/SRYggqtCTAm1IXC3wlIuaBfLWzHAg0trxEiKPlZaTqdFTXP+6b1upz2r9qGVP/UgBBfJSiUWkXAbXMl3UrESdZ0xNVr/AB4aKySVgxxnzCYMTvJbsvkujdckCNrgiM8W/OUjB1VicK5F9Kggc/waIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Csj8H24b; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Csj8H24b"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8367df48711so366634b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778949862; x=1779554662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHW/BI9GDTwQbV2hvJZT0LsNh5n9BJgFdfYTJRCI8qk=;
        b=Csj8H24bodPR9F+BDXvbjmo80/4fUO61ILgGGNytIgw0BwjgCYuHCseft6pFLSrFc5
         6VcgcFvMJWQXmiq0yBNOj95voFmzKTZomF8nfy4bfHe4ZyiQMjYVqVP8yIWDSZS0iK3j
         ltbhV4B69RjVvfE+6XsjN+nje5tfAZOkHSTwyBVpt9LoN+pUwWECf7yQ+EZ3DC0JwIVp
         Slg4BdEf7ypiEvV7EG/kaN798ksiDg9B0AgDkGzH7U1BpyPOpinOgbf4ThHtfPR1EUfx
         6oim5tAg/E0C9mW9uqVtszlzWN5r3K4lwoWaTh/MBHn9kqInXGL2UxgARzJEZTwBL5TZ
         pSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949862; x=1779554662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JHW/BI9GDTwQbV2hvJZT0LsNh5n9BJgFdfYTJRCI8qk=;
        b=KTbfOTWh/7Hp4LS/hQmzPQpZhrIk5W0BEwkrhywaqgG2a11rXOTSR6pzUfQOAZar/l
         zcKo002rq8Vq2Ivnoo2xTgt+gLScJIprCCfqnkmb+HAjJFRHCizVc0ca8vVhfeknGljb
         v6neLg5igwxq5HjupUKWovSuyFfF7s1Chd0hCfqLg2aaGvdLyHlERBf1so0cYrtdKfGU
         bqnI5gb0lCEilg59hXu6nfykO5EBl+d7xVXfogK8L8wijngElI70Ns+h55CqA7ezJbBD
         BSkF9yt09nf4ZCdWtkkCahIHWPSl8knIqPziFNMTqJKZzlFYfZbDIrBdSRuxEXz7FynJ
         EiLg==
X-Forwarded-Encrypted: i=1; AFNElJ8IcOjSP0yWPD7YV3AESocDIPt4k7NcxJrwPl5clNCc7oUxm8glMQULnVrMN2J1oiVhrd0h5NdIyh1zYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaPMb1oN/JzbRQK8FoHMSPmTCQ+xvpKsoUm1GT0YkVrQPROQYT
	wMIW4jRVcLwnwyTLjJX2hxZBnxJAPWk0/4lkOnAIdujyuWavVnskFV4F
X-Gm-Gg: Acq92OEUc/HBnXAblZjG0YpdlR56vjsbCC6X8qtUQlMtMCGHDg9hGvocTGegNhJ+0G2
	xvNfwKBoNiG4zl4kFvgaxClah33UoFuoeV3xlSXZAYwIW1Tfd0J8hOWV+nNG/D12xOJ5rX7ZEYn
	NkAnecJ5apaiQrHqPgKrqeg/bx71LNw+bG2SaoN0s9/X16Pbmy7KzW3xjJmAxh6TY4TZBBAM+Qt
	xA7G2X8wzem+LGdSTHAmr0TLUm67b9YXySd2INyCwxDlbPqjkjF3qtBHewA5t2iYMlROHoHuKcb
	d3u1ghI51oGB20nQsGx61Le+lvjV5W56/Z23ZFpFdErVK4WenZjeVh97FCm+2k2rptpgbCIa2Oc
	fRwUVLVk4Cqf1WoK4tN4BbUYEBHgmxSxCAx91iQvXdivOlGy3qaiVFT2Qfymt9N4Q3/myHm45zm
	UmJzG8yHh5zlVDA/gLKPRYSweq3ke5LHqcthh4LQgZMU1jHMmHBp9xfEdUQw==
X-Received: by 2002:a05:6a00:e1a:b0:835:6bdf:c888 with SMTP id d2e1a72fcca58-83f33c329d8mr9642858b3a.2.1778949861637;
        Sat, 16 May 2026 09:44:21 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm9562564b3a.1.2026.05.16.09.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:44:21 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: raspberrypi: Add voltage input support
Date: Sat, 16 May 2026 22:14:06 +0530
Message-ID: <20260516164407.25255-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the raspberrypi-hwmon driver to expose firmware-provided
voltage measurements through the hwmon subsystem.

The driver now exports the following voltage inputs:

  - in0_input (core)
  - in1_input (sdram_c)
  - in2_input (sdram_i)
  - in3_input (sdram_p)

Voltage values returned by firmware are converted from microvolts
to millivolts as expected by the hwmon subsystem.

The existing undervoltage sticky alarm handling is preserved and
associated with the first voltage channel.

Tested in -
- Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
  Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/hwmon/raspberrypi-hwmon.c | 112 +++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index a2938881ccd2..c73a970db025 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -5,6 +5,7 @@
  * Based on firmware/raspberrypi.c by Noralf Trønnes
  *
  * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
+ * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
  */
 #include <linux/device.h>
 #include <linux/devm-helpers.h>
@@ -18,6 +19,11 @@
 
 #define UNDERVOLTAGE_STICKY_BIT	BIT(16)
 
+struct rpi_firmware_get_value {
+	__le32 id;
+	__le32 val;
+} __packed;
+
 struct rpi_hwmon_data {
 	struct device *hwmon_dev;
 	struct rpi_firmware *fw;
@@ -56,6 +62,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
 }
 
+static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
+				    long *val)
+{
+	struct rpi_firmware_get_value packet;
+	int ret;
+
+	packet.id = cpu_to_le32(id);
+	packet.val = 0;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
+				    &packet, sizeof(packet));
+	if (ret)
+		return ret;
+
+	*val = le32_to_cpu(packet.val) / 1000;
+	return 0;
+}
+
 static void get_values_poll(struct work_struct *work)
 {
 	struct rpi_hwmon_data *data;
@@ -77,19 +100,101 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct rpi_hwmon_data *data = dev_get_drvdata(dev);
 
-	*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+			switch (channel) {
+			case 0:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_CORE,
+						val);
+			case 1:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_C,
+						val);
+			case 2:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_I,
+						val);
+			case 3:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_P,
+						val);
+			default:
+				return -EOPNOTSUPP;
+			}
+		case hwmon_in_lcrit_alarm:
+			if (channel == 0) {
+				*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+				return 0;
+			}
+			return -EOPNOTSUPP;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int rpi_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	if (type == hwmon_in && attr == hwmon_in_label) {
+		switch (channel) {
+		case 0:
+			*str = "core";
+			return 0;
+		case 1:
+			*str = "sdram_c";
+			return 0;
+		case 2:
+			*str = "sdram_i";
+			return 0;
+		case 3:
+			*str = "sdram_p";
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			return 0444;
+		case hwmon_in_lcrit_alarm:
+			if (channel == 0)
+				return 0444;
+			return 0;
+		default:
+			return 0;
+		}
+	}
+
 	return 0;
 }
 
 static const struct hwmon_channel_info * const rpi_info[] = {
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_LCRIT_ALARM),
+			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_LCRIT_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
 	NULL
 };
 
 static const struct hwmon_ops rpi_hwmon_ops = {
-	.visible = 0444,
+	.is_visible = rpi_is_visible,
 	.read = rpi_read,
+	.read_string = rpi_read_string,
 };
 
 static const struct hwmon_chip_info rpi_chip_info = {
@@ -159,6 +264,7 @@ static struct platform_driver rpi_hwmon_driver = {
 module_platform_driver(rpi_hwmon_driver);
 
 MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
+MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
 MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:raspberrypi-hwmon");
-- 
2.54.0

