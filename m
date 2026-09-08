Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14FD59E32C
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892468; cv=none; b=l6B8TUh2cug5EwBMsWLWpkLnC3kqHfsKFqhY24rWvUOZm8GldGkl36C0cN/HYWKn3UqKLhRvtgK6UTbpNBm0eRDwMGbDXs0NXyiJ8rkyCfcfIRD2AIH1LHkMFmT76K+QKcZGCu8yBGw36r7ywqLMmB6wtBn7EIM/8tlvaS+VS6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892468; c=relaxed/simple;
	bh=0KoPpn/mCsrKJOQipuve0qJQDNEly/mYbM/GZxt7GlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A13FSI10/n9Qz7NCl56mHZXt0QHgW0Hy0m/mgz+K04lWb2OlcsGRIdUIQDS5aD5peb1wtlNXSXiuHW3nGhvK7Efs5o5OOTDJc6PqRwFVrfqN/N2IT/9i1tQOmcFvQkvaSAK3OQ5K+wQ79Xc/xe1QZoZNV6nXZTvA7m7/4BMQAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX95X54G; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX95X54G"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso48214695e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892459; x=1789497259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jzlr+JabOc7aRmharus669ifRObfngZQdovWKygW7l0=;
        b=QX95X54GtWKT8y0X4aT45DSI4G1uS0dPG6xObU5MkexLHvjpTejsHbs3IgG9oYDHTC
         bE0kLPySmEr7gxDIEPZH3q1aDxO9IPwKJ83CDenflVUD+RTVNysW8oL86oG8icLyGZ2D
         K0l4kHOYcWIJfURS8fuQe1m3s8ygOTaBjOdtHbfaiz7wnRP44lw+FOsrMc5+GkzO9sQh
         zdMiXtqm5KuCz8kuvORjqEletjP4UQ0nEj4uQt3/dHVKfxizbOxliV4VkvJ86iFhwGJQ
         jSwQMPAiXC0uwPXaSHhybfEd9s8XBOdPTxE9BO3uacWMYn7/7WRBUyjcXgD8S82N2HRW
         oPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892459; x=1789497259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jzlr+JabOc7aRmharus669ifRObfngZQdovWKygW7l0=;
        b=BgmqDkWg+mMspwVUhZqk0AVRRU3WBqBVt/TThq1Ap5elhjXKqPi9uXteRqi1fJPMs1
         tZcTNmlrZ6aF9oJBgbKmuxjMajy2CLcHFmCAYqb5knVVkDqpRn7pEE6hY3stWWYZpd7I
         zRF5yQUSGfR5rmN+LuP/jF/LcjT3DkqrJ6WxwQuWN7i/q7t82nSrygQeyHXVWXLw6xn3
         gNsFid6P5cumE3+sD3OBLObuL+uDpZgCx6ClAwX2XFa6KGed0s2nBnRlg7/42HiOHkkX
         XVyGJhMr3mc5zi+e2hbAketDkGWmCqMG3KVIUAd9/27OEI5eVXwSPLiKh1JUohq+gfku
         5r6g==
X-Forwarded-Encrypted: i=1; AKwUvBw8xHT1eUSTNpGRsPYE2+UfUtwVGI3luHHzHWwOUqvMpC+E0LsVUiDq7xlsJXuFwkXW9nwUMjwry2RyLQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m/rNv4mizTmZc+IWZCpOcIljzedeUv2WJcQfdc3G5vg9v/8qiC
	j+gYE+8vcp0Mm//XZYCzAZIIJ4Fq4RQixoIkU7gJTgIvWSdDwLIlgdvV
X-Gm-Gg: AYBFou2csYJ1/LVZAVr8V4lLkunguqk5l738VShvbmXifW8BdLP7QeGtfrwneSO8Eki
	/cH69UdU4BjhSQSsOqXjZ765zt9jb0Om9Dwe5vZWAwHs2Wzau3B6rCTrZGTwq2WK93Ht7hRcvDD
	usAC3QI7LgigUo2Yy5JZqfn6PJxkRBew98OlkO6ksIz+F6y94eMfDkphGJYDvRTxg4k54z4mIvL
	1smyiz5rkyWNlSPeqyQ4OsR8+hyJbrVJnRaIAHQwJlmUABV/0EPlvBtT7l3AXGK2yzU44o2h06F
	J/GgPTQYkV3ihoRyTFMJKZXguddA+yJd1++w8wLFYwAvGrF/N0VvzZAhL+d31DHgGOv28E5XrbU
	op3sQwYMp+jtq27T40jJaaRZ1NXn0mUBf0PAOJKbIfT6Zt0vT26mgV6KmJ2DTm6l/JDUOa+LhNv
	YKalC/qx4kMi4KmME9jpA2fX+Tjdw4z/Z0fmDrdJYSVMII7jCpFDMDYt5eQEvuRGj0/7HO6mXSS
	pekoHau5At4SydAhF42j6UW/NLq0h5W
X-Received: by 2002:a05:600c:83ce:b0:49c:fa20:cbff with SMTP id 5b1f17b1804b1-49cfa20cd37mr273811345e9.22.1788892458663;
        Tue, 08 Sep 2026 11:34:18 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm312095435e9.0.2026.09.08.11.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:18 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 2/2] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
Date: Tue,  8 Sep 2026 20:34:03 +0200
Message-ID: <20260908183403.2107-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183403.2107-1-okerixx@gmail.com>
References: <20260908183403.2107-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x Gen 11 (Qualcomm glymur / Snapdragon X2 Elite)
carries a Compal EF06 embedded controller on I2C at address 0x70. The
platform firmware describes it as an ACPI GenericSerialBus region, but the
machine boots from device tree, so nothing otherwise talks to it.

Commands are exchanged with two raw I2C block transfers: a 7 byte write to
register 0x02 carrying the command and up to six arguments, then a 6 byte
read of register 0x01 for the result, with a short delay in between before
the result register is valid.

Expose what the EC offers that the rest of the kernel does not already
provide:

  - five board thermistors as hwmon temperature channels. These are
    charger, CPU voltage regulator, 5 V rail and ambient sensors, not die
    sensors, and read considerably cooler than tsens
  - the four battery cell voltages, which live in a banked mailbox shared
    with other EC activity; readings are validated against a signature and
    retried, and cached briefly so that all four channels come from one
    coherent sample
  - CPU fan speed in RPM
  - the keyboard backlight as an LED, off/low/high
  - Fn-lock as a read/write sysfs attribute, matching the ideapad-laptop
    interface. The EC reports Fn+Esc as an event but keeps no state of its
    own, so the driver owns the bit and toggles it on the key
  - the mic-mute and airplane-mode keys as KEY_MICMUTE and KEY_RFKILL.
    These reach the host only as EC events; they are not on the keyboard's
    HID interface and have no GPIO of their own

The EC signals pending events on a dedicated line, and keeps pulsing it
until they are read - so the queue must be drained completely on every
interrupt, including codes this driver ignores. Leaving one behind makes
the controller pulse indefinitely.

Fan speed is reported but not controlled. The EC accepts a manual setpoint,
however it enforces no thermal floor over it: with the fan pinned at
roughly 2000 RPM under full load the SoC rose from 69 to 91 degrees in 30
seconds without the EC ever overriding. Exposing pwm1_enable or fan1_target
would therefore let userspace overheat the machine, so neither is
implemented.

Note this is the Gen 11 machine specifically. Its EC differs from the
Qualcomm reference EC that the reference designs place at address 0x76,
which is not populated here, and so EC_QCOM_HAMOA does not drive it.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec  |  21 +
 drivers/platform/arm64/Kconfig                |  23 +
 drivers/platform/arm64/Makefile               |   1 +
 .../arm64/lenovo-yoga-slim7x-gen11-ec.c       | 638 ++++++++++++++++++
 4 files changed, 683 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec b/Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
new file mode 100644
index 000000000000..901a8eca4c65
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
@@ -0,0 +1,21 @@
+What:		/sys/bus/i2c/devices/*/fn_lock
+Date:		August 2026
+KernelVersion:	7.3
+Contact:	"Oleg Keri <okerixx@gmail.com>"
+Description:
+		Control fn-lock mode.
+
+			* 1 -> Switched On
+			* 0 -> Switched Off
+
+		When switched on, the function keys act as F1..F12 and the
+		multimedia functions require the Fn modifier.
+
+		The embedded controller reports the Fn+Esc key as an event but
+		keeps no state of its own, so this attribute is the state: the
+		driver toggles it when the key is pressed, and writing it takes
+		effect immediately.
+
+		For example::
+
+		  # echo "0" > /sys/bus/i2c/devices/9-0070/fn_lock
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index e32e01b2a9bd..7581432e69b0 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -90,6 +90,29 @@ config EC_LENOVO_THINKPAD_T14S
 
 	  Say M or Y here to include this support.
 
+config EC_LENOVO_YOGA_SLIM7X_GEN11
+	tristate "Lenovo Yoga Slim 7x Gen 11 Embedded Controller driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	depends on INPUT
+	depends on HWMON
+	select NEW_LEDS
+	select LEDS_CLASS
+	help
+	  Say Y here to enable the EC driver for the (Snapdragon X2 Elite,
+	  glymur-based) Lenovo Yoga Slim 7x Gen 11 laptop. The EC provides
+	  thermistors, battery cell voltages and CPU fan speed as hwmon
+	  channels, and the keyboard backlight as an LED.
+
+	  This is the Gen 11 (glymur) machine specifically. Its EC is a Compal
+	  design at i2c address 0x70 and speaks a different protocol from the
+	  Qualcomm reference EC that the reference designs place at 0x76, so
+	  EC_QCOM_HAMOA does not drive it - and conversely this driver does not
+	  cover the X1E-based Yoga Slim 7x Gen 9.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-yoga-slim7x-gen11-ec.
+
 config EC_QCOM_HAMOA
 	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 7681be4a46e9..605cca4d42a9 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -9,4 +9,5 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
+obj-$(CONFIG_EC_LENOVO_YOGA_SLIM7X_GEN11) += lenovo-yoga-slim7x-gen11-ec.o
 obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
new file mode 100644
index 000000000000..b14e26bf40f8
--- /dev/null
+++ b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
@@ -0,0 +1,638 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm.h>
+#include <linux/string.h>
+
+#define YOGA_EC_BLOCK_READ	0x01
+#define YOGA_EC_BLOCK_WRITE	0x02
+#define YOGA_EC_RESP_LEN	6
+#define YOGA_EC_REQ_LEN		7
+
+#define YOGA_EC_CMD_RAM_READ	0xb0
+#define YOGA_EC_CMD_RAM_WRITE	0xb1
+#define YOGA_EC_CMD_BANK_READ	0xb4
+#define YOGA_EC_CMD_FAN		0x46
+#define YOGA_EC_FAN_GET_SPEED	0x81
+
+#define YOGA_EC_CMD_EVENT	0x84
+#define YOGA_EC_EVT_MAX_DRAIN	64
+#define YOGA_EC_EVT_FN_LOCK	0x0f
+#define YOGA_EC_EVT_MIC_MUTE	0x18
+#define YOGA_EC_EVT_FLIGHT_MODE	0x19
+
+#define YOGA_EC_SCUK		0x1c
+#define YOGA_EC_SCUK_FN_LOCK	BIT(7)
+#define YOGA_EC_SCUK_FN_LOCK_ON	0xa0
+#define YOGA_EC_SCUK_FN_LOCK_OFF	0x5f
+
+#define YOGA_EC_KBLT		0x03
+#define YOGA_EC_KBLT_LEVEL	GENMASK(1, 0)
+#define YOGA_EC_KBLT_AUTO	3
+#define YOGA_EC_KBLT_MAX	2
+
+#define YOGA_EC_TEMP_FIRST	0x12
+#define YOGA_EC_NUM_TEMP	6
+#define YOGA_EC_TEMP_MAX	120
+
+#define YOGA_EC_CELL_BANK	0x0b
+#define YOGA_EC_CELL_SIG_LO	0x02
+#define YOGA_EC_CELL_SIG_HI	0x0c
+#define YOGA_EC_CELL_FIRST	0x04
+#define YOGA_EC_NUM_CELL	4
+#define YOGA_EC_CELL_MIN_MV	2000
+#define YOGA_EC_CELL_MAX_MV	5000
+#define YOGA_EC_CELL_TRIES	30
+
+#define YOGA_EC_CACHE		(2 * HZ)
+#define YOGA_EC_STALE		(10 * HZ)
+
+struct yoga_ec {
+	struct i2c_client *client;
+	struct mutex lock;
+	unsigned long temp_present;
+	unsigned long cell_read_at;
+	u16 cell[YOGA_EC_NUM_CELL];
+	bool cell_cached;
+	struct led_classdev kbd_led;
+	u8 kblt_level;
+	bool kblt_restore;
+	struct input_dev *keys;
+};
+
+static int yoga_ec_command(struct yoga_ec *ec, u8 cmd, u8 arg0, u8 arg1,
+			   u8 resp[YOGA_EC_RESP_LEN])
+{
+	u8 req[YOGA_EC_REQ_LEN] = { cmd, arg0, arg1 };
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(ec->client, YOGA_EC_BLOCK_WRITE,
+					     sizeof(req), req);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(2000, 3000);
+
+	ret = i2c_smbus_read_i2c_block_data(ec->client, YOGA_EC_BLOCK_READ,
+					    YOGA_EC_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+	if (ret != YOGA_EC_RESP_LEN)
+		return -EIO;
+
+	return 0;
+}
+
+static int yoga_ec_ram_read(struct yoga_ec *ec, u8 addr, u8 *val)
+{
+	u8 resp[YOGA_EC_RESP_LEN];
+	int ret;
+
+	ret = yoga_ec_command(ec, YOGA_EC_CMD_RAM_READ, addr, 0, resp);
+	if (ret)
+		return ret;
+
+	*val = resp[0];
+	return 0;
+}
+
+static int yoga_ec_bank_read(struct yoga_ec *ec, u8 bank, u8 addr, u8 *val)
+{
+	u8 resp[YOGA_EC_RESP_LEN];
+	int ret;
+
+	ret = yoga_ec_command(ec, YOGA_EC_CMD_BANK_READ, bank, addr, resp);
+	if (ret)
+		return ret;
+
+	*val = resp[0];
+	return 0;
+}
+
+static int yoga_ec_ram_write(struct yoga_ec *ec, u8 addr, u8 val)
+{
+	u8 resp[YOGA_EC_RESP_LEN];
+
+	return yoga_ec_command(ec, YOGA_EC_CMD_RAM_WRITE, addr, val, resp);
+}
+
+static int yoga_ec_fan_read(struct yoga_ec *ec, long *rpm)
+{
+	u8 resp[YOGA_EC_RESP_LEN];
+	int ret;
+
+	ret = yoga_ec_command(ec, YOGA_EC_CMD_FAN, YOGA_EC_FAN_GET_SPEED, 0,
+			      resp);
+	if (ret)
+		return ret;
+
+	*rpm = resp[0] * 100;
+	return 0;
+}
+
+static int yoga_ec_refresh_cells(struct yoga_ec *ec)
+{
+	unsigned int try;
+	int ret;
+
+	if (ec->cell_cached &&
+	    time_before(jiffies, ec->cell_read_at + YOGA_EC_CACHE))
+		return 0;
+
+	for (try = 0; try < YOGA_EC_CELL_TRIES; try++) {
+		u16 cell[YOGA_EC_NUM_CELL];
+		u8 sig[3];
+		unsigned int i;
+		bool ok = true;
+
+		ret = yoga_ec_bank_read(ec, YOGA_EC_CELL_BANK,
+					YOGA_EC_CELL_SIG_LO, &sig[0]);
+		if (!ret)
+			ret = yoga_ec_bank_read(ec, YOGA_EC_CELL_BANK,
+						YOGA_EC_CELL_SIG_LO + 1, &sig[1]);
+		if (!ret)
+			ret = yoga_ec_bank_read(ec, YOGA_EC_CELL_BANK,
+						YOGA_EC_CELL_SIG_HI, &sig[2]);
+		if (ret)
+			return ret;
+
+		if (sig[0] != 0x01 || sig[1] != 0x01 || sig[2] != 0x03)
+			continue;
+
+		for (i = 0; i < YOGA_EC_NUM_CELL; i++) {
+			u8 lsb, msb;
+
+			ret = yoga_ec_bank_read(ec, YOGA_EC_CELL_BANK,
+						YOGA_EC_CELL_FIRST + i * 2, &lsb);
+			if (!ret)
+				ret = yoga_ec_bank_read(ec, YOGA_EC_CELL_BANK,
+							YOGA_EC_CELL_FIRST + i * 2 + 1,
+							&msb);
+			if (ret)
+				return ret;
+
+			cell[i] = lsb | (msb << 8);
+			if (cell[i] < YOGA_EC_CELL_MIN_MV ||
+			    cell[i] > YOGA_EC_CELL_MAX_MV)
+				ok = false;
+		}
+
+		if (!ok)
+			continue;
+
+		memcpy(ec->cell, cell, sizeof(cell));
+		ec->cell_cached = true;
+		ec->cell_read_at = jiffies;
+
+		return 0;
+	}
+
+	if (ec->cell_cached &&
+	    time_before(jiffies, ec->cell_read_at + YOGA_EC_STALE))
+		return 0;
+
+	return -EAGAIN;
+}
+
+static umode_t yoga_ec_is_visible(const void *drvdata,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	const struct yoga_ec *ec = drvdata;
+
+	switch (type) {
+	case hwmon_temp:
+		if (!(ec->temp_present & BIT(channel)))
+			return 0;
+		return 0444;
+	case hwmon_in:
+		return 0444;
+	case hwmon_fan:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static int yoga_ec_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct yoga_ec *ec = dev_get_drvdata(dev);
+	int ret;
+	u8 raw;
+
+	guard(mutex)(&ec->lock);
+
+	switch (type) {
+	case hwmon_temp:
+		ret = yoga_ec_ram_read(ec, YOGA_EC_TEMP_FIRST + channel, &raw);
+		if (ret)
+			return ret;
+		if (raw > YOGA_EC_TEMP_MAX)
+			return -EIO;
+		*val = raw * 1000;
+		return 0;
+	case hwmon_in:
+		ret = yoga_ec_refresh_cells(ec);
+		if (ret)
+			return ret;
+		*val = ec->cell[channel];
+		return 0;
+	case hwmon_fan:
+		return yoga_ec_fan_read(ec, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const char * const yoga_ec_temp_labels[YOGA_EC_NUM_TEMP] = {
+	"Charger A",
+	"CPU VR",
+	"5V rail",
+	"Ambient",
+	"Charger B",
+	"Thermistor 6",
+};
+
+static const char * const yoga_ec_cell_labels[YOGA_EC_NUM_CELL] = {
+	"Cell 1", "Cell 2", "Cell 3", "Cell 4",
+};
+
+static int yoga_ec_read_string(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		*str = yoga_ec_temp_labels[channel];
+		return 0;
+	case hwmon_in:
+		*str = yoga_ec_cell_labels[channel];
+		return 0;
+	case hwmon_fan:
+		*str = "CPU fan";
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static enum led_brightness yoga_ec_kbd_led_get(struct led_classdev *led)
+{
+	struct yoga_ec *ec = container_of(led, struct yoga_ec, kbd_led);
+	u8 raw;
+
+	guard(mutex)(&ec->lock);
+
+	if (yoga_ec_ram_read(ec, YOGA_EC_KBLT, &raw))
+		return 0;
+
+	raw = FIELD_GET(YOGA_EC_KBLT_LEVEL, raw);
+
+	if (raw == YOGA_EC_KBLT_AUTO)
+		return YOGA_EC_KBLT_MAX;
+
+	return raw;
+}
+
+static int yoga_ec_kbd_led_level(struct yoga_ec *ec, u8 level, u8 *old)
+{
+	u8 raw;
+	int ret;
+
+	ret = yoga_ec_ram_read(ec, YOGA_EC_KBLT, &raw);
+	if (ret)
+		return ret;
+
+	if (old)
+		*old = FIELD_GET(YOGA_EC_KBLT_LEVEL, raw);
+
+	raw &= ~YOGA_EC_KBLT_LEVEL;
+	raw |= FIELD_PREP(YOGA_EC_KBLT_LEVEL, level);
+
+	return yoga_ec_ram_write(ec, YOGA_EC_KBLT, raw);
+}
+
+static int yoga_ec_kbd_led_set(struct led_classdev *led,
+			       enum led_brightness brightness)
+{
+	struct yoga_ec *ec = container_of(led, struct yoga_ec, kbd_led);
+
+	guard(mutex)(&ec->lock);
+
+	return yoga_ec_kbd_led_level(ec, brightness, NULL);
+}
+
+static const struct hwmon_ops yoga_ec_hwmon_ops = {
+	.is_visible = yoga_ec_is_visible,
+	.read = yoga_ec_read,
+	.read_string = yoga_ec_read_string,
+};
+
+static const struct hwmon_channel_info * const yoga_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info yoga_ec_chip_info = {
+	.ops = &yoga_ec_hwmon_ops,
+	.info = yoga_ec_hwmon_info,
+};
+
+static int yoga_ec_fn_lock_toggle(struct yoga_ec *ec)
+{
+	u8 raw;
+	int ret;
+
+	ret = yoga_ec_ram_read(ec, YOGA_EC_SCUK, &raw);
+	if (ret)
+		return ret;
+
+	if (raw & YOGA_EC_SCUK_FN_LOCK)
+		raw &= YOGA_EC_SCUK_FN_LOCK_OFF;
+	else
+		raw |= YOGA_EC_SCUK_FN_LOCK_ON;
+
+	return yoga_ec_ram_write(ec, YOGA_EC_SCUK, raw);
+}
+
+static void yoga_ec_report_key(struct yoga_ec *ec, unsigned int code)
+{
+	if (!ec->keys)
+		return;
+
+	input_report_key(ec->keys, code, 1);
+	input_sync(ec->keys);
+	input_report_key(ec->keys, code, 0);
+	input_sync(ec->keys);
+}
+
+static irqreturn_t yoga_ec_irq(int irq, void *data)
+{
+	struct yoga_ec *ec = data;
+	unsigned int i;
+
+	guard(mutex)(&ec->lock);
+
+	for (i = 0; i < YOGA_EC_EVT_MAX_DRAIN; i++) {
+		u8 resp[YOGA_EC_RESP_LEN];
+
+		if (yoga_ec_command(ec, YOGA_EC_CMD_EVENT, 0, 0, resp))
+			break;
+		if (!resp[0])
+			break;
+
+		switch (resp[0]) {
+		case YOGA_EC_EVT_FN_LOCK:
+			yoga_ec_fn_lock_toggle(ec);
+			break;
+		case YOGA_EC_EVT_MIC_MUTE:
+			yoga_ec_report_key(ec, KEY_MICMUTE);
+			break;
+		case YOGA_EC_EVT_FLIGHT_MODE:
+			yoga_ec_report_key(ec, KEY_RFKILL);
+			break;
+		default:
+			break;
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void yoga_ec_register_keys(struct yoga_ec *ec)
+{
+	struct device *dev = &ec->client->dev;
+	struct input_dev *input;
+	int ret;
+
+	input = devm_input_allocate_device(dev);
+	if (!input) {
+		dev_warn(dev, "no memory for the hotkey device\n");
+		return;
+	}
+
+	input->name = "Lenovo Yoga Slim 7x hotkeys";
+	input->phys = "lenovo-yoga-slim7x-gen11-ec/input0";
+	input->id.bustype = BUS_I2C;
+	input_set_capability(input, EV_KEY, KEY_MICMUTE);
+	input_set_capability(input, EV_KEY, KEY_RFKILL);
+
+	ret = input_register_device(input);
+	if (ret) {
+		dev_warn(dev, "cannot register the hotkey device: %d\n", ret);
+		return;
+	}
+
+	ec->keys = input;
+}
+
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct yoga_ec *ec = dev_get_drvdata(dev);
+	u8 raw;
+	int ret;
+
+	scoped_guard(mutex, &ec->lock)
+		ret = yoga_ec_ram_read(ec, YOGA_EC_SCUK, &raw);
+
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", !!(raw & YOGA_EC_SCUK_FN_LOCK));
+}
+
+static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct yoga_ec *ec = dev_get_drvdata(dev);
+	bool enable;
+	u8 raw;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&ec->lock);
+
+	ret = yoga_ec_ram_read(ec, YOGA_EC_SCUK, &raw);
+	if (ret)
+		return ret;
+
+	if (enable)
+		raw |= YOGA_EC_SCUK_FN_LOCK_ON;
+	else
+		raw &= YOGA_EC_SCUK_FN_LOCK_OFF;
+
+	ret = yoga_ec_ram_write(ec, YOGA_EC_SCUK, raw);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(fn_lock);
+
+static struct attribute *yoga_ec_attrs[] = {
+	&dev_attr_fn_lock.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(yoga_ec);
+
+static int yoga_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon;
+	struct yoga_ec *ec;
+	unsigned int i;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_I2C_BLOCK))
+		return dev_err_probe(dev, -ENODEV,
+				     "adapter does not support SMBus block transfers\n");
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->client = client;
+	mutex_init(&ec->lock);
+	i2c_set_clientdata(client, ec);
+
+	for (i = 0; i < YOGA_EC_NUM_TEMP; i++) {
+		u8 raw;
+
+		ret = yoga_ec_ram_read(ec, YOGA_EC_TEMP_FIRST + i, &raw);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read thermistor %u\n", i);
+
+		if (raw > 0 && raw <= YOGA_EC_TEMP_MAX)
+			ec->temp_present |= BIT(i);
+	}
+
+	if (!ec->temp_present)
+		return dev_err_probe(dev, -ENODEV,
+				     "no thermistor reported a usable value\n");
+
+	dev_dbg(dev, "thermistors present: %#lx\n", ec->temp_present);
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "yoga_slim7x_ec", ec,
+						     &yoga_ec_chip_info, NULL);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	ec->kbd_led.name = "platform::kbd_backlight";
+	ec->kbd_led.max_brightness = YOGA_EC_KBLT_MAX;
+	ec->kbd_led.brightness_get = yoga_ec_kbd_led_get;
+	ec->kbd_led.brightness_set_blocking = yoga_ec_kbd_led_set;
+
+	ret = devm_led_classdev_register(dev, &ec->kbd_led);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register keyboard backlight\n");
+
+	if (client->irq) {
+		yoga_ec_register_keys(ec);
+
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						yoga_ec_irq, IRQF_ONESHOT,
+						"lenovo-yoga-slim7x-gen11-ec", ec);
+		if (ret)
+			return dev_err_probe(dev, ret, "cannot request the EC interrupt\n");
+
+		scoped_guard(mutex, &ec->lock) {
+			unsigned int i;
+
+			for (i = 0; i < YOGA_EC_EVT_MAX_DRAIN; i++) {
+				u8 resp[YOGA_EC_RESP_LEN];
+
+				if (yoga_ec_command(ec, YOGA_EC_CMD_EVENT, 0, 0, resp))
+					break;
+				if (!resp[0])
+					break;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int yoga_ec_suspend(struct device *dev)
+{
+	struct yoga_ec *ec = dev_get_drvdata(dev);
+
+	guard(mutex)(&ec->lock);
+	ec->kblt_restore = !yoga_ec_kbd_led_level(ec, 0, &ec->kblt_level);
+
+	return 0;
+}
+
+static int yoga_ec_resume(struct device *dev)
+{
+	struct yoga_ec *ec = dev_get_drvdata(dev);
+
+	guard(mutex)(&ec->lock);
+	ec->cell_cached = false;
+
+	if (ec->kblt_restore) {
+		ec->kblt_restore = false;
+		yoga_ec_kbd_led_level(ec, ec->kblt_level, NULL);
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(yoga_ec_pm_ops, yoga_ec_suspend, yoga_ec_resume);
+
+static const struct of_device_id yoga_ec_of_match[] = {
+	{ .compatible = "lenovo,yoga-slim7x-gen11-ec" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, yoga_ec_of_match);
+
+static const struct i2c_device_id yoga_ec_i2c_id[] = {
+	{ "yoga-slim7x-ec" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, yoga_ec_i2c_id);
+
+static struct i2c_driver yoga_ec_driver = {
+	.driver = {
+		.name = "lenovo-yoga-slim7x-ec",
+		.of_match_table = yoga_ec_of_match,
+		.dev_groups = yoga_ec_groups,
+		.pm = pm_sleep_ptr(&yoga_ec_pm_ops),
+	},
+	.probe = yoga_ec_probe,
+	.id_table = yoga_ec_i2c_id,
+};
+module_i2c_driver(yoga_ec_driver);
+
+MODULE_AUTHOR("Oleg Keri <ezhi99@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Yoga Slim 7x Gen 11 embedded controller");
+MODULE_LICENSE("GPL");
-- 
2.55.0

