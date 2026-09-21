Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78683B3C10;
	Mon, 21 Sep 2026 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975015; cv=fail; b=AH9+GY1Z/Uf2UKWRWuEIXMXZLFOrgp3WmuGzNaHBxwiCgz/CzHAJYzxQx4zwCkeDSU+933u3a72RyCqV31IgbjPWsJ3f8RbuvCfkgbtZ2toeTe8Z/3KMr6TeYKOnM9oZwy69BrTNGu0xqeRY41baztHWYXtQZFpSzbh2dNUboSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975015; c=relaxed/simple;
	bh=sEinfxk898LehliEWdFU6tdiEsWQMQPmKaHpJuIx0nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IdtliYAXorSjbOrDJkXnd1jRpmX/EuRI14ZZVYomy0ECaD3wimtHHn8tBF76/Z7FO7v7hzfv8GoNQ04lD7qZfUI1JwVnlDC+Ko6wgVbBsFsgsHYasI7gWW5gimx/qg1vM6UaZGmBPiHv4oEcL/atPn7tG/L2LjypTfYqyPl2gCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com; dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b=zuJ10hK5; arc=fail smtp.client-ip=52.101.48.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="zuJ10hK5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc+aMMJIQJa3WCTrwXow1syn1Jku/vb6akv9+v0vukXG+84nQyPPrlTwcYDUk1HQLW4pGkMMalkhEIxUARiWsbOeTLbk7ZsbJ0zEKPYCvkO/X0ocKo5L4e3L+k67OGTXdvFiwvePuMgmc1BWhaCHcQT4x7yV5CBipyMszOroGAOSoWV/kSgHbFXiU5Mwu+pTp3TMJkYRpGPxcBz5guj6FV9APr2xZMerxmjGzA/eCPjjdxRwcBhip4KLygirmZ9qbffDH9byK+bqq7YjXjwJIAuyyde1bubQQmoP361RGmby33za8iCey2ZFknqtfCXoeXEY2XFFKxKHiQpnKRi4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1LBZy08p3SWUhdwqQgGx5tXrt9iJLLTdnDMmzuJZJg=;
 b=fv64SclcA1UfPvC+RGvKEPbj4nGiQykuJftP+nBASq+wQUt6LlbVR+o6fhL0NqqKaMx0MDKvKwieQCF7YuqX7saWsHl+SxDXiIwQd2syARhYRj0fzk02cSOSzOZZjvxUZ/SqD3CajmtXVae7Iz98eP0i1NjSkPRFtXGAxOLUjfGUZ19Si8WI9ITeuZA68P04ZVf8hTdzv9eMmUs7TlKuv37Kjpfo9nGyVJS1WEV90HVq7t5sxjDWjmG+q1BITJkAMEAKlV7o4YIuHEO/PI481MhmvYfdlq1sXVcMq4PGX8Rs6qeIrq5l3QKwemty48zRrTold8hp385T1Ze+L7GNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1LBZy08p3SWUhdwqQgGx5tXrt9iJLLTdnDMmzuJZJg=;
 b=zuJ10hK5nyFzOuz1KYBkkP/g+0OSeLBGrfCuzoWSHxLKBs/0R8nLiEMlqyLI5NIP89kuDxjx5MYHDLh7xeciYGq1ZoZmDJdLHqCwbFQtxpo0N3U/iItnw9j67FH28/xMUCji3UGIrQuAqc7XduR1hCpw+SubzXa/IenSkb2OsHWbVytAlwxms04SwYRiJXjDvql3rhWhlSAzT9UkEnxrnxBPpArqunjkuFLN7y2TezMdVYO/8QYU2hb9Kx11Q17izOeOxOOB9NhdnDkqZJ8uZ1uoUyoK++CPgNkMuzSWcHo9sUvhjgpz7FBKvSLg8uXqws0xXQ5Xi60LRJ7KS7By+A==
Received: from DS3P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::18) by
 MW4PR12MB6923.namprd12.prod.outlook.com (2603:10b6:303:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 07:16:49 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:8:45e:cafe::82) by DS3P221CA0014.outlook.office365.com
 (2603:10b6:8:45e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 07:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 07:16:48 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 02:16:48 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 02:16:45 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 21 Sep 2026 15:16:36 +0800
Subject: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639 and
 RAA229640
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789975000; l=1519;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=sEinfxk898LehliEWdFU6tdiEsWQMQPmKaHpJuIx0nU=;
 b=JTkTj9mnO3pVlr8zWz9hdCaCYeuagjewZUtKLx3ZUvSmRTlf7dSahBI2tfuiSFLqQwpEZpIdm
 3kk+CNC+cgiCQ0yR3/aTLvosAgc5TQj+G5TglSuSTKwawwFpnWRhnd0
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|MW4PR12MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: f80ec62d-837e-44fb-b921-08df17b04d56
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35950700016|376014|7416014|61400799027|48200799018|7093399015|82310400026|4128699003|10067099003|56012099006|11063799006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MDAhU8Ur9GhNplPKnkRn7MWOshqmFGXI+23o+GNa2PEPPizZAXiJ49/rlvYcJ0xXoNR//FAt8QiAHybQ/jzM4DQDvTLJ3bxR3u9u19KTdkmaGQjHIAY8y1O3CrK1tv3bWGt7q7A9dgsm48NF94PZyiL2wfqE2iMS9N1ETCBzpNgIaRsn/ZmLd3bAMhl1LMTWyMY7x1yHy3fttZsu4duuZh5thwngOLcqs9RvrS0q1vKjFcjUoEqT1R7NShcyyg54QKMzWGkN1G05bDaKgm8GOzkwpXp4xJhwdRvfiD86utyyJCk1SNTNdz8DOTSaNyzor3zY+Zz4qG7dHtt90IY4yN5Rwt48JPHFGbUxtYpdqE6WN4h6r4zCwaqtCeN3BEy/KAdIo/HdS2g19dL2XuI7dD8LZx/mTAtHnZnuaD6/wr8kClI+3gGU4p2yq4gik5Kg1zKo+d1dB+M2i8iMJe9cUNoRV2rBRh6XLygYhqAZ7ECL9ZKVuRloM6y/9aZRF5Xk5nbdmHq2CBt7BZxhpC1E0Cyc/hysEJlQDLc21udVUSCnaLItBlgrz9txDHrtDUFJdlde+ImRC+NYTn+ZPno9T9OC+dq09qwbBNVihaDHpeYQ0C37RDNFwN629QZpLyIHCNbtGlweWeR+Rq+DbYTk3rrLS2q4wyv1+aJq0EBF3w6FQJIWqPV2Y6qqGqX/P5uTP5CSMT5PjUXP513v+CBUhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35950700016)(376014)(7416014)(61400799027)(48200799018)(7093399015)(82310400026)(4128699003)(10067099003)(56012099006)(11063799006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wE1GuZJyGtlGUWr7NYuV7M89+Ys78Flus1dng25KhJ+T+2gKArI/ovGQXpKwUXafC2DA1obLSbVVfzYF9W51kLX1AuZf2awHki3PtjpXBAdANuVzpFxKDynRpy1AmzyZG+16rCgY6Bj0vnA9sOKW3xOamH3oz8JcpWwo2jZzDdJpbtT4TkQo8hMafV5Gtjc+IQchhrA+0bpIQNTYZ/H0KoA1xuPlL9el4fzRbYiv9AnK2is0ASay/JvbYFy0IRZH+DY3EvAtOEQ18+YUMRbVcbpIB2WchYY1VFxVhRN7jQCn1x8sINaVK/6fgXpUnlsUpsG/Wc37gZMqlSaofSyaKu7Cr0CFzf5upG3ggDtaeUTQp2CifWLiMWBJ2M2oW6iZ7DjXFbT3qy+MqszzNWC1DGMYy8rVc1mzA2HPv+0vT53GUeaAoI8kFDJmIHq2lE/i
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:16:48.8231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80ec62d-837e-44fb-b921-08df17b04d56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6923

Add support for the Renesas RAA229639 and RAA229640 PMBus
voltage regulator devices.

Both devices are supported by the existing raa_dmpvr2_2rail_nontc
driver variant, so no functional changes are required beyond
adding the corresponding device IDs and OF match entries.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 drivers/hwmon/pmbus/isl68137.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2f7f825bfb69..15b4e3f15f11 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{ .name = "raa229004", .driver_data = raa_dmpvr2_2rail },
 	{ .name = "raa229141", .driver_data = raa_dmpvr2_2rail_pmbus },
 	{ .name = "raa229621", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "raa229639", .driver_data = raa_dmpvr2_2rail_nontc },
+	{ .name = "raa229640", .driver_data = raa_dmpvr2_2rail_nontc },
 	{ }
 };
 
@@ -506,6 +508,8 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,raa229639", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa229640", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ },
 };
 

-- 
2.34.1

