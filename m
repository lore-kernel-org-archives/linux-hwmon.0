Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19C34EEFD;
	Fri, 19 Jun 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861954; cv=fail; b=sn6T9cTzW2XrafYphInSPxkOZi3iT9SeCPDWxvp0lRr7w5Hn2ue7nUqfOo+rggFDMTF4jfp+waizt/Y9+jG+XG8PrPbwzrX4c1jKhpc40j8p18HE8Y/Uw5SZq5z+jg2zU355ujMs1nnSZ9Sy6/l0nZ8IW5HR6ny+lnFyfn+fh8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861954; c=relaxed/simple;
	bh=+gFZZ08MCvExkY0LdQjXckAxNDkqm7rogg9yr73RPpg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EDmmipFIsoGCq81D8c9LMDaXFaJl8zstUaIuiTAMs/MXdcgBjofxlEQQDP54q5MoU8HB41F/lfwuxjRw7rwe0gO9xF4U749PGRu31YqZAOhN2+TVwiqWBF1JI/JWkd7ibpIsRmo14P/i8XODfEoRruYcfi1VCFNhggki+b7QdbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=TyUCE+og; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="TyUCE+og"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmxVIbHihAKvy1mOet/qtKdKl2Dpu322Vbc7xiyB8PXlAXKk+eLUohsXKCe5Os3lTQgBECwy5LUqzkZyETNQ818IJ/Hysrv77U1NTFLOjbXBfaihXDO2AY63sqXOMPulRvr+/QDIwXHfJC/qr7CLQug8sDWe5FqzjnrjLcvDmUhOhAMO4d1K2EGxckY+O20yfjTTe7AvpVKfs1kFGXNMlaf4m3d8KVR+JqtUtfEGaA0BRIsGuuqP9s8fpNiO+UkRv3Rd2JLtfY0SIzQoSx9AZF/siIc9c4cMf/2ocR0u7LRHDIv9W3cj94wmAOhy5pTzmz0amsfqD+MruWMdPM6rOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Rz2Aa98T4OYmBovbYUn4Zg1Gv+CBPV30AmAHq0TV1s=;
 b=E4Z3N4AoAQztjuNz1OM3d1xZTz4JIa1sSg8m7v7aKcno14lhUi2wSMvaRfAs0S+P/Q1Y5NPe9mqx/b1fz4cPZhwmHYophDW3nBLU1LMExjcrREhUosJNhxaoEBSnitY7abGWIidBSTRJ2SY3qla/jCywkCilsVvrZnWHMhRAw/ucdwFfkPBXkGYwoJg9bbbyIYGV3gXIz+XlD6oot7OvnxQ3bpPQTya0BsmaUb44YD1KqH4Z0t8CL+17612WrGWpmF5iM5KhOo2MX1/5RgdC+yrb/cqvlOnTeBkEJTR6tofVLi8PXdpMbRwiTLo/q6lfe3J0PDKJ4TUuL1J7k9bf/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Rz2Aa98T4OYmBovbYUn4Zg1Gv+CBPV30AmAHq0TV1s=;
 b=TyUCE+ogjRhdxZBmxEthecIuRJsfwiDdl9B1TiIDGW8L6q1dPBJZySvDF0EjeqbDVGAutlkf6owl3l4JEgSiQVV20pmeHgQhaZEUWGIEDW48gXmovewdIexRVYXd1k5glkq09Wz6/GXXmUloqiXtZPt6BIMLzi1LJWUwH+iWN7kbLDdaIPA7aMoKbOCYA+Ue05DEEE6GDX2uY5his7cZFrKychrAr3vFAZ0AkZ/banwwTlF4m83a4pgfNQH+BhpjfuNTd5P6KuixxXWmHFnnEze3YoMJkyszjak3eZQsJ9noQcMrMh+0rAf+ayHSos01ECb2jQ86qqUaiI8ImYPxmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7562.namprd03.prod.outlook.com (2603:10b6:408:28f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 19 Jun
 2026 09:39:02 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:39:02 +0000
From: tze.yee.ng@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 4/5] hwmon: add Stratix 10 SoC FPGA hardware monitor driver
Date: Fri, 19 Jun 2026 02:38:55 -0700
Message-ID: <081650bc4d92e9497b7a5a926e79a067cca3519f.1781861409.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 370916c9-ebf3-4da6-8850-08decde69849
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|55112099003|3023799007|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	ZjZg8DOgmGJ0pU/cMk1vE4DfUcvXoIxYJYIqncbLbWr+7WfTnulm9oK5s78QC1NiJzUIRRhG8nSVaTThkZkCrRCoBSCo/UWX7td/oXmkCF3KYaplAEHKMl4hlSKTbMwUxv67886miYN2ShJRQy/KXPRDLH1ArBsn9+lLwO+A78rmJCM55Q75sEW/tpZ0L/42RtLgT8RD2GICZSiv20nb8U6RAgOZ9K1MV+jGGDyIDHcrgofHriKTYqTe80gKXeV0c+dvviRGdl5e8f69ri1yHlSH+ehfjZl5sGL0pb797CFels+2K8DItkyXmtvP2jZmSfhr5ShpDeRMGg4X6MK0loJKsUDaFjyKdhRTY/OCB/+ES+KwuDreXHCZTuHZsLiJa/G5yMYjf55QGlD2A+8ctmZH8Vdny72VZqaheuw30fGvM+BJBRrMzEQhkQUoWJDxuLFrtnw6xMVqlk9yPkmXACqlf8uIOEsAQxsxMUne4KPM47P2CCUykWehyEAJVOYbITzzJAPeCBrfcx6welmvXlj8c5Q6v5xt+OECZZVXawIHMvY1huGDyxlZChUxFj+hbMy7LpULJzmllpDOfhPg2DRjHscDveFUbJg2CBitD75jS3gF9xhvzZ60arTNCFZV1+LVsDhDVAC+MY7YHm0CVUGskIsqIOqZkUGATFqWyCWG9htfUgg+zAjCnMrS026ssaXTXNdvfqkU7oaj3ZuHjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(55112099003)(3023799007)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yp2CizgrA06jIXHjhsLGp+U7gEI7KeW5b0BnvwkZDGklL/p78kg8gaJqVVqr?=
 =?us-ascii?Q?LDS4j5fS7xSfJWY2Q1LT0lKbh6D+U8ItsFkjq9fwrU3kcpvHvBzHJg1Va/uu?=
 =?us-ascii?Q?8RLmCyOZ8FHgxqGqIWsxtZqLNwKkiDcpCUpG7Jh2uK6qysxUqgig6XNvLEkk?=
 =?us-ascii?Q?spMADK1AW4f2OGwnmlc58eTyqiTT084raD1JQ9AsUJnUEVS5Q3DD3Zt80Wg0?=
 =?us-ascii?Q?JstxvzrYVWQNtEpLtKpTL6eELReLM1PptHAeUsbH3CFOXWgdUqskm2r8/z2r?=
 =?us-ascii?Q?9zwcdFk2PWdQRVhWkolPbnMHnPfICmPPp6MCa1d2DJAKiWpPDe3+oHSfwYzo?=
 =?us-ascii?Q?5RhMkJN4vhAtYNV2sPWEal4XZI+HKhFUDdiA+7ATLVW/JhgviJnifrFh82Mj?=
 =?us-ascii?Q?uKKkI9s6tEF35hB7Bs2tphF4gS7NA1NofoFu9vC4MQ2PJAAjYAq5oqNOw4vq?=
 =?us-ascii?Q?2DX+PNF2BGv9rIG353PWcybAeEz86cosZuO30IZ4wu4gpQ5f2KIq07lIHgFW?=
 =?us-ascii?Q?qbWEhBAFsaw6cTNsLJDKS/DomyN6QrDLwfkXS1qnGA+dh0VibMH3YjDqwyVT?=
 =?us-ascii?Q?QTDNuYYD+PTxpMUWpQI4J8PD25jXznwkGeJBCURtbjq5uhxyigpVw1CrJT0I?=
 =?us-ascii?Q?sXC69a7W09KTDTeyXk7lgQa7I55YMkpxjwJxndnC975FkAdAcLJi0fUCwDEf?=
 =?us-ascii?Q?IUhz2id213XnGouIO6p29mHpixWUcbtIBV5QLPzRp7pwCjYNEmfbfjAuJU+5?=
 =?us-ascii?Q?2RoK5wjzC0cuGgTe0G8FbIlHeZFj4xpGsdzpr5zEKB6UF0+gXGsS3E7kyv5p?=
 =?us-ascii?Q?Jtrl1lYI+NlQt34JSNnRKFleMZyi6DGBZnm0gvSd7aiqsE2AApr86/ONvF6i?=
 =?us-ascii?Q?K78QhhDiHg3mJC6nqRvixnH76wjWvwC75u8A2PWNDyz0qo8fpAoRjDFuLjVE?=
 =?us-ascii?Q?8ruW0TjXnATlz0ZL0iqrxbFSipfc/W4s+8TsVFXSIHq5u/4LuWAffh+m+A3J?=
 =?us-ascii?Q?y402iSG1/c9qaKIbS7z30S19TK9siYDeH7Kc57iyyQPffnMpS25kf1WodCI+?=
 =?us-ascii?Q?2NWqLYU6G3OHekGr22LJEJRo+OOUyoaZXH5GD8ukyz0QcuWUPoNFysFhajQ6?=
 =?us-ascii?Q?SgmLTqCylIHc6YfhyvVwMAUe0aqO9IsIaS0s6x5yuauHYtp100sKfr9UMhcE?=
 =?us-ascii?Q?1kfAAldJzjo7cXCUo3ugQEdk5ENTcmFWzRNLl16AdAwZ+YgEHMLsz3rmrOwz?=
 =?us-ascii?Q?S1y++xWRSuh88uz2zdQOH5H9H7oiYGT3Q2qZOfd34G/d/VIvLHc1g5tQqU2n?=
 =?us-ascii?Q?NrNeLGRP2Bpj6/+rwGJ6NfeEwXmAt8GL9BivYdW7EWDOLaasUMZ1XBqSpzqU?=
 =?us-ascii?Q?XjxsPpLEZOqT31fVtnlNGRC7px+FfbFDhZex2g3Zq6ql39m2G4vqtaeNG3hi?=
 =?us-ascii?Q?RCVs84xA7M6FrIcM1B6D27UIyrpVEbRDQQweEVXmtQtCukuDK7DcGuBhbv7r?=
 =?us-ascii?Q?UFIkrYVxOlPfeFc+vh+Sebi6gHncIgszv7rq0wPxCKyjKDs0ZWpDwATbAemE?=
 =?us-ascii?Q?Au8YH4JMEl8aM/VAk2Eyg0mlnPbMrcag29qJ6r4LllEWBzJHi+x6LZeADzJx?=
 =?us-ascii?Q?XdPLvFCDZQbApnz1tFkpmCgrYY3gDgwmpYGUo4kDb2Q1DkthyVm1Ze97/fEZ?=
 =?us-ascii?Q?a8SkzsQu9ng4vnJfUgE+pBS1h74WVIJblnCLMNhkVAoXFXxwDQiojkZ5pwMF?=
 =?us-ascii?Q?VxxwkvSQiQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370916c9-ebf3-4da6-8850-08decde69849
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:39:01.5688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqkT6k18UDinopqu9MMMGErGFUmmZix3RszoIdPYqyui0vG9QeGt/IvxCDmUZuzmVXzITkYXBkfx4Qjr5Lm2GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7562

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add a hardware monitoring driver for Altera Stratix 10 SoC FPGA devices
that reads temperature and voltage sensors through the Stratix 10 service
layer. Use the asynchronous service layer interface when available, with
a synchronous fallback.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 Documentation/hwmon/index.rst           |   1 +
 Documentation/hwmon/stratix10-hwmon.rst |  31 ++
 MAINTAINERS                             |   2 +
 drivers/hwmon/Kconfig                   |  10 +
 drivers/hwmon/Makefile                  |   1 +
 drivers/hwmon/stratix10-hwmon.c         | 575 ++++++++++++++++++++++++
 6 files changed, 620 insertions(+)
 create mode 100644 Documentation/hwmon/stratix10-hwmon.rst
 create mode 100644 drivers/hwmon/stratix10-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8b655e5d6b68..30f533301903 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -244,6 +244,7 @@ Hardware Monitoring Kernel Drivers
    sparx5-temp
    spd5118
    stpddc60
+   stratix10-hwmon
    surface_fan
    sy7636a-hwmon
    tc654
diff --git a/Documentation/hwmon/stratix10-hwmon.rst b/Documentation/hwmon/stratix10-hwmon.rst
new file mode 100644
index 000000000000..61b682fe177a
--- /dev/null
+++ b/Documentation/hwmon/stratix10-hwmon.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver stratix10-hwmon
+=============================
+
+Supported chips:
+
+ * Altera Stratix 10 SoC FPGA
+
+Authors:
+      - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+      - Tze Yee Ng <tze.yee.ng@altera.com>
+
+Description
+-----------
+
+This driver supports hardware monitoring for Altera Stratix 10 SoC FPGA
+devices through the Secure Device Manager and Stratix 10 service layer.
+
+The following sensor types are supported:
+
+  * temperature
+  * voltage
+
+Usage Notes
+-----------
+
+The driver relies on a device tree node to enumerate sensors present on the
+specific device. See
+Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml for details
+of the device-tree node.
diff --git a/MAINTAINERS b/MAINTAINERS
index 678f6c429627..5afdf286f8f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -943,6 +943,8 @@ M:	Tze Yee Ng <tze.yee.ng@altera.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
+F:	Documentation/hwmon/stratix10-hwmon.rst
+F:	drivers/hwmon/stratix10-hwmon.c
 
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 14e4cea48acc..8eff1c71a226 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2112,6 +2112,16 @@ config SENSORS_SMSC47M192
 	  This driver can also be built as a module. If so, the module
 	  will be called smsc47m192.
 
+config SENSORS_ALTERA_SOCFPGA_STRATIX10
+	tristate "Altera SoC FPGA Stratix 10 hardware monitoring features"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  If you say yes here you get support for the temperature and
+	  voltage sensors of Altera SoC FPGA Stratix 10 devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called stratix10-hwmon.
+
 config SENSORS_SMSC47B397
 	tristate "SMSC LPC47B397-NC"
 	depends on HAS_IOPORT
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 982ee2c6f9de..7e643de0e7d4 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -217,6 +217,7 @@ obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
+obj-$(CONFIG_SENSORS_ALTERA_SOCFPGA_STRATIX10)	+= stratix10-hwmon.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
diff --git a/drivers/hwmon/stratix10-hwmon.c b/drivers/hwmon/stratix10-hwmon.c
new file mode 100644
index 000000000000..7ed1116e57b8
--- /dev/null
+++ b/drivers/hwmon/stratix10-hwmon.c
@@ -0,0 +1,575 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Altera Stratix 10 SoC FPGA hardware monitoring driver
+ *
+ * Copyright (c) 2026 Altera Corporation
+ *
+ * Authors:
+ *	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+ *	Tze Yee Ng <tze.yee.ng@altera.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define HWMON_TIMEOUT			msecs_to_jiffies(SVC_HWMON_REQUEST_TIMEOUT_MS)
+#define HWMON_RETRY_SLEEP_MS		1U
+#define HWMON_ASYNC_MSG_RETRY		3U
+#define STRATIX10_HWMON_MAXSENSORS	16
+#define STRATIX10_HWMON_TEMPERATURE	"temperature"
+#define STRATIX10_HWMON_VOLTAGE		"voltage"
+#define STRATIX10_HWMON_CHANNEL_MASK	GENMASK(15, 0)
+#define STRATIX10_HWMON_PAGE_SHIFT	16
+#define STRATIX10_HWMON_ATTR_VISIBLE	0444
+/* Temperature from SDM is signed Q8.8 millidegrees Celsius (8 fractional bits). */
+#define STRATIX10_HWMON_TEMP_FRAC_BITS	8
+#define STRATIX10_HWMON_TEMP_FRAC_DIV	BIT(STRATIX10_HWMON_TEMP_FRAC_BITS)
+/* Voltage from SDM is unsigned Q16 (millivolts, 16 fractional bits). */
+#define STRATIX10_HWMON_VOLT_FRAC_BITS	16
+#define STRATIX10_HWMON_VOLT_FRAC_DIV	BIT(STRATIX10_HWMON_VOLT_FRAC_BITS)
+
+#define ETEMP_INACTIVE			0x80000000U
+#define ETEMP_TOO_OLD			0x80000001U
+#define ETEMP_NOT_PRESENT		0x80000002U
+#define ETEMP_TIMEOUT			0x80000003U
+#define ETEMP_CORRUPT			0x80000004U
+#define ETEMP_BUSY			0x80000005U
+#define ETEMP_NOT_INITIALIZED		0x800000FFU
+
+struct stratix10_hwmon_priv {
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct completion completion;
+	struct mutex lock;	/* protect SVC calls */
+	bool async;
+	u32 temperature;
+	u32 voltage;
+	int temperature_channels;
+	int voltage_channels;
+	const char *temp_chan_names[STRATIX10_HWMON_MAXSENSORS];
+	const char *volt_chan_names[STRATIX10_HWMON_MAXSENSORS];
+	u32 temp_chan[STRATIX10_HWMON_MAXSENSORS];
+	u32 volt_chan[STRATIX10_HWMON_MAXSENSORS];
+};
+
+static umode_t stratix10_hwmon_is_visible(const void *dev,
+					  enum hwmon_sensor_types type,
+					 u32 attr, int chan)
+{
+	const struct stratix10_hwmon_priv *priv = dev;
+
+	switch (type) {
+	case hwmon_temp:
+		if (chan < priv->temperature_channels)
+			return STRATIX10_HWMON_ATTR_VISIBLE;
+		return 0;
+	case hwmon_in:
+		if (chan < priv->voltage_channels)
+			return STRATIX10_HWMON_ATTR_VISIBLE;
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static void stratix10_hwmon_readtemp_cb(struct stratix10_svc_client *client,
+					struct stratix10_svc_cb_data *data)
+{
+	struct stratix10_hwmon_priv *priv = client->priv;
+
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->temperature = (u32)*(unsigned long *)data->kaddr1;
+	} else if (data->kaddr1) {
+		dev_err(client->dev, "%s failed with status 0x%x, value 0x%lx\n",
+			__func__, data->status,
+			*(unsigned long *)data->kaddr1);
+	} else {
+		dev_err(client->dev, "%s failed with status 0x%x\n",
+			__func__, data->status);
+	}
+
+	complete(&priv->completion);
+}
+
+static void stratix10_hwmon_readvolt_cb(struct stratix10_svc_client *client,
+					struct stratix10_svc_cb_data *data)
+{
+	struct stratix10_hwmon_priv *priv = client->priv;
+
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->voltage = (u32)*(unsigned long *)data->kaddr1;
+	} else if (data->kaddr1) {
+		dev_err(client->dev, "%s failed with status 0x%x, value 0x%lx\n",
+			__func__, data->status,
+			*(unsigned long *)data->kaddr1);
+	} else {
+		dev_err(client->dev, "%s failed with status 0x%x\n",
+			__func__, data->status);
+	}
+
+	complete(&priv->completion);
+}
+
+static void stratix10_hwmon_async_callback(void *ptr)
+{
+	if (ptr)
+		complete(ptr);
+}
+
+static int stratix10_hwmon_parse_temp(long *val, u32 temperature)
+{
+	switch (temperature) {
+	case ETEMP_INACTIVE:
+	case ETEMP_NOT_PRESENT:
+	case ETEMP_CORRUPT:
+	case ETEMP_NOT_INITIALIZED:
+		return -EOPNOTSUPP;
+	case ETEMP_TIMEOUT:
+	case ETEMP_BUSY:
+	case ETEMP_TOO_OLD:
+		return -EAGAIN;
+	default:
+		/* Convert Q8.8 millidegrees Celsius to millidegrees for hwmon. */
+		*val = (long)(s32)temperature / STRATIX10_HWMON_TEMP_FRAC_DIV;
+		return 0;
+	}
+}
+
+static int stratix10_hwmon_encode_temp_arg(u32 reg, u64 *arg)
+{
+	u32 page = (reg >> STRATIX10_HWMON_PAGE_SHIFT) & STRATIX10_HWMON_CHANNEL_MASK;
+	u32 channel = reg & STRATIX10_HWMON_CHANNEL_MASK;
+
+	if (channel >= STRATIX10_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	*arg = (1ULL << channel) | ((u64)page << STRATIX10_HWMON_PAGE_SHIFT);
+	return 0;
+}
+
+static int stratix10_hwmon_encode_volt_arg(u32 reg, u64 *arg)
+{
+	u32 channel = reg & STRATIX10_HWMON_CHANNEL_MASK;
+
+	if (channel >= STRATIX10_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	*arg = 1ULL << channel;
+	return 0;
+}
+
+static int stratix10_hwmon_async_read(struct device *dev,
+				      enum hwmon_sensor_types type,
+				     struct stratix10_svc_client_msg *msg)
+{
+	struct stratix10_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_cb_data data = {};
+	struct completion completion;
+	unsigned long wait_ret;
+	void *handle = NULL;
+	int status, index, ret;
+
+	init_completion(&completion);
+
+	for (index = 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  stratix10_hwmon_async_callback,
+						  &completion);
+		if (status == 0)
+			break;
+		dev_warn(dev, "Failed to send async message\n");
+		msleep(HWMON_RETRY_SLEEP_MS);
+	}
+
+	if (status && !handle)
+		return status;
+
+	wait_ret = wait_for_completion_io_timeout(&completion, HWMON_TIMEOUT);
+	if (wait_ret > 0)
+		dev_dbg(dev, "Received async interrupt\n");
+	else if (wait_ret == 0)
+		dev_dbg(dev, "Timeout occurred, trying to poll the response\n");
+
+	ret = -ETIMEDOUT;
+	for (index = 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+		if (status == -EAGAIN) {
+			dev_dbg(dev, "Async message is still in progress\n");
+		} else if (status < 0) {
+			dev_alert(dev, "Failed to poll async message: %d\n", status);
+			ret = status;
+			break;
+		} else if (status == 0) {
+			ret = 0;
+			break;
+		}
+		msleep(HWMON_RETRY_SLEEP_MS);
+	}
+
+	if (ret) {
+		dev_err(dev, "Failed to get async response\n");
+		goto done;
+	}
+
+	if (data.status) {
+		dev_err(dev, "%s returned 0x%x from SDM\n", __func__,
+			data.status);
+		ret = -EFAULT;
+		goto done;
+	}
+
+	if (type == hwmon_temp)
+		priv->temperature = (u32)*(unsigned long *)data.kaddr1;
+	else
+		priv->voltage = (u32)*(unsigned long *)data.kaddr1;
+
+	ret = 0;
+
+done:
+	stratix10_svc_async_done(priv->chan, handle);
+	return ret;
+}
+
+static int stratix10_hwmon_sync_read(struct device *dev,
+				     enum hwmon_sensor_types type,
+				    struct stratix10_svc_client_msg *msg)
+{
+	struct stratix10_hwmon_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	reinit_completion(&priv->completion);
+
+	if (type == hwmon_temp)
+		priv->client.receive_cb = stratix10_hwmon_readtemp_cb;
+	else
+		priv->client.receive_cb = stratix10_hwmon_readvolt_cb;
+
+	ret = stratix10_svc_send(priv->chan, msg);
+	if (ret < 0)
+		goto status_done;
+
+	ret = wait_for_completion_interruptible_timeout(&priv->completion,
+							HWMON_TIMEOUT);
+	if (!ret) {
+		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
+		ret = -ETIMEDOUT;
+		goto status_done;
+	}
+	if (ret < 0) {
+		dev_err(priv->client.dev, "error %d waiting for SMC call\n", ret);
+		goto status_done;
+	}
+
+	ret = 0;
+
+status_done:
+	stratix10_svc_done(priv->chan);
+	return ret;
+}
+
+static int stratix10_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+				u32 attr, int chan, long *val)
+{
+	struct stratix10_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_client_msg msg = {0};
+	int ret;
+
+	if (chan >= STRATIX10_HWMON_MAXSENSORS)
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case hwmon_temp:
+		ret = stratix10_hwmon_encode_temp_arg(priv->temp_chan[chan],
+						      &msg.arg[0]);
+		if (ret)
+			return ret;
+		msg.command = COMMAND_HWMON_READTEMP;
+		break;
+	case hwmon_in:
+		ret = stratix10_hwmon_encode_volt_arg(priv->volt_chan[chan],
+						      &msg.arg[0]);
+		if (ret)
+			return ret;
+		msg.command = COMMAND_HWMON_READVOLT;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	guard(mutex)(&priv->lock);
+	if (priv->async)
+		ret = stratix10_hwmon_async_read(dev, type, &msg);
+	else
+		ret = stratix10_hwmon_sync_read(dev, type, &msg);
+	if (ret)
+		return ret;
+
+	if (type == hwmon_temp)
+		ret = stratix10_hwmon_parse_temp(val, priv->temperature);
+	else
+		/* Convert Q16 millivolts to millivolts for hwmon. */
+		*val = (long)priv->voltage / STRATIX10_HWMON_VOLT_FRAC_DIV;
+	return ret;
+}
+
+static int stratix10_hwmon_read_string(struct device *dev,
+				       enum hwmon_sensor_types type, u32 attr,
+				      int chan, const char **str)
+{
+	struct stratix10_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_in:
+		*str = priv->volt_chan_names[chan];
+		return 0;
+	case hwmon_temp:
+		*str = priv->temp_chan_names[chan];
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops stratix10_hwmon_ops = {
+	.is_visible = stratix10_hwmon_is_visible,
+	.read = stratix10_hwmon_read,
+	.read_string = stratix10_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *stratix10_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info stratix10_hwmon_chip_info = {
+	.ops = &stratix10_hwmon_ops,
+	.info = stratix10_hwmon_info,
+};
+
+static int stratix10_hwmon_add_channel(struct device *dev, const char *type,
+				       u32 val, const char *label,
+				      struct stratix10_hwmon_priv *priv)
+{
+	if (!strcmp(type, STRATIX10_HWMON_TEMPERATURE)) {
+		if (priv->temperature_channels >= STRATIX10_HWMON_MAXSENSORS) {
+			dev_warn(dev, "Can't add temp node %s, too many channels\n",
+				 label);
+			return 0;
+		}
+
+		priv->temp_chan_names[priv->temperature_channels] = label;
+		priv->temp_chan[priv->temperature_channels] = val;
+		priv->temperature_channels++;
+		return 0;
+	}
+
+	if (!strcmp(type, STRATIX10_HWMON_VOLTAGE)) {
+		if (priv->voltage_channels >= STRATIX10_HWMON_MAXSENSORS) {
+			dev_warn(dev, "Can't add voltage node %s, too many channels\n",
+				 label);
+			return 0;
+		}
+
+		priv->volt_chan_names[priv->voltage_channels] = label;
+		priv->volt_chan[priv->voltage_channels] = val;
+		priv->voltage_channels++;
+		return 0;
+	}
+
+	dev_warn(dev, "unsupported sensor type %s\n", type);
+	return 0;
+}
+
+static int stratix10_hwmon_probe_child_from_dt(struct device *dev,
+					       struct device_node *child,
+					      struct stratix10_hwmon_priv *priv)
+{
+	struct device_node *grandchild;
+	const char *label;
+	u32 val;
+	int ret;
+
+	for_each_child_of_node(child, grandchild) {
+		ret = of_property_read_u32(grandchild, "reg", &val);
+		if (ret) {
+			dev_err(dev, "missing reg property of %pOFn\n",
+				grandchild);
+			of_node_put(grandchild);
+			return ret;
+		}
+
+		ret = of_property_read_string(grandchild, "label", &label);
+		if (ret)
+			label = grandchild->name;
+
+		stratix10_hwmon_add_channel(dev, child->name, val, label, priv);
+	}
+
+	return 0;
+}
+
+static int stratix10_hwmon_probe_from_dt(struct device *dev,
+					 struct stratix10_hwmon_priv *priv)
+{
+	struct device_node *child;
+	int ret;
+
+	if (!dev->of_node)
+		return 0;
+
+	for_each_child_of_node(dev->of_node, child) {
+		ret = stratix10_hwmon_probe_child_from_dt(dev, child, priv);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int stratix10_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct stratix10_hwmon_priv *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client.dev = dev;
+	priv->client.priv = priv;
+	init_completion(&priv->completion);
+	mutex_init(&priv->lock);
+
+	ret = stratix10_hwmon_probe_from_dt(dev, priv);
+	if (ret) {
+		dev_err(dev, "Unable to probe from device tree\n");
+		return ret;
+	}
+
+	if (!priv->temperature_channels && !priv->voltage_channels) {
+		dev_err(dev, "no temperature or voltage channels in device tree\n");
+		return -ENODEV;
+	}
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_HWMON);
+	if (IS_ERR(priv->chan)) {
+		ret = PTR_ERR(priv->chan);
+		if (ret == -EPROBE_DEFER)
+			dev_dbg(dev, "service channel %s not ready, deferring probe\n",
+				SVC_CLIENT_HWMON);
+		else
+			dev_err(dev, "couldn't get service channel %s: %d\n",
+				SVC_CLIENT_HWMON, ret);
+		return ret;
+	}
+
+	ret = stratix10_svc_add_async_client(priv->chan, false);
+	switch (ret) {
+	case 0:
+		priv->async = true;
+		break;
+	case -EINVAL:
+		dev_dbg(dev, "async operations not supported, using sync mode\n");
+		priv->async = false;
+		break;
+	default:
+		dev_err(dev, "failed to add async client: %d\n", ret);
+		stratix10_svc_free_channel(priv->chan);
+		return ret;
+	}
+
+	dev_info(dev, "Initialized %d temperature and %d voltage channels\n",
+		 priv->temperature_channels, priv->voltage_channels);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "stratix10_hwmon",
+							 priv,
+							 &stratix10_hwmon_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
+		if (priv->async)
+			stratix10_svc_remove_async_client(priv->chan);
+		stratix10_svc_free_channel(priv->chan);
+		return PTR_ERR(hwmon_dev);
+	}
+
+	platform_set_drvdata(pdev, priv);
+	return 0;
+}
+
+static void stratix10_hwmon_remove(struct platform_device *pdev)
+{
+	struct stratix10_hwmon_priv *priv = platform_get_drvdata(pdev);
+
+	if (priv->async)
+		stratix10_svc_remove_async_client(priv->chan);
+	stratix10_svc_free_channel(priv->chan);
+}
+
+static const struct of_device_id stratix10_hwmon_of_match[] = {
+	{ .compatible = "altr,stratix10-hwmon" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, stratix10_hwmon_of_match);
+
+static struct platform_driver stratix10_hwmon_driver = {
+	.driver = {
+		.name = "stratix10-hwmon",
+		.of_match_table = stratix10_hwmon_of_match,
+	},
+	.probe = stratix10_hwmon_probe,
+	.remove = stratix10_hwmon_remove,
+};
+module_platform_driver(stratix10_hwmon_driver);
+
+MODULE_AUTHOR("Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>");
+MODULE_AUTHOR("Tze Yee Ng <tze.yee.ng@altera.com>");
+MODULE_DESCRIPTION("Altera Stratix 10 SoC FPGA hardware monitoring driver");
+MODULE_LICENSE("GPL");
-- 
2.43.7

