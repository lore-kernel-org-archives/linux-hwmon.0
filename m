Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10642189C
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378796; cv=none; b=qBfiCyst8SK5Rt+MVTeaErmPm6GP9Q+YQguwts9Zx2guXb/pDVjHfAFYRa/gdqf9NIZyy1vYJ4hYvgAvEx7apMiFy7tUvl0Y17ZYrojuNRQd2tCn5RwtIRUMzXjsT5EqGK0lCFvte0tmmy1H4OGWnMQVN1Pbsh/EkIAYsENL3Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378796; c=relaxed/simple;
	bh=M/sOIDN1OH5lbAtVgg3JeylSjCLDwSD5RTk79w8wpko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uI31IT/ukl54580LOeymJVxo81oA1q6JguhArTGz1EJ+jGNE3Hi6EDtA4/EuzQLZpXRTd5QbOM9IWh9cmilTB40z+f7kuX6oOxYO+4Q1KU0IapWKQgEKqdupm8tKmJYnY2gowJfq7yhVpEWfotQez7HQ1Apwgy1Q1QrzHmORthM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=fail smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=AoCGqHKt; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="AoCGqHKt"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so4556211b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 05:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777378784; x=1777983584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=am9M3EBhsBtI0W+fdPdNyDSQadIL28OCsPQk25ZYgrA=;
        b=AoCGqHKtA5JLLi8MIovpDUPqqy3Uwjq10CnUyeIFJlZzhRndg/gvcPTB36eZSx1k/+
         Egktoyz25eoeX0bFpnzAkKFBXweomcXF5FqfABm5lD6y9dTvyVc4ROqVjP8pbK7UqxKB
         kDWMKjn286uzXBFDBymr1j7YX8hbqMm4Q/sX2tKmBZv/uNAWb2YH1C8LQLhbPTqT1bK+
         niMYN7UJ5iKmBfvsmT/6NwspVCA0VcA02cLFwpObbbmLwfU/ru6JQ+F8rxt3TFiCx0vV
         3jcMe4BPJ3azMQcSOov0QpydgZ/U0qajHa8lSS9t+2a3HVoRsvImo/fbhjbOGqpnG1mS
         Xd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378784; x=1777983584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=am9M3EBhsBtI0W+fdPdNyDSQadIL28OCsPQk25ZYgrA=;
        b=IZAixkVjxSLUs2AByBZJDdWRCB/ZCpAxtl7h10ITHd5bD6ALZEvkFQzfax78ABGKit
         udleWRwIsnjHqxHNP8A47yXJFRiNhYp1tOf31QKagAx0GCAEabCbiQ1L9024U02znJ50
         qfdVsIrp2qtPHhiALxHmcg7lHs/iAhfA+KUfmWTN1PEAizNOyr05e7mYDc1gIjbcdW7o
         HjI8OVT1fS8TS4MknLYctqOjyysmut4iA8jVw/cnezWwQq4L7xAn5LdHmR0xh28UR+LU
         8AP2aE4TtfsZ55eD3tIU2Qa1teP43+el/7RIOsgajt6buiMZbW8zsIGnMO4Vol8AY9Rg
         uzpA==
X-Gm-Message-State: AOJu0Yy/eBUHDrqSOstJ8ACeub5W2Hj00qxS3chIpeZuqrpCrN0xJQsf
	7VIuoIFooGgSFDqxVIYq5WGU+M/448X09tGE8LtLp1LRxTivu8Y+cvMeXdWMPyxjwh8=
X-Gm-Gg: AeBDieugmMorXCfR6GqF6zQmnQs2llF6JlLWrkCBt0g1J2xrZ8wmMQx2mN55Y0KW78C
	vrn+x41I2HGvBcqPYLn9uqi82OlNbTzj8sV32nkg0f3KdNSwFS/yPGqZXD8pJalL8h8J8qiwWoV
	OnZ3ySz4H4sQ75wL9w93HT0JNFP6Cvq+kIBGN3dld+xbkABo7YoP/pZ5yxPiaCj9tI0sbKW9/vw
	cAGhUQqmCSRrm8Xm+0MyNtj5jY6sqDeQqfxhjJWD0FmYy5VHohHUD6tgLddEE5zuCN9L6OaSMgm
	49mqibYGh0ogh3KsKhiXPrum4V0QXGMqe2k45ibN5wgr5/LPrGFS7IYeId+1z+B1seaa2SrootZ
	JA3YMD26gOJbhk1jfilKAgRaFKuqFvqrG1LPblgltpbwS6RN/L6rRLTr9BfITlUNrIytL+Tv6Hw
	4yezdGCjt6avR99AoGF1qZFO0fqnomqMOXtenhJgcH
X-Received: by 2002:a05:6a00:1805:b0:82c:e09b:3f76 with SMTP id d2e1a72fcca58-834ddc791bdmr3068989b3a.41.1777378783835;
        Tue, 28 Apr 2026 05:19:43 -0700 (PDT)
Received: from [127.0.1.1] ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf5705fsm3254587b3a.42.2026.04.28.05.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:19:43 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Tue, 28 Apr 2026 12:19:29 +0000
Subject: [PATCH v2 2/2] hwmon: (pmbus/lx1308) Add support for LX1308
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-add-support-lx1308-v2-2-90f115954143@inventec.com>
References: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
In-Reply-To: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777378774; l=11714;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=M/sOIDN1OH5lbAtVgg3JeylSjCLDwSD5RTk79w8wpko=;
 b=lPbZLKRAyGIyAkbNNrCinnnrVVDG3QyFhF6tEDprn2s4A4zTXl5PVTHVCz2M1npddCMeIWjCR
 Dt6SU4zkHaZBSjoJ+Bry1czDY0ywld4nrVatCkbAHrWFOPuWJbPMJg0
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

Add support for the Luxshare LX1308, a high-efficiency 12V 860W
DC/DC power module. The module operates from 40-60V input voltage.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/lx1308.rst |  90 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |  10 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/lx1308.c   | 204 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 306 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b2ca8513cfcd..c86c21554c37 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -145,6 +145,7 @@ Hardware Monitoring Kernel Drivers
    ltc4261
    ltc4282
    ltc4286
+   lx1308
    macsmc-hwmon
    max127
    max15301
diff --git a/Documentation/hwmon/lx1308.rst b/Documentation/hwmon/lx1308.rst
new file mode 100644
index 000000000000..c1b72e1647c5
--- /dev/null
+++ b/Documentation/hwmon/lx1308.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver lx1308
+====================
+
+Supported chips:
+
+  * Luxshare LX1308
+
+    Prefixes: 'lx1308'
+
+    Addresses scanned: -
+
+    Datasheet: Datasheet is not publicly available.
+
+Author: Brian Chiang <chiang.brian@inventec.com>
+
+
+Description
+-----------
+
+The LX1308 is a high-efficiency, non-isolated, regulated 12V, 860W,
+digital DC/DC power module. The module operates from a 40V to 60V DC
+primary bus and provides a 12V regulated output voltage. It can deliver
+up to 860W continuous and 1300W in transient.
+
+The module has slow OCP and fast OCP. If the module output current is higher
+than slow OCP set point and the lasting time is also longer than the delay,
+the module will shut down and retry 3 time, if the fault still exists then
+module enter latch mode.
+
+If the module output current is higher than fast OCP set point then it shut
+down and enter latch mode.
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
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr1_alarm             Input current alarm
+curr1_input             Input current (IIN)
+curr1_label             "iin"
+curr2_crit              Output over current fault threshold (slow OCP, 60ms delay)
+curr2_crit_alarm        Output over current fault alarm
+curr2_input             Output current (IOUT)
+curr2_label             "iout1"
+curr2_max               Output over current warning threshold (slow OCP, 60ms delay)
+curr2_max_alarm         Output over current warning alarm
+in1_crit                Input over voltage fault threshold
+in1_crit_alarm          Input over voltage fault alarm
+in1_input               Input voltage (VIN)
+in1_label               "vin"
+in1_lcrit               Input under voltage fault threshold
+in1_lcrit_alarm         Input under voltage fault alarm
+in1_max                 Input over voltage warning threshold
+in1_max_alarm           Input over voltage warning alarm
+in1_min                 Input under voltage warning threshold
+in1_min_alarm           Input under voltage warning alarm
+in2_crit                Output over voltage fault threshold
+in2_crit_alarm          Output over voltage fault alarm
+in2_input               Output voltage (VOUT)
+in2_label               "vout1"
+in2_lcrit               Output under voltage fault threshold
+in2_lcrit_alarm         Output under voltage fault alarm
+in2_max                 Output over voltage warning threshold
+in2_max_alarm           Output over voltage warning alarm
+in2_min                 Output under voltage warning threshold
+in2_min_alarm           Output under voltage warning alarm
+power1_alarm            Input power alarm
+power1_input            Input power (PIN)
+power1_label            "pin"
+power2_input            Output power (POUT)
+power2_label            "pout1"
+temp1_crit              Over temperature fault threshold
+temp1_crit_alarm        Over temperature fault alarm
+temp1_input             Module hot spot temperature
+temp1_max               Over temperature warning threshold
+temp1_max_alarm         Over temperature warning alarm
+======================= ======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fc1273abe357..1b003a828537 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -302,6 +302,16 @@ config SENSORS_LTC4286
 	  If you say yes here you get hardware monitoring support for Analog
 	  Devices LTC4286.
 
+config SENSORS_LX1308
+	tristate "Luxshare LX1308 DC/DC Power Module"
+	help
+	  If you say yes here you get hardware monitoring support for
+	  Luxshare LX1308, a high-efficiency 12V 860W DC/DC power module
+	  with PMBus interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called lx1308.
+
 config SENSORS_MAX15301
 	tristate "Maxim MAX15301"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d6c86924f887..95fc539a77e9 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
 obj-$(CONFIG_SENSORS_LTC4286)	+= ltc4286.o
+obj-$(CONFIG_SENSORS_LX1308)	+= lx1308.o
 obj-$(CONFIG_SENSORS_MAX15301)	+= max15301.o
 obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
 obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
diff --git a/drivers/hwmon/pmbus/lx1308.c b/drivers/hwmon/pmbus/lx1308.c
new file mode 100644
index 000000000000..0c453393796b
--- /dev/null
+++ b/drivers/hwmon/pmbus/lx1308.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define LX1308_MFR_IOUT_OCP3_FAULT	0xBE
+#define LX1308_MFR_IOUT_OCP3_WARN	0xBF
+
+/*
+ * Decode a Linear11-encoded word to an integer value.
+ * Linear11 format: bits[15:11] = signed 5-bit exponent,
+ * bits[10:0] = signed 11-bit mantissa. Result = mant * 2^exp.
+ */
+static inline int linear11_to_int(u16 word)
+{
+	s16 exp = ((s16)word) >> 11;
+	s16 mant = ((s16)((word & 0x7ff) << 5)) >> 5;
+
+	return (exp >= 0) ? (int)((u32)mant << exp) : (mant >> -exp);
+}
+
+static int lx1308_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	int ret;
+
+	if (page > 0)
+		return -ENXIO;
+
+	switch (reg) {
+	/*
+	 * The LX1308 OCP3 registers (slow OCP, 60ms delay) use a
+	 * manufacturer-specific U8.0 format. Read the byte value N and present
+	 * it as a Linear11 word with exponent 0.
+	 */
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		ret = i2c_smbus_read_byte_data(client, LX1308_MFR_IOUT_OCP3_FAULT);
+		if (ret < 0)
+			break;
+		ret &= 0x7FF;
+		break;
+
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = i2c_smbus_read_byte_data(client, LX1308_MFR_IOUT_OCP3_WARN);
+		if (ret < 0)
+			break;
+		ret &= 0x7FF;
+		break;
+
+	/*
+	 * The following registers are not implemented by the LX1308. Return
+	 * -ENXIO to suppress the corresponding sysfs attributes.
+	 */
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_UC_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+	case PMBUS_POUT_OP_WARN_LIMIT:
+	case PMBUS_UT_WARN_LIMIT:
+	case PMBUS_UT_FAULT_LIMIT:
+	case PMBUS_MFR_IIN_MAX:
+	case PMBUS_MFR_IOUT_MAX:
+	case PMBUS_MFR_VIN_MIN:
+	case PMBUS_MFR_VIN_MAX:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_MFR_PIN_MAX:
+	case PMBUS_MFR_POUT_MAX:
+	case PMBUS_MFR_MAX_TEMP_1:
+		ret = -ENXIO;
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int lx1308_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	int ret;
+
+	if (page > 0)
+		return -ENXIO;
+
+	switch (reg) {
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		/*
+		 * Decode Linear11 word from pmbus_core back to a plain integer
+		 * and write as the U8.0 byte the device expects.
+		 */
+		ret = i2c_smbus_write_byte_data(client, LX1308_MFR_IOUT_OCP3_FAULT,
+						clamp_val(linear11_to_int(word), 0, 255));
+		break;
+
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = i2c_smbus_write_byte_data(client, LX1308_MFR_IOUT_OCP3_WARN,
+						clamp_val(linear11_to_int(word), 0, 255));
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static struct pmbus_driver_info lx1308_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		| PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+		| PMBUS_HAVE_PIN | PMBUS_HAVE_POUT
+		| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+		| PMBUS_HAVE_STATUS_INPUT,
+
+	.read_word_data  = lx1308_read_word_data,
+	.write_word_data = lx1308_write_word_data,
+};
+
+static const struct of_device_id lx1308_of_match[] = {
+	{ .compatible = "luxshare,lx1308" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, lx1308_of_match);
+
+static const struct i2c_device_id lx1308_id[] = {
+	{ "lx1308" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, lx1308_id);
+
+static int lx1308_probe(struct i2c_client *client)
+{
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read manufacturer id\n");
+	buf[ret] = '\0';
+
+	if (ret != 12 || strncmp(buf, "LUXSHARE", 8))
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported Manufacturer ID '%s'\n", buf);
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read Manufacturer Model\n");
+	buf[ret] = '\0';
+
+	for (mid = lx1308_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0])
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported Manufacturer Model '%s'\n", buf);
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read Manufacturer Revision\n");
+	buf[ret] = '\0';
+
+	if (ret != 12 || buf[0] != 'V')
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported Manufacturer Revision '%s'\n", buf);
+	return pmbus_do_probe(client, &lx1308_info);
+}
+
+static struct i2c_driver lx1308_driver = {
+	.driver = {
+		.name = "lx1308",
+		.of_match_table = lx1308_of_match,
+	},
+	.probe = lx1308_probe,
+	.id_table = lx1308_id,
+};
+
+module_i2c_driver(lx1308_driver);
+
+MODULE_AUTHOR("Brian Chiang <chiang.brian@inventec.com>");
+MODULE_DESCRIPTION("PMBus driver for Luxshare LX1308");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.43.0

