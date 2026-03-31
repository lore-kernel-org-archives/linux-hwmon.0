Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA8C3B47F0
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 23:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774999170; cv=none; b=gPUAJbCIwAMJmy0tgSuSt/KVBBBBTu0pZ8NHYk+YjRGjanWawtoIq3mHgoLKW3NduOi9QqymdSdHcOWIwMwzqZ0epvrl+l/QqK1LyCiMRNI4KUELE250RpsuINZ8Ud4pX5toVaeyycOPdZ9cRuWZzZCLcSzKper/QNi6pPz5Ck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774999170; c=relaxed/simple;
	bh=GgqPIYVqyQe9+Kc37wwDhF1EL0bB4cr0mHKkcc56rmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXZ36YwD8GnOShCSzHJMo0Nvua/EEsS4kmlAQ17GnSGzWMe9CnHqZ4H5pPO9fr07bm8GzeyzCjk+SNg4mhW1JFXdSv5pdxWd0w/kvnpFkelCcjJ7hNquEVO3J6XUZXCkUQRPsdbVXX8CDIr0XVXJ7+zk+wouhQIQEQ19YGHlxqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=RZk2oEJ0; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="RZk2oEJ0"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D91322C02FF;
	Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1774999165;
	bh=lsLNWw0B00QtyDUa/41kW3siVH8hjuamx6nZ83CO1QY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RZk2oEJ0NgAX70rc0hpAHYkBXm4yFt2JKtjIfnimPkjeJydCsq6Q5HTG5SWqswu/F
	 DY4MIALA302kV2WkfhGo0HIEXctECwdw231k2P4ICf0SDmmgYx0P4Pfnz988FE3BXC
	 s3rtXkTkSCtbi4katEdVogH+YLgi06ZJ8JKI1HrlPAcHgIUTNkgv+Zwk0da8U0RYcW
	 /EmD157dvkUb4rpvWItGbPrEKSCCjroBG7cH9yaBV97ngfabrxDJlAkhIer9KhWD1H
	 fUpCBhNBeF086LntGzW9PIEMxwhbuS9/f3WK7hqNDs6lHcGHh+Rauh5FYDKO/+3rRx
	 7ptI/fL90Ygvg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cc567d0002>; Wed, 01 Apr 2026 12:19:25 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 8C14213EE7A;
	Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 861DC280990; Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] hwmon: pmbus: Add support for Sony APS-379
Date: Wed,  1 Apr 2026 12:19:13 +1300
Message-ID: <20260331231916.94662-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331231916.94662-1-chris.packham@alliedtelesis.co.nz>
References: <20260331231916.94662-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cc567d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=nAkT6b51qpQmUpSyBroA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add pmbus support for Sony APS-379 power supplies. There are a few PMBUS
commands that return data that is undocumented/invalid so these need to
be rejected with -ENXIO. The READ_VOUT command returns data in linear11
format instead of linear16 so we need to workaround this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/hwmon/pmbus/Kconfig   |   6 ++
 drivers/hwmon/pmbus/Makefile  |   1 +
 drivers/hwmon/pmbus/aps-379.c | 196 ++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/aps-379.c

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
index 000000000000..e4c4c2d12bc9
--- /dev/null
+++ b/drivers/hwmon/pmbus/aps-379.c
@@ -0,0 +1,196 @@
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
+static const struct i2c_device_id aps_379_id[] =3D {
+	{ "aps-379", 0 },
+	{},
+};
+
+static int aps_379_read_byte_data(struct i2c_client *client, int page, i=
nt reg)
+{
+	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
+	struct aps_379_data *data =3D to_aps_379_data(info);
+	int ret;
+
+	if (page > 0)
+		return -ENXIO;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/*
+		 * The VOUT format used by the chip is linear11,
+		 * not linear16. Report that VOUT is in linear mode
+		 * and return exponent value extracted while probing
+		 * the chip.
+		 */
+		ret =3D data->vout_linear_exponent;
+		break;
+	default:
+		ret =3D -ENODATA;
+		break;
+	}
+
+	return ret;
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
+	s32 mantissa;
+
+	ret =3D pmbus_read_word_data(client, 0, 0xff, PMBUS_READ_VOUT);
+	if (ret < 0)
+		return ret;
+
+	mantissa =3D ((s16)((ret & 0x7ff) << 5)) >> 5;
+	ret =3D mantissa;
+
+	return ret;
+}
+
+static int aps_379_read_word_data(struct i2c_client *client, int page, i=
nt phase, int reg)
+{
+	int ret;
+
+	if (page > 0)
+		return -ENXIO;
+
+	switch (reg) {
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
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
+		ret =3D -ENXIO;
+		break;
+	case PMBUS_READ_VOUT:
+		ret =3D aps_379_read_vout(client);
+		break;
+	default:
+		if (reg >=3D PMBUS_VIRT_BASE)
+			ret =3D -ENXIO;
+		else
+			ret =3D -ENODATA;
+		break;
+	}
+
+	return ret;
+
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
+static int aps_379_probe(struct i2c_client *client)
+{
+	struct device *dev =3D &client->dev;
+	const struct i2c_device_id *mid;
+	struct pmbus_driver_info *info;
+	struct aps_379_data *data;
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
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
+	for (mid =3D aps_379_id; mid->name[0]; mid++) {
+		if (!strncasecmp(buf, mid->name, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0]) {
+		buf[ret] =3D '\0';
+		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	ret =3D i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
+	if (ret < 0) {
+		dev_err(dev, "Can't get vout exponent.\n");
+		return ret;
+	}
+	data->vout_linear_exponent =3D (u8)((ret >> 11) & 0x1f);
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

