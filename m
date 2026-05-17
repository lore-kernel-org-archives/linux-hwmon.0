Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83892798F3
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005114; cv=none; b=g7+30rQd7iQV/ieKznS3NlG9kwdQk9iv0tcEP7V8AfIRL3WotGNzCplguwXAsb7jHK970tLLv0krf7EEmhaZ5767mxFgKWGAoN0Q42IDuEAraN9hbOVQcGVi6N0o5Wp51xJITHh1SiSwLgP9hRkVXmVuMzzqiKAzAz7yeD1qn4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005114; c=relaxed/simple;
	bh=CQnnrNz3QaLer4rIvuR5rcsVjjt1zgl/QceRPjuqaRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzFdMAYEyc9jRNTznSLxlfY7cbvRK8wYmAVy5YzEvIQQcCWDWpj3faGJffXnHKK98bFFbYKKCwcsx7rQnvEoBfshuJyhL7x5kKdMVj6yg7VHyh0/hYFXMVd8FCtVhmRp7GGQeZ+eMR5wP8GIifmhPt8mgXuRikhY48AXSnCL2RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMrRZzm9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMrRZzm9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2baef9f5ecdso10547895ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005112; x=1779609912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCKAo/jf8xEPgNkV5gsPWnBJjgGBXqxhdGGblYeVH98=;
        b=FMrRZzm986YjqNCDhkXsmQJz5OrtqGKBioVtFnkAAAXteEaU8O5/20H3t2uH6z4O2X
         6TygKTE+D9pIprpVfdnhTxN/fpU4U6CgryY/68euXQBgjNst5k2qo55kpfHH9tE8uJ6X
         Z15RIICPhtMc57pbT5XUn5lGNRHoYU5Rk1zurPxMnw6J4DSEHhLB367BFActaaMLnqX9
         WMMFD309rNyiIRN+LdF0czoNXvcEXNJeD8CWjAThbBGz9qqJhAavuBs8Fd/BHVfMuM87
         4zE+ItHdVJUbc/OXTnqQnnN14OsTu+MGyefjXrUwGPIQb/JBrqBgB3EPFCaGBQ1uA1C8
         +4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005112; x=1779609912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCKAo/jf8xEPgNkV5gsPWnBJjgGBXqxhdGGblYeVH98=;
        b=psfFmqX+RrAKNt+C/Ut6O2ejw2ynnwPrNmtkmLXFn5GivgAmQCgATOhUw6jdnmSMOr
         5+cQenFwRt7AqPw6RCvyDEaZKbwnYBZePYmSl69qu8siByyqBPfFmjHJFKmIuV6o/utO
         Od7Ow1a+C8u3kP/LClKPqxwCMVtVqbVcMylijnZK/67URJkkm50hDZk6ynD7rourFwfj
         O5go7PmMQIyD55Y46LMV4TA7QsjYG2ZKlr06nj5uInqCeA9ESXrqcNUkqUzbscZehbyl
         Hgqu2fVg/+LKzTxtszzJnwRIDmhF80rm2yZ5JTqRftwYElvLZDKibDqWCuovqgn6VSih
         7How==
X-Forwarded-Encrypted: i=1; AFNElJ8CX+zKUVFr9DwH9GFdXxjCVoUe3I1szNpM+L3JwYvH7xg6cs0hwAS8gXa4lvVjwPQudwlPcHxUCEIeSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcm4jr274LuJfqGlwYp2bzByI/wLF5ndRSnqrWvNzO/jxRVRvO
	X96o/h6uU9p11jD/P+AtHuCIAV/9lFr9nH7k/ze3HBHP0kn109qXxhzE
X-Gm-Gg: Acq92OG3uqLsPG3B9bVJITOOyzQJHBq8Jpdn0xdCYKOPmMD9qwsBxR6IBRZPd8Kvh+M
	o8gbKhqHCzqttdAPLb5a0Q7XxxI6R5Kz/c2TCySEDYJyWERoz7nsTc8FDcCWvGHeCKQUKfElXy2
	5mxgxX1USy8nbnlzhbz5Jk73/VF7AQ0Fsx0fq71T3TxG8viOJSi88LHuYZmQ2d1ooG9q4lcbvVW
	UdE3h3atS67uZiL9fWKHi2WHuntD4LzkMiDitdDW6vWKoHr2rbMew4Cj6ErmFB00iRcyDR+EsuN
	lp7xrE3d0m9HxUA3KHni8NU7eiq1CbA5ETv7wOHJ8FM2/eCpvKJC+RFEkX+ME7GSpJ3DmvMoGN4
	NoIkEw3epbWTjkCUAhOunvWWhL4hBMZfmL56532IC2orJtN6udNMqIJWARzc5Y3GPuLk/WHLlYu
	G9QHTidCzPB0I9zv9evg2tZeSrspCK/B6FA383D+4S2/XyoIEFo8QjVKJSSmKBKRD5q1C8vGE=
X-Received: by 2002:a17:902:b090:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2bd7e77a4ccmr84321965ad.4.1779005112119;
        Sun, 17 May 2026 01:05:12 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:05:11 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 2/3] hwmon: raspberrypi: Add voltage input support
Date: Sun, 17 May 2026 13:34:44 +0530
Message-ID: <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
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

Update the documentation related to it.

The existing undervoltage sticky alarm handling is preserved and
associated with the first voltage channel.

Tested in -
- Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
  Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/hwmon/raspberrypi-hwmon.rst |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c         | 127 +++++++++++++++++++++-
 2 files changed, 137 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/raspberrypi-hwmon.rst b/Documentation/hwmon/raspberrypi-hwmon.rst
index 8038ade36490..db315184b861 100644
--- a/Documentation/hwmon/raspberrypi-hwmon.rst
+++ b/Documentation/hwmon/raspberrypi-hwmon.rst
@@ -20,6 +20,17 @@ undervoltage conditions.
 Sysfs entries
 -------------
 
-======================= ==================
+======================= ======================================================
+in0_input		Core voltage in millivolts
+in1_input		SDRAM controller voltage in millivolts
+in2_input		SDRAM I/O voltage in millivolts
+in3_input		SDRAM PHY voltage in millivolts
+in0_label		"core"
+in1_label		"sdram_c"
+in2_label		"sdram_i"
+in3_label		"sdram_p"
 in0_lcrit_alarm		Undervoltage alarm
-======================= ==================
+======================= ======================================================
+
+The voltage inputs and labels are only exposed if the firmware reports support
+for the corresponding voltage ID.
diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index a2938881ccd2..8ce6dacc19b0 100644
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
@@ -21,10 +22,18 @@
 struct rpi_hwmon_data {
 	struct device *hwmon_dev;
 	struct rpi_firmware *fw;
+	u32 valid_inputs;
 	u32 last_throttled;
 	struct delayed_work get_values_poll_work;
 };
 
+static const char * const rpi_hwmon_labels[] = {
+	"core",
+	"sdram_c",
+	"sdram_i",
+	"sdram_p",
+};
+
 static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 {
 	u32 new_uv, old_uv, value;
@@ -56,6 +65,21 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
 }
 
+static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
+				    long *val)
+{
+	struct rpi_firmware_get_voltage_request packet =
+		RPI_FIRMWARE_GET_VOLTAGE_REQUEST(id);
+	int ret;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
+				    &packet, sizeof(packet));
+	if (ret)
+		return ret;
+
+	*val = le32_to_cpu(packet.value) / 1000;
+	return 0;
+}
+
 static void get_values_poll(struct work_struct *work)
 {
 	struct rpi_hwmon_data *data;
@@ -77,19 +101,94 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
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
+		if (channel >= ARRAY_SIZE(rpi_hwmon_labels))
+			return -EOPNOTSUPP;
+
+		*str = rpi_hwmon_labels[channel];
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	const struct rpi_hwmon_data *data = _data;
+
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			if (!(data->valid_inputs & BIT(channel)))
+				return 0;
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
@@ -101,6 +200,7 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_hwmon_data *data;
+	long voltage;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -110,6 +210,26 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	/* Parent driver assure that firmware is correct */
 	data->fw = dev_get_drvdata(dev->parent);
 
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_CORE,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(0);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_C,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(1);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_I,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(2);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_P,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(3);
+
 	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
 							       data,
 							       &rpi_chip_info,
@@ -159,6 +279,7 @@ static struct platform_driver rpi_hwmon_driver = {
 module_platform_driver(rpi_hwmon_driver);
 
 MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
+MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
 MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:raspberrypi-hwmon");
-- 
2.54.0

