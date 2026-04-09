Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C442D0625;
	Thu,  9 Apr 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732487; cv=fail; b=nV39ivc8RxFcV+lTnXYzku5xg1NvWL0RQW74TZ8fweTxhBKug5FGcJ5MgCCmP8YSw2t9c3FJUcWV5ieEcDjcwcbKbaqpRczxvdSYf72bW2Vp/xmxIQhdTF7RXK6r0sPBBV0gaY3JTqJOsgMCvm7FBdl+f4QPOQV6dMfmd0Wyd9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732487; c=relaxed/simple;
	bh=qtlGiP499W0KZhgtUT3X0wKi5GEiiV2hfvuHvikU+Cg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwISnswDZc9wGRYO5FeaXbfYS5rRV/JZmypmwIgPbPvrrRsl1UAd9845CS8ZDlWJpqVgDScTaIeuep2jad20CA3psCqgUZwd6Y1nkReNYbxzq6XdA5nYLh4IgABJiCvVDkwviG63rFbTqICUCamaMi3KZLULPqEBPR+8Tvi4WoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OJK+cuSr; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OJK+cuSr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5nY8ZyuhQRkFcQ5389thiZBDdbXjufaye5YoQz7bdszKMHn6TaU+MFMuDFN4OWwdFA0IVmpIsRYepQsnbYM1Ei1zFAD/HaIp84iamqU4GO4DEydgeZ1Yf5Mi7Mzq5C8G4qojchI0FX6ZomlbhDaIl95q0GMXWDg+zDjD779nbpIS2+mdF8twupphfA4o+KREAQghhyX4hz0o7d+TGSXDnebMA0T5+2B4Zulu1CqDu0Y+JtrQxsukCuX63IogoftaEvnEVFmXT8/JMF2kjEPCvm6oICi7CVjcQNfEgtJKSGLJCRjFHuH4m/mI8HxFnh6FH+Es19B+9t3mHWEsZvx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P1G9sd5eVKPv7crjYiwbJhXENNX6LRIjAm0yieU/gk=;
 b=X7dzspuPTehzwhqmW/XY4E5xIVIW/v3n1e5vXHd1wrnqJNqMDq0wjov9hUdJKBCDvecFrUTrNSue3D2MO8/AoB+Xe56LqrHx9AHJasUGpuy5VAy11eplLYIJbjXoCvWdILDXn8TK6WhZMr8FzBdAi5d0Oo9VVtQpWYEi/ogSHyJbffeq+GbxzKjSTCp1c0zmkErunnJtdtn8yFgVjApeyzNFhAXC/xjVXn8oelhwaorl18NtImA71ftYIX52WHngy+p5lfiHfW9IS+GQJ1yZ1RxErgl0F5v+NHoOh0+YEX1yXupI2yDzXjkoCzxjramlD2iH5nTsL+9QF4ndf8BRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P1G9sd5eVKPv7crjYiwbJhXENNX6LRIjAm0yieU/gk=;
 b=OJK+cuSrBQ1sHdOSi9KtpwGJhNIsK6G/vJjUm/t4LVaKJpidXwhZpUVtJ67VZOrjM0shvHDbbWSKVsWkJGzmo5h1JyXZ4QlxcmCjvmq1UL0cahrbyMG+Jhd/rnJEWd7DvGTTWxG3GRLnkHvX+LF/7b1PjsrFOxqJAv5JT/ebCdCWeq2xGufsnTdFXCf9XC8oDMXHg7OXxy+nkbyNTDg/21DSLVUyT5sdlKLhwceTv5RYeDCKERM05DpqsDRmsjdlBmJ0QpdKznlSljcIriHeQrcg/0EmOv046NO6+I8PzLr+aU+bNcA9biKIyoTioBB6NOJcRFCd1oDbEBBxaI8UtQ==
Received: from SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 11:01:20 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::36) by SJ0PR03CA0043.outlook.office365.com
 (2603:10b6:a03:33e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 11:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:01:18 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:55 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:55 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 04:00:49 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
Date: Thu, 9 Apr 2026 16:27:42 +0530
Message-ID: <20260409105747.48158-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260409105747.48158-1-akhilrajeev@nvidia.com>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 96653bd4-503b-4d01-f210-08de962753f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	w1OlsDkSAlZ4CnwrU0TQ1yNzM0DblzUWCsvWOyw/4D9k0IhPq8lDECx/01tg1Q3B4vvBNsHZJVF2JB4pUxLEZZmm4XqZ3vAqI+1JQ0Qfd/4B3EQEcdzfe9rJ6zUcZAUPIPAblNhETfajxaf0iKsH57tY56n974apozZgA5jLWnsQMuknDK/64xBE6Hhv5bx+Wk8Rr8V4aY5jDEMk0zY+m5yVBwMwJSfEyLh4PPGTJNKkrF7HLNZE6XNlaPHazfXc6JrvmqQvX+m1ihXz6m0p17YX+NHCnhj9xHKrXpytyaDXZbcbe9w2ajIyG6l5vTfYocys50ySFw8JeEii9C8T3MwmKC9T1h7MbrCi7hdd/KCMGhBisaenJAW5GpaXFQrfGOHZRWyP2ud4wdMWYKntPuucLNTAxRbQIXsaCm2vxeFW7Q1V7VkTc/SN65trPCJWnMMf8qJ45aNa2CbzrQMgATnUdhmPBX2M5ybP7mV/exkhuDOoXAxJoKMA95vnwVgH3S1/ZeL4FgUHPruOIxDIRaSAqDznTcjb68q+TYlk2cEnaqqVw0GH7xQqQJAz9WDR5UMaAiRSPMFeZSW+iW3CH8oBvOI+B9zlrvAXq4t0Mbkj+B8uM2Px3cqX0aDSl4zlrzkH1qjiDqYXlh8t/e6Grs9ZKdCOIkdt1mbdcZkjTQBd3utBbCZrm9CoAVaNRDx/lVVBjvkkqBzQoSe46fUE4hXBqOwo+FeihlNba42aRf9LsD6a7fEoYm36OJ/7P+DMK2oNIEmRt27sLhvzvrERvslGQ1Xqi30dpTlSKy6Ht7jv6/eD3VloU9sGh/vxi75z
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qz0etjz8hPBxW8iZ1GVRhWhmmNIDrP14WyI2ndsrRCy+k7a8aBv7bctBsYQ3H/glh3IyLIZDgTguZeO0KS90TLGFAL8mjajFXHGsBOZIj3yjBRKMwUmAAdMwy6bVWYciygeyoMZSCjIgQzcQ8aQnt/SBcgm2oyLrsnB1QxhQSDSO1f8q6+E5iILnpzcoQEVjn1QxDIOEtr2rZ/jv9+eMFD2JNnyi17SWNcmrUwUh848X9drSf1CGdheDRq5UrEbRl05ZMg4NZPlBWA8uhlqguHRiDKx8mOHGO4rO/4V7hfx4D4bDTZGno7UAgTwEfTWlUi2sKe1NO6D8Sdz6n6fagacYfmxjfMw3hQujP0PrsNxpvtp6y0lq6PQGaLDq2cbkZit7hKv21Eqzn9eF0FyW3TGabQZ1B6W+MJgIkp0gPlE+cerL+TG45f6L6BNraJoy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:01:18.8586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96653bd4-503b-4d01-f210-08de962753f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627

Add a regmap config and a probe function to support for I3C based
communication to SPD5118 devices.

On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
ACPI or device tree entry. The device matching is hence through the OF
match tables only and do not need an I3C class match table. The device
identity is verified in the type registers before proceeding to the
common probe function.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/hwmon/Kconfig   |  9 ++++---
 drivers/hwmon/spd5118.c | 56 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8af80e17d25e..7e8f419603df 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2298,12 +2298,15 @@ config SENSORS_INA3221
 
 config SENSORS_SPD5118
 	tristate "SPD5118 Compliant Temperature Sensors"
-	depends on I2C
+	depends on I3C_OR_I2C
 	select REGMAP_I2C
+	select REGMAP_I3C if I3C
 	help
 	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
-	  compliant temperature sensors. Such sensors are found on DDR5 memory
-	  modules.
+	  compliant temperature sensors using I2C or I3C bus interface.
+	  Such sensors are found on DDR5 memory modules.
+
+	  This driver supports both I2C and I3C interfaces.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called spd5118.
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 8fdde35e68cd..db66028d2f59 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -18,6 +18,7 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/i3c/device.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -464,6 +465,27 @@ static const struct regmap_config spd5118_regmap8_config = {
 	.num_ranges = ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
 };
 
+/*
+ * SPD5118 2-byte register address format (JESD300-5, Tables 7 & 20):
+ *   Byte 1 (on wire first):  MemReg | BlkAddr[0] | Address[5:0]
+ *   Byte 2 (on wire second): 0000   | BlkAddr[4:1]
+ *
+ * The address byte (with MemReg and lower address bits) must be sent first,
+ * followed by the upper block address byte. With regmap 16-bit register
+ * format, this maps to little-endian: the low byte of the 16-bit value is
+ * transmitted first. No range config is needed since I3C does not use MR11
+ * page switching.
+ */
+static const struct regmap_config spd5118_regmap_i3c_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = 0x7ff,
+	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
+	.writeable_reg = spd5118_writeable_reg,
+	.volatile_reg = spd5118_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static int spd5118_suspend(struct device *dev)
 {
 	struct spd5118_data *data = dev_get_drvdata(dev);
@@ -701,7 +723,39 @@ static struct i2c_driver spd5118_i2c_driver = {
 	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
 };
 
-module_i2c_driver(spd5118_i2c_driver);
+/* I3C */
+
+static int spd5118_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct regmap *regmap;
+	u8 regval[2];
+	int err;
+
+	regmap = devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
+
+	err = regmap_bulk_read(regmap, SPD5118_REG_TYPE, regval, 2);
+	if (err)
+		return err;
+
+	if (regval[0] != 0x51 || regval[1] != 0x18)
+		return -ENODEV;
+
+	return spd5118_common_probe(dev, regmap);
+}
+
+static struct i3c_driver spd5118_i3c_driver = {
+	.driver = {
+		.name	= "spd5118_i3c",
+		.of_match_table = spd5118_of_ids,
+		.pm = pm_sleep_ptr(&spd5118_pm_ops),
+	},
+	.probe		= spd5118_i3c_probe,
+};
+
+module_i3c_i2c_driver(spd5118_i3c_driver, &spd5118_i2c_driver);
 
 MODULE_AUTHOR("René Rebe <rene@exactcode.de>");
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
-- 
2.50.1

