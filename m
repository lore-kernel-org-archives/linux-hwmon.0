Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678003;
	b=BXuKn5wZ/lwiZ83/6r2jkEGXB+GrntemgVGLpT7XpevAEgrAancy9/BQq4cr7Iu4VD2X
	 bOL5NEMSlWoysoUPIQCADDWbn0gAQqqhWYOb6NZEKNvIa2W9GsL0m+npCCegieUS02T3M
	 70NAD4lrZdZfIhHs6AZkGrQvkUmVLEI6c/wLOTXSuy0kKfmdVtZvOctnOyc4OGaL9Qf68
	 NLW2zQCTxb/9n5WRs8fp58FFqPkfq8Dud1jA523w+o6Yct47T5IQS4j4ZWzNTTVJbhrHA
	 xoQnM5zGigNXH0Z29PFcBgMZVnlo+40zzeW4+0MxNqmZV9alDd4AX+xZ3qM42bSAIew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vYu8kBmzY99tvtLA+mnOuYYwUJpf0GKsu/QGHy4PRNs=;
	b=jrHU+vcyY0O8nQFGaFWNsRE66y9H1NyNWyXsOjyhfMxm6+4mlqwUc+uDMbbRSRCPtEiC
	 DvsVSN6k0QAkwRhmbgdaVUjWTF+jBMEeZTU5bC6gx+kdjh1e8L9xFaKnDeVh3pxw1KZCg
	 2tMNaBb/5Lbn8LEAHLACZNrV2ScgyXVtovnSeUfgXybzslewKZwRv3NXG8b4tTXJEbyu7
	 61SuCqSM9Yw1y3F7Bk0CJWJHlhEQUArIICDNHhhuix3Mhn4tHTFiA54sy5v6ypdM2aBdX
	 AEfyZxqUXXwEIa0N8sugB4lFXu0ZxN1D3TLvHpy0j1uIPi9N6W9RjeVYdyOrikHu9nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T2M/hAOU";
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84460A2606
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C84460A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T2M/hAOU
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4b2bf375fso6206667b3.0
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 09:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678001; x=1795282801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYu8kBmzY99tvtLA+mnOuYYwUJpf0GKsu/QGHy4PRNs=;
        b=T2M/hAOUHm7uGuNFMed0BjamiBxSsKItBtsFVXBGkmxxGMZpXDk83QsNUkfC95ltd0
         BFujSxWn9wo5vcAXnbQOYKQwfKmMzEumz6Qhxmv0iom0H9bSQuScYRx3/y/C3CvlEaP/
         axMz0b6Yx9p+GI11DmgZkKK82XvgGotQ/a2ceHlkupcjiWQdf4uWwqHWMHgqC9Wvv45/
         259WDPHZnAf/OJ+Pa1lMB8/htuhSTUb/Ut1kumCjL50zlOkTKcP5QtyFfR+BueMucjxr
         hQ2NnERFkf9466BvLEbqdi7wQzVYDqWiFRfLnolKdkbzfCyB+fGu9oxREdN254CH7yGe
         hJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678001; x=1795282801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYu8kBmzY99tvtLA+mnOuYYwUJpf0GKsu/QGHy4PRNs=;
        b=RVqD5EHoE4WU4DS48auLGtE8ea/3CFcq1Q85gJ5fE3TaK5Z/1cyRe+LtbplRd3gMDb
         94lLmqM2JS2zvieduePP+YQuLakZf6IPiUClJMIGm38KSvJ5TICPNvLPCaNm5h/W8EE8
         OFMGZPZ+FLRf0tqPo33/vpUg9bcoj9mynS/M9KfB0X+/HYUgJbLm9z4sYk4XrhR9KGsX
         GIbprNOfInB7XlhYPq1Lza/feQYpejbP0M4Hyp4BDAaFbxOzjb30GZ4HKktoM9f0KfHK
         dv2QA7vgO6QICmWWD4Cj3hM3v7DNuBdGHjCXob2ZSPYOvnu8t0aA07WDWy88gcUvWt6x
         3pyQ==
X-Forwarded-Encrypted: i=1; AL+hErHRnSQk5E23AwWrjmyCaXHvB69v1BE3tiavW83fNGAgXqABpPSbK74ozqi66C7OGqB1vNWety/Qk9VBCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9p6LjNtw2H9TpTqU66mItZQ93anLbadNXsM7QMtFgCgOoRWNnZ
	gQzlf2pQGSUUAyWaDnGyLvjUFiFfjkw44aUVDXiouySjBBoLM5J/HVCC
X-Gm-Gg: AYBFou179cjhL6Ev0K7OWgb5Ei2s2FVC834lUG6boXcnRGzoQjCnA2E76N5v9oi7NgL
	ipGQFz8Locr/qgonAu3Gw1yl0oYplzMVDMrEYhsiqcCSW+RMxdLNpt9Q9kZBo79Bieo6m3g7Kk1
	9p1jLv2Yic+LO4kEwEiisROdeIfpODXvA51HPJX2TDE4hj8VoBSC9fVVGvfhrC6BYMDFtHW/6wy
	Sk3ob3RcPqBmjrvvS2xv7mE5p2fn5cq8uevkWQHVNs4gbgu6GaQNlsa/+HVuLb+5SNvYsmzcB8M
	Ue3zXF7ovNCl/n5XnHKyTGP8kEftBNmxh0Auu6AaZgcKd4MtBCU61eF3PO4v8KqiSjn4G9Pw2Y1
	JmMxN2Tox/KRFL/6LH3zPdKfTC5PplTEti76O01oS3w/B5uZ0+Hh+0ufP6phX/3oVBrhx+ewFGO
	6dHuvqr7Gqeopga5aPpk8OC3P+PSg+mkZ4y1IaT3nzSk1c0by8BsiKRZxZmZZS6dLePa1fDVtxu
	g1vBTel2rYBvysaFd7l+tpkj+pM2jPL+WJndZT3wjzyWDYznv/NLyc9FDjSVZGwz/DXyPdsh6QV
	Mhwqif9X3pajE2F3Jnw1afOg8Hnrs2BFLvlot2DxJroYxsP8zHjA7wsZrYrCevxRYmKlnkk5DEQ
	BAzKnIWENuQWL5EDaLmckrRYmI/jaIdCqjmvTrdnFDK6N/pnQDWoJgsIs5r4vC50=
X-Received: by 2002:a05:690c:fd2:b0:8b4:cc58:78d6 with SMTP id 00721157ae682-8b4cc5882a1mr1774357b3.19.1794678001020;
        Sat, 14 Nov 2026 09:40:01 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4c65f85c3sm9088097b3.33.2026.11.14.09.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:59 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:51 -0500
Subject: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer environmental
 sensors
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
Message-Id: <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=21842; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=CGsKsW8Qw7uqFhmB+YTN/1Si8VAmgG+9q66togiUJmo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHl8o+RJlav2L9tgJzve+StiOf7PvfKMqarR2/zpj
 sn3uVk0Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYaAx2Gv9IPbC+1NZ
 Sfss05K2Xpqj5fZuadicn5lglcalaLv//nWcnIsCF2Wrm0l8fyB9kTUxP2xpiVnBNbyZPRn8J76
 4bjXjZbDgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
ES80 and ES47, monitors temperatures, fans, voltages and power supplies.
The SRM console describes each sensor as a packet in a power and
environment node of its config tree (GCT), and fills in the readings
when asked to refresh the node. The packet layout was taken from Tru64
UNIX.

Export the sensors through hwmon. Temperatures come with their warning
and fault thresholds and fans with their warning threshold. Voltages
export a reading and an alarm, power supplies only an alarm.

A refresh keeps the boot CPU in the console with interrupts disabled for
up to 300 ms per node, so refresh a node at most once per
update_interval.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Documentation/hwmon/index.rst      |   1 +
 Documentation/hwmon/marvel-env.rst |  60 ++++
 MAINTAINERS                        |   8 +
 drivers/hwmon/Kconfig              |  11 +
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/marvel-env.c         | 552 +++++++++++++++++++++++++++++++++++++
 6 files changed, 633 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79621e9..b062ad1ff53f 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -157,6 +157,7 @@ Hardware Monitoring Kernel Drivers
    ltc4286
    lx1308
    macsmc-hwmon
+   marvel-env
    max127
    max15301
    max16064
diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
new file mode 100644
index 000000000000..db36127c3805
--- /dev/null
+++ b/Documentation/hwmon/marvel-env.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver marvel-env
+========================
+
+Supported systems:
+
+  * Marvel (EV7) AlphaServers: the GS1280, ES80 and ES47 families,
+    booted from the SRM console
+
+Author: Matt Turner <mattst88@gmail.com>
+
+Description
+-----------
+
+The management firmware of these machines monitors temperatures, fans,
+voltages and power supplies, and the SRM console describes each sensor in
+its configuration tree (GCT). This driver asks the console to refresh the
+readings and exports them.
+
+The console has no sensor names, so the labels are built from the reporting
+unit (such as ``CMM0`` or ``MBM/PBM``) and the sensor's position in that
+unit. On systems with more than one drawer the label starts with the
+cabinet and drawer numbers.
+
+A refresh keeps the boot CPU in the console with interrupts disabled for up
+to 300 ms per unit, so a unit is refreshed at most once every
+``update_interval`` milliseconds (10000 by default).
+
+Sysfs entries
+-------------
+
+=========================== =================================================
+``update_interval``         Minimum time between refreshes of a unit, in ms
+
+``temp[1-*]_input``         Temperature
+``temp[1-*]_max``           Warning threshold
+``temp[1-*]_crit``          Fault threshold
+``temp[1-*]_max_alarm``     Sensor is in the warning or fault state
+``temp[1-*]_crit_alarm``    Sensor is in the fault state
+``temp[1-*]_label``         Sensor label
+
+``fan[1-*]_input``          Fan speed
+``fan[1-*]_min``            Warning threshold
+``fan[1-*]_min_alarm``      Fan is in the warning or fault state
+``fan[1-*]_fault``          Fan is in the fault state
+``fan[1-*]_label``          Fan label
+
+``in[0-*]_input``           Voltage
+``in[0-*]_alarm``           Sensor is in the warning or fault state
+``in[0-*]_label``           Sensor label
+
+``power[1-*]_alarm``        Power supply is in the warning or fault state
+``power[1-*]_label``        Power supply label
+=========================== =================================================
+
+Sensors that the console reports as unknown or not present when the driver
+loads are not exported. If a sensor becomes unknown later, reading its input
+attribute fails with ``-ENODATA``, as does reading the alarm of a voltage
+sensor or power supply.
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..09dee8fab9ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16100,6 +16100,14 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/img/pistachio*
 
+MARVEL ALPHASERVER ENVIRONMENTAL SENSOR DRIVER
+M:	Matt Turner <mattst88@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-alpha@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/marvel-env.rst
+F:	drivers/hwmon/marvel-env.c
+
 MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
 M:	Andrew Lunn <andrew@lunn.ch>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..50a1bf966f30 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1255,6 +1255,17 @@ config SENSORS_MACSMC_HWMON
 	  This driver can also be built as a module. If so, the module will
 	  be called macsmc-hwmon.
 
+config SENSORS_MARVEL_ENV
+	tristate "Marvel (EV7) AlphaServer environmental sensors"
+	depends on ALPHA_MARVEL || ALPHA_GENERIC
+	help
+	  If you say yes here you get support for the temperature, fan,
+	  voltage and power supply sensors of Marvel AlphaServers (the
+	  GS1280, ES80 and ES47), as described by the SRM console.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called marvel-env.
+
 config SENSORS_MAX1111
 	tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
 	depends on SPI_MASTER
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..2b1b1850d641 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
 obj-$(CONFIG_SENSORS_LTC4283)	+= ltc4283.o
 obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
 obj-$(CONFIG_SENSORS_MACSMC_HWMON)	+= macsmc-hwmon.o
+obj-$(CONFIG_SENSORS_MARVEL_ENV)	+= marvel-env.o
 obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
 obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
 obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
new file mode 100644
index 000000000000..cdc7e059e17b
--- /dev/null
+++ b/drivers/hwmon/marvel-env.c
@@ -0,0 +1,552 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Environmental sensors of Marvel (EV7) AlphaServers: the GS1280, ES80 and
+ * ES47 families.
+ *
+ * The SRM console describes every sensor in the config tree (GCT). Each power
+ * and environment (P&E) node may carry a list of environmental packets:
+ * temperature and voltage sensors, fans and power supplies. The console fills
+ * in the readings when asked to refresh the node. The packet layout was
+ * taken from Tru64 UNIX.
+ */
+
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <asm/gct.h>
+#include <asm/marvel_env.h>
+
+#define DRVNAME "marvel_env"
+
+#define GCT_TYPE_PE		0x13
+#define GCT_FLAGS_REQUIRED	BIT(9)
+#define GCT_FLAGS_EXCLUDED	(BIT(2) | BIT(7) | BIT(12) | BIT(14))
+
+/* Packet types. */
+#define ENV_PKT_POWER_SUPPLY	0x08
+#define ENV_PKT_FAN		0x09
+#define ENV_PKT_SENSOR		0x2a
+
+/*
+ * Sensor packet: kind, status, reading, high warning, high fault.
+ * Temperatures are in tenths of a degree Celsius, voltages in millivolts.
+ * For voltages the two thresholds look like the nominal voltage and an upper
+ * limit, so they are not exported.
+ */
+#define SENSOR_KIND		0x28
+#define SENSOR_STATUS		0x2c
+#define SENSOR_VALUE		0x30
+#define SENSOR_WARN		0x34
+#define SENSOR_FAULT		0x38
+#define SENSOR_SIZE		0x3c
+
+#define SENSOR_KIND_THERMAL	2
+#define SENSOR_KIND_VOLT_FIRST	3
+#define SENSOR_KIND_VOLT_LAST	5
+
+/* Fan packet: status, rpm, low warning, low fault. */
+#define FAN_STATUS		0x24
+#define FAN_VALUE		0x28
+#define FAN_WARN		0x2c
+#define FAN_SIZE		0x34
+
+/* Power supply packet: status. */
+#define PS_STATUS		0x24
+#define PS_SIZE			0x28
+
+/* Status values, in the low byte of the status word. */
+#define ENV_OK			0
+#define ENV_WARNING		1
+#define ENV_FAULT		2
+#define ENV_UNKNOWN		0xfe
+#define ENV_NOT_PRESENT		0xff
+
+/* Console status of a refresh that Tru64 also treats as success. */
+#define CFGTREE_STATUS_OK2	(-0x4a)
+
+struct marvel_env_node {
+	gct6_node *node;
+	unsigned long offset;		/* from the start of the GCT */
+	unsigned long last_refresh;
+	bool valid;
+	unsigned int cabinet, drawer, pe;
+};
+
+struct marvel_env_chan {
+	struct marvel_env_node *node;
+	unsigned int pkt;		/* packet offset in the node */
+	char label[32];
+};
+
+struct marvel_env_data {
+	struct device *dev;
+	struct mutex lock;		/* serializes refreshes and reads */
+	unsigned int update_interval;	/* ms */
+	struct marvel_env_node *nodes;
+	unsigned int nr_nodes;
+	struct marvel_env_chan *chans[hwmon_max];
+	unsigned int nr_chans[hwmon_max];
+};
+
+static const char * const pe_names[] = {
+	[0x09] = "MBM",
+	[0x0a] = "MBM/PBM",
+	[0x0c] = "PS",
+	[0x0d] = "FAN",
+	[0x0f] = "CMM0", [0x10] = "CMM1", [0x11] = "CMM2", [0x12] = "CMM3",
+	[0x14] = "VRM0", [0x15] = "VRM1", [0x16] = "VRM2", [0x17] = "VRM3",
+	[0x19] = "PBM",
+	[0x1a] = "XSHELF",
+	[0x1b] = "PCIPS",
+	[0x1c] = "PCIFANS",
+};
+
+static inline u32 env_rd(struct marvel_env_node *n, unsigned int off)
+{
+	return *(u32 *)((char *)n->node + off);
+}
+
+static inline u8 env_status(struct marvel_env_node *n, unsigned int off)
+{
+	return env_rd(n, off) & 0xff;
+}
+
+static bool env_status_valid(u8 status)
+{
+	return status != ENV_UNKNOWN && status != ENV_NOT_PRESENT;
+}
+
+static bool env_status_alarm(u8 status)
+{
+	return status == ENV_WARNING || status == ENV_FAULT;
+}
+
+static unsigned int env_status_off(enum hwmon_sensor_types type)
+{
+	switch (type) {
+	case hwmon_fan:
+		return FAN_STATUS;
+	case hwmon_power:
+		return PS_STATUS;
+	default:
+		return SENSOR_STATUS;
+	}
+}
+
+static inline gct6_node *gct_node(gct6_handle h)
+{
+	return GCT_NODE_PTR(h);
+}
+
+/* Cabinet and drawer come from the P&E node's parent. */
+static void marvel_env_keys(struct marvel_env_node *n)
+{
+	gct6_node *parent = n->node->parent ? gct_node(n->node->parent) : NULL;
+
+	n->pe = n->node->id & 0xff;
+	if (!parent)
+		return;
+	if (parent->type == GCT_TYPE_PE && parent->subtype == 0x3d)
+		n->cabinet = (parent->id >> 48) & 0xff;
+	else
+		n->cabinet = (parent->id >> 48) & 0x3f;
+	n->drawer = (parent->id >> 32) & 0xff;
+}
+
+static int marvel_env_refresh(struct marvel_env_data *data,
+			      struct marvel_env_node *n)
+{
+	long status;
+
+	if (n->valid && time_before(jiffies, n->last_refresh +
+				    msecs_to_jiffies(data->update_interval)))
+		return 0;
+
+	status = marvel_cfgtree_partial_update(n->offset);
+	if (status != 1 && status != CFGTREE_STATUS_OK2) {
+		dev_warn_ratelimited(data->dev,
+				     "refresh of GCT node %#lx failed: %ld\n",
+				     n->offset, status);
+		return -EIO;
+	}
+	n->last_refresh = jiffies;
+	n->valid = true;
+	return 0;
+}
+
+/* The hwmon type of a packet, or hwmon_max to skip it. */
+static enum hwmon_sensor_types marvel_env_pkt_type(struct marvel_env_node *n,
+						   unsigned int pkt,
+						   unsigned int type)
+{
+	unsigned int len = env_rd(n, pkt) & 0xffff;
+	u32 kind;
+
+	switch (type) {
+	case ENV_PKT_SENSOR:
+		if (len < SENSOR_SIZE)
+			break;
+		kind = env_rd(n, pkt + SENSOR_KIND);
+		if (kind == SENSOR_KIND_THERMAL)
+			return hwmon_temp;
+		if (kind >= SENSOR_KIND_VOLT_FIRST && kind <= SENSOR_KIND_VOLT_LAST)
+			return hwmon_in;
+		break;
+	case ENV_PKT_FAN:
+		if (len >= FAN_SIZE)
+			return hwmon_fan;
+		break;
+	case ENV_PKT_POWER_SUPPLY:
+		if (len >= PS_SIZE)
+			return hwmon_power;
+		break;
+	}
+	return hwmon_max;
+}
+
+static void marvel_env_add_chan(struct marvel_env_data *data,
+				struct marvel_env_node *n, unsigned int pkt,
+				enum hwmon_sensor_types type,
+				unsigned int index)
+{
+	static const char * const what[hwmon_max] = {
+		[hwmon_temp] = "Temp", [hwmon_fan] = "Fan",
+		[hwmon_in] = "Volt", [hwmon_power] = "PS",
+	};
+	struct marvel_env_chan *c;
+	const char *pe = NULL;
+	size_t len = 0;
+
+	c = &data->chans[type][data->nr_chans[type]++];
+	c->node = n;
+	c->pkt = pkt;
+
+	if (n->cabinet || n->drawer)
+		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
+				n->cabinet, n->drawer);
+
+	if (n->pe < ARRAY_SIZE(pe_names))
+		pe = pe_names[n->pe];
+	if (pe && !strncasecmp(pe, what[type], strlen(what[type])))
+		scnprintf(c->label + len, sizeof(c->label) - len, "%s %u",
+			  pe, index);
+	else if (pe)
+		scnprintf(c->label + len, sizeof(c->label) - len, "%s %s %u",
+			  pe, what[type], index);
+	else
+		scnprintf(c->label + len, sizeof(c->label) - len, "PE%u %s %u",
+			  n->pe, what[type], index);
+}
+
+/*
+ * Walk a P&E node's packets, counting them, or adding them when @add. The
+ * header at hd_extension holds the count at +0x10 and the offset of the
+ * first packet at +0x14. As Tru64 does, visit count + 1 packets and number
+ * sensors from their position minus one.
+ */
+static void marvel_env_walk(struct marvel_env_data *data,
+			    struct marvel_env_node *n, bool add)
+{
+	unsigned int size = n->node->size;
+	unsigned int hdr = n->node->hd_extension;
+	unsigned int count, pkt, i;
+
+	if (!hdr || hdr + 0x18 > size)
+		return;
+	count = env_rd(n, hdr + 0x10);
+	pkt = env_rd(n, hdr + 0x14);
+
+	for (i = 0; i <= count; i++) {
+		enum hwmon_sensor_types type;
+		unsigned int len, pkt_type;
+
+		if (pkt < 8 || pkt + 8 > size)
+			break;
+		len = env_rd(n, pkt) & 0xffff;
+		pkt_type = env_rd(n, pkt + 4) & 0xffff;
+		if (len < 8 || pkt + len > size)
+			break;
+
+		type = marvel_env_pkt_type(n, pkt, pkt_type);
+		if (type != hwmon_max && add)
+			marvel_env_add_chan(data, n, pkt, type,
+					    pkt_type == ENV_PKT_SENSOR && i ?
+					    i - 1 : i);
+		else if (type != hwmon_max)
+			data->nr_chans[type]++;
+		pkt += len;
+	}
+}
+
+/* Collect the P&E nodes with an environmental packet list. */
+static void marvel_env_find_nodes(struct marvel_env_data *data,
+				  gct6_node *node, bool record)
+{
+	for (; node; node = node->next ? gct_node(node->next) : NULL) {
+		if (node->magic != GCT_NODE_MAGIC)
+			return;
+		if (node->type == GCT_TYPE_PE && node->hd_extension &&
+		    (node->flags & GCT_FLAGS_REQUIRED) &&
+		    !(node->flags & GCT_FLAGS_EXCLUDED)) {
+			if (record) {
+				struct marvel_env_node *n =
+					&data->nodes[data->nr_nodes];
+
+				n->node = node;
+				n->offset = (char *)node - (char *)gct_node(0);
+				marvel_env_keys(n);
+			}
+			data->nr_nodes++;
+		}
+		if (node->child)
+			marvel_env_find_nodes(data, gct_node(node->child),
+					      record);
+	}
+}
+
+static umode_t marvel_env_is_visible(const void *drvdata,
+				     enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	const struct marvel_env_data *data = drvdata;
+	const struct marvel_env_chan *c;
+
+	if (type == hwmon_chip)
+		return 0644;
+
+	/* Hide sensors that are absent when the driver loads. */
+	c = &data->chans[type][channel];
+	if (!env_status_valid(env_status(c->node, c->pkt + env_status_off(type))))
+		return 0;
+	return 0444;
+}
+
+static int marvel_env_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct marvel_env_data *data = dev_get_drvdata(dev);
+	struct marvel_env_chan *c;
+	struct marvel_env_node *n;
+	unsigned int pkt;
+	u8 status;
+	int ret;
+
+	if (type == hwmon_chip) {
+		*val = data->update_interval;
+		return 0;
+	}
+
+	c = &data->chans[type][channel];
+	n = c->node;
+	pkt = c->pkt;
+
+	mutex_lock(&data->lock);
+	ret = marvel_env_refresh(data, n);
+	if (ret)
+		goto out;
+
+	switch (type) {
+	case hwmon_temp:
+		status = env_status(n, pkt + SENSOR_STATUS);
+		switch (attr) {
+		case hwmon_temp_input:
+			if (!env_status_valid(status))
+				ret = -ENODATA;
+			else
+				*val = (s32)env_rd(n, pkt + SENSOR_VALUE) * 100L;
+			break;
+		case hwmon_temp_max:
+			*val = (s32)env_rd(n, pkt + SENSOR_WARN) * 100L;
+			break;
+		case hwmon_temp_crit:
+			*val = (s32)env_rd(n, pkt + SENSOR_FAULT) * 100L;
+			break;
+		case hwmon_temp_max_alarm:
+			*val = env_status_alarm(status);
+			break;
+		case hwmon_temp_crit_alarm:
+			*val = status == ENV_FAULT;
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_fan:
+		status = env_status(n, pkt + FAN_STATUS);
+		switch (attr) {
+		case hwmon_fan_input:
+			if (!env_status_valid(status))
+				ret = -ENODATA;
+			else
+				*val = env_rd(n, pkt + FAN_VALUE);
+			break;
+		case hwmon_fan_min:
+			*val = env_rd(n, pkt + FAN_WARN);
+			break;
+		case hwmon_fan_min_alarm:
+			*val = env_status_alarm(status);
+			break;
+		case hwmon_fan_fault:
+			*val = status == ENV_FAULT;
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_in:
+	case hwmon_power:
+		status = env_status(n, pkt + env_status_off(type));
+		if (!env_status_valid(status))
+			ret = -ENODATA;
+		else if (type == hwmon_in && attr == hwmon_in_input)
+			*val = (s32)env_rd(n, pkt + SENSOR_VALUE);
+		else
+			*val = env_status_alarm(status);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+out:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static int marvel_env_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	struct marvel_env_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_chip || attr != hwmon_chip_update_interval)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&data->lock);
+	data->update_interval = clamp_val(val, 0, 3600 * MSEC_PER_SEC);
+	mutex_unlock(&data->lock);
+	return 0;
+}
+
+static int marvel_env_read_string(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, const char **str)
+{
+	struct marvel_env_data *data = dev_get_drvdata(dev);
+
+	*str = data->chans[type][channel].label;
+	return 0;
+}
+
+static const struct hwmon_ops marvel_env_ops = {
+	.is_visible = marvel_env_is_visible,
+	.read = marvel_env_read,
+	.write = marvel_env_write,
+	.read_string = marvel_env_read_string,
+};
+
+static const struct {
+	enum hwmon_sensor_types type;
+	u32 config;
+} marvel_env_hwmon[] = {
+	{ hwmon_temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+		      HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_LABEL },
+	{ hwmon_fan, HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MIN_ALARM |
+		     HWMON_F_FAULT | HWMON_F_LABEL },
+	{ hwmon_in, HWMON_I_INPUT | HWMON_I_ALARM | HWMON_I_LABEL },
+	{ hwmon_power, HWMON_P_ALARM | HWMON_P_LABEL },
+};
+
+static const struct hwmon_channel_info * const marvel_env_chip_info =
+	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
+
+static int marvel_env_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct hwmon_channel_info **info;
+	struct marvel_env_data *data;
+	struct hwmon_chip_info *chip;
+	struct device *hwmon;
+	unsigned int i, k, nr_info = 0;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->dev = dev;
+	data->update_interval = 10 * MSEC_PER_SEC;
+	mutex_init(&data->lock);
+
+	marvel_env_find_nodes(data, gct_node(0), false);
+	if (!data->nr_nodes)
+		return -ENODEV;
+	data->nodes = devm_kcalloc(dev, data->nr_nodes, sizeof(*data->nodes),
+				   GFP_KERNEL);
+	if (!data->nodes)
+		return -ENOMEM;
+	data->nr_nodes = 0;
+	marvel_env_find_nodes(data, gct_node(0), true);
+
+	for (i = 0; i < data->nr_nodes; i++) {
+		marvel_env_refresh(data, &data->nodes[i]);
+		marvel_env_walk(data, &data->nodes[i], false);
+	}
+
+	info = devm_kcalloc(dev, ARRAY_SIZE(marvel_env_hwmon) + 2,
+			    sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+	info[nr_info++] = marvel_env_chip_info;
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_hwmon); k++) {
+		enum hwmon_sensor_types type = marvel_env_hwmon[k].type;
+		struct hwmon_channel_info *ci;
+		u32 *config;
+
+		if (!data->nr_chans[type])
+			continue;
+		data->chans[type] = devm_kcalloc(dev, data->nr_chans[type],
+						 sizeof(*data->chans[type]),
+						 GFP_KERNEL);
+		ci = devm_kzalloc(dev, sizeof(*ci), GFP_KERNEL);
+		config = devm_kcalloc(dev, data->nr_chans[type] + 1,
+				      sizeof(*config), GFP_KERNEL);
+		if (!data->chans[type] || !ci || !config)
+			return -ENOMEM;
+		for (i = 0; i < data->nr_chans[type]; i++)
+			config[i] = marvel_env_hwmon[k].config;
+		ci->type = type;
+		ci->config = config;
+		info[nr_info++] = ci;
+		data->nr_chans[type] = 0;
+	}
+	if (nr_info == 1)
+		return -ENODEV;
+
+	for (i = 0; i < data->nr_nodes; i++)
+		marvel_env_walk(data, &data->nodes[i], true);
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+	chip->ops = &marvel_env_ops;
+	chip->info = info;
+
+	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data, chip,
+						     NULL);
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static struct platform_driver marvel_env_driver = {
+	.driver = {
+		.name = DRVNAME,
+	},
+	.probe = marvel_env_probe,
+};
+module_platform_driver(marvel_env_driver);
+
+MODULE_ALIAS("platform:" DRVNAME);
+MODULE_DESCRIPTION("Marvel (EV7) AlphaServer environmental sensors");
+MODULE_LICENSE("GPL");

-- 
2.56.1

