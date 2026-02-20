Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013014.outbound.protection.outlook.com [40.93.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC0C32ED20;
	Fri, 20 Feb 2026 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586435; cv=fail; b=jGzewpM2Uragl1ZlHk9ZMPVIyAzfkUUj86Ny6+AR3zbR/W3C8lvQcPI8ebjESbFIWG8aJxvv7y0ir4UNf/MgZJQTsfnEsI23Wb7FVYrE/4exmnsDMNi2wmXQJiuU20u+0buzC8huR+T2GriKsjnpX9fZxS9lj4gD3Q63mX8sFpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586435; c=relaxed/simple;
	bh=effQqiM1FvIuCGlGBH/eGyZl9nZxC11YnI3TqlwDEIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7qXiGBxld4El5mYE2Qd/t241dR/pyeuROQGHTlZSuE8IA+sXS4CWYX5GG9nvHlstseGN1+sOPvzzOGOgnweChRFRBHU51dDeBP00/CcGZMj7NiRZWk38eR0e2fZoBXYL5k43id+PWFTvIfsxMAI3sjzO4w2delrHy0vCLDiObE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=mnZ8yb/w; arc=fail smtp.client-ip=40.93.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="mnZ8yb/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUM4pYGO5kTsguEXj4Zcc/sdxSuxV7kXn95ZBMY6Y9wBzilAD/jACmDK0gKJyDYoyhmIUB+voOYsnrxtYwdP6HZQC74DDZTVtW9sXFguTMIG1ujTO4HZZFQu9Y6Kv66z+s6FCRenWGTXUcjZw5bfVt8JZPU6If6jWaGzcJFA/eKQMUCOarAGlQBGKe7aAQUKZRwVpa4QYHxIzzjkQO6PlQSwc8jbUAgs42kSxPIGNDjowd+1BT5SLLGu7lC/8dLrESQNPoC5EAfPVs0dEMD9wBnP71i9z39NNIrqZTIavcPBPUPDLlgrrn/iY4LYr0aSFxq6yd3xgqC7lLqGwqIOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxQe06a6988zwclH3GEFrprzjEj2xXX8XUBxyrUYWhE=;
 b=JSFgWpJ3f9/mTEt64InqkLdo19frX89ScKT+N/htyjx1wIs1XH6x4bkmtYh3HiiKzpTs1E9YG+YiP7s6FGiemanQV7TtMzaIkWLBCJzDPgl4JabB712zF7Fwxj3syTx8QiWK0G/jl4FDSiACuoYAs8BvLttmXFlTW+EhDJVKq6ITw1VAknM8p464xuu6vMM1DzBiwPgK38cLhNkj2a139iJAixdeT7BYgDqNwDWZ6VBL1aZ8lhrb145UymBUsSRgvI7W6UjTarGKHNHBtIxcSdxiwe7csTTpBbTCZnNYMQjG1NhtTK0LX0xVASoB/q/pRwY2qpbSSSpqiemEW5LrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxQe06a6988zwclH3GEFrprzjEj2xXX8XUBxyrUYWhE=;
 b=mnZ8yb/whR9SbkveLSJZArqH9Qm+dlNKsX237AIo9Z0h2kJ8cGa4WSxp+ooKOm0UYPsG63Wik/iAJJsGqSv5vtQRqbUk4TquXwNXEhslT7TkUf34mJygN5eF2lhgSCAtvmYgmCvMGvf/Lu3FDP81GxxDrrGtf6f/h/G2gysz8yjDf3riOfQ1G8P2LncQuF1JExMFDZBq7S305QC3RNG1aZmy5R+Ru6GpEKyRVq4D1saP4xaMEV1eQowKpLUzKGVoI9gumH0CUjRlgQ75Bih9bsJ3DRc01W5GU80EX2IhGUT4T760S9AJJ699SBO8MG/R/e32FQryNvJitLMZAJkY8w==
Received: from MN0P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::11)
 by LV8PR22MB5891.namprd22.prod.outlook.com (2603:10b6:408:25f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 11:20:30 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::b6) by MN0P220CA0021.outlook.office365.com
 (2603:10b6:208:52e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 11:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 11:20:30 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 7C044FFDA2;
	Fri, 20 Feb 2026 13:20:26 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	=?UTF-8?q?Toma=C5=BE=20Zaman?= <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH V3 3/3] hwmon: (ina2xx) Add support for INA234
Date: Fri, 20 Feb 2026 13:20:22 +0200
Message-ID: <20260220112024.97446-4-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260220112024.97446-1-ian.ray@gehealthcare.com>
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|LV8PR22MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 85320773-3234-4285-7a43-08de70720e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVBSQ0k1d044K3JZL2JUeGNsTTRSZTJDRkZjZ3lkd0IvdnBkRVNtd2kxWG85?=
 =?utf-8?B?V3JZcG1vaVRwa2dYUENQTmtoYXpvOHJQUlZZVlJRQnZ5R3liRFJYMEJZaWpu?=
 =?utf-8?B?b0RIS2g4cndTcXFJQXRRdEQ2eDM2czJITGVUQlFHblFMVWUyZGZTckFrcXNv?=
 =?utf-8?B?ZHpOOVhxNWNJNHpTRGNYNXZuR2RHd0VBU3lndGRxdEtpWXdrdFgxRTdqU0tE?=
 =?utf-8?B?YzRoTnhSL3lKcjMzUEtZMHpLK2tZbkNOeFpOdGt2SENXbnEwL1I1OTk4S0N4?=
 =?utf-8?B?MFJoWDdMdzVMRWpOSlZ5TzJkS0VTRFpUNjk4ZlYzL1plWFNMRXhsVFBQT1Nr?=
 =?utf-8?B?QXo4enJwWWhCSitrZzVGMkR0TmxJU3hPaVRNYyswNjc4OStKakxlODNMM0d0?=
 =?utf-8?B?WUpheHhDcFFTTCtuR20yeVk0b0QrRDRrakh0QnlMbW9PVTk1OXZ3djltRisy?=
 =?utf-8?B?VXJaZ1RmODZYRWhVblNFK1drTUg5ZUo2endMcVR4d2tJOSs5d0FCUGFsUVRh?=
 =?utf-8?B?RGlyZDNsUXUzdlJUZmJhRk5pbGcwYmNVamdMZjZtVUJOdDFNVXZ2MHoveTN0?=
 =?utf-8?B?eVNzY05jR0FUaWN2MUtYb3gyRmxoOEQ5RExpQVNIdFhUdElDcGJOai9WMnM1?=
 =?utf-8?B?TFI4TkJYeGtveHlra2lNQnczV0hUc2NxSk5DSVYrWm5wUGdISDBVUjU1SUdJ?=
 =?utf-8?B?ZkIxaGxLcTZJeFJ6WE8xUkQyclM2aE1UTG85SnJKSzJJRklJeVRpY2V4dFRS?=
 =?utf-8?B?R29HUHdsTEJDZDgycG9oSGNRTlVNSFp0VjlDaU1lNjNuRnUxc3ZoWC9yc0oz?=
 =?utf-8?B?cUhCU3VCZWduRGpFZTRvQXNOUHJqWVJvMFJzVlFEclBWNExxRDJLT3FhbnR3?=
 =?utf-8?B?dVI1bFhpbWszcnhyMXhucjE3Vk1kSGRFcHExMUkxRzVZckZ6K1RaeExnSUg3?=
 =?utf-8?B?S3BiRllhLzZySTlLTTdubTZzWXBPLzNBdnc1bzNmdk02dlZ0ZWducWh5UFdB?=
 =?utf-8?B?THNwRktwaUF4M09rWCt4d283ZFdNUGFKSTZHek1pejlaVVgvU3VPdVNnb01T?=
 =?utf-8?B?K3VzcG5KSHYrQ0kxSThiYzhtdDNNWEliRE8vY0pFRHZ4MzI4aWEwUFBCMVlm?=
 =?utf-8?B?UUhMZVF4S2tEZ1BJWjFyajBaWmZoNkd2TEFGdmhoU3dMaFhpZVo0dUlYOW5p?=
 =?utf-8?B?TnRFRzFTSDNHZFpsRG5SUDdCZ1RiRkJyK21NY2J0bEQrZzdTdkZSdlZ6SFBa?=
 =?utf-8?B?bkl3Z21OZFlYRHJtckZrZUxqRWR5a3FUamNVUkpzcTdtSStNbG1KaU1hWHhq?=
 =?utf-8?B?REpGR3BHVEMwVEdmTDBEZHhsODlPaGNoV1lvbjBmNElkYzlkV2ZZYVRycDB2?=
 =?utf-8?B?d2ZTUnA0MThsQUhqNWVQYUNWMzArcFlWK0VIdlMvT21TSUZUZWhJaC94M3Uy?=
 =?utf-8?B?TFd4K0JzWkNlem9ja1RqdGY5cndWd0dLT3ZMZERqcnZpZXBkeVFvVWhlTU1H?=
 =?utf-8?B?TFJOck5DejZ3NkJ3NjQ0cVNTcjBlMk04VUNNdXYzbHpFTTFFcGh0TnFMejd3?=
 =?utf-8?B?MTd6MFM1T1BRcXpRdFVXNkV1RlZ3UU1FQjhoMzVRTHFlUGpjTnMvdWU0SVdW?=
 =?utf-8?B?c1YrR0VzT0NOQW9hQkNiaGlKc3c3RXRremJsUWZuTDBETUVoKzVEcDdHZlN0?=
 =?utf-8?B?M2l5aldPMklzVjZPd1llUXZTRFo5N3BpVXJqd2xpdjBWeG43VE1MRzcrekgx?=
 =?utf-8?B?M1N5emtoS0ZzSkxXOFhuUDErNXc1MUlJU3BEbHFDVjRlRTNLZUR4RGdpM0Mv?=
 =?utf-8?B?WnAvdWlYOGVpcXJXS0QyZXdNTG8xTTUxS0dKWHNXLzlYQkttb0hPdHd2YVZL?=
 =?utf-8?B?K09jcldpajJlcXJ0M0N1dEVUN1QrRDJFcDgyT2xuaVRuSUhVVms2aWlqQXpm?=
 =?utf-8?B?K09iUFZGL09wbVZmeDRzbmhRckZhMEJlNGQ2MXRGaXplR0t6bnhrYk1WeDhL?=
 =?utf-8?B?Qlg4RTZaQTBwZGFSYXd3ZFJkMG8xK0ZDaGhHcE1oNUNZN3k5NHEvQi9jSm9w?=
 =?utf-8?B?RWZNRkpFdS8rU3NqcHdHSlFic3NkVW9jekJCRk1ZdGNFMjFPNHRCMlhpSG9o?=
 =?utf-8?B?NnVKM1ZEeCtNOUl6UzB5dkpJWUpJZ28yaEtMZzM2Nm5laEtQV0Zmd1l3Yk1C?=
 =?utf-8?B?K2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q7MA1Cx9ucJvv/Ht9fwup+vFx1lu7x+RxFX3M/t4zfCMMZ7Gx23DndzYd0m4gu/fGkhuvVEE0M3Pdm82NMCO/CAF6fj1fFqAtmxuFkD4f9MWY5nKBHGC60GKAM94EZ8CPuAKWb4zWHsQBK7TeXqLQdBm+NbZuaDuhQU3gFFYtULJAimQ23OxFl01p7Wo+p1/WD2HB0maZt7RBTm9BKMCDmBbMv1cm5ZS2egjdkZlDLH8QNsQCuFSx3LTyLuBricOd1ATs/M5YgPn6ikOis2On3tul5re5308OtK2YI0gWXvSF3J61PZcxNwljem++YuVO1kGyhff8gMwo3sgMhB1BWO4teZLdtxlDyqOS4+pwWmepcYC+YyNC9hLy3HG4vPO1x675vQZLR4GJ5qI5taGtORauyvkOQoW8skFHg8tFc3yI5K5AKkS3qT3THXEedCW
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:20:30.0231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85320773-3234-4285-7a43-08de70720e66
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5891

INA234 is register compatible to INA226 (excepting manufacturer and die
or device id registers) but has different scaling.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
Reviewed-by: Bence Csókás <bence98@sch.bme.hu> # v2
---
 Documentation/hwmon/ina2xx.rst | 13 ++++++++++++-
 drivers/hwmon/Kconfig          |  2 +-
 drivers/hwmon/ina2xx.c         | 18 ++++++++++++++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index a4ddf4bd2b08..d64e7af46a12 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -74,6 +74,16 @@ Supported chips:
 	       https://us1.silergy.com/
 
 
+  * Texas Instruments INA234
+
+    Prefix: 'ina234'
+
+    Addresses: I2C 0x40 - 0x43
+
+    Datasheet: Publicly available at the Texas Instruments website
+
+	       https://www.ti.com/
+
 Author: Lothar Felten <lothar.felten@gmail.com>
 
 Description
@@ -89,7 +99,7 @@ interface. The INA220 monitors both shunt drop and supply voltage.
 The INA226 is a current shunt and power monitor with an I2C interface.
 The INA226 monitors both a shunt voltage drop and bus supply voltage.
 
-INA230 and INA231 are high or low side current shunt and power monitors
+INA230, INA231, and INA234 are high or low side current shunt and power monitors
 with an I2C interface. The chips monitor both a shunt voltage drop and
 bus supply voltage.
 
@@ -132,6 +142,7 @@ Additional entries are available for the following chips:
   * ina226
   * ina230
   * ina231
+  * ina234
   * ina260
   * sy24655
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 41c381764c2b..6aa8a89f4747 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2284,7 +2284,7 @@ config SENSORS_INA2XX
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for INA219, INA220, INA226,
-	  INA230, INA231, INA260, and SY24655 power monitor chips.
+	  INA230, INA231, INA234, INA260, and SY24655 power monitor chips.
 
 	  The INA2xx driver is configured for the default configuration of
 	  the part as described in the datasheet.
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index cd0d39ee7616..836e15a5a780 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -138,6 +138,7 @@ static const struct regmap_config ina2xx_regmap_config = {
 enum ina2xx_ids {
 	ina219,
 	ina226,
+	ina234,
 	ina260,
 	sy24655
 };
@@ -191,6 +192,18 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_power_average = false,
 		.has_update_interval = true,
 	},
+	[ina234] = {
+		.config_default = INA226_CONFIG_DEFAULT,
+		.calibration_value = 2048,
+		.shunt_div = 400, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
+		.bus_voltage_shift = 4,
+		.bus_voltage_lsb = 25600,
+		.power_lsb_factor = 32,
+		.has_alerts = true,
+		.has_ishunt = false,
+		.has_power_average = false,
+		.has_update_interval = true,
+	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
 		.shunt_div = 400,
@@ -992,6 +1005,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina234", ina234 },
 	{ "ina260", ina260 },
 	{ "sy24655", sy24655 },
 	{ }
@@ -1023,6 +1037,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
 		.compatible = "ti,ina231",
 		.data = (void *)ina226
 	},
+	{
+		.compatible = "ti,ina234",
+		.data = (void *)ina234
+	},
 	{
 		.compatible = "ti,ina260",
 		.data = (void *)ina260
-- 
2.49.0

