Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FF732F74D;
	Fri, 20 Feb 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586437; cv=fail; b=aHoIzf8ckPjh4nWVEOGDE8ibmvcyc+3PZln6e3KzXZ1Du+h5DlTUzXDk13H74KtMvXcwsW/otctnTOgIbpbZJW6scl7R5nmGc/++sUzmMzv/4L44inaxC/+Jc/jZTlOTtvqchpd5ZYDMlRBx1cKl7v6LWuuykVwoEidG9kg36dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586437; c=relaxed/simple;
	bh=tA7nvkXGKnh3Fg/NYcGIScu+nJ1iOLGu6EbHNvTsHhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqA1MUH2MLxE7PSpceKP5alLTMA9ZPNZ23oMV/RCmkXDdbiGEeUZTVoqH3kZfUgygSaGfOME/jqhTnRfJcewTCMeVwvXmztwi8ZCKOsNlaHJ5UzVlLQ0H57CeVy3EngsFrejpOZTjfGeONojppjxH06xB8RN8XDlcOKpbqfz6S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=SBouBhTN; arc=fail smtp.client-ip=52.101.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="SBouBhTN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9yqx2fDg0y3Jfcjs1Wq3ts60HE31gO/tMxJdwdU0+kt4HblQTw8paBNH4l7EjnB1RlCU2cu7gEWKL6WVYXfOSPlQt0Ru099a8JegYNNh8+Pd9G8Cu4Mkzy54VnXocM21eTcMBAxMkLkBCXmxzxeN7+Y0/wgIoNVkye/DaNwR5Px/P8Utd4Tkps4n+LYMzvBrRLHOto8c0ejUsvYkRhpwVshezSbdtvpYHNve3dB/AjrKyDpStYRhhrWTJtw42dc3S7EcWrGv0zMNVtYtsGrnhtAfKsQJ6H8ccaktEzXl/uVqNPduFFeLjvlh5egAv01CgcBIDDFO2m9Ccg0hFcbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trsTXgYxKLvvSW9Ye4G9qUzbRhMVpNV0IBkiskZPB9Y=;
 b=qwvPS/KDwtIGtCMZgjPJPb1Ztxj66hbakxcWq9CfDIcKY0rbzLqfP0dOuTMr1YJRiNQNS6Y7OZASgpwF9ezDVsLbete7lT+HNGPl1FOaG3CGtuwnrrBcBYbYDA64y+KTeH8QpTDbQ0i2f+0O91mQ7XldOk1x6axafG4K5k0M6VfSiuaWGaxrz5sO55rozl+m0Eg2nU6H3wfNOM37qXz3KXSzh2aZo8djG3YRP0JED4UsqGGei+n0OHxLjL2BL8raxsD9Q44MoHySoAzuUa6IgQOZd7fhELvncEgAilrnaaa/cwk3ZDjRsQ991aWuBD+e1FTlh+KZUHhzqB9P2TVZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trsTXgYxKLvvSW9Ye4G9qUzbRhMVpNV0IBkiskZPB9Y=;
 b=SBouBhTN8ZgEVEVq1RWEwR8ZItGIeBV858L93801WH1HC6sC8IZWWwf4qhjRG2rbYcNSr1Y76EVvEKamRlf/6PZPGWU9m0QN5wK0AuOIZt8ung/hcMoJDuO9wbT4arSWPLISv+pHTo078JadeYUQfQ7q52Ek4ZxwCzYokZxSE9AaXHMGf/xMoiP+nhqGsICLurOwdKUWTQqIimxIuzi/XThmPk3CiiTIftyX29pOusYFCoG6S3c/hziFrNGPXNicWUWALvJEHVAj3Las4O8UR+Rxfbj6hXQj3GsoQkBjs4BFJiPdA5MfSsgWp50ZS38rxX5fDX0EjyPF8xh4PKZe+w==
Received: from MN2PR05CA0035.namprd05.prod.outlook.com (2603:10b6:208:c0::48)
 by LV3PR22MB4848.namprd22.prod.outlook.com (2603:10b6:408:1de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 11:20:30 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::f) by MN2PR05CA0035.outlook.office365.com
 (2603:10b6:208:c0::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 11:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 11:20:30 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 75576FD310;
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
Subject: [PATCH V3 2/3] hwmon: (ina2xx) Make it easier to add more devices
Date: Fri, 20 Feb 2026 13:20:21 +0200
Message-ID: <20260220112024.97446-3-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|LV3PR22MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: f02e7044-5478-4c1c-5c62-08de70720e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tjc5RHo4a0hJbVRBMTBFcmlVMnJ4ZXdmTDJPV1FvZWJZWW91eW1jdFdURExF?=
 =?utf-8?B?c1NKT2xpM2dZZ2xGeWlEZEZrQ2N5TlRrTkM5RTZQVjRadGk5eHBVWVR6bDZZ?=
 =?utf-8?B?QkJVN3JYa1hRd2ZNNVBZMkRPQlVranMzTDA3cmhDTjdqUEF3R1Y1enRFSHUx?=
 =?utf-8?B?OWFoUUxsZERoZUkyb1NwUm1PNDFzdXgyYzVtQSt0ekc1QmRMcFFHY3cyN2hl?=
 =?utf-8?B?ZmplN3pYQS85bFUvYm1sR0lHTk95Y1pGblFNSE5kb1VqUEdvMzdvaWl3T21S?=
 =?utf-8?B?WElTU0Ftam1IMzQ0NmxzRFlZdTJYU2NvTFBuSzBIOXdPMFo4U25ZVG95V3RY?=
 =?utf-8?B?aU5VRGw4MWR4NUx1ZTYvejNmUEZlaG5XNGJiQzM3eEQvWE5YRGhkUTQ5K1Ix?=
 =?utf-8?B?UmsyMHJYdkg1RjIyU1YzMnNmOU9TN1k5NHR6Q0dXZ0NxaUN0SGNObEo2V00x?=
 =?utf-8?B?Y1JNWXFVUjN2QlBodXQrbDhDOVVSZFJXRVgzb2cySHFwWkJNaU5WSGhBU0xL?=
 =?utf-8?B?ZEpqZThjaHBZTVY1OWdoZUZlY0dKQkNZRTZrV3lSUHlyb0VQUXVZcGMwZFlu?=
 =?utf-8?B?SEVsdjN6TDM3cmtDcHlRVkMxQWNxTXJUZXVOUmI1TWpZdGpOdzQzVE5JVHNG?=
 =?utf-8?B?NXdLajJNYXJKWXNnRDZmRDFQL3Q1a2cwT0NvK255YlAyNHpZYmFobEpNNmdm?=
 =?utf-8?B?TU94SFhSRDEyeUFpTTlWMVY2TEpMWUNWNFFHR013cjY5SjVZcU9qKzZSQXNP?=
 =?utf-8?B?ditDaXJCWWEyY2VKbWhCRFFhdjkyZXdkMFRsM1FYZEJ5VUIyOGVQbGRIbHpz?=
 =?utf-8?B?ZE5yMGlGV09JVzZtK2xaN0RWTTVRMG1IVDdxcy82ZkViSHJtdjJuYVRURGE5?=
 =?utf-8?B?alJZRjI1eGVhR2RJZlpteElETkZnd0VpWkVJTVpyUjI0c1JqUUlRMFB0ZFlW?=
 =?utf-8?B?blF0YU1wSWljYlNhMnlMRVJVREtzU1lXMUczcDJobmtQWXFIbklZYmJNYU43?=
 =?utf-8?B?YUlNS2lUTDJIckNtTElBVXk1MU1aMXhjck9aUHptcWg0VHB4b3pZQmJra1Jw?=
 =?utf-8?B?ZmZwNkJ3M0FxYXRqVnI3RC9nYTRjRTU2YkZZOEFORGFJZFdwUi9UcFRDaHQ0?=
 =?utf-8?B?Q3M4aGV3VTVWdVJxQ2Y3R3NNK28rYmkrdW81ZG1xUnhrVlV4Sm5rbmhEU0RD?=
 =?utf-8?B?VXVtWDR1UHNodkdDQUkxT0FYVmlYWlNISUdoVW9yOWxpdkY1aWkzUlI4bnlC?=
 =?utf-8?B?bjVFWUN6RUo4Q09ZT1Nkb3hneCsyNk5qK2lrNVNqZDl6azhXMFNMTTdjQ0pr?=
 =?utf-8?B?bWJPUkNPUGR4d1U3QjRtWENWc05sdExvL2t1ZmdlWjI0Wk16TnZ6KzNQdUZ0?=
 =?utf-8?B?aXlSY3NqeG9JMSt0MXBHTngwcTM5Q25OOFpxRjJ0Y0VtOFdHVHlLOTFNcXBJ?=
 =?utf-8?B?ZHh4czgyMElNQ3VhSlRoWXJlQ1JGSm8za3RCdklteFpRYkVkOGVOS0MvdGZY?=
 =?utf-8?B?Zkp3UGMwWUQwQmVoc2ZBR1lxVGt3dGcreG54L2hKdVJXRHc4RUhkZ3JVbnJK?=
 =?utf-8?B?ZUdEcUtPQS9yREUrV25iMU9zRDJtL0pUUTNCSThKN0p5UEJiS01kRGhyWjh3?=
 =?utf-8?B?TnRKUXlFbEpnZWhZcjB1YzgxUU1KaXdMaGd1aW00ZXdES2Y0Z09OYlE3anV4?=
 =?utf-8?B?SE9jaFVvS2RtQ1ZYR3JScFc0bWw1WHozMCsxQUZYQkpWRzdjeHR1VWFBRmtF?=
 =?utf-8?B?Q3UrWmVNMXJORllCN0pmTnRpamRaOVJaZFRtZE9HTXZTd1ZFaTJkWG50Mm5y?=
 =?utf-8?B?c0FXWm96MlhYNmNwQ1NhWHE0M0IxMmZTMjA4R0pYRVhjUmgrZzVGeVFRdmdP?=
 =?utf-8?B?QVorVTUrVWZZMVpwUWxHd3F3N2grdjVhWDM3WGJCRHVQblhpcUpOcXhqYXJN?=
 =?utf-8?B?Yi9IYW40ZEl1V3ZJM3d0cmMrWmF1bERLVUlPdGNVS054VXRuNHNEOSt4RVMr?=
 =?utf-8?B?VUVhQ3ZIZ2dKSDNKWEZ0TW1Oc09OMnJicDI2anVkK21IZ0NySWNML2dxdXAz?=
 =?utf-8?B?aS91azhSVGhyQWNoa1JwWFA2WmtzcFVLd1FkaFY1WjhzQUMxRTJ5QStoL1R4?=
 =?utf-8?B?Y3NRalJqbm1FK1RwVzZYQWx1ZUNyTE5iQzNOTTFvQjlWOXRzK0lJdjN3S1lW?=
 =?utf-8?B?aDE2bTZZWVhYbTZleXNGZ3ltK0dqUERBdTV5S3pzQUJJaTBxKzYxK3VEVG82?=
 =?utf-8?B?OEY3N2dKcEtZdysxcVREeUlOMHVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W0RR5QdM1Kz9mV+jS4R9GNgQDLRMsUWYiVBlxC1hVgqEj30uK314/kifWkzgNU9HfwpbPpIACwXYLiMoJdmBsPRsljaYGH9rWYUHfwlYcjg/pH05SH23PWZ4bZDEMpgnpycjEkwhzoa8nVSpXDVPSkklsbGIIY7G4Wxq5QoeM1SjMeAIU4rC5rG6/OcQRNGVmbtDK2jRtLI00vNPz2hKoULwShRTimMsxQ8NzEeyJZR8vAX1VIHGFjaF9xHWk/cymKlnY4t7Dr16ECfUkUWFB7FIF2vkKNfQb+q8ZbeUtTGckgj1Sg11Ee/HK+VQb6u1yVORpcHbbEXgoMaaA8XBAUuOTtO8DxYCyJYGwUOYBLPgXx7AEUcC1aZ8NQOjVUu9e42UmusGdZzyADQjUscCSe7xYLEMzL0OZB/+qX/cnRPnlxVmx+8X+bcIAV99CZpf
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:20:30.3692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f02e7044-5478-4c1c-5c62-08de70720e9c
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB4848

* Make sysfs entries documentation easier to maintain.
* Use multi-line enum.
* Correct "has_power_average" comment.

Create a new "has_update_interval" member for chips which support
averaging.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
Reviewed-by: Bence Csókás <bence98@sch.bme.hu> # v2
---
 Documentation/hwmon/ina2xx.rst | 12 ++++++++++--
 drivers/hwmon/ina2xx.c         | 18 ++++++++++++++----
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index a3860aae444c..a4ddf4bd2b08 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -124,8 +124,16 @@ power1_input		Power(uW) measurement channel
 shunt_resistor		Shunt resistance(uOhm) channel (not for ina260)
 ======================= ===============================================
 
-Additional sysfs entries for ina226, ina230, ina231, ina260, and sy24655
-------------------------------------------------------------------------
+Additional sysfs entries
+------------------------
+
+Additional entries are available for the following chips:
+
+  * ina226
+  * ina230
+  * ina231
+  * ina260
+  * sy24655
 
 ======================= ====================================================
 curr1_lcrit		Critical low current
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 69ac0468dee4..cd0d39ee7616 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -135,13 +135,19 @@ static const struct regmap_config ina2xx_regmap_config = {
 	.writeable_reg = ina2xx_writeable_reg,
 };
 
-enum ina2xx_ids { ina219, ina226, ina260, sy24655 };
+enum ina2xx_ids {
+	ina219,
+	ina226,
+	ina260,
+	sy24655
+};
 
 struct ina2xx_config {
 	u16 config_default;
 	bool has_alerts;	/* chip supports alerts and limits */
 	bool has_ishunt;	/* chip has internal shunt resistor */
-	bool has_power_average;	/* chip has internal shunt resistor */
+	bool has_power_average;	/* chip supports average power */
+	bool has_update_interval;
 	int calibration_value;
 	int shunt_div;
 	int bus_voltage_shift;
@@ -171,6 +177,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_alerts = false,
 		.has_ishunt = false,
 		.has_power_average = false,
+		.has_update_interval = false,
 	},
 	[ina226] = {
 		.config_default = INA226_CONFIG_DEFAULT,
@@ -182,6 +189,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_alerts = true,
 		.has_ishunt = false,
 		.has_power_average = false,
+		.has_update_interval = true,
 	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
@@ -192,6 +200,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_alerts = true,
 		.has_ishunt = true,
 		.has_power_average = false,
+		.has_update_interval = true,
 	},
 	[sy24655] = {
 		.config_default = SY24655_CONFIG_DEFAULT,
@@ -203,6 +212,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_alerts = true,
 		.has_ishunt = false,
 		.has_power_average = true,
+		.has_update_interval = false,
 	},
 };
 
@@ -706,7 +716,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 	const struct ina2xx_data *data = _data;
 	bool has_alerts = data->config->has_alerts;
 	bool has_power_average = data->config->has_power_average;
-	enum ina2xx_ids chip = data->chip;
+	bool has_update_interval = data->config->has_update_interval;
 
 	switch (type) {
 	case hwmon_in:
@@ -768,7 +778,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			if (chip == ina226 || chip == ina260)
+			if (has_update_interval)
 				return 0644;
 			break;
 		default:
-- 
2.49.0

