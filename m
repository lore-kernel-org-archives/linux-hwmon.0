Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0FA33B6E3;
	Thu, 19 Feb 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506100; cv=fail; b=D2rcy+o7hZs7I9EwKo3BX1+21M8tJY+iups2YHesgXaop8/nu0fwjeWx8lgCG68HQzJrYh9eQ/CUSs8mzY2Qa/0CVsD4aN+6LjJb7feSRUs2twgu/QF70NPioghsoL5G32dJl1LDGyZw254XVLEWtx21zP//DlznchLgwCQD0d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506100; c=relaxed/simple;
	bh=wPGwWpzGzOiRyh8mAVsNZ2WJdkg1+xfU6SXc8xJJRVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSsmfe3VQfNmyOOIajyOtfM7KeKfhHJh1UK4bqyUQ+2kCOcmbInYNrLbTR2ha1AXVRJaEvark5acQtEQUrAOInBweYVPLlWtmV0NDshPSPMFp+JldFG2cvo2WklsAR+C3Ieb1T/gl7f0ofWuUyTHfNHtaQ9mq32ciTss4cW3ATU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=w/x3PmW5; arc=fail smtp.client-ip=40.93.194.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="w/x3PmW5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKcL68ks+bmKHChKKcOTLRPRyDm19A+/mD/GuJltkXV9iOKs/w52XCftASJww8LsFUXp7F6v1mLRC+d02zBAGhpTY7T3E36nl6E/90MLMJGESrL3k6x7rW3Z4yxoOl0VGck3/kPiRVv+rddNgkEF8/444753l8aSfZkS080+a5ZKp5se/kPhBsh4ZCdWVQTVPBlpZPpTPXk+Ha9sIEY6vBlWx/hXJ9/7VBnMlmfJEAzUDQuMf+9d+Bx98so8OSovrZtGwAw/nTUaC9D3f390qI7BB0TXit6tCdd71q0mm2qLhg5U3iX2m3A7tQEBUirp+GOlGwzVtVOphYJVU0tGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zn/YjKO7q6k/Ly/TAPwDNvswDziYzMAFLS6mvshx4h8=;
 b=mXperVuBgBEjefW/KtK7Lz/adHhZ3CrRiKyR8GDAl36HnKMSlFNG2TakSeM2okZ0Yh2CcN7U9rgL++YzFE1WLaJJrTPRHvShthEXu2vgkdbRqvDkZU7ZfC3ji6ZSOzgYVj3Z12nPA59KM9ODDUp8hFbdv5i/SKWwd92FTrHBRq6y4WTWDZlOtkAITAGyRrEOm5JdskkjBHr4aZhhzGfNZpjmQqbvqHIcC4Qgo4RQViipruf0nOtlYQAKp2SOjfWNZjNPh9I7+xMnvNVHe1jTSEXgt35DV+6tVO1XSUUkMtFuNrvSotMDtv7eY2169WMO095tPfE70swUaii1AZ8Jrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zn/YjKO7q6k/Ly/TAPwDNvswDziYzMAFLS6mvshx4h8=;
 b=w/x3PmW5naDlyug0ZU2JmwSMbQCEyVmYM6AakUO8WaVoAe2V/GlIQODz5q53C6Ng9EjyvEMKVJ2OnYnsiKpb0wwr9JuTgmKQvoBchYhIrjQRSDE1hELOpfx5jAyFpykE2FxOgzG8/7EFRwy7JzS0V+1+C6vb3/Rc//vD7Y4CMpkv6oWPAkc1pv8lo4wrK9o5sKZ0u5qwXrqAGIhtii5ihMOtv3wlAHQKEeHWSpL1HySjJTrORMIrMCE5RsqvQ+3hjjrLdLg2oF6ig+yXWIefyRnR06B18olK4hzMygZXr/c2rGgPndu5VXRI6GdoGwiw0U1K3m+O3GOdDiikrIChCw==
Received: from CH0PR03CA0085.namprd03.prod.outlook.com (2603:10b6:610:cc::30)
 by DS4PPF7F045B8D9.namprd22.prod.outlook.com (2603:10b6:f:fc00::b31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 19 Feb
 2026 13:01:35 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::89) by CH0PR03CA0085.outlook.office365.com
 (2603:10b6:610:cc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 13:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 13:01:34 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 71D07FFDA4;
	Thu, 19 Feb 2026 15:01:31 +0200 (EET)
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
Subject: [PATCH V2 3/3] hwmon: (ina2xx) Add support for INA234
Date: Thu, 19 Feb 2026 15:01:24 +0200
Message-ID: <20260219130127.87901-4-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260219130127.87901-1-ian.ray@gehealthcare.com>
References: <20260219130127.87901-1-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|DS4PPF7F045B8D9:EE_
X-MS-Office365-Filtering-Correlation-Id: 755afe0f-042b-48e8-e46b-08de6fb702cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDVqbFMyVS9lbHI5RVdaNUJDcG1sMk5jaFVoUVV2ckNNUTVzNk5xNTNidTE4?=
 =?utf-8?B?SEtabXg4NU9TdGNoeWEyRC9mSWZlS2dNWmpRNnI3aFRqamtDT3F4Vk9oYnl2?=
 =?utf-8?B?OGtqaG4vWVYzeDltSGRENFhuUmdIbXhOYVpRU3BnazlWK1BZUE5uLytRQXZx?=
 =?utf-8?B?eENVek1mb3E4YjYra0s1czM5UDd1RlBJL0xEckRScU9JUVEzZ3UyOHF0U09o?=
 =?utf-8?B?VHVDMk5laWdtTmR2Ym91eTlGU0F6UVM0UXhJL3BOSHdMckwrT3h6RWJNVFVQ?=
 =?utf-8?B?UEhjcWhWYTl0cmRhUFlTWDAzVm51SDdPdjdlWjl4Vld2ZDRucUc4ekQ1UEZt?=
 =?utf-8?B?L3UrQkp6a1JmeW91ajFDTk1NQkxHQ2t6bm1SQy94aS9MMS94aUs0YWtqV2p1?=
 =?utf-8?B?amdSVGdrNTJUQ2s4dERRK2ZWb2NLb1hGaC9PWFZVTFI3UVVDZXFXZzBGWlZY?=
 =?utf-8?B?UWhXc2dzWVdZWS9jNlg2WmZ2Qm9wWkQ3UVVza2E1TzFjemJld3dBV25mS2c4?=
 =?utf-8?B?UGROOStHOTFwWlh0SHM3empXQzRUWU93cVlaaFd6TE01dEdHTVB2VmZwTGMv?=
 =?utf-8?B?V2h1Z3E5cjNoeittdDA3OFFNMW1saFd1NlpMQk9GNCtKUGM3REdoOVFPSGJY?=
 =?utf-8?B?Q1pmSVBvbzNEd0ZIWGs5ZzduMkRyT040cW9PcEdPNmtJcW9uQVc1NjYxcjRl?=
 =?utf-8?B?S3B3YnB0WFY5ZlpqUFc0MDVCZDdPQ0Vic0RaOUlwWUNmYjhoQ2dWSHZyRlNH?=
 =?utf-8?B?MnBiSFVNeXBMdUZRK1JHaGZUNHQ3NXczKzA0YVVGQWttUWtOTXFXU0J0bDZ6?=
 =?utf-8?B?ODFVenZaSGJ1RlpzdWlTMnIySXpiQ2hxVXpQWGo3cUl0OG40QVpzT0ZFYXJP?=
 =?utf-8?B?U3JLOHdzRUR1Zm56SGUxNVRweEJrSkN0cWxFWVd2dzRaSWxIWjBlNHpBMFp5?=
 =?utf-8?B?MlA4a3BtYk1tN0tXV3BSRVhUdEZmYnNHSVowbk5OTkxsMjduQmNjMHZUK1ZB?=
 =?utf-8?B?UktiWUNJajJTUUt5R3dFdzVTRVUvTTZDMGRyVzcvL0pmc01zbjZhTFlweC9z?=
 =?utf-8?B?Y2hiWldzUG9DUTVKNEMzWktmNjNZcHdGYjVsWUJJUmZjYy9RTC9UNXhRSE8x?=
 =?utf-8?B?dUJON2FxS0dHR1VoS2t3SGtlWlhMS0ZZSlUyUzJlc2JPVUVndjhtdHN2dGpn?=
 =?utf-8?B?OVRoRkowMVhtT1k1SjZaNXN0eHVmaVp0WFkzc1VTMENvTVBsSnRIVWhPZ1F2?=
 =?utf-8?B?R0hab0FDYUkwM0NXaWpNY3hvNTFhODZ4QlFtanprQ1JRV1JaZ21WUDBqOTNY?=
 =?utf-8?B?TkkxYWhVbWlLK0JwZWdzeWtMSnJWZGhGS0k0dzZDUlhhTDZrNEg3Wmx0MkxG?=
 =?utf-8?B?UnpFSG5pcTB6K0VvZkJJR21LOVdsbTNYSVR2cEQ5aGxyZ0pKUmZVVkt5UHFD?=
 =?utf-8?B?SHJoWjE2a3E3OXNqQXZFbU5KQ2k4SHUwTEJwM3NZQ3B6ZlBBdXhvRjVyOTRH?=
 =?utf-8?B?ZU1MN25USjl6am1ucDd3RS9DcURyVVBkaVVxbkR0YU14am41MlIxcWFyWWJp?=
 =?utf-8?B?bkdZeDAyVHFMTklMU0plYVE3WVF1SWdnUndLWVcrb2VISnBINU9yL1QvVkpR?=
 =?utf-8?B?SWlTbkVFdk5MMVFrWkRUMDZ6WW1abW9XM3FKU0ZTY3lTUTBKV2lPR3JGdzlS?=
 =?utf-8?B?WEo0enRYNUsyc1pyK0UyOFZPN1pubjM1b3ZRS2UyWU1BUWVtNkxkTllnZjMz?=
 =?utf-8?B?N0FERlJCZlUwUDR3SUEvalovVENjT0tzeTl6aHZzaVJhZjJKNFlwRE5DM2x6?=
 =?utf-8?B?VDNNQkkxeTJ0di8xVmtIanVwTXVHWVY3RWdKZUp5YVNYRSs4WitMeVZqNlo5?=
 =?utf-8?B?aVJmOHZ2VTZYRUZoejRQd210eGtxSU5GSnpRWGZUK1JwUW5uam5vemNLczVx?=
 =?utf-8?B?a3ViNDI2UTF2cHgwOTBxYWROZmdyWGpuV1FvdW83cHU1M1VEaDF0VjBFWmpt?=
 =?utf-8?B?OE94aGlycnhZSEp6QnIwN2lHeDVkY1EzeGw3SDBZZ0NIRHZlRHNMR3pUZC9D?=
 =?utf-8?B?Y0g2N3FWL2hFaXloSkZKSlEvWW1ERWdlMUJTREV2a3kwSDBjWDdBUjc5ODY2?=
 =?utf-8?B?TG5qRitjM3p5ODROM1QzUFprZmYzR08wYjN4NURzaWxzTkVDWldqOElWU29E?=
 =?utf-8?B?bHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oKPAgEMFAQFIqiZdP6RNCliKNdXu96RwTxdpr7ECTfYqFn7BKgiD/O35aAUg1x7LRDpi03WyKpnQPNl0DO8hhNtU534EsV3RpdCt0p044vdO90yF5dYqMYxu5BRbpzLKZVKZ46fjqesJdSsZY4GPWeElCsw1+CWDjLbD3knzOFLBlgk5h2ghpsSH9BoBd2tkRAM54JarkEb/sRUTecXem1zvvMXI4WJbtrz7L6csqdPgKobdqc4YKGr84qPYOgC+LFeF3Mr/I2M5EBVDS4rE9BUtNboEAJkhjdfZTWnrAFFrI2AtgVuGtfA7/ESp/cbawKrVs9X+aWLoVwHGvqHAiknm6o0BKvN+VeVkG2D6+DAox75uBGVdWDlc4VchNBuKlz7yOnJe1884TDGf4wHEiScOP9PNIF/jJETsb//j6mFxTnxhja5p74oU9BztOej1
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 13:01:34.7252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 755afe0f-042b-48e8-e46b-08de6fb702cf
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7F045B8D9

INA234 is register compatible to INA226 (excepting manufacturer and die
or device id registers) but has different scaling.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
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
index 4bf609e25f8a..d6032183b055 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -140,6 +140,7 @@ static const struct regmap_config ina2xx_regmap_config = {
 enum ina2xx_ids {
 	ina219,
 	ina226,
+	ina234,
 	ina260,
 	sy24655
 };
@@ -193,6 +194,18 @@ static const struct ina2xx_config ina2xx_config[] = {
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
@@ -995,6 +1008,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina234", ina234 },
 	{ "ina260", ina260 },
 	{ "sy24655", sy24655 },
 	{ }
@@ -1026,6 +1040,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
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

