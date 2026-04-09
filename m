Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CC93BED04;
	Thu,  9 Apr 2026 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732340; cv=fail; b=oFYvAupNttyeKkXsDI35zcQW3X4V5pemyYHPwUb2XNefogcZNLM8PVR7wARrt/FUps4nW2dL/Kc8I7+LxzcLAOom8kdJnQrfN1Ry1MGYiuhYQfZb3uCtf1BjGERlZPfr49xC2m97vyeDRawOagNYgoTP/S/pY+ywpZiIGdmJD4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732340; c=relaxed/simple;
	bh=GKomfaWpnYD2eXKWEnkxdSMZCEOA4l3DAmAcjfosyTY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3aChk5CYXwVsbSWOqKxCzlzPVUrMidyBb1Ujrp7Z44pTPORgyzB+EJbVoB9hFJ3+hnY1wx5Baj6s2DSaw4iBzeIoLc/z4Wa7xfOcCCETheIBrw64G3VO3c0UO81u1T50mWIEEGT/EBvWCShIXvoy8XrvlL2xwhwSDly7Glo/+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kxc1Z3Ln; arc=fail smtp.client-ip=52.101.43.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kxc1Z3Ln"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFDql00B+fO0XK0sx/Q5800O/e1SdXOKbh82FYcmXl8H1fRHHgwz1GMebOUPjhkBKaTa2UNOyIvzscDqJETBLUyutbU4iezy6cwGAq/lUSM8Of4InWh/3zPRwZmduqpvc7raiMiaI/oao5HLPQ2bP33A3LlEEy/JBzm97H0+6exZptA49VAKCGZXCErF+iH009Hjr6Xh6nMPtfAs80kljzy+qIdzLucgDGW8fPA/iv6dSfIRwF/A3AcOAtNkt0E/3XYDY5K5f4CfBN6y2grf/igzyaQgthUj7Z786TRLf8PGKJjESNUDLtYJ9lBHYkVrb6B+jiXG+RGBtMW5tNjt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW/98tZuzpeypHTbaLlolnhW5jM6gorI6K4c3+KQ7A8=;
 b=xHOV6ybo4dHSxZ2Ca/lXOEKnda2hLBZPfZg7FbUswm7LsBUzkau8U6WDcuMWcoBkwwIx43lZ2gBCBnWSOYCAuwS2HUz50qJVRZvZfowU4tQzGvxyDhJXR1r9fLdBBZNjTOW8osZumSstuJA9fj9ph30ovtvR3FYDOsI0D75Ec7f8Y9c6hfs/u8Ssdq7XjCcpos8iEFd0bH44zOT72BDEE1y2NBATM+Mfcv/RG2QLEBGz4P+KtgwzHc3JFKYbvprmqrrY1RGheqkabJBNJaofmi0oaQASO4LUvnbTuyNhMKlO16qCGcIjzT1SIUvQFQcQeH0o4o+0OOVIpy2S8X/gOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW/98tZuzpeypHTbaLlolnhW5jM6gorI6K4c3+KQ7A8=;
 b=kxc1Z3LnQbYV4EVUM4NkTWok+A6WxOufHpsrxig6NvF2+7VZfHFT6xX5hJ8VpKF2K4xvyltmQDz7l61uByda/8TypjE5PKNJQ+WT8bnTDkPDZTXXbCnP7otPnu1K3AikgvFDeC5aaEflJ1nPRYkRfbkk/voSPZ/Lu7bpIsvM+hfGrF5leBPMQn0WlX/5aJAlZW+riL/0+3jmexR1JC3hFGM3vzYdTLhqLO1jkSy0b+IyCX2cDMrlgdRitpilucer03PTxa+bYPui1Gfb+Mdg9lvbJEzOcj5nxLbz6o/+BVxzPUJyMcf7rU6sA0s785Qusf/1jeOzYND7JATm0jv7Bg==
Received: from CH0P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::29)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 10:58:53 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:11c:cafe::bb) by CH0P221CA0006.outlook.office365.com
 (2603:10b6:610:11c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 10:58:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Thu, 9 Apr 2026 10:58:52 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:58:37 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:58:37 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:58:31 -0700
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
Subject: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
Date: Thu, 9 Apr 2026 16:27:32 +0530
Message-ID: <20260409105747.48158-3-akhilrajeev@nvidia.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9b8977-74cf-4dbf-58ac-08de9626fc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|13003099007|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cv+ommWNMV1woDLf1AJewrdVh4lGdTbjLeQcpz6OuB1gV5AEeIJpGUOKkBXNmC2dgP6+4UxJv3KE9usiyk2xPwmArNsPL2qSPHo4I6Bw2hd4btOtJ9L34mmBUfF031aZkOWHrAmVBEM/rhooMF9XjvGXQiw0dvcBIBUmUYNg84YiSSNVIu9WkzHoY0ySPYlHUNM2OBjQyz5P8qxBvDdJVIFxFMUdHC9PIziPt/PLTA5nZv/1bpbkrI9gxys0jsgSBl2Wl4f2tiC0lF3g9i/YE8hqWKGQQ4boT5kHVZLjkbkztGklzIVT9rcT9AI7dMz6gOnh1D0Ei24CjBVq7EROD1Xll7YyYjaCdjou3C8fmcCt0+oasK2u+SvFP85fmrAn8BZNnCkyuq5+L2cuBZoyLCoz7ZrQHG2M87KbIea6qXtaoPI2swI13GT9l5AH+P3ifZnChrESQQoPPB3k9K/FYvCXF/LVryTzgwBr+Xg6Zz4CyC2s+293h1BSSet3b/LsQ6UguqiYshYjSrOVNcbeNLIINNQ2OTKQeJrthLvGgOxk+vpxE2Rfo0C7EeEM70EwS/3N9DWdwP4N6LTRGLdELDCZHPEXRBU1d6F5RgFaUefwR0oOxnlK4/zRWxELADUEOWRVpTayyo9kQ7eTjvcrKXJ1tOGzlGkxSXZSflA0Zym4ke/CdzOKnPL5ze9AmLeb3PiOaVi0AKT/rCu8fwGrrcW9v72akY6aKbdzA/33WMmpBOF7TGJ3P87t3G915+SoAwxEn6eN+GRcrOJIrrBv1H7P1kZn0Vib/sztCzWeBQy9oKRKo4qZrQLiDysbKzyZ
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(13003099007)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/mB6pqlGqpO1mmwfGpiIuuvoeH+v7pvjszmWrSBEbH4kxqq0EqvxtUzNYsJWji/9GuE/MaCa4Zgw18b2lO4aKVAbzaTxL/DsswF6/OdAoF0VSyBaxWaA2eja5/GIub/zovQwdjClLHlkkBM8u5or0+rvYBNCuFrsVqf6Aovs48uY92zWBNTegCLWjdZJu49lCLND6Et5URKOerJItIfd4RmGqNAtJRsgERVA48P7cqqibVuOGNIR/IJ+bVv3EEdRiwzTk8D4MaUZ3apyZUrPLqDQG4/RpWyP7mqdQbNgdDDfyU/yUUm+LeIlQTroTYLF4ukk8HNvEePenN51KaBaOux5Pf/HS0HI/JE03InMUtK69/NklyHo7CPpAsmIArhrWfH91MnZBIeq936QZSgVNIKE3qeXLVkI8tnQd2UMRUOKHsC4k8Qee1kAxK7joRDC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:58:52.0192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9b8977-74cf-4dbf-58ac-08de9626fc77
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244

ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
used for Legacy Virtual Register (LVR) data as specified in the MIPI
I3C Specification for an I2C device connected to an I3C Host Controller.
LVR will be read by I3C host controller drivers and it provides details
about the specific speed and 50ns spike filter capabilities of I2C
devices.

Update the rsconvert_info to include this field. For I2C devices on an
I2C bus, this field is Reserved and unused.

This commit is the result of squashing the following:
ACPICA commit 70082dc8fc847673ac7f4bbb1541776730f0b63e
ACPICA commit e62e74baf7e08cf059ec82049aeccd565b24d661
ACPICA commit c404118235108012cad396c834b5aabe2dd1b51a
ACPICA commit 7650d4a889ea7907060bfce89f4f780ce83e7b28
ACPICA commit 014fa9f2dbcc6b1bd42a4a4a6f6705d9cf7d460b

Link: https://github.com/acpica/acpica/commit/70082dc8
Link: https://github.com/acpica/acpica/commit/b3c38dc9
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/acpi/acpica/rsserial.c | 6 +++++-
 include/acpi/acrestyp.h        | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpica/rsserial.c b/drivers/acpi/acpica/rsserial.c
index 279bfa27da94..c06e918ab889 100644
--- a/drivers/acpi/acpica/rsserial.c
+++ b/drivers/acpi/acpica/rsserial.c
@@ -315,7 +315,7 @@ struct acpi_rsconvert_info acpi_rs_convert_csi2_serial_bus[14] = {
  *
  ******************************************************************************/
 
-struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] = {
+struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[18] = {
 	{ACPI_RSC_INITGET, ACPI_RESOURCE_TYPE_SERIAL_BUS,
 	 ACPI_RS_SIZE(struct acpi_resource_i2c_serialbus),
 	 ACPI_RSC_TABLE_SIZE(acpi_rs_convert_i2c_serial_bus)},
@@ -391,6 +391,10 @@ struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] = {
 	 AML_OFFSET(i2c_serial_bus.type_specific_flags),
 	 0},
 
+	{ACPI_RSC_MOVE8, ACPI_RS_OFFSET(data.i2c_serial_bus.lvr),
+	 AML_OFFSET(i2c_serial_bus.type_specific_flags) + 1,
+	 1},
+
 	{ACPI_RSC_MOVE32, ACPI_RS_OFFSET(data.i2c_serial_bus.connection_speed),
 	 AML_OFFSET(i2c_serial_bus.connection_speed),
 	 1},
diff --git a/include/acpi/acrestyp.h b/include/acpi/acrestyp.h
index 842f932e2c2b..38a19b1d19ac 100644
--- a/include/acpi/acrestyp.h
+++ b/include/acpi/acrestyp.h
@@ -423,6 +423,7 @@ struct acpi_resource_i2c_serialbus {
 	ACPI_RESOURCE_SERIAL_COMMON u8 access_mode;
 	u16 slave_address;
 	u32 connection_speed;
+	u8 lvr;
 };
 
 /* Values for access_mode field above */
-- 
2.50.1

