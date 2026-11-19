Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118137;
	b=3wxFsVWuIKEpg+ZmTsJhrrwuIseUGqYx6B9A/Ow+tsWEYTJvu2cj90tDx4+NA6QPJXoF
	 gNV0zyQSaS3U6dsMJhHpuP/0GBP7pd5TFHRHU2TEHQsOAnSaH+eB3fWp+tQH0tiH+whDe
	 jHyJ4MzqrcqAw2/6W4mMkcs/ehTkYEZ3rGJKdhf+FqUrxcICnP7JFOZKsHPpYnBW1Pa6+
	 6LbONe7htvlxTb30Mm6zGWhdr29TDPcu+u60tM9nIyGVNuNG7IuXUXHRDJM3GRc9kOBEs
	 i4JCivOnETEutWcIKe3s1eg1E20UdjiHnVPZzajWOapP+jzoB78OnClu1XULttUK7Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G7bs/s+TqYFxvvyPa5R6j9Pvb+Edlkz05qUHpzm0mzY=;
	b=tPgX6721FpfrhN1JDyjfrtqRF0VWw20hW2S+4Rkq947KSN/WMI8WaUu8MD3agsUEtmAS
	 16wAMiN/vAI1q9H1HSSCyw1WIjWsOU0TUgzycXJqZDIMaivPtBjgfZpEhl3U0xQ1CuRoj
	 24UVF+tD60yOPL8FJRqlD8SWRXd1S9t+VlHya1j1acVk4cckAbF0sGPzkewVWs62AF07G
	 vM+SfbbXitt1lgjxBemInM8ibFIu1mIFkY9XMO4r8lFZ+fxQUiklmeBJwaiTpk9p0LXuA
	 EH6hyxB4PTb6zCSgfanBeGRnRUMoSfjEdjo6N09nY/YL94tvretXdkUEqHA9/9fbBzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7UTeuc7;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B98606A339
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B98606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7UTeuc7
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so53128f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 11:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118135; x=1795722935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7bs/s+TqYFxvvyPa5R6j9Pvb+Edlkz05qUHpzm0mzY=;
        b=h7UTeuc70OYOQ1HXBYW+U29zxObQp5knIO1x8xCvK48gm9/6pLVY+Or7NJ+3CkfYZn
         RzBpyqnx6QFIvpEPq+7nN9b2obJwRJERDDg3lOSfjhZFq6XG5pzfbOVW/LN6TKjxo/sy
         pRkalEgEEUqnS8we4Q9dHIoHUOk2PbnqgKn2r9u/d8znUXViSIbp7ygF42QqRR92y4QP
         bkkHbPqki0iCcD4+Ze8PkU3Jl8mAxnJc4eaZtquEMiNgEGNtJYJEM7IJTInZPCSy9rJm
         nCletJNFABzXlt3/OzB4Vr8Y1Fr4Z8+Vkj2FpJ3zniLCrbXlLc7FffSQVwRk0sqExfSy
         x6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118135; x=1795722935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7bs/s+TqYFxvvyPa5R6j9Pvb+Edlkz05qUHpzm0mzY=;
        b=Ctgc4Kxxf9GhrY08Y8PPJ+qfxkedTekFHpPqp8linnwekHmhOpyx1VGFjGNiK1IS5T
         n5ltKxjSJ1XjztmzzX/RfAm1nr02/rus6ETLxqkSLlMsB38tWXJf8W+5IwHCCRBbjyBG
         4V2FtK7FQA8nvnSUpY9Dq2+r6cOX3LdVGBEF5iBQjUGtTR7gg1BQcRWMSz7EtceAH5RD
         YtbXqDsC0CVYY35NyWkIpPVLUIhLF1vfMVnnGKo4xC0xMnmFP2ec6/RksP5I9zDl+fOe
         UU7C+Wj0t84REhsbO77Y2l3dofXX7rsgs5UwjMx1OSnA7ONrdjwlV/2JXxSqzEakjKio
         ZK9g==
X-Forwarded-Encrypted: i=1; AL+hErH0FQNJKi8n9ofEQB39dNckSU1R6egMTEGgJFZ/MlSEvDbVy5kK7PoAL3kQSw9Ja05dGGxvAJFCQJ8hSA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8aVApNdR99gwZW5jtnotn15NfCdsgDtTHpy3Eyxv/xKQokwlMF
	PpEcTH4nxj9P4in6CGch5LUP25ERoJamfqTg2x2oXb45Yrgiuk0EkCOq
X-Gm-Gg: AZFdTZfI57TqTAqjPgWibylZsavxCcD8V4olAuvqlRyg1EuTkFrHdmsRNx9i2jg2FSv
	bLn1ID6ASZjFjzwM9I3cLLfGgft5yXT8mCvwP093w8/x2T/SX2ELVKS5ot83OrOE0PuBJgOnOLE
	KaN86CsqW+rVXPFCebGW4JIuuSpJ6qI+86d5lnSHta0K7UURgDr5pz7+RsCtkxH6ncJf2m6JHMH
	19ewVe7FBxp+q6yvxnX1+SFyO4/nAI6jw92n09PLrNf4EPCizdXICAzVZbTcExh9Dt0hWMwvtdy
	wrIWPoZtBgaTPOEZu9H9WIQCGAMenSC0TV2DvyAGUYO8j6abSNu3r8x/jKrZ0iAUg3LiIQg7ort
	hzC+51pgS6ysAKe9jsFhux8wI1DUZe7nOykR16waOlPkSDM8VJVUe2Is5JXggB9IDR3cnXDy6l1
	265Kl4iTJvvBAimQqXaAk1UnbFv3MTvKwJM4eZPR3rKKOW1mIuvjTCwRknOzfxwjSQdNt+PF/+4
	lv0vGawuleOVgGyVg0VhGScXOMHU7vrEh5jpUMpBVJTVt5x6h+v5X6+OqERTmRkUxPI/n9Fsijz
	OE2Eh9OUzd7rTJvkXK6X49zS6y5VX3uHTwB2mjhtTXMNJ939JJKv6eXEEnfsS5oAVM9OZQyu00i
	+GZsBUko5fdYv07g=
X-Received: by 2002:a05:6000:4310:b0:4a7:b365:19df with SMTP id ffacd0b85a97d-4abb5eabd28mr816894f8f.35.1795118134710;
        Thu, 19 Nov 2026 11:55:34 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1442434f8f.33.2026.11.19.11.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:55:34 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:55:30 +0100
Subject: [PATCH v4 1/2] hwmon: add Raspberry Pi PMIC driver
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-hwmon-da9091-v4-1-0d6e345c3666@gmail.com>
References: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13852;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=nfrJxbeaJNu8bXTkxb2+ETQWMhVkZREkCro9tACw7y8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1Q1snHwXP4jn/Pm0eptAW2VaSX57flO7/J9k
 nroLAe7t+CJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9UNQAKCRB4zXhFDAXI
 Z36ED/91vCesNPc5+QU0rFRKM//DSqGKgPWXXK8mWxruiy1c4WrnnC0P80XiWhLxMdl/dRXUOwP
 goWkYS1FxTT5/6DTSKEqQM+Xxpo64OgWK2MGjq/Lopt71CNI3OPgrz8NEWrf3vdRcwwGwpehxs9
 67Q4jiG78WT3ZJyKI8Aup3hnqySQjFzEDQLnxdEBfZjeh41QmYTjRLtNaLHqrapVsj7l0iUNi+E
 uDSXGpPnmgToM75wF5nrm94FGxvgOAxcQxJLj5AZ27u2VqDl2rGbZfpGwhTpOOe8nnair4rfdKa
 W0BAyTOP+4Wb2bXNy02kjM1QU5j4hhMbptW4B+DULqIXmYgYpuyWXKF6YjOk3HrkUOr4lcaYVj8
 1bLchzryAgbSZbH5izfAzZjs4PrVT9Yo3/3nD1yeD7St0wOn4iM1IoKsyFiHBGt6osSvH4y0M60
 GAlk6/vIV3JP34Yk8Dd58Yvw9l5AFVkOSiLLBK7O2dGtsJSzFEnuc6KUBN/70UJ3z3kw6+DXh4d
 G8D5G738+KwXGnQTlNmsHBDKHYpgRc+ja7dbxwTAex18auJVePWQRhwCeBuBkA0QAvNiIPFxo4g
 pOQ4uKbvE9+EHro+ikqRVsW2VxisoU38LofdqPOzSZi0DQ1qPwgCEp2EEnXV4XM2kLp2yHo8dbW
 5y2D9Mr722zDO5A==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add a hwmon driver for the PMIC found on the Raspberry Pi 5.
The PMIC exposes voltages, currents and temperatures exclusively
through the VideoCore firmware mailbox interface (property
0x0003009f).

Requires a sufficiently recent Raspberry Pi firmware that
implements the structured PMIC ADC property.

The driver:
- is instantiated at runtime by the raspberrypi-firmware driver
  (same pattern as the Pi 5 RTC driver)
- reads all channels in a single batch mailbox call
- uses a short refresh-on-read cache
- exposes the sensors via the standard hwmon sysfs interface

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 Documentation/hwmon/index.rst                  |   1 +
 Documentation/hwmon/raspberrypi-pmic-hwmon.rst |  49 ++++
 drivers/hwmon/Kconfig                          |  11 +
 drivers/hwmon/Makefile                         |   1 +
 drivers/hwmon/raspberrypi-pmic-hwmon.c         | 296 +++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h     |   1 +
 6 files changed, 359 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c9018fb4b009..41b7da5a19ea 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -245,6 +245,7 @@ Hardware Monitoring Kernel Drivers
    q54sj108a2
    qnap-mcu-hwmon
    raspberrypi-hwmon
+   raspberrypi-pmic-hwmon
    sbrmi
    sbtsi_temp
    sch5627
diff --git a/Documentation/hwmon/raspberrypi-pmic-hwmon.rst b/Documentation/hwmon/raspberrypi-pmic-hwmon.rst
new file mode 100644
index 000000000000..000d85359515
--- /dev/null
+++ b/Documentation/hwmon/raspberrypi-pmic-hwmon.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver raspberrypi-pmic-hwmon
+=======================================
+
+Supported boards:
+
+  * Raspberry Pi 5 Model B
+  * Raspberry Pi Compute Module 5
+  * Raspberry Pi 500
+  * Raspberry Pi 500+
+
+Author: Sander Speetjens <sander.speetjens@gmail.com>
+
+Description
+-----------
+
+The Raspberry Pi 5 uses a PMIC that monitors supply voltages,
+currents and internal temperatures. These sensors are accessed
+via the VideoCore firmware mailbox (property 0x0003009f).
+
+This driver registers with the firmware device at runtime and exposes
+the ADC readings through the standard hwmon sysfs interface. All
+channels are read in a single mailbox transaction and cached for a
+short interval so concurrent or repeated sysfs reads do not generate
+excessive firmware traffic.
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr[1-12]_input	Current in milliamps
+curr[1-12]_label	Current rail name
+in[0-13]_input		Voltage in millivolts
+in[0-13]_label		Voltage rail name
+temp[1-9]_input		Temperature in millidegrees Celsius
+temp[1-9]_label		Temperature sensor name
+======================= ======================================================
+
+Current and voltage labels follow the firmware naming (e.g. 3V3_SYS,
+VDD_CORE, EXT5V, BATT). Temperature labels are TEMP1–TEMP8 and TEMP_BG
+(bandgap reference).
+
+Notes
+-----
+
+The driver depends on Raspberry Pi firmware that implements the
+structured PMIC ADC property (0x0003009f). Older firmware will cause
+probe to fail when the property is unavailable.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index bd408fc6f876..58b7dff5e636 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2076,6 +2076,17 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
+config SENSORS_RASPBERRYPI_PMIC
+	tristate "Raspberry Pi PMIC monitor"
+	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
+	help
+	  If you say yes here you get support for the PMIC
+	  voltage, current and temperature sensors on the Raspberry Pi 5,
+	  accessed via the firmware mailbox interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called raspberrypi-pmic-hwmon.
+
 config SENSORS_SL28CPLD
 	tristate "Kontron sl28cpld hardware monitoring driver"
 	depends on MFD_SL28CPLD || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index dfb6fa4d4492..5dbc6b864f76 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -214,6 +214,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
+obj-$(CONFIG_SENSORS_RASPBERRYPI_PMIC) += raspberrypi-pmic-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
diff --git a/drivers/hwmon/raspberrypi-pmic-hwmon.c b/drivers/hwmon/raspberrypi-pmic-hwmon.c
new file mode 100644
index 000000000000..ce1f6bf0d70e
--- /dev/null
+++ b/drivers/hwmon/raspberrypi-pmic-hwmon.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Raspberry Pi 5 PMIC hwmon driver
+ *
+ * Reads voltages, currents and temperatures through the VideoCore
+ * firmware mailbox property
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
+#define RPI_PMIC_NUM_CHANNELS	35	/* 0..34 */
+#define RPI_PMIC_CACHE_MS	500
+
+struct rpi_pmic_data {
+	struct rpi_firmware *fw;
+	u32 values[RPI_PMIC_NUM_CHANNELS];
+	u64 last_update;
+};
+
+struct rpi_pmic_adc_msg {
+	__le32 index;
+	__le32 length;
+	__le32 values[RPI_PMIC_NUM_CHANNELS];
+} __packed;
+
+static const char * const rpi_pmic_labels[RPI_PMIC_NUM_CHANNELS] = {
+	/* Currents 0-7 */
+	[0]  = "3V7_WL_SW",
+	[1]  = "3V3_SYS",
+	[2]  = "1V8_SYS",
+	[3]  = "DDR_VDD2",
+	[4]  = "DDR_VDDQ",
+	[5]  = "1V1_SYS",
+	[6]  = "0V8_SW",
+	[7]  = "VDD_CORE",
+	/* Voltages 8-15 */
+	[8]  = "3V7_WL_SW",
+	[9]  = "3V3_SYS",
+	[10] = "1V8_SYS",
+	[11] = "DDR_VDD2",
+	[12] = "DDR_VDDQ",
+	[13] = "1V1_SYS",
+	[14] = "0V8_SW",
+	[15] = "VDD_CORE",
+	/* More currents / voltages */
+	[16] = "0V8_AON",
+	[17] = "3V3_DAC",
+	[18] = "3V3_ADC",
+	[19] = "0V8_AON",
+	[20] = "3V3_DAC",
+	[21] = "3V3_ADC",
+	[22] = "HDMI",
+	[23] = "HDMI",
+	[24] = "EXT5V",
+	[25] = "BATT",
+	/* Temperatures 26-34 (µ°C) */
+	[26] = "TEMP1",
+	[27] = "TEMP2",
+	[28] = "TEMP3",
+	[29] = "TEMP4",
+	[30] = "TEMP5",
+	[31] = "TEMP6",
+	[32] = "TEMP7",
+	[33] = "TEMP8",
+	[34] = "TEMP_BG",
+};
+
+/* Firmware ADC indices for each hwmon channel */
+static const u8 rpi_pmic_curr_idx[] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 22
+};
+
+static const u8 rpi_pmic_in_idx[] = {
+	8, 9, 10, 11, 12, 13, 14, 15, 19, 20, 21, 23, 24, 25
+};
+
+static const u8 rpi_pmic_temp_idx[] = {
+	26, 27, 28, 29, 30, 31, 32, 33, 34
+};
+
+static int rpi_pmic_update(struct rpi_pmic_data *data)
+{
+	struct rpi_pmic_adc_msg msg = {
+		.index  = cpu_to_le32(0),
+		.length = cpu_to_le32(RPI_PMIC_NUM_CHANNELS),
+	};
+	int ret;
+	unsigned int i;
+
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_PMIC_ADC,
+				    &msg, sizeof(msg));
+	if (ret)
+		return ret;
+
+	/* Sanity-check the response */
+	if (le32_to_cpu(msg.length) != RPI_PMIC_NUM_CHANNELS)
+		return -EIO;
+
+	for (i = 0; i < RPI_PMIC_NUM_CHANNELS; i++)
+		data->values[i] = le32_to_cpu(msg.values[i]);
+
+	data->last_update = get_jiffies_64();
+	return 0;
+}
+
+static int rpi_pmic_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct rpi_pmic_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (time_after64(get_jiffies_64(),
+			 data->last_update + msecs_to_jiffies(RPI_PMIC_CACHE_MS))) {
+		ret = rpi_pmic_update(data);
+		if (ret)
+			goto out;
+	}
+
+	switch (type) {
+	case hwmon_in:
+		*val = data->values[rpi_pmic_in_idx[channel]] / 1000;	/* µV → mV */
+		break;
+	case hwmon_curr:
+		*val = data->values[rpi_pmic_curr_idx[channel]] / 1000;	/* µA → mA */
+		break;
+	case hwmon_temp:
+		*val = data->values[rpi_pmic_temp_idx[channel]] / 1000;	/* µ°C → m°C */
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+out:
+	return ret;
+}
+
+static int rpi_pmic_read_string(struct device *dev,
+				enum hwmon_sensor_types type, u32 attr,
+				int channel, const char **str)
+{
+	size_t idx;
+
+	switch (type) {
+	case hwmon_in:
+		idx = rpi_pmic_in_idx[channel];
+		break;
+	case hwmon_curr:
+		idx = rpi_pmic_curr_idx[channel];
+		break;
+	case hwmon_temp:
+		idx = rpi_pmic_temp_idx[channel];
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*str = rpi_pmic_labels[idx];
+	return 0;
+}
+
+static umode_t rpi_pmic_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		if (channel < ARRAY_SIZE(rpi_pmic_in_idx) &&
+		    (attr == hwmon_in_input || attr == hwmon_in_label))
+			return 0444;
+		break;
+	case hwmon_curr:
+		if (channel < ARRAY_SIZE(rpi_pmic_curr_idx) &&
+		    (attr == hwmon_curr_input || attr == hwmon_curr_label))
+			return 0444;
+		break;
+	case hwmon_temp:
+		if (channel < ARRAY_SIZE(rpi_pmic_temp_idx) &&
+		    (attr == hwmon_temp_input || attr == hwmon_temp_label))
+			return 0444;
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_ops rpi_pmic_ops = {
+	.is_visible	= rpi_pmic_is_visible,
+	.read		= rpi_pmic_read,
+	.read_string	= rpi_pmic_read_string,
+};
+
+static const struct hwmon_channel_info * const rpi_pmic_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/*  8 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/*  9 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 10 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 11 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 12 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 13 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 14 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 15 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 19 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 20 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 21 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 23 */
+			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 24 */
+			   HWMON_I_INPUT | HWMON_I_LABEL	/* 25 */
+	),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  0 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  1 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  2 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  3 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  4 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  5 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  6 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  7 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 16 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 17 */
+			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 18 */
+			   HWMON_C_INPUT | HWMON_C_LABEL	/* 22 */
+	),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 26 TEMP1 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 27 TEMP2 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 28 TEMP3 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 29 TEMP4 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 30 TEMP5 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 31 TEMP6 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 32 TEMP7 */
+			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 33 TEMP8 */
+			   HWMON_T_INPUT | HWMON_T_LABEL	/* 34 TEMP_BG */
+	),
+	NULL
+};
+
+static const struct hwmon_chip_info rpi_pmic_chip_info = {
+	.ops	= &rpi_pmic_ops,
+	.info	= rpi_pmic_info,
+};
+
+static int rpi_pmic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rpi_pmic_data *data;
+	struct rpi_firmware *fw;
+	struct device *hwmon_dev;
+	int ret;
+
+	fw = devm_rpi_firmware_get(dev, dev->parent->of_node);
+	if (!fw)
+		return -EPROBE_DEFER;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->fw = fw;
+
+	ret = rpi_pmic_update(data);
+	if (ret)
+		return -ENODEV;
+
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(dev,
+						     "rpi_pmic", data, &rpi_pmic_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct platform_device_id rpi_pmic_id[] = {
+	{ "raspberrypi-pmic-hwmon", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, rpi_pmic_id);
+
+static struct platform_driver rpi_pmic_driver = {
+	.probe = rpi_pmic_probe,
+	.driver = {
+		.name = "raspberrypi-pmic-hwmon",
+	},
+	.id_table = rpi_pmic_id,
+};
+module_platform_driver(rpi_pmic_driver);
+
+MODULE_AUTHOR("Sander Speetjens <sander.speetjens@gmail.com>");
+MODULE_DESCRIPTION("Raspberry Pi 5 PMIC hwmon driver");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 20141eb2cb67..90d7b66b96e3 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -84,6 +84,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
+	RPI_FIRMWARE_GET_PMIC_ADC =                           0x0003009f,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,

-- 
2.56.1

