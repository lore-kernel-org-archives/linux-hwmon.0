Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167938F638;
	Thu, 16 Apr 2026 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326428; cv=none; b=XVIMXW8RupIaGxSXQT2/ExigsjcXoJObVWNqLDvC4CPfKeomB/+Wj3msmBzubAXSsGtfu1/+R4fiMNkduVpYyUDGs+hvk+0+SbEBrX4XO5xmWeHFvKJeVWUk1GV2WuaqMVIhJHfN3RetwsVtZKfM2TxR24uXgQWH3icTFKC68+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326428; c=relaxed/simple;
	bh=XcGdDK+5Al2PljZ8FZVtV7YmxIJ6LBn+ZhoY4QLeFgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=c4P5P1pXhN5pGcfud8QjlqvoGoYO/acBN/4Kat4I6ELcYpMnhNgObCNl9JNCtHzus+RvHSxwYiZ64YWaXtbPNtItjRrykPntEB6Y7HgK0yrfVSJamQxOo5xHNybew/zzx8F2bdQVt0p9SEvLhwoK6tYG/uiKNruWQhN6FDeuBMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Ly1JXDcM; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Ly1JXDcM"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6paq83672462;
	Thu, 16 Apr 2026 04:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=XwNGj
	p+H8dP7qrmWL/3kWdnPc1TsBmvHGMGylwaikds=; b=Ly1JXDcMZ9Pv/1BODCDWI
	gu80Q8X5kS5yx/1RDYjCmx+Njr/4U5tYUy7w/VdSL2Z2fYugvU+2eJJaK6rUL5pE
	mL4mRA1SZJfUegzI2qVXRpS0/jbpm3lM3nGjNO6DjeOOGYwxQjtefrrH91lyqq6x
	Chdz/TYeCmSPMyCUsDukgnvOZY+XosA9L0w3QcCsQxCYS+6iufUT8Oif1jQaWuol
	/DW6sx3THpTu/PKVVCKtuY3CwsltVyHSGD45UeMdATGf6bE9QS7Pfj45tvnqFZgP
	lZhKM+Y8M0NkhqOKUgIYu/f4f6M5X2718EF4Ux/kzzeHtnI3MaiETjZCwYoE6ly/
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4dh86wdnpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 04:00:06 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63G805Nw042675
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Apr 2026 04:00:05 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Apr 2026 04:00:05 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Apr 2026 04:00:05 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 16 Apr 2026 04:00:05 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63G7xbe1025993;
	Thu, 16 Apr 2026 03:59:58 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 16 Apr 2026 15:59:11 +0800
Subject: [PATCH v2 2/2] hwmon: (pmbus/max20830) add driver for max20830
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260416-dev_max20830-v2-2-2c7d676dc0bd@analog.com>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
In-Reply-To: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776326383; l=7365;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=XcGdDK+5Al2PljZ8FZVtV7YmxIJ6LBn+ZhoY4QLeFgo=;
 b=RF0tE5fODf4aOYQKm9T+/dhITlC7N5EjEsryC8pemXoDMkR7NyPxNeuLKJ9KJE9E3RdikF/ao
 3uZmrnOvG7/A6JEcYjpf85/CtEIwWCIjW3V7DhqQKCspjnFd7dydoK7
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NCBTYWx0ZWRfX2wciuP/7eUxk
 DjDQiz9feql+FgENpkzrHztAnMfaGObpwxE9k9hUGdqZFiXOaVJb7t5giYML/QTl1vyDC4l96l8
 CfeMg/bc9S3FgOtIKHwMaXaijHPJWTuXOthCMBeB5RiIktCkeBIkMjqm0KwjvUS+rj+UWgQ+omC
 frj30dg8viIoyLRInZYlDr89l/PQnEHFefum9TG3ZvvS1YYRJ8jmoqXTlKqBQ691JZvBJ6mzCyQ
 FelzCmUkHp3awqFfUxuToH9BLiRmUgWBwqw53wzIBX8zYd3mlNI9wHFz4jAGBxsf61iMcmrAKs1
 Z24zZQkMyeA+3S/95Xp0cZ5poErdTlg6oqrP/GtCA7PJpLMXaw7Cbc5/C0bcJCdCNxCLnkeJwr8
 2cNn9B5sOwKutTKQYK+J8kgxvoFaL+F1+VO6G5gg5bIAJ5YUnUVECRB6q616iLErX+EEkeFBSjH
 XVkWcZ0hVHCMpU8QJXw==
X-Authority-Analysis: v=2.4 cv=FKcrAeos c=1 sm=1 tr=0 ts=69e09706 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=eOFfa883y_zvaPAmtb4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BjM_vFg34jZ3_qGAVhgY7wjdysYBaZl_
X-Proofpoint-ORIG-GUID: BjM_vFg34jZ3_qGAVhgY7wjdysYBaZl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160074

Add support for MAX20830 step-down DC-DC switching regulator with
PMBus interface. It allows monitoring of input/output voltage,
output current and temperature through the PMBus serial interface.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/index.rst    |  1 +
 Documentation/hwmon/max20830.rst | 49 +++++++++++++++++++++++
 MAINTAINERS                      |  2 +
 drivers/hwmon/pmbus/Kconfig      |  9 +++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/max20830.c   | 86 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 148 insertions(+)

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
index 0000000000000000000000000000000000000000..936e409dcc5c0898dde27d782308d4a7e1357e73
--- /dev/null
+++ b/Documentation/hwmon/max20830.rst
@@ -0,0 +1,49 @@
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
+in2_alarm         Output voltage alarm
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
index 0000000000000000000000000000000000000000..21ea8b59150cb0564f1776ee08131bad7fdef003
--- /dev/null
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -0,0 +1,86 @@
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
+	u8 len;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
+		return -ENODEV;
+
+	/*
+	 * Use i2c_smbus_read_i2c_block_data() instead of
+	 * i2c_smbus_read_block_data() to support I2C controllers
+	 * which do not support SMBus block reads.
+	 */
+	ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
+					    I2C_SMBUS_BLOCK_MAX, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read IC_DEVICE_ID\n");
+
+	/* First byte is the block length. */
+	len = buf[0];
+	if (len != 9)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unexpected IC_DEVICE_ID response\n");
+
+	buf[len] = '\0';
+	if (strncmp(buf + 1, "MAX20830", 8))
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device: '%s'\n", buf + 1);
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
+MODULE_IMPORT_NS("PMBUS");

-- 
2.34.1

