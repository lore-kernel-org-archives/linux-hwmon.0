Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEB227B33B;
	Tue, 17 Feb 2026 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320216; cv=fail; b=S/PyPbjSuwjk0YE3GLlPVYvhq+3HJINXMsd7IIsMC+Tx8XTqJd8Ws6gCgU7ZihXixw9bvHbZq7khxDn8kZETqrTk170Kw2F7CVtxH6KePMHs9iChpkiN+mSuy9Zx2Yo+Lvvhos9oEsQXuEN0MbgYWbmK/2ej7zwMZPEkS9hsdy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320216; c=relaxed/simple;
	bh=v+J1ms67J+Mj4u5hliu81QUq2o/HR3c8B9GczF7Gs1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mao4WbMsRgB7DNHDsANiugxXSRMWK0i/7nusz+Y7l8p6eGEUL5/HySBYZClZx+sAAoN/A8YtkoXKK6cSye86rHY/mWtHiK1e1EgyfKpjnOsxiaD2X60b/PXgR+Kx4cW2hFs2PT+r/swZF4crS7IOC5dGp/Vo1XvpX4R3DbZT3Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=nUknFZ67; arc=fail smtp.client-ip=52.101.46.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="nUknFZ67"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmgQFuxviAc/D+VreK+x+nh8pe3CoAG663rC82kGI/AN6O0P4AfGelYaToy+l8w3RQ2zYWyGpnXP/NOw+rFmMMlGGZiJQwA7azgMilHr86HNcpuofu4hKiLXPXovkYgCnf3OXuzV9x+WMc/36S+H4fBbe0UZsAzKQAdICgrLgeB3XNTzw0cWtUEn+WF2q/FWEGTzxCNtbroW1wHd3aAg2xOG+9Su0hfp6nB2lW9OFBO40ue9OE1FCfkSQ+kpIfKNF0sokvnBwYouMwQCPksK9HZPjfpk89SXPvrR0YpwYeJP4p6rQ/N3lMdynuJ25XXS4IO1fX+Eq4PURpcgw0BCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68FdqE8Erime5GPGN7fgOfGvbm1EoNWfvchnyAYhGEw=;
 b=mGeJVemZ4VqW8spHPk33AFAyWvJQrS2ZCFfMDSrJ6g2IReN7Lq7Sf8j2QO5rXFFLrva97d7vAK3nZ5+lIuM6BrwXbqXLxlk+vJmN194xHyf3dxbxwa2nAw1pLdkEvtv9hvFdgfSmzQDjDttH+kA/mIFowpIzN8D96X7OkyP6gDeWbYbQIquMRJGbzx5SiV8IKOksx7OWxP+/AfekwQYdOLPfvoD8aaezqKVxFLB5cbQ5Y5O1iTPCuTITJMIKrFimxiHLegBDYjrfaCmFIbL/zv7UFNHPiRD+kxqHkijBdtdHm3gnL8/4EOz+r+XtDT6ED7sfzRjDMBqLmFp3je21EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68FdqE8Erime5GPGN7fgOfGvbm1EoNWfvchnyAYhGEw=;
 b=nUknFZ67NMJpDwDUAoB9HjH3+GTLTlNuWuZ0Mv3Vw6quzPkE8CnupgUbZBRkQmF6LVjtMX4D9Od44kb4xj7qvdiCtlkQ6hbVGa3+A6QuwiupZQQnbWIObcs1Gvq1Vs6VnlvMoiNQyBrb5xNIdgjacKx/HzX230RfGNld9Q9phWJD1EqadULYFB8/O+Tm+568PGkLxKirJLPd8kPjr4BE5/FqogpJ1bo8ICAiCLUWRQFzVuJgRK88sHrlvL7pCOGdUi+FfWAXSvdWxxxG3OM6WbEWYuPdHMZXBDWvpSK+/hOXTQLgd52Oow3lqIPMwfG3LSqEVYW/iirjpd9mnYX/7Q==
Received: from SJ0PR13CA0016.namprd13.prod.outlook.com (2603:10b6:a03:2c0::21)
 by BY1PR22MB5599.namprd22.prod.outlook.com (2603:10b6:a03:4ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 09:23:32 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::52) by SJ0PR13CA0016.outlook.office365.com
 (2603:10b6:a03:2c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 09:23:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 09:23:31 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id BA5E3F884B;
	Tue, 17 Feb 2026 11:23:28 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (ina2xx) Add support for INA234
Date: Tue, 17 Feb 2026 11:23:22 +0200
Message-ID: <20260217092325.15867-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217092325.15867-1-ian.ray@gehealthcare.com>
References: <20260217092325.15867-1-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|BY1PR22MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: b44c63ad-f480-4535-be48-08de6e0637f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG9veGREVVF4ZmRCb2NDZUNLOHR2Zy9wTjY5L1QxTHlsTVlWK1FkUEUxZTlT?=
 =?utf-8?B?dytuWDNVaVNsY2xTZXZrMG1FOXBkRys5alR4MnExNmZmNHZVVUE4Ti82RU15?=
 =?utf-8?B?a20vV2xLMW1ZTVYycEVFdlRmVG9hcXFtSFJCVVB2eWxna2pHSWNOczRCcHV2?=
 =?utf-8?B?cGlPMGtXK2UxUjN4RVVlUk1qQm41NjQ2UkV0eG1RMURBOFRuVUdTSUF2SDRQ?=
 =?utf-8?B?WCs1UVYzbGhFSWI2enVueHFOTjg5azQyc0NnYXJqS3dhQVBIa1NCNmpzbUoz?=
 =?utf-8?B?ZHZJMW1XUHpsVVZoNGdWQ1IrMTROVk03YmxjTUMzWkViTUVuNHJ4L0JPL0hI?=
 =?utf-8?B?QUphNFVrWFJRNXVEUSsyNDVDS3B0OU92Zk80QmpiVSs3eHRoZEFmSU1HeVh3?=
 =?utf-8?B?QzdhYmVHblljQWRuMkhXWk15ajhnS2t3MVJTSzA4bG1yMEJEZmE3LzNINmRy?=
 =?utf-8?B?K3QvNTYwS1J4VUZWZmtJWXpOYTdyOWFhVDFZSU9YVXY5Vm8rM0c3MVVOUXds?=
 =?utf-8?B?RnJCSERiQ3B2MEV6RzB0NU92WGR6TXVMZXhSV2VVbWFTTFU3dlpvY20vUzVI?=
 =?utf-8?B?RWt6c0xXc0VTTmluNjE2MDFXSGFwSzkrcFRkM3VzNVFIU0FNbnZNL3FOdUFX?=
 =?utf-8?B?N1ZyTzUrbzFvcFE5V0FMMWl4bWMwVSswRTRVb0szTXIrRlVEQ3dZaytRTGkv?=
 =?utf-8?B?VW1vTW9NYjZzZ040ZmV5MVdZVmNLR3hOSjBlVkhvRGsxNTVHczNDaElncmp3?=
 =?utf-8?B?dzBUcU8vQ2lnZ3VLaUhJMlNsbmxMcEdJcExSUWU4UUdyMVBBRmNYd3Jsby9i?=
 =?utf-8?B?UGdWYVJOYjJDWFZkcVM3LzdJMkpuYVB1V0VzZXJxV0phaFFhc3ZScElveDB1?=
 =?utf-8?B?L2hDcTkvQ1RFNHExdmZ3OHNndDRDTjNNSlhZT1dCSGhQQVV2RURUYVpCZjJV?=
 =?utf-8?B?SVBqNktzZ3hwVHRtZjR5Mmxqa0EwTjdlNmhUcEMrZThQMkltMm92RlJ2NmFB?=
 =?utf-8?B?Z0xzdituU3JWMEhoYTkyTHN5S2p5cnpPSjlhbTZFSU9pcnhQNy92enRaUkU4?=
 =?utf-8?B?V2VEaXZ5SGJRdDV4ZnlOZHdmM0xDb3o0TG9kTCt0c1NXL2tmbHE4QWpJMSs2?=
 =?utf-8?B?RENJQ2sraEI4VXNyektOVll0R2Y3MmlVN1JkS0VSTCt3Mkt6UU0xZW5MdElG?=
 =?utf-8?B?Tmh5bDl0RGJWODhxNzRvQk93MjdzaGN2N3JlNkg5ckwzUHA1OUQzNmlkZk5o?=
 =?utf-8?B?bU14RlhwOXdqUStpdmpVTW9uN0RUNXY3eUlHdUx1MG93UU1BaFNwbUEreVJk?=
 =?utf-8?B?MHk4NGNMcFpQdVNXc1VCcDdlT3NyT0pkMDR1NkpGd0wyYWpMdm5KMzZoZU9P?=
 =?utf-8?B?TC9kNU1ydzVxS0VSZCtxS2Q3WENxVHpTTnFFcEU4eW9SbXc3Sy9QdTlUSERG?=
 =?utf-8?B?ZnFzb2p2a0ZIWTVTS09XbmtMWjVzdDFWbTRXMEJ4aHR3TEVYbld5TjBHdHd3?=
 =?utf-8?B?djgrOUVpU0QwMTlNell3V09mWHNFWGJCaEVBZytJU29ZVlZTNi9xdm9SQTJq?=
 =?utf-8?B?U0daYU53eGZydFgvY0NBY21tRWtEdG9jVGlTcmNHRkM5THk1ajRIWExhZ0Zh?=
 =?utf-8?B?R3NyWTJwTGZZU3pHcUx3Tm5PNldSYi9EY0lKZk45WHhjQUhqbWJhQ3JDWWJG?=
 =?utf-8?B?S2g5YmpzR1FXYjRPMm9Wd0Z3NnhSUWdYNHVOUnBJUVQ3UUlpN0ZiTlZrNVZF?=
 =?utf-8?B?dGtBaUV6OU9ac01KTEhTcGVEckJIWktQYTVGVldzSDBCVmk1MEhrVStBMmdv?=
 =?utf-8?B?UVZsYzZtOUhaTnlPUGZUMmZYZGJMU2FFU0VibzFwNlN4S2xpM09KV3pSdUtY?=
 =?utf-8?B?cW93S3F2VkJYUGhKWkd5ZGc2eEdNSDhTL0pvblNyalp4OVhKUzBDdjMxRFI4?=
 =?utf-8?B?UWxRY202L2hGbDM5RUFnOXplZ0JoQ1hYRTlGZ0lpUDJqaE1OeElGRmlxTjgy?=
 =?utf-8?B?cmFnQ21Ud3lYVUcrOEU5cVhUOXJNZkVMc0tySHVIRjdJY3JmMHQyMHFOWGpr?=
 =?utf-8?B?Qmkvanc2ZjRLQnYwU2JJNGRXSUFLNllGOFU4R1lrampWczhhVEhOc0UrWjdr?=
 =?utf-8?B?U282T0o5U1ptbWZPcUtOTVpXTkpUZ09VeHVJSUZLUlJLZytNdVVkd21KMkZS?=
 =?utf-8?B?Y3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S6nKd1fyH+rcmRyPwyEBWid5sfEtQR5wFizEgTtGmee1E3crKrkvKG8fs7gY/1Tyy7C9LTt51FFYUJvAOmzM52V5FqNGdpQVjAfEpQ8ulVwBNUGASYzLJzWpyKrFA2yq+xuX0AtRIMOurIdqwU2q+CQmg8Xw8lly0JQ6qkdKcZWAwXYJ+Lm0hM1T6IUoh6GNfTM3I/Rm2rv1lsf2a4YP3s2hmpNSuZpElzq+XtGteytEhZwNuvOrFKyJidH8ZZXNWZTCy0H8knmch1QlyUbvM/VXo1Yfu4P0qMhof5H7ngt5jMp1ZoXmJ0+lrlBjdPYwtaWVwE0WHwYg7831BqhtAtHZDADGIDG8R3rdOzkw1o8/X6uFaBnFY31KRQw/VxUkEEUx5+EA7AFxKQRQP4kpmyn55V1DBMZSI3BAtbNYn0fBUobbYoWRaCWq+/C32zM4
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:23:31.7305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b44c63ad-f480-4535-be48-08de6e0637f7
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR22MB5599

INA234 is register compatible to INA226 (excepting manufacturer and die
or device id registers) but has different scaling.

While the manufacturer and die/device id registers are different, these
are currently unused.  Comment INA226_DIE_ID to aid future maintenance.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 Documentation/hwmon/ina2xx.rst | 14 ++++++++++++--
 drivers/hwmon/Kconfig          |  2 +-
 drivers/hwmon/ina2xx.c         | 21 +++++++++++++++++++--
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index a3860aae444c..4c05bd5e24fb 100644
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
 
@@ -124,7 +134,7 @@ power1_input		Power(uW) measurement channel
 shunt_resistor		Shunt resistance(uOhm) channel (not for ina260)
 ======================= ===============================================
 
-Additional sysfs entries for ina226, ina230, ina231, ina260, and sy24655
+Additional sysfs entries for ina226, ina230, ina231, ina234, ina260, and sy24655
 ------------------------------------------------------------------------
 
 ======================= ====================================================
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
index 69ac0468dee4..923f8c953e8f 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -49,6 +49,8 @@
 /* INA226 register definitions */
 #define INA226_MASK_ENABLE		0x06
 #define INA226_ALERT_LIMIT		0x07
+
+/* INA226-specific register definitions */
 #define INA226_DIE_ID			0xFF
 
 /* SY24655 register definitions */
@@ -59,6 +61,7 @@
 /* settings - depend on use case */
 #define INA219_CONFIG_DEFAULT		0x399F	/* PGA=8 */
 #define INA226_CONFIG_DEFAULT		0x4527	/* averages=16 */
+#define INA234_CONFIG_DEFAULT		0x4527	/* averages=16 */
 #define INA260_CONFIG_DEFAULT		0x6527	/* averages=16 */
 #define SY24655_CONFIG_DEFAULT		0x4527	/* averages=16 */
 
@@ -135,7 +138,7 @@ static const struct regmap_config ina2xx_regmap_config = {
 	.writeable_reg = ina2xx_writeable_reg,
 };
 
-enum ina2xx_ids { ina219, ina226, ina260, sy24655 };
+enum ina2xx_ids { ina219, ina226, ina234, ina260, sy24655 };
 
 struct ina2xx_config {
 	u16 config_default;
@@ -204,6 +207,15 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.has_ishunt = false,
 		.has_power_average = true,
 	},
+	[ina234] = {
+		.config_default = INA234_CONFIG_DEFAULT,
+		.calibration_value = 2048,
+		.shunt_div = 400, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
+		.bus_voltage_shift = 4,
+		.bus_voltage_lsb = 25600,
+		.power_lsb_factor = 32,
+		.has_alerts = true,
+	},
 };
 
 /*
@@ -768,7 +780,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			if (chip == ina226 || chip == ina260)
+			if (chip == ina226 || chip == ina234 || chip == ina260)
 				return 0644;
 			break;
 		default:
@@ -982,6 +994,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina234", ina234 },
 	{ "ina260", ina260 },
 	{ "sy24655", sy24655 },
 	{ }
@@ -1013,6 +1026,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
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

