Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09073126D6
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097672; cv=none; b=T8JukfSsl4pcgUpKkZcWsC1fpukt98G5ecaW0GoKAi09VMM71pqIW0vsCyMrekrQTZ3z0K4edSJiipMyRvWcVxPZw/TD2u/9pcErIZvhPY38/goWWWsY4TXsrDu0ak8yN+ezuWIzBWHkGRpH60pXpPW4z8ox1wuRvhPKSXAkhDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097672; c=relaxed/simple;
	bh=Txt+WdQS9R7oGpuL602PCmRt6KMClDiQ6MEy8cOPOMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=scApeYS40h2pt0iXsAIPErbgKufWtAQnEBQ1vT90GpaiZpkDWW4kCLxMqRO9fS6NlfkuykBe7AeBio/6tSMPAAUbhNIER/Qo4hUEFmrbyyEzlNm11Lv0nm/+orynTH2ljY04xhOLnfrvuVbL0WK4t5KkN6zFUYn+mPddi0hCoI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=PrGd5B/5; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="PrGd5B/5"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C62142C04CF;
	Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775097667;
	bh=P+CQWOb8xR3uTpnzNfYZrJ8fKIU22HcjGh/ILLR16ZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PrGd5B/5PbXLo2JW6JfhEHPh9KnFSXRoojaGyR0F9TwMn/nqkBJspi6VaBy/kLvVL
	 X9QcgXbk7/euC8cR3e3LUUN+DuKxMZoYFMBfoG04NER/hid+Zct2ColSrklRuVRYY5
	 4mvRnGyLxjkl6lxAn9HZb6VxqHb+eAE+UaVhP6YgZJcuvlAGPPEkaj+CYGRAsvJEmG
	 wOQAhtnuZb7RU9zerVNbxF/sQKBlHyGeFgFj2gMCVbTBZgu80/pNr7NH/U/7BYx4ki
	 i+pFspNba+q3tanSwyH925Lo5f/9CxT/FIKudY88uKu6y9LMCq111aR6pjzRpXunlg
	 wGPf81pQpv1NA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cdd7430002>; Thu, 02 Apr 2026 15:41:07 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 8261113EE7A;
	Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 7B993280A7B; Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 2/2] hwmon: pmbus: Add support for Sony APS-379
Date: Thu,  2 Apr 2026 15:41:00 +1300
Message-ID: <20260402024101.4136697-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
References: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cdd743 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=e6eYRz_1WUNsZJDutzsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add pmbus support for Sony APS-379 power supplies. There are a few PMBUS
commands that return data that is undocumented/invalid so these need to
be rejected with -ENXIO. The READ_VOUT command returns data in linear11
format instead of linear16 so we need to workaround this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v4:
    - Deal with signed linear11 reading for READ_VOUT
    - Ignore non-standard IOUT_OC_FAULT_LIMIT
    - Add more unsupported commands (iout and temp limits)
    - Use fixed value for VOUT_MODE
    Changes in v3:
    - Add missing MODULE_DEVICE_TABLE(i2c, ...) and move aps_379_id to ju=
st
      above the probe.
    - Remove unnecessary sign_extend32
    - Zero initialise array on stack
    Changes in v2:
    - Simplify code per recommendations from Guenter
    - Add driver documentation

 Documentation/hwmon/aps-379.rst |  58 +++++++++++
 Documentation/hwmon/index.rst   |   1 +
 drivers/hwmon/pmbus/Kconfig     |   6 ++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/aps-379.c   | 178 ++++++++++++++++++++++++++++++++
 5 files changed, 244 insertions(+)
 create mode 100644 Documentation/hwmon/aps-379.rst
 create mode 100644 drivers/hwmon/pmbus/aps-379.c

diff --git a/Documentation/hwmon/aps-379.rst b/Documentation/hwmon/aps-37=
9.rst
new file mode 100644
index 000000000000..468ec5a98fd6
--- /dev/null
+++ b/Documentation/hwmon/aps-379.rst
@@ -0,0 +1,58 @@
+Kernel driver aps-379
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Supported chips:
+
+  * Sony APS-379
+
+    Prefix: 'aps-379'
+
+    Addresses scanned: -
+
+ Authors:
+        - Chris Packham
+
+Description
+-----------
+
+This driver implements support for the PMBus monitor on the Sony APS-379
+modular power supply. The APS-379 deviates from the PMBus standard for t=
he
+READ_VOUT command by using the linear11 format instead of linear16.
+
+The known supported PMBus commands are:
+
+=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
 =3D=3D=3D=3D=3D
+Cmd Function                      Protocol  Scaling Bytes
+=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
 =3D=3D=3D=3D=3D
+01  On / Off Command (OPERATION)  Byte R/W  --      1
+10  WRITE_PROTECT                 Byte R/W  --      1
+3B  FAN_COMMAND_1                 Word R/W  --      2
+46  Current Limit (in percent)    Word R/W  2^0     2
+47  Current Limit Fault Response  Byte R/W  --      1
+79  Alarm Data Bits (STATUS_WORD) Word Rd   --      2
+8B  Output Voltage (READ_VOUT)    Word Rd   2^-4    2
+8C  Output Current (READ_IOUT)    Word Rd   2^-2    2
+8D  Power Supply Ambient Temp     Word Rd   2^0     2
+90  READ_FAN_SPEED_1              Word Rd   2^6     2
+91  READ_FAN_SPEED_2              Word Rd   2^6     2
+96  Output Wattage (READ_POUT)    Word Rd   2^1     2
+97  Input Wattage (READ_PIN)      Word Rd   2^1     2
+9A  Unit Model Number (MFR_MODEL) Block R/W --      10
+9B  Unit Revision Number          Block R/W --      10
+9E  Unit Serial Number            Block R/W --      8
+99  Unit Manufacturer ID (MFR_ID) Block R/W --      8
+D0  Unit Run Time Information     Block Rd  --      4
+D5  Firmware Version              Rd cust   --      8
+B0  User Data 1 (USER_DATA_00)    Block R/W --      4
+B1  User Data 2 (USER_DATA_01)    Block R/W --      4
+B2  User Data 3 (USER_DATA_02)    Block R/W --      4
+B3  User Data 4 (USER_DATA_03)    Block R/W --      4
+B4  User Data 5 (USER_DATA_04)    Block R/W --      4
+B5  User Data 6 (USER_DATA_05)    Block R/W --      4
+B6  User Data 7 (USER_DATA_06)    Block R/W --      4
+B7  User Data 8 (USER_DATA_07)    Block R/W --      4
+F0  Calibration command           Byte R/W  --      1
+F1  Calibration data              Word Wr   2^9     2
+F2  Unlock Calibration            Byte Wr   --      1
+=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
 =3D=3D=3D=3D=3D
+
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rs=
t
index b2ca8513cfcd..2bc8d88b5724 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -41,6 +41,7 @@ Hardware Monitoring Kernel Drivers
    adt7475
    aht10
    amc6821
+   aps-379
    aquacomputer_d5next
    asb100
    asc7621
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fc1273abe357..29076921e330 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -77,6 +77,12 @@ config SENSORS_ADP1050_REGULATOR
 	  =C2=B5Module regulators that can provide microprocessor power from 54=
V
 	  power distribution architecture.
=20
+config SENSORS_APS_379
+	tristate "Sony APS-379 Power Supplies"
+	help
+	  If you say yes here you get hardware monitoring support for Sony
+	  APS-379 Power Supplies.
+
 config SENSORS_BEL_PFE
 	tristate "Bel PFE Compatible Power Supplies"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d6c86924f887..94f36c7069ec 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ACBEL_FSG032) +=3D acbel-fsg032.o
 obj-$(CONFIG_SENSORS_ADM1266)	+=3D adm1266.o
 obj-$(CONFIG_SENSORS_ADM1275)	+=3D adm1275.o
 obj-$(CONFIG_SENSORS_ADP1050)	+=3D adp1050.o
+obj-$(CONFIG_SENSORS_APS_379)	+=3D aps-379.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+=3D bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+=3D bpa-rs600.o
 obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) +=3D delta-ahe50dc-fan.o
diff --git a/drivers/hwmon/pmbus/aps-379.c b/drivers/hwmon/pmbus/aps-379.=
c
new file mode 100644
index 000000000000..631ba238ba49
--- /dev/null
+++ b/drivers/hwmon/pmbus/aps-379.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Sony APS-379 Power Supplies
+ *
+ * Copyright 2026 Allied Telesis Labs
+ */
+
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+struct aps_379_data {
+	struct pmbus_driver_info info;
+	u8 vout_linear_exponent;
+};
+
+#define to_aps_379_data(x) container_of(x, struct aps_379_data, info)
+
+static int aps_379_read_byte_data(struct i2c_client *client, int page, i=
nt reg)
+{
+	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
+	struct aps_379_data *data =3D to_aps_379_data(info);
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/*
+		 * The VOUT format used by the chip is linear11,
+		 * not linear16. Report that VOUT is in linear mode
+		 * and return exponent value extracted while probing
+		 * the chip.
+		 */
+		return data->vout_linear_exponent;
+	default:
+		return -ENODATA;
+	}
+}
+
+/*
+ * The APS-379 uses linear11 format instead of linear16. We've reported =
the exponent
+ * via the PMBUS_VOUT_MODE so we just return the mantissa here.
+ */
+static int aps_379_read_vout(struct i2c_client *client)
+{
+	int ret;
+
+	ret =3D pmbus_read_word_data(client, 0, 0xff, PMBUS_READ_VOUT);
+	if (ret < 0)
+		return ret;
+
+	return clamp_val(sign_extend32(ret & 0x7ff, 10), 0, 0x3ff);
+}
+
+static int aps_379_read_word_data(struct i2c_client *client, int page, i=
nt phase, int reg)
+{
+	switch (reg) {
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_IOUT_UC_FAULT_LIMIT:
+	case PMBUS_UT_WARN_LIMIT:
+	case PMBUS_UT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+	case PMBUS_POUT_OP_WARN_LIMIT:
+	case PMBUS_MFR_IIN_MAX:
+	case PMBUS_MFR_PIN_MAX:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_MFR_IOUT_MAX:
+	case PMBUS_MFR_POUT_MAX:
+	case PMBUS_MFR_MAX_TEMP_1:
+		/* These commands return data but it is invalid/un-documented */
+		return -ENXIO;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		/*
+		 * The standard requires this to be a value in Amps but it's
+		 * actually a percentage of the rated output (123A for
+		 * 110-240Vac, 110A for 90-100Vac) which we don't know. Ignore
+		 * it rather than guessing.
+		 */
+		return -ENXIO;
+	case PMBUS_READ_VOUT:
+		return aps_379_read_vout(client);
+	default:
+		if (reg >=3D PMBUS_VIRT_BASE)
+			return -ENXIO;
+		else
+			return -ENODATA;
+	}
+}
+
+static struct pmbus_driver_info aps_379_info =3D {
+	.pages =3D 1,
+	.format[PSC_VOLTAGE_OUT] =3D linear,
+	.format[PSC_CURRENT_OUT] =3D linear,
+	.format[PSC_POWER] =3D linear,
+	.format[PSC_TEMPERATURE] =3D linear,
+	.format[PSC_FAN] =3D linear,
+	.func[0] =3D PMBUS_HAVE_VOUT |
+		PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_TEMP |
+		PMBUS_HAVE_FAN12,
+	.read_byte_data =3D aps_379_read_byte_data,
+	.read_word_data =3D aps_379_read_word_data,
+};
+
+static const struct i2c_device_id aps_379_id[] =3D {
+	{ "aps-379", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, aps_379_id);
+
+static int aps_379_probe(struct i2c_client *client)
+{
+	struct device *dev =3D &client->dev;
+	struct pmbus_driver_info *info;
+	struct aps_379_data *data;
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] =3D { 0 };
+	int ret;
+
+	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &aps_379_info, sizeof(*info));
+	info =3D &data->info;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA
+				     | I2C_FUNC_SMBUS_READ_WORD_DATA
+				     | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
+		return -ENODEV;
+
+	ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read Manufacturer Model\n");
+		return ret;
+	}
+
+	if (strncasecmp(buf, aps_379_id[0].name, strlen(aps_379_id[0].name)) !=3D=
 0) {
+		buf[ret] =3D '\0';
+		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	data->vout_linear_exponent =3D (u8)(-4 & 0x1f);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id __maybe_unused aps_379_of_match[] =3D {
+	{ .compatible =3D "sony,aps-379" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aps_379_of_match);
+
+static struct i2c_driver aps_379_driver =3D {
+	.driver =3D {
+		.name =3D "aps-379",
+		.of_match_table =3D of_match_ptr(aps_379_of_match),
+	},
+	.probe =3D aps_379_probe,
+	.id_table =3D aps_379_id,
+};
+
+module_i2c_driver(aps_379_driver);
+
+MODULE_AUTHOR("Chris Packham");
+MODULE_DESCRIPTION("PMBus driver for Sony APS-379");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
--=20
2.53.0

