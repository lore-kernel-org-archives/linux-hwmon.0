Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919973;
	b=bWJeNC1SwTaBAmnBFQzOQD5caKJKqPXJGwn3kLA6O0NGbTpJG6iwRS/uySh7Af1CXNSK
	 UszDNb/1uuQ8xhht01h3aiOMrVYrdd26vXi4EFFB7+iSoVIebS3cFER6Xhie+wXVy4Q09
	 pOEKZ0BjnOapNAvvfxHzUPgex8vcuqvimFWMZzQu+MqyAG8TLhm2gfAMg5+ZqY04SZs3p
	 z2/LHMonKJmFGJAU903wpmm0IC91xnKECBVSpy82nMo80gEynu0Wxr5YcjB2HtTXr9g/1
	 2JKaIrwaX7chY5oUNNaijlVeQwVwZiYdNIuOuUK4AL83pyGYk/UP9KkjY+eJRPNixWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sz0ZlAw2+5aOAdfuwIAUOxpOF2hZr90UPLH+Un02zA0=;
	b=jK939TMnJAJ2xgCycGRfM96iXHUv0CaMPaqxsZPCiSEzBJYIlU1rU1Y7D2dqMqg1aZP8
	 8L/piK93uBA/tkJsMBy5GW6rl/HNg9rgosQOkMVL3J0TtNL4tCYD5VjwpNax0ZRJnMq8q
	 dXAn64GYDbf08J9zcipqjkzZpCEGj3pQdVSLDjmxPN8XJMDRoE8VbIlDibwyU8DZP4ESL
	 owR7HAOegPVRBi3YH4onoejvjcYWLuJinkyOjvdpP46kImWF+GB5A68VsKwYG9zl7dO6J
	 BAzeSdOd84Cvt1g0E6U3/ootnichNJ0wq8BMRxHXD4Z3ahAwMoFcSzv0YMOLraRU+jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4OeWj2p;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F4606A33D
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 12:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90F4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4OeWj2p
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso47555775e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 04:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919971; x=1795524771; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sz0ZlAw2+5aOAdfuwIAUOxpOF2hZr90UPLH+Un02zA0=;
        b=G4OeWj2pAcWK8Gq4EIkg9YizKAjkKQpxxbUCrgE7p0r3QvedXjJTpqYhoUo2mrewbh
         rt7jHEpCfJsN3RASTLl9PlRMr3AQN4ER95HW7HaJ/OxmG0SnEnE6BNcmZFpQdYawpmxc
         RKkUcWMmd/qZ98zk9K10v4mWRbBPyiXIzHBJMIcgHPx1ZwfW9G5HDFC90DutQ7ND9UUt
         GbJ3DIOLJmX0e4ywNLbc1uR2qtscDGEsDo/RFHTX4hYsDontozTXVlvM1JRH8eyLgIqZ
         R2k4yz3gH/1qXOvb04y5UDG8U6y1yfpPoOhwn5ghQTfi7N2cwIxR/1pn4BbhDnxbFZHW
         cbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919971; x=1795524771;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sz0ZlAw2+5aOAdfuwIAUOxpOF2hZr90UPLH+Un02zA0=;
        b=qIQt9WjMYXMjQlpqhMM/GWQmwCuPKXwmB6k+6MmIopBxeI0AT4IzcFMTB/nQ+71r3c
         CtQb/k9bdzjVmXVxU4ocekvjioPyeEUIgjoreXsDL+bxGO9aFS7xXo0SF4djlZ8UrIs0
         ua0FF6/JDhdu6YwRtgMOlRTcfRDkk6OxD7kVsncT9Wl/KjmbfpJSTznhwBtXtuPWSHpI
         02iaOTinqhDfqzY7ZXx0Aw1UT75vT+ebyPP1yXnAzSLGU/UhMF1vLFB8GKJYV3+lGH1l
         aethVCQkd3OMKVlCq7qKYhbL4z1JJd0WJsn9YaXI0muA6AnySAFTcZhPIkim1VpJkpAP
         Mm0w==
X-Forwarded-Encrypted: i=1; AL+hErFmfxoQBcsPPV5/gHmvsq3mBKDOm/BXgPMfkXKGCsnhpfeBBFgUJ90x/wjSqw8vkrOc1cnsb7BI5+NRjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbfiaBh/aLbdc4jnz+z48XLwjl//1pxT3po/+IHdSYMGFP1GH
	T104J8wknI3Vz+3vM1KRwxzCiZu7lOIn50fUfim0c5bnAdDhifhCX9Rf
X-Gm-Gg: AYBFou0JxjZJA/J+0W0VWPl8B6HF/Z122Tvgy7Sa24QZDnspjZoatwr9hSkD1rcTLHb
	yAO3xKlTNbERrk8RgrJogbFEEpE1Oz5VkXcYodRFCdYV0TrC9ETP2j+ObIsrEtf7Hy92zTHFP6G
	+5vpGqF+3rSqjHM0CTWvu4eNLMuq47e2Kw3WtacWupqY+XwkVMGxo7vaZl5gxoPyAl5+34XBzV3
	4pINMiBfthn3uoX03yFDa59voCvNXepQDbixyAlYB9RCKV277VY5Qz7aauvDrn5Sy5sO9GX1zxe
	nPYLFX6YWQ+aRFTybBFkmAMD2b43RK+1nBuU72+kscLq1ALXKZig83JmyS9/GGoSyZcjN7+J10D
	k0c2p1BTdCPCdWb6EPSu4jEvbcBP/ImGwTkoThiAcj4tr2iUut5PluMuTBkI6kwgJYHLmoGRJHR
	Ht7ppboKKj9F/ycdXpuWBZBF2po+6JYSQMFIGkQZtjJBn7pJXhg1DNdbWVANdG/V6UTaWPfLgaO
	z5wQSzfGV3AwlvqMTNcW9dbGWcsrT6dv13fjc3y+6aMqakccEtKBbVwH1x7qha6eg331J9El4zd
	/HwkA1eYfuto2cY2zwSVzJpxGMD4Gv/lxr8WWNMWqMyM/IkL8h8wB9+q3K2ETAZqR859SSedMyy
	YMbnZciW/4tO4ZYo=
X-Received: by 2002:a05:600c:1c03:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb55a42fe4mr311692745e9.5.1794919970862;
        Tue, 17 Nov 2026 04:52:50 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm80628985e9.2.2026.11.17.04.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:52:50 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 17 Nov 2026 13:52:43 +0100
Subject: [PATCH] hwmon: add Raspberry Pi DA9091 PMIC driver
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
Message-Id: <20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yWMy27DIBBFfwXNOsQeWtvAsr9RZcFjbI9UQwK4t
 RTl36sku3OPdM8dKhWmClbcodAvV84JrMCTgLC6tJDkCFaA6tWIiJNc/7acZHSmNygnR+TCGDX
 NGk4CroVmPl6578t7F7rtXLm9JXhXSYa8bdysGGZlInqt0Q1xQD2pj0mZPgyEMxqtR+eU+Yz+m
 X4dWyGyYm3tWm3XLdzW3Z9D3rqvkl18Qm3+h9N+nBduItHR4PJ4/AMnFFpI5gAAAA==
X-Change-ID: 20261117-hwmon-da9091-7aeeac6d8ef8
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15730;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=/gMXdPBCfOQh9IbSYkreX6tIcjroQVWotuor+jn1UCE=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/E4hyrtsgetYYJQDvB9k3bYNckcqFmwMOgGhA
 B2lNCzz4r6JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavxOIQAKCRB4zXhFDAXI
 Z2MAD/9EdWkyRH1G4LTQWUNXcvFvrduFH1zxVxM8RwCr2QfIG7fntD49Q5VRknXKWFUYww/RrHr
 mb1TsUJXDr+V8xjzJ3ALBsRtmVE2HCTlzx+pbQuJj4PZzGWQnZK9cj0NwHQG8ADYeXQpM9/JfeZ
 OfaSHrh81RKeO1K+OXnk9Im6EpT5wn/OLgcgUpoiCafVNuccTmIQVEPEpLy0Y2L4Yl2gQWv/G7b
 +bVogkcckAd/5+WePnafetzeadVG42S8Qyq2MzLKl4I2u8jos3fSA144DOGnKT9LsuYWWMBDI36
 dmNSipz1PVqs9sXPdIStqMWd4/PaBmYSJoSTp+kLgcMSfpyFzJYaGk4iCFH9sXhlIaB1GpbQjjq
 kGZ+dZAzjJ9TDkweFkDyuC9Pcv4cZBiw8i5Us7t9yZ+rtThsquUi5geCkzckUqLJCfMsgP/ikCz
 hVpyX6gLWoA9g2RNYJdp1Xv4FWBLri0HbpFGsHw+O6TLaNZwkf71hzW7z/ilJ3/AVXqyh+p5kB9
 lTWDElMcsbr6BFkFQ9VjiHwlWNOIuBLxTZj8w5ZuXgXiK2vBej4hQIyzQ7jJxCVoRPu6pX6X+40
 oh8/CwoZ1GVZJ+M6vL+LTzjfRgnMVHxvQ8IDPvhd95IiTmq9SUWSWNC/p/DPsLt/EiThLvbjqLQ
 +3T0RDAOCrXW/5g==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add a hwmon driver for the DA9091 PMIC found on the Raspberry Pi 5.
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
This patch adds an hwmon driver for the DA9091 PMIC used on the
Raspberry Pi 5.

The DA9091 exposes a set of voltage, current and temperature sensors.
Access is only available through the VideoCore firmware mailbox
interface; there is no direct register access from the ARM side.

A structured property tag (0x0003009f) was recently added to the
firmware. It returns the ADC values in binary form (index + length +
array of values), which is much cleaner for a kernel driver than
parsing the text output of the existing gencmd interface.

The driver follows the same instantiation pattern as the Raspberry Pi 5
RTC driver: the raspberrypi-firmware driver creates a platform device
at runtime, and this driver binds to it. All channels are read in a
single mailbox call and a short refresh-on-read cache is used.

The sensors are exposed through the standard hwmon sysfs interface so
tools such as `sensors`, collectd and node-exporter work without
modification.

Dependencies:
- Raspberry Pi firmware that implements property 0x0003009f
- CONFIG_RASPBERRYPI_FIRMWARE

Tested on a Raspberry Pi 5 with recent firmware.
---
 drivers/firmware/raspberrypi.c             |  21 ++
 drivers/hwmon/Kconfig                      |  11 +
 drivers/hwmon/Makefile                     |   1 +
 drivers/hwmon/raspberrypi-da9091.c         | 339 +++++++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h |   1 +
 5 files changed, 373 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 68512224e3ce..c6834dfa4dae 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -34,6 +34,7 @@ struct rpi_firmware {
 
 	struct platform_device *hwmon_dev;
 	struct platform_device *clk_dev;
+	struct platform_device *pmic_dev;
 	struct platform_device *rtc_dev;
 };
 
@@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 	fw->clk_dev = pdev;
 }
 
+static void rpi_register_pmic_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	struct platform_device *pdev;
+
+	/* Only present on Pi 5 (bcm2712) */
+	if (!(of_machine_is_compatible("brcm,bcm2712") ||
+	      of_machine_is_compatible("brcm,bcm2712-d0")))
+		return;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-da9091",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return;
+
+	fw->pmic_dev = pdev;
+}
+
 static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
@@ -371,6 +389,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev, fw);
+	rpi_register_pmic_driver(dev, fw);
 	rpi_register_rtc_driver(dev, fw);
 	rpi_register_reboot_mode(dev, fw);
 
@@ -395,6 +414,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	fw->hwmon_dev = NULL;
 	platform_device_unregister(fw->clk_dev);
 	fw->clk_dev = NULL;
+	platform_device_unregister(fw->pmic_dev);
+	fw->pmic_dev = NULL;
 	platform_device_unregister(fw->rtc_dev);
 	fw->rtc_dev = NULL;
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..ad5f23fb86ac 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2020,6 +2020,17 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
+config SENSORS_RASPBERRYPI_DA9091
+	tristate "Raspberry Pi DA9091 PMIC monitor"
+	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
+	help
+	  If you say yes here you get support for the DA9091 PMIC
+	  voltage, current and temperature sensors on the Raspberry Pi 5,
+	  accessed via the firmware mailbox interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called raspberrypi-da9091.
+
 config SENSORS_SL28CPLD
 	tristate "Kontron sl28cpld hardware monitoring driver"
 	depends on MFD_SL28CPLD || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..107bb5d29a94 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -211,6 +211,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
+obj-$(CONFIG_SENSORS_RASPBERRYPI_DA9091) += raspberrypi-da9091.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
diff --git a/drivers/hwmon/raspberrypi-da9091.c b/drivers/hwmon/raspberrypi-da9091.c
new file mode 100644
index 000000000000..a021ca596658
--- /dev/null
+++ b/drivers/hwmon/raspberrypi-da9091.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Raspberry Pi 5 DA9091 PMIC hwmon driver
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
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
+#define RPI_PMIC_NUM_CHANNELS	35	/* 0..34 */
+#define RPI_PMIC_CACHE_MS	500
+
+struct rpi_pmic_data {
+	struct rpi_firmware *fw;
+	struct device *hwmon_dev;
+	u32 values[RPI_PMIC_NUM_CHANNELS];
+	unsigned long last_update;
+	struct mutex lock; /* protects values[] and last_update */
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
+static int rpi_pmic_fw_index(enum hwmon_sensor_types type, int channel)
+{
+	switch (type) {
+	case hwmon_curr:
+		if (channel < 0 || channel >= ARRAY_SIZE(rpi_pmic_curr_idx))
+			return -EINVAL;
+		return rpi_pmic_curr_idx[channel];
+	case hwmon_in:
+		if (channel < 0 || channel >= ARRAY_SIZE(rpi_pmic_in_idx))
+			return -EINVAL;
+		return rpi_pmic_in_idx[channel];
+	case hwmon_temp:
+		if (channel < 0 || channel >= ARRAY_SIZE(rpi_pmic_temp_idx))
+			return -EINVAL;
+		return rpi_pmic_temp_idx[channel];
+	default:
+		return -EINVAL;
+	}
+}
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
+	// Sanity-check the response
+	if (le32_to_cpu(msg.length) != RPI_PMIC_NUM_CHANNELS)
+		return -EIO;
+
+	for (i = 0; i < RPI_PMIC_NUM_CHANNELS; i++)
+		data->values[i] = le32_to_cpu(msg.values[i]);
+
+	data->last_update = jiffies;
+	return 0;
+}
+
+static int rpi_pmic_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct rpi_pmic_data *data = dev_get_drvdata(dev);
+	int fw_idx = rpi_pmic_fw_index(type, channel);
+	int ret = 0;
+
+	if (fw_idx < 0)
+		return fw_idx;
+
+	mutex_lock(&data->lock);
+
+	if (time_after(jiffies,
+		       data->last_update + msecs_to_jiffies(RPI_PMIC_CACHE_MS))) {
+		ret = rpi_pmic_update(data);
+		if (ret)
+			goto out;
+	}
+
+	switch (type) {
+	case hwmon_in:
+		if (attr == hwmon_in_input)
+			*val = data->values[fw_idx] / 1000;	/* µV → mV */
+		else
+			ret = -EOPNOTSUPP;
+		break;
+	case hwmon_curr:
+		if (attr == hwmon_curr_input)
+			*val = data->values[fw_idx] / 1000;	/* µA → mA */
+		else
+			ret = -EOPNOTSUPP;
+		break;
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			*val = data->values[fw_idx] / 1000;	/* µ°C → m°C */
+		else
+			ret = -EOPNOTSUPP;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+out:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static int rpi_pmic_read_string(struct device *dev,
+				enum hwmon_sensor_types type, u32 attr,
+				int channel, const char **str)
+{
+	int fw_idx = rpi_pmic_fw_index(type, channel);
+
+	if (fw_idx < 0)
+		return fw_idx;
+
+	if ((type == hwmon_in   && attr == hwmon_in_label)   ||
+	    (type == hwmon_curr && attr == hwmon_curr_label) ||
+	    (type == hwmon_temp && attr == hwmon_temp_label)) {
+		*str = rpi_pmic_labels[fw_idx];
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t rpi_pmic_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	int fw_idx = rpi_pmic_fw_index(type, channel);
+
+	if (fw_idx < 0)
+		return 0;
+
+	switch (type) {
+	case hwmon_in:
+		if (attr == hwmon_in_input || attr == hwmon_in_label)
+			return 0444;
+		break;
+	case hwmon_curr:
+		if (attr == hwmon_curr_input || attr == hwmon_curr_label)
+			return 0444;
+		break;
+	case hwmon_temp:
+		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
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
+	mutex_init(&data->lock);
+	data->last_update = jiffies - msecs_to_jiffies(RPI_PMIC_CACHE_MS);
+
+	ret = rpi_pmic_update(data);
+	if (ret) {
+		dev_err(dev, "Failed to read PMIC ADC property: %d\n", ret);
+		return ret;
+	}
+
+	data->hwmon_dev =
+		devm_hwmon_device_register_with_info(dev,
+						     "da9091", data, &rpi_pmic_chip_info, NULL);
+	if (IS_ERR(data->hwmon_dev))
+		return PTR_ERR(data->hwmon_dev);
+
+	platform_set_drvdata(pdev, data);
+	dev_info(dev, "Raspberry Pi DA9091 PMIC hwmon registered\n");
+	return 0;
+}
+
+static const struct platform_device_id rpi_pmic_id[] = {
+	{ "raspberrypi-da9091", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, rpi_pmic_id);
+
+static struct platform_driver rpi_pmic_driver = {
+	.probe = rpi_pmic_probe,
+	.driver = {
+		.name = "raspberrypi-da9091",
+	},
+	.id_table = rpi_pmic_id,
+};
+module_platform_driver(rpi_pmic_driver);
+
+MODULE_AUTHOR("Sander Speetjens <sander.speetjens@gmail.com>");
+MODULE_DESCRIPTION("Raspberry Pi 5 DA9091 PMIC hwmon driver");
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

---
base-commit: 5f29d1b881a5d5187237290c5e1f19886aa294db
change-id: 20261117-hwmon-da9091-7aeeac6d8ef8

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>

