Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFA23FE650;
	Thu,  9 Jul 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587725; cv=fail; b=r6HdDjI//qfH3VxVaGFiQX/wvAgUs23xqqmUNs7ZICmRJdFFDk5OrAIntP3tJx5qgZWI/piVzHoNx3+07sz1RpXLprmmRcT1j/h94lFWjz3S83E5MMTtXylq7e3uwcqR5rAQR7Icz+AH3RJH3NOK9J59azC5eFfLpzoSQMYDRrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587725; c=relaxed/simple;
	bh=EHUYjUbPO4NFZEFbLxofvHB2d8rzE0CinfgBlfXUwQQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SyTgUfvgery5Dl1PmhV2vJl2U65xsrG4Tq6iC6/2CS1bgCwFf5jCRa5nPGPaC7UVlI00wpd5NYFDhxVtxg8D4D4muiUwcj9pRQn0o1O2zNlossoYZjYd9sdWGmAatfnRqcMNINnAQeanRU5pHL62wP33hw499IfdYk2zhQCQzcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=tLrIyh5x; arc=fail smtp.client-ip=40.93.195.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="tLrIyh5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQVvk2isX7NzDecelm2bGBs11IhmRTZCOw3OWDdnwHnXlTDbcCoJ7fQ96DRdOg2ioQZg31DejNXdzpsOrgYKhIXa2uy6M5HKurPxM4EoLpCjJoDA6ifAjm5ifghwmF4vp4dlh+0MN884b4j4c0sSMgHHqk6ns18Q97ogLqvmEakUKcBm7OiO1Ijtiaxa7O4vGtztkTv0GSupMTZdYuslPDHmSSX8IcqKX/r6hr/NgfBVfQqjPurDHGsgcEO5rp3Qi5FNigmaVxYm48pJ/uXx8ZKZn2w6ymCEXvV8qBKiEZnTeK62w7YH22qu8RNSVhnHZDKUeUTgAHXCtVvXf+F7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTZ/2tIB7/iepZJRNBkAdOwfs3gjLVwCeZ7pDAP1iz4=;
 b=bS23tDWZuD1UBV5vzw/vCq9iYrnLGk6vAeZi1JFq5yO2y+T69ZfbHhzqeA6YL49p9RKF6YG4sxF5vtjHbtnhCZa5K+LyK6p8VbQFJrNjcZeedfSO6gllOARUznHR03QjeL4LcYo4KkVTMAz2A1YTEPMqhVJnT17X0k9t7v1QxzvnifP72fd1gaEwrkF1uDLPNWz9BZEMx6S4YckWkFLrKnx76HCYMs46ARCnmKqwmVx0mPWf3LniJUcwaBRxkdfBHwwMrjWI5KxEZ+Xs2J+XCE91sQ4+z2z/1iz9jKEXLHIhgbn4RtR11uP4IogzhCM3+Vkx5NU+F9/7jn4XMDf3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTZ/2tIB7/iepZJRNBkAdOwfs3gjLVwCeZ7pDAP1iz4=;
 b=tLrIyh5xoN6oIUnnVu6Blr2PEJgiIyrVNVV+nIfvs7j4LOn9fZNfrY+XPWPB3NYd6RXtWtSKppeeAB1Yr/vY/iI3/me7odLVVBiwBUyeP31NbniYhVBJ+JzNi2ffAw7zSbY4Ai0D4kz4NbtfJ3HuvTJdJtL+uhCWKh1jP7Z+PF8PajVFuIBx8ykP9MH9/mwz8svINCjrnfGi/xAhIHmUXxKX8YbEo2t5DBopNep905DHj6BTWXBICxace91oJJyBaEBryl3tsQ+cMT0TP5s5+8/4XnmzL0OvVPTVbUnTB09PBbJLNF3xS5cxOJtEhcLXyKbYNaH/To1c7OQ5RtR36Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 09:01:57 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 09:01:57 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 2/2] hwmon: add Altera SoC FPGA hardware monitoring driver
Date: Thu,  9 Jul 2026 02:01:53 -0700
Message-ID: <20260709090153.21675-3-tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260709090153.21675-1-tze.yee.ng@altera.com>
References: <20260709090153.21675-1-tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|PH0PR03MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e043ad8-1203-40a1-2a37-08dedd98bb01
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|6133799003|22082099003|18002099003|55112099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	juwLQAjhL79rAYknQTnEB1R2thKFgEi3nzB0AIR/AMpcsfOWorgLoV2Uh6ZroFpGVa2yFSPLN0xv3pZ4O7kWSogqnSTP51hM+HhChuYft8XG4Ph6weQlYSVTQ1DwjyPyJZCWVME0f1iGcq0GH5z7R6N63YRNMNi/sr6xm85wwKWjzDvW8IHMTkEz+G6NguSGtsaVfFoSoIYDBvN2I9H2WEVmzy2pxnRbxr/gGxvMzzPnumUfq09rTNXOecqG5WEc1Cf9OR2v5Wi3mviF9W6YoULIcH8jdljF8sSrX4b2tvvTxkztg5GrTpkObKY/bLZty1N06iQtOCCB8I2FubjMCSHyLZcYt2kkWhJIx/HxQJ2dhZDi3eYGtWp+tLSAnGEEc4TvktzULPArrvFzl3wOgpch6bVS9HjKfkD5qCoC1b00Yc3wKqeslrAfdMqPBF7yCSuuvSG5I0frwbhQGBeOqOtJnPEBfI06U/1bk6SJAqJYhcgoD0R/jp0VOaHNenTJ2xjwZxzKwI5LqAiW/HHSp7/JbP3WXQX/Sp/uXebRMVKYw7z03uS6VgHmZWPFj4nHHk9iPrrJX4xwMeTeKc7k1UJwukmKbPJhsMSeDHqzdq9ZQYCaz03MiEXDW7IDjMaDVsteA7MY1xKuJavgF6HakHhvU9INjBmw/EwuHE48rpI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(55112099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ui33mcqwmklokya5FMkuoKKIiESObsBqISzkFEbRedxtGoubexQ3feM5iHWi?=
 =?us-ascii?Q?JE0dUE8PyTnplvHPS4/p4up5lU3N5GLBHAE2Puk5bJ25t1LAKzGFK+0/K5CR?=
 =?us-ascii?Q?3XWIDEhxDCDIo4eW1PTq2afmZTnL3UXZXp1GReq+1zi9iBLefds80KYo/thV?=
 =?us-ascii?Q?Yd2nSseUYUFoNgx4thrAG/0b8kQ9x/7WHNlOvCewFE8B3OfFjfZGWd/WwHsh?=
 =?us-ascii?Q?o0RnhyA4fw9JEfAaHgC5evuEDn77MGaSjuoZQrwmPoKP+VhIFAq4pUjYCmYY?=
 =?us-ascii?Q?xvgh7cloZQ08uP6qXwjLNAOWCBVySsmE5qO00K3XAayu30bmokRQPbNmZd0v?=
 =?us-ascii?Q?BTXT5vy8qr2dywF48u3nF6lE14yItPo5YyTISH3nYA1W5OX0/SO3/lXuZFyo?=
 =?us-ascii?Q?wb8CbBPVxkdF4zMwsr5oj30KPIhsK5q8sIGKA9PAi53nWL4BiK4TDul7whsT?=
 =?us-ascii?Q?a4Px+4v/549Ty8giPwSTk2zrfJjE5d7r+BgwhSKKRsqY2eWM9gCEQgYiG4ar?=
 =?us-ascii?Q?ojtUfCnsirgwivYukCYi/ttHSgz0tqcaNBh8THcBUntlPJhQ86pG/PuOEXSi?=
 =?us-ascii?Q?dITd222aPqhCZDEPm8gNTEkRAeq7theArGhnFgJfvGMCPSXSQ5GNkiOQAne8?=
 =?us-ascii?Q?/g/y0oZbq/OQ4fEV+yUzz585Og2JpjKEDcXCnuwP2NgGY+OpnVPA4+DHy5DJ?=
 =?us-ascii?Q?66iRnAG5njLu71FK9ppr7FMXuc+K8aDt6MBl9YUQ+KR43hHX8H/q1HDeDg8i?=
 =?us-ascii?Q?Qi3JHGlQp3ubBhGR9rF2e8OIkDOZMBVw8Q+Sz1KdTAk7DXN5n7FWcGVX2ar7?=
 =?us-ascii?Q?WtcM0AutiMGpXOLHi82VMlBynsCvJab8DGSTk8RsmKVUB73CkO85F0sVYTyz?=
 =?us-ascii?Q?SDWN70Kmnz1HcRcLvY71DGeEyBe2mXR2vRTcYmo6gv4E2lz1hzrD7TAZQzJx?=
 =?us-ascii?Q?PSpJROyOxz+KfvHpXrPOksxfJJlEuJqugugQN+o9g/yBJk5eAs/qCDgh/fiS?=
 =?us-ascii?Q?cEej/WOP0OyKQj4J9y/MiN5VoLrfhG1OhbnCV631i4hBetR16C1Ij/IydgdB?=
 =?us-ascii?Q?k/LP7q4jHGS84IZbFFXe2t7uUSJ5cYAwKpLQNQP6thv+Vkv8FQdhO5LBrNZi?=
 =?us-ascii?Q?CyhqLyyX2z/ruyH5Xdcq9+HKEMpwl6xH1qy/k8oNyxLd8Tey+53ULCMqFa/y?=
 =?us-ascii?Q?W8fPY3EejdzE1LEGAhuVj0lLpZJNRWeAgeOUx6HQ7k2W/t0r8H/vnbGkdfbQ?=
 =?us-ascii?Q?UjT1UaVObf5XhGVhnQ8Ejn1Ac1kSuETZZRfrsTZXPkhwHBCwJOnSVyhIQ0r6?=
 =?us-ascii?Q?E3cEbc3vyjZ6Mno/2BFqdwR7ZjyQeRjflaMcpA+X+WiT+Kv9w5W0chV29OzW?=
 =?us-ascii?Q?rnr5r+NHd0zeMGADUS0HQOlwtp/k/oWnk++CG9RC5QyzNJsjf5TzNHU7t3Im?=
 =?us-ascii?Q?qHWyHMRQ5bVHuy+phEn6ZO05ZjNixgi4YTCxRw46rT+zaVysvg1OyrY0dqSx?=
 =?us-ascii?Q?94xsxYeaoXPBl9xYjBUOvPXB84J5FFDx8FJaX4ViVPTb3USvlv4qky8wtQFy?=
 =?us-ascii?Q?KBwiPO4Ji+CcAgCFqQaMnffdmlNaoOwi2m//XhNEYnnWWtm0EHoLBN2EFUhU?=
 =?us-ascii?Q?i7UMxa8JIGM9sOf0SPPHZLr49Nzn3sJvg40Ml87dJ+URpV4+MHsDETAhFvqw?=
 =?us-ascii?Q?B0opUTT1qExpH3+DFCAJxl5Z98Jb43vrSWkmfwk6WfpeL2btEUmXuA3F7s/g?=
 =?us-ascii?Q?A6/pVRSmKQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e043ad8-1203-40a1-2a37-08dedd98bb01
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:01:57.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nn9oOIYfKhnJMBoqzpjSEwa0u781usqsdBw9qM8n3alrg6F/dvM7wg9zq5qVOADDITihy/qwSKrpUP9XIom3FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6351

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add a hardware monitor driver for Altera SoC FPGA devices using the
Stratix 10 service layer. Sensor channels are selected based on the
service layer compatible string.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v4:
- Register devm_add_action_or_reset() before
  devm_hwmon_device_register_with_info(); drop manual channel cleanup
  on hwmon registration failure
- Remove unreferenced async completion and pre-poll
  wait_for_completion_io_timeout(); poll directly after async_send()
  with the existing retry loop

Changes in v3:
- Fix 16-bit signed Q8.8 temperature conversion (cast through s16)
- Remove unused async callback; pass NULL to stratix10_svc_async_send()
- Keep wait_for_completion_io_timeout() before polling with comment
  explaining the service layer never invokes the callback but firmware
  needs time to complete the transaction (RSU pattern)
- Align async poll loop with RSU (retry on failure instead of aborting)
- Use wait_for_completion_timeout() for synchronous reads
- Handle -EINVAL and -EOPNOTSUPP when async client registration fails
- Defer SVC channel/async cleanup via devm_add_action_or_reset();
  drop .remove()

Changes in v2:
- Drop altr,stratix10-hwmon OF compatible and DT channel parsing
- Select channels from hardcoded tables using parent SVC compatible
  (intel,stratix10-svc or intel,agilex-svc)
- Rename driver from stratix10-hwmon to socfpga-hwmon
- Rename Kconfig symbol to CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON
- Add Agilex voltage and temperature channel tables
- Convert SDM Q8.8 degrees Celsius to hwmon millidegrees
- Convert SDM Q16 volts to hwmon millivolts
- Use socfpga_hwmon as hwmon sysfs device name
- Add last_err for synchronous SVC read error propagation
- Update Documentation/hwmon and MAINTAINERS accordingly
---
 Documentation/hwmon/index.rst         |   1 +
 Documentation/hwmon/socfpga-hwmon.rst |  34 ++
 MAINTAINERS                           |   8 +
 drivers/hwmon/Kconfig                 |  10 +
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/socfpga-hwmon.c         | 577 ++++++++++++++++++++++++++
 6 files changed, 631 insertions(+)
 create mode 100644 Documentation/hwmon/socfpga-hwmon.rst
 create mode 100644 drivers/hwmon/socfpga-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8b655e5d6b68..04b3bce60c98 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -244,6 +244,7 @@ Hardware Monitoring Kernel Drivers
    sparx5-temp
    spd5118
    stpddc60
+   socfpga-hwmon
    surface_fan
    sy7636a-hwmon
    tc654
diff --git a/Documentation/hwmon/socfpga-hwmon.rst b/Documentation/hwmon/socfpga-hwmon.rst
new file mode 100644
index 000000000000..e5da42556a62
--- /dev/null
+++ b/Documentation/hwmon/socfpga-hwmon.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver socfpga-hwmon
+=============================
+
+Supported chips:
+
+ * Altera Stratix 10 SoC FPGA
+ * Altera Agilex SoC FPGA
+
+Authors:
+      - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+      - Tze Yee Ng <tze.yee.ng@altera.com>
+
+Description
+-----------
+
+This driver supports hardware monitoring for Altera SoC
+FPGA devices through the Secure Device Manager and Stratix 10 service layer.
+
+The following sensor types are supported:
+
+  * temperature
+  * voltage
+
+Usage Notes
+-----------
+
+The stratix10-svc driver registers a socfpga-hwmon platform device when
+hardware monitor support is enabled. Sensor channels are selected in the
+driver based on the service layer compatible string:
+
+  * intel,stratix10-svc
+  * intel,agilex-svc
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..5a032c9931c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -950,6 +950,14 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
 
+ALTERA SoC FPGA HWMON DRIVER
+M:	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+M:	Tze Yee Ng <tze.yee.ng@altera.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/socfpga-hwmon.rst
+F:	drivers/hwmon/socfpga-hwmon.c
+
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Boon Khai Ng <boon.khai.ng@altera.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 14e4cea48acc..05a9c7a6647e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2112,6 +2112,16 @@ config SENSORS_SMSC47M192
 	  This driver can also be built as a module. If so, the module
 	  will be called smsc47m192.
 
+config SENSORS_ALTERA_SOCFPGA_HWMON
+	tristate "Altera SoC FPGA hardware monitoring features"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  If you say yes here you get support for the temperature and
+	  voltage sensors of Altera SoC FPGA devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called socfpga-hwmon.
+
 config SENSORS_SMSC47B397
 	tristate "SMSC LPC47B397-NC"
 	depends on HAS_IOPORT
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 4788996aa137..9d1c5f1bf569 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -218,6 +218,7 @@ obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
+obj-$(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)	+= socfpga-hwmon.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
new file mode 100644
index 000000000000..1cd3a06fec42
--- /dev/null
+++ b/drivers/hwmon/socfpga-hwmon.c
@@ -0,0 +1,577 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Altera SoC FPGA hardware monitoring driver
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
+#define SOCFPGA_HWMON_MAXSENSORS	16
+#define SOCFPGA_HWMON_CHANNEL_MASK	GENMASK(15, 0)
+#define SOCFPGA_HWMON_PAGE_SHIFT	16
+#define SOCFPGA_HWMON_CHAN(page, channel) \
+	(((page) << SOCFPGA_HWMON_PAGE_SHIFT) | \
+	 ((channel) & SOCFPGA_HWMON_CHANNEL_MASK))
+#define SOCFPGA_HWMON_ATTR_VISIBLE	0444
+/* Temperature from SDM is signed Q8.8 degrees Celsius (8 fractional bits). */
+#define SOCFPGA_HWMON_TEMP_FRAC_BITS	8
+#define SOCFPGA_HWMON_TEMP_FRAC_DIV	BIT(SOCFPGA_HWMON_TEMP_FRAC_BITS)
+#define SOCFPGA_HWMON_TEMP_MDEG_SCALE	1000
+/* Voltage from SDM is unsigned Q16 volts (16 fractional bits). */
+#define SOCFPGA_HWMON_VOLT_FRAC_BITS	16
+#define SOCFPGA_HWMON_VOLT_FRAC_DIV	BIT(SOCFPGA_HWMON_VOLT_FRAC_BITS)
+#define SOCFPGA_HWMON_VOLT_MV_SCALE	1000
+
+#define ETEMP_INACTIVE			0x80000000U
+#define ETEMP_TOO_OLD			0x80000001U
+#define ETEMP_NOT_PRESENT		0x80000002U
+#define ETEMP_TIMEOUT			0x80000003U
+#define ETEMP_CORRUPT			0x80000004U
+#define ETEMP_BUSY			0x80000005U
+#define ETEMP_NOT_INITIALIZED		0x800000FFU
+
+struct socfpga_hwmon_channel {
+	u32 reg;
+	const char *label;
+};
+
+struct socfpga_hwmon_board_data {
+	const struct socfpga_hwmon_channel *temp;
+	unsigned int num_temp;
+	const struct socfpga_hwmon_channel *volt;
+	unsigned int num_volt;
+};
+
+struct socfpga_hwmon_priv {
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct completion completion;
+	struct mutex lock;	/* protect SVC calls */
+	bool async;
+	int last_err;		/* sync-mode SVC result; 0 on success */
+	u32 temperature;
+	u32 voltage;
+	int temperature_channels;
+	int voltage_channels;
+	const char *temp_chan_names[SOCFPGA_HWMON_MAXSENSORS];
+	const char *volt_chan_names[SOCFPGA_HWMON_MAXSENSORS];
+	u32 temp_chan[SOCFPGA_HWMON_MAXSENSORS];
+	u32 volt_chan[SOCFPGA_HWMON_MAXSENSORS];
+};
+
+static umode_t socfpga_hwmon_is_visible(const void *dev,
+					enum hwmon_sensor_types type,
+					u32 attr, int chan)
+{
+	const struct socfpga_hwmon_priv *priv = dev;
+
+	switch (type) {
+	case hwmon_temp:
+		if (chan < priv->temperature_channels)
+			return SOCFPGA_HWMON_ATTR_VISIBLE;
+		return 0;
+	case hwmon_in:
+		if (chan < priv->voltage_channels)
+			return SOCFPGA_HWMON_ATTR_VISIBLE;
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static void socfpga_hwmon_readtemp_cb(struct stratix10_svc_client *client,
+				      struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_hwmon_priv *priv = client->priv;
+
+	priv->last_err = -EIO;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->last_err = 0;
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
+static void socfpga_hwmon_readvolt_cb(struct stratix10_svc_client *client,
+				      struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_hwmon_priv *priv = client->priv;
+
+	priv->last_err = -EIO;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->last_err = 0;
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
+static int socfpga_hwmon_parse_temp(long *val, u32 temperature)
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
+		/* SDM returns a 16-bit signed Q8.8 value in the low 16 bits. */
+		*val = (long)(s16)(temperature & SOCFPGA_HWMON_CHANNEL_MASK) *
+			SOCFPGA_HWMON_TEMP_MDEG_SCALE / SOCFPGA_HWMON_TEMP_FRAC_DIV;
+		return 0;
+	}
+}
+
+static int socfpga_hwmon_encode_temp_arg(u32 reg, u64 *arg)
+{
+	u32 page = (reg >> SOCFPGA_HWMON_PAGE_SHIFT) & SOCFPGA_HWMON_CHANNEL_MASK;
+	u32 channel = reg & SOCFPGA_HWMON_CHANNEL_MASK;
+
+	if (channel >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	*arg = (1ULL << channel) | ((u64)page << SOCFPGA_HWMON_PAGE_SHIFT);
+	return 0;
+}
+
+static int socfpga_hwmon_encode_volt_arg(u32 reg, u64 *arg)
+{
+	u32 channel = reg & SOCFPGA_HWMON_CHANNEL_MASK;
+
+	if (channel >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	*arg = 1ULL << channel;
+	return 0;
+}
+
+static int socfpga_hwmon_async_read(struct device *dev,
+				    enum hwmon_sensor_types type,
+				    struct stratix10_svc_client_msg *msg)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_cb_data data = {};
+	void *handle = NULL;
+	int status, index, ret;
+
+	for (index = 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  NULL, NULL);
+		if (status == 0)
+			break;
+		dev_warn(dev, "Failed to send async message: %d\n", status);
+		msleep(HWMON_RETRY_SLEEP_MS);
+	}
+
+	if (status && !handle) {
+		dev_err(dev, "Failed to send async message after %u retries: %d\n",
+			HWMON_ASYNC_MSG_RETRY, status);
+		return status;
+	}
+
+	ret = -ETIMEDOUT;
+	for (index = 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+		if (status == -EAGAIN) {
+			dev_dbg(dev, "Async message is still in progress\n");
+		} else if (status < 0) {
+			dev_alert(dev, "Failed to poll async message: %d\n", status);
+			ret = -ETIMEDOUT;
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
+static int socfpga_hwmon_sync_read(struct device *dev,
+				   enum hwmon_sensor_types type,
+				   struct stratix10_svc_client_msg *msg)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	reinit_completion(&priv->completion);
+
+	if (type == hwmon_temp)
+		priv->client.receive_cb = socfpga_hwmon_readtemp_cb;
+	else
+		priv->client.receive_cb = socfpga_hwmon_readvolt_cb;
+
+	ret = stratix10_svc_send(priv->chan, msg);
+	if (ret < 0)
+		goto status_done;
+
+	ret = wait_for_completion_timeout(&priv->completion, HWMON_TIMEOUT);
+	if (!ret) {
+		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
+		ret = -ETIMEDOUT;
+		goto status_done;
+	}
+
+	ret = priv->last_err;
+
+status_done:
+	stratix10_svc_done(priv->chan);
+	return ret;
+}
+
+static int socfpga_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int chan, long *val)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_client_msg msg = {0};
+	int ret;
+
+	if (chan >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case hwmon_temp:
+		ret = socfpga_hwmon_encode_temp_arg(priv->temp_chan[chan],
+						    &msg.arg[0]);
+		if (ret)
+			return ret;
+		msg.command = COMMAND_HWMON_READTEMP;
+		break;
+	case hwmon_in:
+		ret = socfpga_hwmon_encode_volt_arg(priv->volt_chan[chan],
+						    &msg.arg[0]);
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
+		ret = socfpga_hwmon_async_read(dev, type, &msg);
+	else
+		ret = socfpga_hwmon_sync_read(dev, type, &msg);
+	if (ret)
+		return ret;
+
+	if (type == hwmon_temp)
+		ret = socfpga_hwmon_parse_temp(val, priv->temperature);
+	else
+		/* Convert Q16 volts to millivolts for hwmon. */
+		*val = (long)priv->voltage * SOCFPGA_HWMON_VOLT_MV_SCALE /
+			SOCFPGA_HWMON_VOLT_FRAC_DIV;
+	return ret;
+}
+
+static int socfpga_hwmon_read_string(struct device *dev,
+				     enum hwmon_sensor_types type, u32 attr,
+				     int chan, const char **str)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
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
+static const struct hwmon_ops socfpga_hwmon_ops = {
+	.is_visible = socfpga_hwmon_is_visible,
+	.read = socfpga_hwmon_read,
+	.read_string = socfpga_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *socfpga_hwmon_info[] = {
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
+static const struct hwmon_chip_info socfpga_hwmon_chip_info = {
+	.ops = &socfpga_hwmon_ops,
+	.info = socfpga_hwmon_info,
+};
+
+static const struct socfpga_hwmon_channel s10_hwmon_volt_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 2), "0.8V VCC" },
+	{ SOCFPGA_HWMON_CHAN(0, 3), "1.8V VCCIO_SDM" },
+	{ SOCFPGA_HWMON_CHAN(0, 6), "0.9V VCCERAM" },
+};
+
+static const struct socfpga_hwmon_channel s10_hwmon_temp_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
+};
+
+static const struct socfpga_hwmon_board_data s10_hwmon_board = {
+	.temp = s10_hwmon_temp_channels,
+	.num_temp = ARRAY_SIZE(s10_hwmon_temp_channels),
+	.volt = s10_hwmon_volt_channels,
+	.num_volt = ARRAY_SIZE(s10_hwmon_volt_channels),
+};
+
+static const struct socfpga_hwmon_channel agilex_hwmon_volt_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 2), "0.8V VCC" },
+	{ SOCFPGA_HWMON_CHAN(0, 3), "1.8V VCCIO_SDM" },
+	{ SOCFPGA_HWMON_CHAN(0, 4), "1.8V VCCPT" },
+	{ SOCFPGA_HWMON_CHAN(0, 5), "1.2V VCCCRCORE" },
+	{ SOCFPGA_HWMON_CHAN(0, 6), "0.9V VCCH" },
+	{ SOCFPGA_HWMON_CHAN(0, 7), "0.8V VCCL" },
+};
+
+static const struct socfpga_hwmon_channel agilex_hwmon_temp_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
+	{ SOCFPGA_HWMON_CHAN(1, 0), "Main Die corner bottom left max" },
+	{ SOCFPGA_HWMON_CHAN(2, 0), "Main Die corner top left max" },
+	{ SOCFPGA_HWMON_CHAN(3, 0), "Main Die corner bottom right max" },
+	{ SOCFPGA_HWMON_CHAN(4, 0), "Main Die corner top right max" },
+};
+
+static const struct socfpga_hwmon_board_data agilex_hwmon_board = {
+	.temp = agilex_hwmon_temp_channels,
+	.num_temp = ARRAY_SIZE(agilex_hwmon_temp_channels),
+	.volt = agilex_hwmon_volt_channels,
+	.num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
+};
+
+static const struct socfpga_hwmon_board_data *
+socfpga_hwmon_get_board(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+
+	if (!np)
+		return NULL;
+
+	if (of_device_is_compatible(np, "intel,stratix10-svc"))
+		return &s10_hwmon_board;
+	if (of_device_is_compatible(np, "intel,agilex-svc"))
+		return &agilex_hwmon_board;
+
+	return NULL;
+}
+
+static int socfpga_hwmon_init_channels(struct device *dev,
+				       const struct socfpga_hwmon_board_data *board,
+				       struct socfpga_hwmon_priv *priv)
+{
+	unsigned int i;
+
+	if (board->num_temp > SOCFPGA_HWMON_MAXSENSORS ||
+	    board->num_volt > SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	for (i = 0; i < board->num_temp; i++) {
+		priv->temp_chan_names[i] = board->temp[i].label;
+		priv->temp_chan[i] = board->temp[i].reg;
+	}
+	priv->temperature_channels = board->num_temp;
+
+	for (i = 0; i < board->num_volt; i++) {
+		priv->volt_chan_names[i] = board->volt[i].label;
+		priv->volt_chan[i] = board->volt[i].reg;
+	}
+	priv->voltage_channels = board->num_volt;
+
+	return 0;
+}
+
+static void socfpga_hwmon_release_svc(void *data)
+{
+	struct socfpga_hwmon_priv *priv = data;
+
+	if (priv->async)
+		stratix10_svc_remove_async_client(priv->chan);
+	stratix10_svc_free_channel(priv->chan);
+}
+
+static int socfpga_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	const struct socfpga_hwmon_board_data *board;
+	struct socfpga_hwmon_priv *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	if (!parent || !parent->of_node) {
+		dev_err(dev, "missing parent device node\n");
+		return -ENODEV;
+	}
+
+	board = socfpga_hwmon_get_board(parent);
+	if (!board) {
+		dev_err(dev, "unsupported service layer compatible\n");
+		return -ENODEV;
+	}
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
+	ret = socfpga_hwmon_init_channels(dev, board, priv);
+	if (ret)
+		return ret;
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
+	case -EOPNOTSUPP:
+		/*
+		 * stratix10_svc_add_async_client() returns -EINVAL when the
+		 * async controller is not initialized; fall back to sync mode.
+		 */
+		dev_dbg(dev, "async operations not supported, using sync mode\n");
+		priv->async = false;
+		break;
+	default:
+		dev_err(dev, "failed to add async client: %d\n", ret);
+		stratix10_svc_free_channel(priv->chan);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, socfpga_hwmon_release_svc, priv);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "socfpga_hwmon",
+							 priv,
+							 &socfpga_hwmon_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	platform_set_drvdata(pdev, priv);
+	return 0;
+}
+
+static struct platform_driver socfpga_hwmon_driver = {
+	.probe = socfpga_hwmon_probe,
+	.driver = {
+		.name = "socfpga-hwmon",
+	},
+};
+module_platform_driver(socfpga_hwmon_driver);
+
+MODULE_AUTHOR("Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>");
+MODULE_AUTHOR("Tze Yee Ng <tze.yee.ng@altera.com>");
+MODULE_DESCRIPTION("Altera SoC FPGA hardware monitoring driver");
+MODULE_LICENSE("GPL");
-- 
2.43.7

