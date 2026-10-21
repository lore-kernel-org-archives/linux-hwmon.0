Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551737;
	b=05/PnNKWmOE2Dv5Cfx0KR3/15GAHt8rmaI1nNyoLEU2Nm/SIxOH8HKL+zUEMqBHhRwDe
	 kHrl1Bk1amGxo+N1B5TMUbxgL9bfgK+E5govlpHvzeQDk3AEZFgsXfIO90ui+vsEw/Xld
	 639o0BKD/Sjg600OWI5gGO/u5KbsJpdscpu30b6hCwoJKjjvdKZjO7RABgYuS0otjEI9i
	 Zjt6ySgMro3HOKkPXqVV8/motg2Ci6bZssDUQVfNYPADxBBwZHwk6CZDPXgPhT5hGkegw
	 L6tknB6KitzWd0QRVYh/cw/hRcM7MrxULfMTwaDMGQksQMJWcxqrqBNM1ka+XcmfQ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8henHE9/qdCt8Nlu46oWUg4no6BP9dhaZWHwMjUANPc=;
	b=f5ZT2401Tb9DlmFeeTJ8oX7V0gcjiRKJlnJ0OtHAKrsxtql/Q6A46Dd82T1u0x8pTbx+
	 m/IV5pi+H/kZ4kJt8eWgMWtlJ8UGSlup2/BcjSpMUdL7zRRQy/7Jc8YmYhbOkdFCy1SL8
	 2rxRzkJJJW065ZFdORH5VUelXOKmrBsMJ8A0ZrkxR9+68vAXwruGFSWfSLG4hisfXBqv4
	 xKfWGzR3PNLV/lwAXD8S0b1hmsv58x1mZEsPZARnr2Pr9LbBT8k9B0qcbl2Pnx+qHL38V
	 8VXMdbjZPaee12deRKPA5S3cwPCPZoPjZrf98qT4wwJJut3VUMAn/wdSgEjukRubmAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CZLZKvuW;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67999606A322
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 03:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67999606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CZLZKvuW
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35c76e9614aso447968eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 20:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551736; x=1793156536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8henHE9/qdCt8Nlu46oWUg4no6BP9dhaZWHwMjUANPc=;
        b=CZLZKvuWeyTY05mPDf3jdXz3mnKEkhdP1zGzX7dt8j59AWY8IFobj+h9fspBTE0XS/
         /Mr4+RX3aLjrXCk+k9IgLndytMEr+SWASlrUc06JnN66MBNu1CqdFBFlPGYO65nzNkgS
         oXvPTr+KtHQTlX4W/Ogcou23ReEHoFXZaYq6ja4b7TbxRCvWiYNoP+UvDmuvpFGLIeBb
         CGldxT0nPRUt10lV5MFQqfTeWQ2VXWwIlMutjlAhaXnH7wc1WzAhkl2I+omu13jo0kqO
         Bc24azIomV+DWL3rS0UTJTRaSph1xknE/s0hA7kwRIrwwV8I3m24pfUxqarZEBIv8w3r
         ScDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551736; x=1793156536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8henHE9/qdCt8Nlu46oWUg4no6BP9dhaZWHwMjUANPc=;
        b=QZoixzKBBhD6CRk6K8u5aNiK+wd6p+f1qzFxfcO9aiUvMYNKoAq9/m988kXmjypihR
         7O6Br10sS7nSEl9yrD+wDhbHetHZ53QtOuzBCOskNhXKTJ7Uc4SGl2BU1isxn7PrzKgV
         QZRoCT9hekbxZwe4SYc1QMCtCPPvfOXn223sSgQCBvwqkCCc6lHILnnh13nHg9FpBTcK
         uWrOb0hL5pu7hPHVjicZZZ3X+kMhex5vlEHSQjRZDOAOXLMqKNFFV/w3yHD4Hv1yZzfO
         CzXqhMQUp+Y54PNCchuvHTEURYTmOM/Lxync7rVElw+yoroD26+o6cAxANY8UzqWjz4K
         /kHg==
X-Forwarded-Encrypted: i=1; AKwUvByrZCAaB3xwmhXfno5QqGp3loaO3yz16VuuMJvyl5UUMnxp89ObdQ664LrGKfRrLPncGXFhLjoTGTy2bA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIUDSxE7/i64i+CchHlH/iIjVzS9m3kVbvj541pf99xrBpn7uph
	LQp5iv7tGoauva2Ny0L3TdCuGa4b6v7LeqF8uhU29+HnvuMhFsrWek3+M9QjHM6ROuQ=
X-Gm-Gg: AYBFou2BtUOsut/NoxkArzvLT2poW2jA5lDvIb+RnImDvJmu2hJVj8KpL/+B6c1EMiw
	4UssNU6QEwzGm8IhISQUNEA26Ckg5P+bZaPgDdXINeg01EQbKqnvU8kLZvoYi8V6bDvgfu8u4Z5
	UtvbmJh5mdwRJ0K4pCVMk2W/8OqlsKaezMx0ejTL6EmY7xg95hsNUeggCdXXqJYA/vBuKXvLmOY
	H4uGbQr3yQhLSFjLNIF7fKkOYZwcJlQ86E0RfDbQvwLtKg/vjINtvg/KIdEIeEPJgP0DGYTqLAn
	oUeeWqy09+muGZypnw5tJT55h0bhpfnve08vVgGToRXt3ZTUDmsetQY5Be7FAX2/glAQQVOZdDi
	VFQjJxnBooho5U3bUwJKRdLh79PgZqJlnQp1LY7hAMct3mDGzmdTc5pGY+hTn82i6xker89F0Vw
	CoIKgPVRYKKIz9dmAQQpByd8pozMqvDfA5o9hlpf4OVeBcwpwg/2OetOmfqFbhFP40q5btrWk0w
	vXJ5epa5U6M2Xm6fulc0ZLi2w0Qh7siFclPicXwjWUNH+98A66N9g5A9hc=
X-Received: by 2002:a05:693c:4144:10b0:365:9e3c:4ab2 with SMTP id 5a478bee46e88-3674f411e7fmr1638199eec.41.1792551735417;
        Tue, 20 Oct 2026 20:02:15 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:14 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:08 -0700
Subject: [PATCH v4 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=14547;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=wZvLMQuH89Zfy6d10xvpZvNTOsM7iJs3bh5N4dYTTA8=;
 b=nnNPi7OWq3Zc1HyoJk77osGLYt6CgucfFLqWdoBgyvU1nHZ02h3ePIqLKLFJHoghQWEP8XHjc
 SexpHW2aTktDh1ZvNkOP4BKLeOmo0pa1FSCBhZXBo9v4efpByFuPDic
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
telemetry for input voltage, output voltage and temperature, plus the
matching status registers. The FS1525 also reports output current and
has an over-temperature warning limit. The FS1412 has neither:
READ_IOUT and OT_WARN_LIMIT are not in its command table. Both read
"KDT" from MFR_ID, which the driver checks before binding, and are
told apart by IC_DEVICE_ID (0x0c for the FS1412, 0x19 for the FS1525).

VOUT_MODE is read-only and has bit 7 set on both: 0x98 on the FS1412
(exponent -8) and 0x96 on the FS1525 (exponent -10). Their output
voltage limits are relative to VOUT_COMMAND, so 0x0133 against a 0.6V
command is a 120% over-voltage limit on the FS1412. The PMBus core
converts them now that it supports relative VOUT encoding.

On the FS1412, OT_WARN_LIMIT answers although it is not in the command
table, but the part reports OT_WARNING at room temperature, so the
driver hides the register from the core and only the OT_FAULT_LIMIT
based attributes are provided.

When the output is set with an external divider, the FS1412 reports
READ_VOUT at the feedback pin, so in2_input and its limits all scale
with the divider in user space. The FS1525 reports READ_VOUT as the
output voltage and compares it against its warning and under-voltage
limits as they are, relative to VOUT_COMMAND. Its over-voltage fault
is an analog comparison at the feedback pin, which would read below
in2_input on such boards, so the driver hides VOUT_OV_FAULT_LIMIT on
the FS1525.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/hwmon/fs1412.rst | 124 ++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst  |   1 +
 MAINTAINERS                    |   7 ++
 drivers/hwmon/pmbus/Kconfig    |   9 +++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/fs1412.c   | 171 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 313 insertions(+)

diff --git a/Documentation/hwmon/fs1412.rst b/Documentation/hwmon/fs1412.rst
new file mode 100644
index 000000000000..b9fb083b7569
--- /dev/null
+++ b/Documentation/hwmon/fs1412.rst
@@ -0,0 +1,124 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver fs1412
+====================
+
+Supported chips:
+
+  * TDK FS1412
+
+    Prefix: 'fs1412'
+
+    Addresses scanned: -
+
+    Datasheet: https://product.tdk.com/system/files/dam/doc/product/power/switching-power/micro-pol/data_sheet/fs1412_datasheet.pdf
+
+  * TDK FS1525
+
+    Prefix: 'fs1525'
+
+    Addresses scanned: -
+
+    Datasheet: Publicly available at the TDK website
+
+Authors:
+    Abdurrahman Hussain <abdurrahman@nexthop.ai>
+
+
+Description
+-----------
+
+This driver implements support for the TDK FS1412 and FS1525 uPOL DC/DC
+regulators.
+
+The FS1412 is a 12A part with PMBus monitoring of its input voltage, output
+voltage and temperature. It has over-current and over-temperature protection
+with programmable fault limits but no current telemetry, so no current
+attributes are provided.
+
+The FS1525 is a 25A part that adds output current telemetry and an
+over-temperature warning limit.
+
+Both parts read "KDT" from MFR_ID. The driver tells them apart by
+IC_DEVICE_ID and warns if the detected part does not match the one it was
+instantiated as.
+
+The FS1412 answers on two I2C addresses: a register interface at the I2C
+base address (0x08 by default) and the PMBus interface at the PMBus base
+address (0x70 by default), each plus the offset strapped on the ADDR pin.
+This driver binds to the PMBus address.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+Both parts store their output voltage limits relative to VOUT_COMMAND
+(VOUT_MODE bit 7 set). The PMBus core converts them to and from absolute
+voltages, so the output voltage limits read and write in volts. A written
+limit is stored as a fraction of VOUT_COMMAND in the resolution of VOUT_MODE
+(1/256 on the FS1412, 1/1024 on the FS1525), so it may read back rounded. The
+over-voltage protection itself engages at one of four thresholds the device
+rounds the fault limit to; see the datasheet.
+
+When the output voltage is set with an external resistor divider,
+VOUT_COMMAND holds the feedback pin target rather than the output voltage,
+and the two parts differ:
+
+- The FS1412 reports READ_VOUT at the feedback pin, so in2_input and the in2
+  limits are all in the feedback domain. Scale them by the divider ratio in
+  user space.
+
+- The FS1525 reports READ_VOUT as the output voltage. Its warning and
+  under-voltage limits are compared by the device against READ_VOUT but are
+  still relative to VOUT_COMMAND, so in2_max, in2_min and in2_lcrit are the
+  thresholds the device actually applies to in2_input. Its over-voltage
+  fault is an analog comparison at the feedback pin, which would read below
+  in2_input on such boards, so in2_crit is not provided for the FS1525.
+
+The FS1412 reports an over-temperature warning at room temperature and has
+no OT_WARN_LIMIT in its command table, so temp1_max and its alarm are not
+provided for it; temp1_crit comes from OT_FAULT_LIMIT.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_min			Minimum input voltage
+in1_min_alarm		Input voltage low alarm
+in1_crit		Critical high input voltage
+in1_crit_alarm		Input voltage critical high alarm
+
+in2_label		"vout1"
+in2_input		Measured output voltage (FS1412: at the feedback pin)
+in2_min			Minimum output voltage
+in2_min_alarm		Output voltage low alarm
+in2_max			Maximum output voltage
+in2_max_alarm		Output voltage high alarm
+in2_lcrit		Critical low output voltage
+in2_lcrit_alarm		Output voltage critical low alarm
+in2_crit		Critical high output voltage (FS1412 only)
+in2_crit_alarm		Output voltage critical high alarm (FS1412 only)
+
+curr1_label		"iout1" (FS1525 only)
+curr1_input		Measured output current (FS1525 only)
+curr1_max		Maximum output current (FS1525 only)
+curr1_max_alarm		Output current high alarm (FS1525 only)
+curr1_crit		Critical high output current (FS1525 only)
+curr1_crit_alarm	Output current critical high alarm (FS1525 only)
+
+temp1_input		Measured temperature
+temp1_max		Maximum temperature (FS1525 only)
+temp1_max_alarm		Temperature high alarm (FS1525 only)
+temp1_crit		Critical high temperature
+temp1_crit_alarm	Temperature critical high alarm
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9955a525436a..625833374c94 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -79,6 +79,7 @@ Hardware Monitoring Kernel Drivers
    f71805f
    f71882fg
    fam15h_power
+   fs1412
    fsp-3y
    ftsteutates
    g760a
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..73b5a120517e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26778,6 +26778,13 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/tda9840*
 
+TDK FS1412 AND FS1525 MICRO POL DRIVER
+M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/fs1412.rst
+F:	drivers/hwmon/pmbus/fs1412.c
+
 TEA5761 TUNER DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index eb71a0ac044b..67bbc87710ee 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -132,6 +132,15 @@ config SENSORS_DELTA_AHE50DC_FAN
 	  This driver can also be built as a module. If so, the module
 	  will be called delta-ahe50dc-fan.
 
+config SENSORS_FS1412
+	tristate "TDK FS1412 and FS1525"
+	help
+	  If you say yes here you get hardware monitoring support for the TDK
+	  FS1412 and FS1525 uPOL regulators.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called fs1412.
+
 config SENSORS_FSP_3Y
 	tristate "FSP/3Y-Power power supplies"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index e288fe72a437..7bbc0d02bfad 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_APS_379)	+= aps-379.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
 obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
+obj-$(CONFIG_SENSORS_FS1412)	+= fs1412.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
diff --git a/drivers/hwmon/pmbus/fs1412.c b/drivers/hwmon/pmbus/fs1412.c
new file mode 100644
index 000000000000..de69116c43f5
--- /dev/null
+++ b/drivers/hwmon/pmbus/fs1412.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for the TDK FS1412 and FS1525 uPOL regulators
+ *
+ * Copyright 2026 Nexthop Systems.
+ */
+
+#include <linux/array_size.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+#include <linux/string.h>
+
+#include "pmbus.h"
+
+#define FS1412_MFR_ID		"KDT"
+#define FS1412_MFR_ID_LEN	(sizeof(FS1412_MFR_ID) - 1)
+
+/*
+ * OT_WARN_LIMIT is not in the FS1412 command table. The register answers,
+ * but the part has no warning threshold and reports OT_WARNING at room
+ * temperature, so keep the core from exposing either.
+ */
+static int fs1412_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	if (reg == PMBUS_OT_WARN_LIMIT)
+		return -ENXIO;
+
+	return -ENODATA;
+}
+
+static int fs1412_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	if (reg == PMBUS_OT_WARN_LIMIT)
+		return -ENXIO;
+
+	return -ENODATA;
+}
+
+/*
+ * The FS1525 compares READ_VOUT, the output voltage, against its warning and
+ * under-voltage limits, but its over-voltage fault is an analog comparison at
+ * the feedback pin. With an external divider VOUT_OV_FAULT_LIMIT would read in
+ * feedback-pin volts, below in2_input, and the part cannot report the divider,
+ * so do not expose it.
+ */
+static int fs1525_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	if (reg == PMBUS_VOUT_OV_FAULT_LIMIT)
+		return -ENXIO;
+
+	return -ENODATA;
+}
+
+static int fs1525_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	if (reg == PMBUS_VOUT_OV_FAULT_LIMIT)
+		return -ENXIO;
+
+	return -ENODATA;
+}
+
+enum chips { fs1412, fs1525 };
+
+/* IC_DEVICE_ID, a one byte block */
+static const u8 fs1412_device_id[] = {
+	[fs1412] = 0x0c,
+	[fs1525] = 0x19,
+};
+
+static struct pmbus_driver_info fs1412_info[] = {
+	[fs1412] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+			   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_word_data = fs1412_read_word_data,
+		.write_word_data = fs1412_write_word_data,
+	},
+	[fs1525] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+			   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_word_data = fs1525_read_word_data,
+		.write_word_data = fs1525_write_word_data,
+	},
+};
+
+static const struct i2c_device_id fs1412_id[] = {
+	{ .name = "fs1412", .driver_data = fs1412 },
+	{ .name = "fs1525", .driver_data = fs1525 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, fs1412_id);
+
+static int fs1412_probe(struct i2c_client *client)
+{
+	char buf[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
+	struct device *dev = &client->dev;
+	enum chips chip, detected;
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_ID\n");
+
+	if (ret != FS1412_MFR_ID_LEN ||
+	    strncmp(buf, FS1412_MFR_ID, FS1412_MFR_ID_LEN))
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported Manufacturer ID '%s'\n", buf);
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to read PMBUS_IC_DEVICE_ID\n");
+	if (ret != 1)
+		return dev_err_probe(dev, -ENODEV,
+				     "Unexpected IC_DEVICE_ID length %d\n", ret);
+
+	for (detected = 0; detected < ARRAY_SIZE(fs1412_device_id); detected++)
+		if (fs1412_device_id[detected] == (u8)buf[0])
+			break;
+	if (detected == ARRAY_SIZE(fs1412_device_id))
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported IC_DEVICE_ID 0x%02x\n",
+				     (u8)buf[0]);
+
+	chip = (uintptr_t)i2c_get_match_data(client);
+	if (chip != detected)
+		dev_warn(dev, "Device mismatch: Configured %s, detected %s\n",
+			 client->name, fs1412_id[detected].name);
+
+	return pmbus_do_probe(client, &fs1412_info[detected]);
+}
+
+static const struct of_device_id fs1412_of_match[] = {
+	{ .compatible = "tdk,fs1412", .data = (void *)fs1412 },
+	{ .compatible = "tdk,fs1525", .data = (void *)fs1525 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, fs1412_of_match);
+
+static struct i2c_driver fs1412_driver = {
+	.driver = {
+		.name = "fs1412",
+		.of_match_table = fs1412_of_match,
+	},
+	.probe = fs1412_probe,
+	.id_table = fs1412_id,
+};
+
+module_i2c_driver(fs1412_driver);
+
+MODULE_AUTHOR("Abdurrahman Hussain <abdurrahman@nexthop.ai>");
+MODULE_DESCRIPTION("PMBus driver for the TDK FS1412 and FS1525 uPOL regulators");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.54.0

