Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514912;
	b=UZ65oNn7xAocej73MN+3HeCCAj/8MKtpXohu33vx+w7hPb4IDmDHC4i2zxw7a0yG1W9G
	 noDFz1JOQpoLyLkw6f65jiI7zk+mhZqqAJJWIxqInp7EOoPar2nGLbkvwRGxSbDONPMjB
	 fYhcUyWdrxAiok30T73iuDz7scIIDAHuYVXXimoEiK0aalUUgAqgGpuM4zLC2PxsVfRK3
	 t+THLU5wzUrsIlJHFP2MN0Xdfe8FmGQeaE/aBWpngWOm778LsuRi0STwePISjR9kLpu4D
	 liSvVrqKgAKCDvcjft8RDtAagobTrjuDcLf6rjMh0EPPKL5+QetXkTlNymf/J7r+xIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yOVnpJCUDrHS5XtDy2LVfYzH67VSMOqV48wcMc7eFu8=;
	b=x30mJ46esm4W8N8QI6BE5vPlmYSA+lB7DGSEA8/nvG1jiqRjBJ9P4NLNmBWSa9TXQPsd
	 6lt266oGw1fINrldzFcjGtRJbxZZSDJwNbHERt1lcfHEdcA0SjRP3F6S3SiumKo9bQg0h
	 OlD2mB2ujOCC/VSPM/WUKUh6kce5SyKuIEEBwsrmdonkRofvM5WONtJefO3Ho64RsQMR4
	 yItA2scQml59x0Y9nD+Z8K6IXQotPW3MF0glM9Q7LaRC9ZqShtUUi+1aVqN7eSIc3daGb
	 CGTP9OGQLtDHRhmJvKF80RZoFyj/ytfRK3sWD/h01M/HtxCo9rOj1O3q1AE2j4KVY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ahWzW+c2;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB85C60A2639
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB85C60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ahWzW+c2
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-16079d54c17so756162c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514910; x=1793119710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yOVnpJCUDrHS5XtDy2LVfYzH67VSMOqV48wcMc7eFu8=;
        b=ahWzW+c27JeNO1iCNYeqW6p1i6NeBhTnGPjxMLEh58gUhkYdCm8EloiC4h6/x4pxvx
         UVhH14hIumP/I2x4c+rsq0iJZjFM4uD7wumOQW7g8u1vhq559+fssuWrU37XqzNNc6eD
         wJSfiaShhXaAk2gql3ea0B6v38VcMy+7LKruaaTDOX8Qa2RqAh9NGXju2cf273QP4uGG
         LAvrjkv2QGXoc3UKnmB1MwYmj7DMBshRKSQaoiwLwIybRShXmeg052MJ8ekYa6HCy9pX
         EjO6vKdSKwCA/ZNi/78n4DCkdG1POdWsNpS5EWsnx3rMP5/3i40RknYXfJJBWB5f5VRF
         FSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514910; x=1793119710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOVnpJCUDrHS5XtDy2LVfYzH67VSMOqV48wcMc7eFu8=;
        b=rZ0wBe+k9k6ePoR4+V/Bh3BUmOlwgvGINthEkmm4qxAOEmCn2jf+8nlEhBCojeF68B
         8LzsG5jRiBx50nwCih1Ngdj62aIxle9A4JdmZPp0ow9n2c6m22ZhcjUGN84M3BPjAndD
         qrPoZryaNSdv7jpLORwRfcwr/GD0/HSoXFdlHLkdkwAzzqULxOya8tNbRrPRQU+rXCLi
         5s1fCOQL0qyvwiJ1GCurHF/hplj2/bQuuc1LOfQHufPI3gD9OCaW1iDkU1avBvAxqtju
         Myh31I81ktBoOOCAZjis77MTVCmDpiumQGLd+pc3/c2gX/ydM+c1XPKH+uSJSvwWZWRg
         xK8A==
X-Forwarded-Encrypted: i=1; AKwUvBxwVwIgDUHEkPslHnRdjltlrtoelBwHmevKKOz6qcGrmrM4XzRYQDap61WlvgckBKSkcuNNAJlhYNxW3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKeUkOcba7+Q6cAZA3dHjd6mcL+53WBlIKRUg5K+ERzliYJzOXL
	lVtSXD9AmC2+L1s3p16I8Ml/pUdaoubtWyv+nh+S1V9CWZIx8wGCmVhQxFkUfTj/lFk=
X-Gm-Gg: AYBFou2jOC90IQhLyttzgy1CGEoZd8vIpCohV3pNzZrA6BubkrIy2yJ7A3WdytF2PDL
	AedUo7zmjdz2wgH4A5tYcjQg2mjqac+zx0r+mJn2tsFwn28lMkwo42WKA0zkBqZ3Txoz/cTGZAt
	Be7fLc//tkZWxHsBr2ic0XdXUHUA6SDkKaFoXAvkGV1WxsCe+B2ahGRyYXEM4xcNUFJTHlyhKVQ
	bu/m4+BW+vSIiqdOG4wK8/SlataufuSOG1V2DzS1f8gxyC6FJc0x42tANpLod1ALLHH17svYIem
	xtJ2Z4eU3Mp8Relu4dYstrbaQpE2idWtCIQgvlUPOGKgejMIWf5Rdmie86mdSJd8+eb5n+Hc/3s
	l3ZX0QhDXWVReq5tM3WingpigZ+g7K00zSfbspC70aYmW/Re5f5LyUJc8vhA5NdhPsyhh9brABw
	y2zk+55DluxjUoJT7SHOoGsD61nhQ0X+u9ugp9pROVrU+HnX50oQ14C0FnSt1pqCdI
X-Received: by 2002:a05:7022:b051:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-18514cf32d5mr17126680c88.47.1792514909743;
        Tue, 20 Oct 2026 09:48:29 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:26 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:16 +0000
Subject: [PATCH v2 3/3] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fs1603-v2-3-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=24222;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=+GV5Mk4obDbJRaHgiYl9QnrFlLDDl8lRg2PBHyfvefk=;
 b=aXbpE9Asdmj4qlbb79KYL1Y51mMr73z53IFiR5HBJdr4f0um7webpR9NQh6ioCEa4QmHKUA7L
 DN1gbWAjyf4Ac/za8BfRj0NFfF6rNP6VT9JkArtZ/YgxG3XkJiHjvQm
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
an integrated inductor. They report input voltage, output voltage, output
current and temperature, plus over-voltage, over-current and
over-temperature status, over a proprietary I2C register map. They are
not PMBus devices, and their register numbers collide with PMBus command
codes: 0x21 is a status byte here where PMBus defines VOUT_COMMAND.

The parts have no ID register, and the FS1606-0600 and FS1606-2500
presets change how telemetry is encoded: the -2500 uses the 20mV steps
of the higher voltage parts, and the -0600 needs a current correction
derived from the IOUT_GAIN register and the output voltage. The model is
therefore taken from the device name or compatible. OCSet[2:0], the
programmable over-current protection level, ships with a different
default on each family member, so probe warns if it does not match the
declared part, which usually catches a wrong device name.

The over-voltage and over-temperature protection thresholds are
reported as in1_crit and temp1_crit. The over-voltage threshold is a
percentage of the VOUT_SET target, so the driver reads VOUT_SET but
never writes it: VOUT_SET is a two-byte pair, and a partial write leaves
the part silently ignoring all register writes until its input power is
cycled. The driver is read-only.

Power good is not exposed. It also deasserts while the output is
disabled or soft-starting, so it would report a deliberately disabled
output as a fault.

On boards that raise the rail with a feedback divider, VOUT_SET holds
the feedback-pin target while the output voltage telemetry reports the
rail. The driver measures the divider ratio at probe from the output
voltage and the Fb register and scales the over-voltage threshold by
it, so in1_crit is in the same domain as in1_input. A part whose Fb
reads within four steps of the output keeps a ratio of one.

Co-developed-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/hwmon/fs1603.rst |  78 ++++++
 Documentation/hwmon/index.rst  |   1 +
 MAINTAINERS                    |   7 +
 drivers/hwmon/Kconfig          |  11 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/fs1603.c         | 540 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 638 insertions(+)

diff --git a/Documentation/hwmon/fs1603.rst b/Documentation/hwmon/fs1603.rst
new file mode 100644
index 000000000000..ba0038e0d9b5
--- /dev/null
+++ b/Documentation/hwmon/fs1603.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver fs1603
+====================
+
+Supported chips:
+
+  * TDK FS1603
+
+    Prefix: 'fs1603'
+
+    Datasheet: Publicly available at the TDK website
+
+  * TDK FS1604
+
+    Prefix: 'fs1604'
+
+    Datasheet: Publicly available at the TDK website
+
+  * TDK FS1606, FS1606-0600, FS1606-2500
+
+    Prefixes: 'fs1606', 'fs1606_0600', 'fs1606_2500'
+
+    Datasheet: Publicly available at the TDK website
+
+  * TDK FS1006-3300, FS1006-5000
+
+    Prefixes: 'fs1006_3300', 'fs1006_5000'
+
+    Datasheet: Publicly available at the TDK website
+
+Author:
+
+  * Kevin Jia <kjia@nexthop.ai>
+
+Description
+-----------
+
+The TDK FS160x and FS1006 are uPOL DC-DC converters with an integrated
+inductor. They report input voltage, output voltage, output current and
+temperature over a proprietary I2C register map. They are not PMBus devices,
+and their register numbers collide with PMBus command codes, so a PMBus driver
+must not be bound to them.
+
+The model is not auto-detected. It must be declared through the I2C device
+name or the devicetree compatible. The FS1606-0600 and FS1606-2500 presets
+scale telemetry differently from the base FS1606, so they must be declared
+by their own names. At probe time the driver compares the OCSet register,
+the programmable over-current protection level, with the factory default of
+the declared family member and logs a warning on a mismatch. That usually
+means the wrong model was declared, but it is expected on boards that
+reprogram the over-current protection level.
+
+The driver is read-only. On boards that use a feedback divider to reach a
+higher rail voltage, the output voltage is still reported for the rail, and the
+over-voltage threshold is scaled to the rail by the divider ratio, measured at
+probe from the output voltage and the feedback pin. TDK notes that current
+reporting does not apply in that configuration.
+
+Sysfs attributes
+----------------
+
+=================== == ========================================================
+in0_input           RO Input voltage in millivolts.
+in0_label           RO "vin"
+in1_input           RO Output voltage in millivolts.
+in1_label           RO "vout"
+in1_crit            RO Output over-voltage protection threshold in millivolts:
+                       the OV_Threshold percentage of the VOUT_SET target,
+                       scaled to the rail on boards with a feedback divider.
+in1_alarm           RO Output over-voltage status.
+curr1_input         RO Output current in milliamperes.
+curr1_alarm         RO Over-current status.
+temp1_input         RO Temperature in millidegrees Celsius.
+temp1_crit          RO Over-temperature protection threshold in millidegrees
+                       Celsius.
+temp1_alarm         RO Over-temperature status.
+=================== == ========================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79621e9..7d79a7aadaa6 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -81,6 +81,7 @@ Hardware Monitoring Kernel Drivers
    f71805f
    f71882fg
    fam15h_power
+   fs1603
    fsp-3y
    ftsteutates
    g760a
diff --git a/MAINTAINERS b/MAINTAINERS
index 5ad12c57ca5f..24073ee3ede2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26799,6 +26799,13 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/tda9840*
 
+TDK FS1603 HARDWARE MONITOR DRIVER
+M:	Kevin Jia <kjia@nexthop.ai>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/fs1603.rst
+F:	drivers/hwmon/fs1603.c
+
 TEA5761 TUNER DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..047a3050946b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -728,6 +728,17 @@ config SENSORS_MC33XS2410
 	  This driver can also be built as a module. If so, the module
 	  will be called mc33xs2410_hwmon.
 
+config SENSORS_FS1603
+	tristate "TDK FS1603 and compatible uPOL DC-DC converters"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get hardware monitoring support for the
+	  TDK FS1603, FS1604, FS1606 and FS1006 uPOL DC-DC converters.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called fs1603.
+
 config SENSORS_FSCHMD
 	tristate "Fujitsu Siemens Computers sensor chips"
 	depends on (X86 || COMPILE_TEST) && I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..23a5f262eecf 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_SENSORS_F71805F)	+= f71805f.o
 obj-$(CONFIG_SENSORS_F71882FG)	+= f71882fg.o
 obj-$(CONFIG_SENSORS_F75375S)	+= f75375s.o
 obj-$(CONFIG_SENSORS_FAM15H_POWER) += fam15h_power.o
+obj-$(CONFIG_SENSORS_FS1603)	+= fs1603.o
 obj-$(CONFIG_SENSORS_FSCHMD)	+= fschmd.o
 obj-$(CONFIG_SENSORS_FTSTEUTATES) += ftsteutates.o
 obj-$(CONFIG_SENSORS_G760A)	+= g760a.o
diff --git a/drivers/hwmon/fs1603.c b/drivers/hwmon/fs1603.c
new file mode 100644
index 000000000000..afe75657ce39
--- /dev/null
+++ b/drivers/hwmon/fs1603.c
@@ -0,0 +1,540 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Copyright (C) 2026 Nexthop Systems Inc.
+ *
+ * Driver for the TDK FS160x family of uPOL DC-DC converters with integrated
+ * inductor. Supported models: FS1603, FS1604, FS1606, FS1006.
+ *
+ * The parts expose voltage, current and temperature telemetry over a
+ * proprietary I2C register map. They are not PMBus devices, and their
+ * register numbers actively collide with PMBus command codes -- 0x21 is a
+ * status byte here where PMBus defines VOUT_COMMAND -- so a generic PMBus
+ * driver must never be bound to them.
+ *
+ * Read-only. VOUT_SET (0x12/0x13) is an atomic write-protected pair: writing
+ * the high byte arms an update that takes effect only once the low byte is
+ * written. A partial write leaves the part armed, after which it acknowledges
+ * but silently ignores every register write until its input power is cycled,
+ * so this driver only reads it, to scale the over-voltage threshold.
+ *
+ * On a board that raises the rail with a feedback divider, VOUT still reports
+ * the rail but VOUT_SET holds the feedback-pin target, so the over-voltage
+ * threshold is scaled by the divider ratio, measured at probe from VOUT and
+ * the Fb register (0x22). TDK notes that current reporting does not apply in
+ * that configuration.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define FS1603_REG_PVIN			0x0C
+#define FS1603_REG_VOUT			0x0D
+#define FS1603_REG_IOUT			0x0E
+#define FS1603_REG_TEMP			0x0F
+#define FS1603_REG_VOUT_SET_HI		0x12
+#define FS1603_REG_VOUT_SET_LO		0x13
+#define FS1603_REG_OCSET		0x15
+#define FS1603_REG_OV_THRESHOLD		0x17
+#define FS1603_REG_OT_THRESHOLD		0x19
+#define FS1603_REG_IOUT_GAIN		0x1A
+#define FS1603_REG_STATUS		0x21
+#define FS1603_REG_FB			0x22
+
+#define FS1603_VOUT_SET_HI_MASK		BIT(0)
+#define FS1603_OV_THRESHOLD_MASK	GENMASK(1, 0)
+#define FS1603_OT_THRESHOLD_MASK	GENMASK(1, 0)
+#define FS1603_IOUT_GAIN_MASK		GENMASK(7, 2)
+
+/*
+ * OCSet[2:0] is the user-programmable over-current protection trip level,
+ * not an ID. Each family member ships with a different default, so a
+ * mismatch at probe usually means the wrong model was declared.
+ */
+#define FS1603_OCSET_LEVEL		GENMASK(2, 0)
+#define FS1603_OCSET_DEFAULT_FS1603	0
+#define FS1603_OCSET_DEFAULT_FS1604	1
+#define FS1603_OCSET_DEFAULT_FS1606	2
+#define FS1603_OCSET_DEFAULT_FS1006	3
+
+/* Bits in FS1603_REG_STATUS. */
+#define FS1603_STATUS_OVER_VOLTAGE	BIT(6)
+#define FS1603_STATUS_OVER_CURRENT	BIT(5)
+#define FS1603_STATUS_OVER_TEMP		BIT(4)
+
+/* OV_Threshold[1:0] in percent of programmed VOUT; OT_Threshold[1:0] in degC. */
+static const unsigned int fs1603_ov_threshold_pct[] = { 105, 110, 115, 120 };
+static const unsigned int fs1603_ot_threshold_c[] = { 75, 85, 125, 145 };
+
+/*
+ * Voltage telemetry is a linear step and base, both fixed per variant.
+ * Current is raw/32 A except on the FS1606-0600, which applies a calibration
+ * correction derived from FS1603_REG_IOUT_GAIN and the output voltage.
+ */
+struct fs1603_info {
+	unsigned int vout_step_mv;
+	unsigned int vout_base_mv;
+	u8 ocset_default;
+	bool iout_gain_corrected;
+};
+
+enum fs1603_model {
+	fs1603,
+	fs1604,
+	fs1606,
+	fs1606_0600,
+	fs1606_2500,
+	fs1006,
+};
+
+/*
+ * The FS1606 reports at 10mV/300mV except for the -2500 preset, which uses the
+ * same 20mV/600mV encoding as the higher-voltage family members.
+ */
+static const struct fs1603_info fs1603_models[] = {
+	[fs1603]      = { .vout_step_mv = 20, .vout_base_mv = 600,
+			  .ocset_default = FS1603_OCSET_DEFAULT_FS1603 },
+	[fs1604]      = { .vout_step_mv = 20, .vout_base_mv = 600,
+			  .ocset_default = FS1603_OCSET_DEFAULT_FS1604 },
+	[fs1606]      = { .vout_step_mv = 10, .vout_base_mv = 300,
+			  .ocset_default = FS1603_OCSET_DEFAULT_FS1606 },
+	[fs1606_0600] = { .vout_step_mv = 10, .vout_base_mv = 300,
+			  .ocset_default = FS1603_OCSET_DEFAULT_FS1606,
+			  .iout_gain_corrected = true },
+	[fs1606_2500] = { .vout_step_mv = 20, .vout_base_mv = 600,
+			  .ocset_default = FS1603_OCSET_DEFAULT_FS1606 },
+	[fs1006]      = { .vout_step_mv = 20, .vout_base_mv = 600,
+			  .ocset_default = FS1603_OCSET_DEFAULT_FS1006 },
+};
+
+/*
+ * Every register is a byte, and every read is live telemetry, so nothing is
+ * cached. regmap is used for the uniform accessors and the debugfs dump.
+ */
+static const struct regmap_config fs1603_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = FS1603_REG_FB,
+	.cache_type = REGCACHE_NONE,
+};
+
+struct fs1603_data {
+	struct regmap *regmap;
+	const struct fs1603_info *info;
+	u32 fb_ratio_num;
+	u32 fb_ratio_den;
+};
+
+static int fs1603_read_vout_mv(struct fs1603_data *data, long *val)
+{
+	unsigned int raw;
+	int err;
+
+	err = regmap_read(data->regmap, FS1603_REG_VOUT, &raw);
+	if (err)
+		return err;
+
+	*val = raw * data->info->vout_step_mv + data->info->vout_base_mv;
+	return 0;
+}
+
+/*
+ * Output current in mA.
+ *
+ * Every variant but the FS1606-0600 reports raw/32 A directly. The -0600
+ * additionally applies, with G taken from FS1603_REG_IOUT_GAIN bits [7:2]:
+ *
+ *   I = raw/32 - (9.05 - 0.24 * G) * Vout - 0.356 * G + 13.1
+ *
+ * Scaled to milliamps and millivolts so it stays in integer arithmetic:
+ *
+ *   I_mA = raw * 125 / 4
+ *          - ((9050 - 240 * G) * Vout_mV) / 1000
+ *          - 356 * G
+ *          + 13100
+ */
+static int fs1603_read_iout_ma(struct fs1603_data *data, long *val)
+{
+	unsigned int raw, gain;
+	long vout_mv;
+	int err;
+
+	err = regmap_read(data->regmap, FS1603_REG_IOUT, &raw);
+	if (err)
+		return err;
+
+	*val = raw * 125 / 4;
+
+	if (!data->info->iout_gain_corrected)
+		return 0;
+
+	err = regmap_read(data->regmap, FS1603_REG_IOUT_GAIN, &gain);
+	if (err)
+		return err;
+	gain = FIELD_GET(FS1603_IOUT_GAIN_MASK, gain);
+
+	err = fs1603_read_vout_mv(data, &vout_mv);
+	if (err)
+		return err;
+
+	*val -= ((9050 - 240 * (long)gain) * vout_mv) / 1000;
+	*val -= 356 * (long)gain;
+	*val += 13100;
+
+	if (*val < 0)
+		*val = 0;
+
+	return 0;
+}
+
+/*
+ * The 9-bit VOUT_SET code steps at half the telemetry resolution from a base
+ * of 80 steps.
+ */
+static int fs1603_read_vout_set_mv(struct fs1603_data *data, long *val)
+{
+	unsigned int hi, lo;
+	int err;
+
+	err = regmap_read(data->regmap, FS1603_REG_VOUT_SET_HI, &hi);
+	if (err)
+		return err;
+	err = regmap_read(data->regmap, FS1603_REG_VOUT_SET_LO, &lo);
+	if (err)
+		return err;
+
+	*val = ((FIELD_GET(FS1603_VOUT_SET_HI_MASK, hi) << 8 | lo) + 80) *
+	       data->info->vout_step_mv / 2;
+	return 0;
+}
+
+/* Fb has no documented encoding; it decodes with the VOUT step and base. */
+static int fs1603_read_fb_mv(struct fs1603_data *data, long *val)
+{
+	unsigned int raw;
+	int err;
+
+	err = regmap_read(data->regmap, FS1603_REG_FB, &raw);
+	if (err)
+		return err;
+
+	*val = raw * data->info->vout_step_mv + data->info->vout_base_mv;
+	return 0;
+}
+
+/*
+ * A board that raises the rail with a feedback divider leaves VOUT_SET at the
+ * feedback target, and Fb then reads well below VOUT. The divider is fixed in
+ * hardware, so measure its ratio once. Without a divider Fb reads the output
+ * itself, and the ratio stays one so the limit does not follow ADC noise.
+ */
+static int fs1603_measure_fb_ratio(struct fs1603_data *data)
+{
+	long vout_mv, fb_mv;
+	int err;
+
+	data->fb_ratio_num = 1;
+	data->fb_ratio_den = 1;
+
+	err = fs1603_read_vout_mv(data, &vout_mv);
+	if (err)
+		return err;
+	err = fs1603_read_fb_mv(data, &fb_mv);
+	if (err)
+		return err;
+
+	if (fb_mv > 0 && vout_mv > fb_mv + 4 * data->info->vout_step_mv) {
+		data->fb_ratio_num = vout_mv;
+		data->fb_ratio_den = fb_mv;
+	}
+	return 0;
+}
+
+/*
+ * OVP trips at OV_Threshold percent of the VOUT_SET target, measured at the
+ * feedback pin. Scale it by the feedback divider ratio to report it in the
+ * same rail domain as in1_input.
+ */
+static int fs1603_read_vout_crit_mv(struct fs1603_data *data, long *val)
+{
+	unsigned int raw;
+	long vout_set_mv;
+	int err;
+
+	err = regmap_read(data->regmap, FS1603_REG_OV_THRESHOLD, &raw);
+	if (err)
+		return err;
+	err = fs1603_read_vout_set_mv(data, &vout_set_mv);
+	if (err)
+		return err;
+
+	raw = FIELD_GET(FS1603_OV_THRESHOLD_MASK, raw);
+	*val = DIV_ROUND_CLOSEST_ULL((u64)fs1603_ov_threshold_pct[raw] *
+				     vout_set_mv * data->fb_ratio_num,
+				     100 * data->fb_ratio_den);
+	return 0;
+}
+
+static int fs1603_read_status_bit(struct fs1603_data *data, u8 mask,
+				  long *val)
+{
+	unsigned int status;
+	int err;
+
+	err = regmap_read(data->regmap, FS1603_REG_STATUS, &status);
+	if (err)
+		return err;
+
+	*val = !!(status & mask);
+	return 0;
+}
+
+static int fs1603_read_in(struct fs1603_data *data, u32 attr, int channel,
+			  long *val)
+{
+	unsigned int raw;
+	int err;
+
+	switch (attr) {
+	case hwmon_in_input:
+		if (channel == 0) {
+			err = regmap_read(data->regmap, FS1603_REG_PVIN, &raw);
+			if (err)
+				return err;
+			/* PVIN reports in 1/16 V steps. */
+			*val = raw * 1000 / 16;
+			return 0;
+		}
+		return fs1603_read_vout_mv(data, val);
+	case hwmon_in_crit:
+		return fs1603_read_vout_crit_mv(data, val);
+	case hwmon_in_alarm:
+		return fs1603_read_status_bit(data, FS1603_STATUS_OVER_VOLTAGE,
+					      val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int fs1603_read_curr(struct fs1603_data *data, u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_curr_input:
+		return fs1603_read_iout_ma(data, val);
+	case hwmon_curr_alarm:
+		return fs1603_read_status_bit(data, FS1603_STATUS_OVER_CURRENT,
+					      val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int fs1603_read_temp_crit_mc(struct fs1603_data *data, long *val)
+{
+	unsigned int raw;
+	int err;
+
+	err = regmap_read(data->regmap, FS1603_REG_OT_THRESHOLD, &raw);
+	if (err)
+		return err;
+
+	*val = fs1603_ot_threshold_c[FIELD_GET(FS1603_OT_THRESHOLD_MASK, raw)] * 1000;
+	return 0;
+}
+
+static int fs1603_read_temp(struct fs1603_data *data, u32 attr, long *val)
+{
+	unsigned int raw;
+	int err;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		err = regmap_read(data->regmap, FS1603_REG_TEMP, &raw);
+		if (err)
+			return err;
+		/* TEMP_REPORT is degC directly: 1 degC per LSB, no offset. */
+		*val = raw * 1000;
+		return 0;
+	case hwmon_temp_crit:
+		return fs1603_read_temp_crit_mc(data, val);
+	case hwmon_temp_alarm:
+		return fs1603_read_status_bit(data, FS1603_STATUS_OVER_TEMP,
+					      val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int fs1603_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	struct fs1603_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_in:
+		return fs1603_read_in(data, attr, channel, val);
+	case hwmon_curr:
+		return fs1603_read_curr(data, attr, val);
+	case hwmon_temp:
+		return fs1603_read_temp(data, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int fs1603_read_string(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, const char **str)
+{
+	if (type != hwmon_in || attr != hwmon_in_label)
+		return -EOPNOTSUPP;
+
+	*str = channel == 0 ? "vin" : "vout";
+	return 0;
+}
+
+static umode_t fs1603_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			return 0444;
+		case hwmon_in_crit:
+		case hwmon_in_alarm:
+			/* OVP and its alarm describe the regulated output only. */
+			return channel == 1 ? 0444 : 0;
+		default:
+			return 0;
+		}
+	case hwmon_curr:
+	case hwmon_temp:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_ops fs1603_ops = {
+	.is_visible = fs1603_is_visible,
+	.read = fs1603_read,
+	.read_string = fs1603_read_string,
+};
+
+static const struct hwmon_channel_info *fs1603_channel_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_CRIT |
+			   HWMON_I_ALARM),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_ALARM),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_ALARM),
+	NULL
+};
+
+static const struct hwmon_chip_info fs1603_chip_info = {
+	.ops = &fs1603_ops,
+	.info = fs1603_channel_info,
+};
+
+static int fs1603_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	char *name;
+	struct fs1603_data *data;
+	struct device *hwmon;
+	unsigned int ocset;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return dev_err_probe(dev, -ENODEV,
+				     "SMBus byte data not supported\n");
+
+	name = devm_hwmon_sanitize_name(dev, client->name);
+	if (IS_ERR(name))
+		return PTR_ERR(name);
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = devm_regmap_init_i2c(client, &fs1603_regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap),
+				     "failed to allocate regmap\n");
+
+	data->info = i2c_get_match_data(client);
+	if (!data->info)
+		return dev_err_probe(dev, -ENODEV, "no match data for %s\n",
+				     client->name);
+
+	err = regmap_read(data->regmap, FS1603_REG_OCSET, &ocset);
+	if (err)
+		return dev_err_probe(dev, err, "failed to read OCSet\n");
+
+	ocset = FIELD_GET(FS1603_OCSET_LEVEL, ocset);
+	if (ocset != data->info->ocset_default)
+		dev_warn(dev, "OCSet %u differs from the %s default %u\n",
+			 ocset, client->name, data->info->ocset_default);
+
+	err = fs1603_measure_fb_ratio(data);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "failed to read the feedback ratio\n");
+
+	hwmon = devm_hwmon_device_register_with_info(dev, name, data,
+						     &fs1603_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static const struct i2c_device_id fs1603_id[] = {
+	{ .name = "fs1603",
+	  .driver_data = (kernel_ulong_t)&fs1603_models[fs1603] },
+	{ .name = "fs1604",
+	  .driver_data = (kernel_ulong_t)&fs1603_models[fs1604] },
+	{ .name = "fs1606",
+	  .driver_data = (kernel_ulong_t)&fs1603_models[fs1606] },
+	{ .name = "fs1606_0600",
+	  .driver_data = (kernel_ulong_t)&fs1603_models[fs1606_0600] },
+	{ .name = "fs1606_2500",
+	  .driver_data = (kernel_ulong_t)&fs1603_models[fs1606_2500] },
+	{ .name = "fs1006_5000",
+	  .driver_data = (kernel_ulong_t)&fs1603_models[fs1006] },
+	{ .name = "fs1006_3300",
+	  .driver_data = (kernel_ulong_t)&fs1603_models[fs1006] },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, fs1603_id);
+
+static const struct of_device_id fs1603_of_match[] = {
+	{ .compatible = "tdk,fs1603", .data = &fs1603_models[fs1603] },
+	{ .compatible = "tdk,fs1604", .data = &fs1603_models[fs1604] },
+	{ .compatible = "tdk,fs1606", .data = &fs1603_models[fs1606] },
+	{ .compatible = "tdk,fs1606-0600",
+	  .data = &fs1603_models[fs1606_0600] },
+	{ .compatible = "tdk,fs1606-2500",
+	  .data = &fs1603_models[fs1606_2500] },
+	{ .compatible = "tdk,fs1006-5000",
+	  .data = &fs1603_models[fs1006] },
+	{ .compatible = "tdk,fs1006-3300",
+	  .data = &fs1603_models[fs1006] },
+	{}
+};
+MODULE_DEVICE_TABLE(of, fs1603_of_match);
+
+static struct i2c_driver fs1603_driver = {
+	.driver = {
+		.name	= "fs1603",
+		.of_match_table = fs1603_of_match,
+	},
+	.probe = fs1603_probe,
+	.id_table = fs1603_id,
+};
+module_i2c_driver(fs1603_driver);
+
+MODULE_AUTHOR("Kevin Jia <kjia@nexthop.ai>");
+MODULE_DESCRIPTION("TDK FS160x uPOL DC-DC converter telemetry driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

