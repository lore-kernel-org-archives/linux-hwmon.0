Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24282773CA;
	Tue, 14 Apr 2026 04:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776140985; cv=none; b=a1YBa+VpcjFGN6uXIX/UmLlkm0Ip48wi9y15t2TYp5UP60wdp50JQa2sCAGPjb5weIphFklZpkrfBf/wUmwNFjsUVinSN5hKunDx8lClA+UPcTPWO1QffA0KDKiID4yGRQlN4KOB+TTtjqgOnXVpckWbs2hxY2FECilFGfelmPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776140985; c=relaxed/simple;
	bh=pmC7seZ6VhNoEaJZf9BWd8EkNmHKrGB1xfs9XKOhD34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DWd6ZDKRhypgsNp18OnsDRCfBeA63782a8SXW2Dj5WuaTl6c0rMtY2RgxQqHRtSFVavrQDQr84fPH7bEgqB/WcSlqELrf8TRUiTmJhPVSRv+bV/dlu9NH4wW+oU5nRZOv/zq49+UWWBAqkl4NIjwg1ag6E2Iyec8y9aTBVdMDx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=gVbgnHuG; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="gVbgnHuG"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E1fQOY3139429;
	Tue, 14 Apr 2026 00:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=I90PU
	H9eGruj3lOxmA65wLC8talo/eZVGzxdP5CSZTQ=; b=gVbgnHuG5k0gLdVNeIzjW
	5MFzDoDYoRtTrYco6xTHsdn/dnRhuuibC5n59tAMIO9m8M+6nsXMJc7V0BUFUG0A
	WQ3kAeXHb8WNFN4drAgIqcR6lb0R3ALnKwWx2TILnBlr7bvnoWNPBQQC0lcGn2vz
	uSlpVWYHUXh16CmAFTqhOcJWcnojQ6BFjPYiQXgFtyQNE+qgA5xSSJgUBXnQYI7k
	/V3jK1SwzW4wPndMA2o85Bs2avsRJ5rMOhraw5wdzy+chr1Ty+FoKvOPx4DwlHrm
	Pvamf/GOgHBw0QTsi14yBnT47Tf12qwts1lvNJWZFUVCG7APj+SO1oqCmfRrmgfs
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dh8591fff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 00:29:21 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63E4TK3Z022958
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Apr 2026 00:29:20 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 14 Apr
 2026 00:29:20 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 14 Apr 2026 00:29:20 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63E4St4W011556;
	Tue, 14 Apr 2026 00:29:10 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 14 Apr 2026 12:28:50 +0800
Subject: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
References: <20260414-dev_max20830-v1-0-210d3f82c571@analog.com>
In-Reply-To: <20260414-dev_max20830-v1-0-210d3f82c571@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776140935; l=6973;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=pmC7seZ6VhNoEaJZf9BWd8EkNmHKrGB1xfs9XKOhD34=;
 b=/CYXWnH3c2vwFNllnVxuvK2m5CtVVNpCt2cHUw8BttaevqbdQi7vbt3ONx9wy+yc81+bFRkFO
 eOggBzabGhvB3OMq4YzbUALh114mDmrybxUy15p3zj5ZE1zIdMZSdPd
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: sqZEc22CV9XwoxvKmKetCItE4BC8iT1Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzOSBTYWx0ZWRfX2qeEUZqNJ9Ar
 7CTAYrw4ZNhwoLqOzAjxzzVn0skkAySjuyrbBC2lHHsH6AzW5ov/MY3DS4pzaH1QZl7B0qmPCHM
 dxgf4uQ+2tj4Mnz3lpoyWZ/9vEwHnb5GpkQsS7yZVhpF0YmcqzS4RGUHOxe+Q8YUic0A2q68ib7
 l6GWTa4FS3zSlwv1bOJ1ICbiFqSo2ye+8LCI7IwnacH7NI7me4QReTz++cLW3aOYT4IGikgendj
 Ryszn0YnCacGL0UPHgo0FOQ8OJlfNWqmxzVTBKGlar1AA/f0DtQfR4zvAmMcTqV/vmzwh/nk59S
 SN35UqKqzstdQzH8uVDZ+1UlqiLKVcys7QGJYbwWKSm/3CA7kf3nhH/j6mBkHoCuu/MAgJxVWlb
 zBpMYrtWc/ChM+2so9cgdB3jSvb8RlvaQRp6D6l8qCmHP1MstgPwE7CMIYxlsLyYyGoNX7lbpb1
 XxHyKBIdXNhOFKpx55Q==
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=69ddc2a1 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KfVfo0Qmibx6MGEknL8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sqZEc22CV9XwoxvKmKetCItE4BC8iT1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140039

Add support for MAX20830 step-down DC-DC switching regulator with
PMBus interface. It allows monitoring of input/output voltage,
output current and temperature through the PMBus serial interface.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/index.rst    |  1 +
 Documentation/hwmon/max20830.rst | 48 ++++++++++++++++++++++++++
 MAINTAINERS                      |  2 ++
 drivers/hwmon/pmbus/Kconfig      |  9 +++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/max20830.c   | 74 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 135 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8b655e5d6b68b90c697a52c7bf526e81d370caf7..56f7eb761be76dd627a2f34135abad05203b0582 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -158,6 +158,7 @@ Hardware Monitoring Kernel Drivers
    max197
    max20730
    max20751
+   max20830
    max31722
    max31730
    max31760
diff --git a/Documentation/hwmon/max20830.rst b/Documentation/hwmon/max20830.rst
new file mode 100644
index 0000000000000000000000000000000000000000..b9dffb76059781932d383ed798cecff69e738873
--- /dev/null
+++ b/Documentation/hwmon/max20830.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver max20830
+======================
+
+Supported chips:
+
+  * Analog Devices MAX20830
+
+    Prefix: 'max20830'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20830.pdf
+
+Author:
+
+  - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for Analog Devices MAX20830
+Step-Down Switching Regulator with PMBus Interface.
+
+The MAX20830 is a 2.7V to 16V, 30A fully integrated step-down DC-DC switching
+regulator. Through the PMBus interface, the device can monitor input/output
+voltages, output current and temperature.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+Sysfs entries
+-------------
+
+================= ========================================
+in1_label         "vin"
+in1_input         Measured input voltage
+in1_alarm         Input voltage alarm
+in2_label         "vout1"
+in2_input         Measured output voltage
+curr1_label       "iout1"
+curr1_input       Measured output current
+curr1_alarm       Output current alarm
+temp1_input       Measured temperature
+temp1_alarm       Chip temperature alarm
+================= ========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 031c743e979521a92ed9ac67915c178ce31727bd..d6a6745e2dae29c3b8f80bbe61c54a2f5ecd9f47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15585,6 +15585,8 @@ L:	linux-hwmon@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+F:	Documentation/hwmon/max20830.rst
+F:	drivers/hwmon/pmbus/max20830.c
 
 MAX2175 SDR TUNER DRIVER
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecbc355f5ed3400855c2852ec2aa5ef..987705bf45b75b7b91ccc469247909f3c3f53d77 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -365,6 +365,15 @@ config SENSORS_MAX20751
 	  This driver can also be built as a module. If so, the module will
 	  be called max20751.
 
+config SENSORS_MAX20830
+	tristate "Analog Devices MAX20830"
+	help
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices MAX20830.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called max20830.
+
 config SENSORS_MAX31785
 	tristate "Maxim MAX31785 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 7129b62bc00f8a2e98de14004997752a856dfda2..bc52f930e0825a902a0dd1c9e2b44f2e8d577c35 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
 obj-$(CONFIG_SENSORS_MAX17616)	+= max17616.o
 obj-$(CONFIG_SENSORS_MAX20730)	+= max20730.o
 obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
+obj-$(CONFIG_SENSORS_MAX20830)	+= max20830.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
new file mode 100644
index 0000000000000000000000000000000000000000..bcf60fd948e3437f47267747547142704ae96378
--- /dev/null
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring driver for Analog Devices MAX20830
+ *
+ * Copyright (C) 2026 Analog Devices, Inc.
+ */
+
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info max20830_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_TEMP |
+		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int max20830_probe(struct i2c_client *client)
+{
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
+		return -ENODEV;
+
+	ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
+					    I2C_SMBUS_BLOCK_MAX, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read IC_DEVICE_ID\n");
+
+	buf[ret] = '\0';
+	if (ret < 9 || strncmp(buf + 1, "MAX20830", 8))
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device: '%s'\n", buf);
+
+	return pmbus_do_probe(client, &max20830_info);
+}
+
+static const struct i2c_device_id max20830_id[] = {
+	{"max20830"},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max20830_id);
+
+static const struct of_device_id max20830_of_match[] = {
+	{ .compatible = "adi,max20830" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max20830_of_match);
+
+static struct i2c_driver max20830_driver = {
+	.driver = {
+		.name = "max20830",
+		.of_match_table = max20830_of_match,
+	},
+	.probe = max20830_probe,
+	.id_table = max20830_id,
+};
+
+module_i2c_driver(max20830_driver);
+
+MODULE_AUTHOR("Alexis Czezar Torreno <alexisczezar.torreno@analog.com>");
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20830");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);

-- 
2.34.1

