Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795367448;
	b=1b5pxQZsIMj5foaniMd3tJ4nnlBNAqyUB27U9WH/WPdK64zLvg+qui5oQjilHTO2hAwd
	 2fEl8dAzNZipRxJiTuD+sM+za4BH4g/FpsRALsSmuL5YmQzC9jNVeBGIHB+GrVrTEwW6H
	 G9+pe6K/IOUVBWdGCPMI8mXxKfAKl3Fdlh6E2jJpA8fQjsxWimzVdrfQH1goq/n9Jtd4h
	 KYqnJ8oBCe78BtrkibrwZGCB/I3X9poUZPQ5FG94O7iwsJxIAaQKgovWtErlIPedAsfTN
	 NZAb4eeZfsDu52tPxAwvIs95eGbwpaOdFfLT+0c/FA/ab30SDUqLuGgS8weV0eZbX+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367448;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mRdcqy+xRBLc8iEYBsOyhRe7aiC/Vu8JkTX8ifLdAQI=;
	b=J/RE8EJ/D7hua14N8qdT5Id5TO7ofdtS8SDCTzo8p1gHNN1tYJD7WsDhB2eGVJ94/hRs
	 jYATwPbjc4FzKZBJi1jwfVNJ6v4CLE0lK+cZu+/oaqmyFWErG/8DIeYrQKjuaF/lrSZeC
	 xXfA6wXAGJj9MT9DUrPWr8Dmsyp6Meyyoo+f7sC5GpSTeP1Lirx3s4Sl8Ipgi3ClWQ1lC
	 M4XTANh7+8NgfcUQITB9GsEbVeGWaU7BLKN9vW8YgfyH590p1P6obM8yiH3FZBbEHeCNm
	 gmImB5d1s2Ofr2K6rCHS9JyV4XdF8VyOYscG0pJ9gOwPLXfhkojUsB9cWpd2WUp338w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ihkDWqzn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.56
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9805B606A320;
	Sun, 22 Nov 2026 17:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9805B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ihkDWqzn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FebfZ0imiI7WElGg/vKbjSKSclbC7ciaKFOwss5tfTsllO0pGBcLQLl8uDDg2FOdj0YkZEjAGtnl3HMjHmlZP2/M560Zr1dALe2GRrdxdnfsjdlNxz2HV4YC2RAxq+IvcDdJDnGrWGHYbbNt3CvmkwlIdEFYfDM6y/GhLzwVFzD2a81TVScWH61AAyyrBP4uQ/ceiLdG5udHYrzutLzpEscmV7J7lc50q51/Fq1kDmcatn4FV00yheMo4Z6u+cpWdgB1fysGP62W0m9O5NacBMhnxXjra0hcsz14UI3Xb1gyVTM1fxPLo7ug1Ssg/7R0feRekqFIZJpO5PwNV8MyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRdcqy+xRBLc8iEYBsOyhRe7aiC/Vu8JkTX8ifLdAQI=;
 b=NoQKkkhMkj3YdLFxh+GAk3HyT51Mog7LL6NfDkgBqTls7mZX5l9S9ncLyz5Bm/31iZcuaHjoFW/YTAH7VirjksZhtw/WqLUMue8X3B2MHSuTxSMpPCFU5fm5CQN1gRqiE7oDAlQPkyTmpein5oMG2cXp5VqqtHTvKT6GxPt8/Skc7rqKq/mOOl4JfvVKntHHZe7ee4G/trS9VBGH5v/h5XSlcMiGA9O0EXDNfjU19t5d1sVpyqH8c9mYknAVXBGRtH5/Hcrrm7pvUOB2XXimiB1rNFApmi3E0YUFgxi27gHxYWFqjd19BgFlODZX+igBd5y+0HHZValjK5XbDtMu7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRdcqy+xRBLc8iEYBsOyhRe7aiC/Vu8JkTX8ifLdAQI=;
 b=ihkDWqznWnWVYbbseuRsS0bf7pkSa09PJTh7gKjg8rMMa3CEoskOVYthXES4gUus123vEE5CYuXEmjZMyoSD62g5wxm2i10cV69ByccH147PgVIoQbLi2+WxpHWX6w1Wz+HqmJgDFHcg+ZV7FIy/+uK4SD9opGWHA2CfY/RKDeupSRWZnQmbFHQ+Sszx6vvu0n1EmbHr7PYEdAA7z3tFvMC6sXHd2pRWyNvHp+WZ8n3DY23hVnkqHD140RgKUyGctCb9xcfjW5/s96IcIp50Us0/K3lMujWFRXUHmabgPiI6DITK0VBmkHdqMN+6ZhzoWvSAsEtXMbrXIgD578Jk7Q==
Received: from CH5PR02CA0015.namprd02.prod.outlook.com (2603:10b6:610:1ed::9)
 by MN2PR12MB4240.namprd12.prod.outlook.com (2603:10b6:208:1d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 17:10:42 +0000
Received: from BN2PEPF0000A7FF.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::93) by CH5PR02CA0015.outlook.office365.com
 (2603:10b6:610:1ed::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 17:10:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000A7FF.mail.protection.outlook.com (10.167.245.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 17:10:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 22 Nov
 2026 09:10:25 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 09:10:23 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH v2 3/3] hwmon: (pmbus/mp2975) Use PMBUS_FORCE_PAGE_CHANGE
Date: Sun, 22 Nov 2026 19:09:49 +0200
Message-ID: <20261122170949.3059743-4-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122170949.3059743-1-fradensky@nvidia.com>
References: <20261122170949.3059743-1-fradensky@nvidia.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FF:EE_|MN2PR12MB4240:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c39fcd9-d776-4438-4a65-08df48bb8a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	oXs44o6qLhqhdJkPJvOXJs8D9V7bG9KBNUe8nF7N2B30xej193/d8VhlLS9kCDgwaQRlGXh/cme8Jfsocw4SJUklV2EsG6hd7Av0Al3t3Z9upp1SYKrzGtMD1N1KIEZWWkOzl5R8O2amZdUJZ2omptkzeydrEV7HMDaZaQIID3qNiHcy++XZc/BDI+72FLhVO8JAIyVhqo42NS+9AC05KDZqfrI7gR2uINJD3RCYllHA7EK7/9obNrNOsmmLdTk1tNmqb5wcIDpvZITRXxQa93AtnZDTifJbuZSuWReliZF1Cr+JreCYeE/1sqvWFPcFcFKqmGHUj0lO+Ekh1qTN1d5awuRjv5RiMVxx9h4i88wYlhamOK+Y7dTJbOzb9Tyl6aakBTiE8LZnNdzPTXC2+bQQ1cuYRTlBgZ6T3foAvWq9l2cXorl2qMTJPsP7+x78+yNqeo5rtT2SXNL3IAgbgY5zdg/KjCI9/cYppwfJSa/GFRzgghppKq4ePr53j4BTAslxe51pltW6IKjpxOFu8IBYPmarwlKy5H+5LmRsgEPlyWJrzDsyZhQBVKS5Td6qljNmjqbt7sy/J5OC23Ax7G9cW7qZtFvcYdQoK65NdObtQpf5GLkbHvy5lNr+Tn5XkA7rUBPrPDDeFHIigPX8JX/AepolLcb+nxcq5e5glZv8EXvh5At9V7HRJ5KDHWdacuHG2vYikO9/bW/0YFkv7g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PMUDwwOeS/m51rjVs2OZsPPZHodstnd/PexXfciOFkXhnh83hDu6K1vqthim8SoeGSrk34roIfA5camW0RFo8+ciZ5rwBViHyDRyyx/cTYa/xcKvYCjiP/EI3iYk+l1oC++pdgcNTTcvOXCv7fpJB3wJqL4F7k3JXZvVeuIdmnVfDgZOZaQDEiB5ZhzrebFFL6ktFJPPdbBT4I9V1Hvigd7AQdR1jFIAA6z+6jc1TwTK2+kC1VZvqbdf5Pzr4ZdwD5R8gFvzDm89ZRcnzg5Ys1QyTMiygWeCDL2NHEh6HfbcAiLvLHfNhlRLvQ7zI2Bp2+Mz8wFsteuRogEFyrPv9s1akwU7EQUp3KAehC7BLzSrNSuGmmHPi0j/5BEIr1tTK8dEsoa0L4hWsRXPQomLXBisKn6CThvDSb9mpHN5+k83EwmBAwZxp6u8ip2T2UUc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 17:10:42.1445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c39fcd9-d776-4438-4a65-08df48bb8a1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A7FF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240

The voltage reference, from which the vout fault limits are derived, is
read on page 3. In a single rail configuration the driver writes PAGE
directly for it, since the PMBus core does not change the page of a chip
with a single page. If changing back to the rail page fails, the core
reads page 3 registers in place of the rail registers, until the next
voltage reference read changes the page again.

Set PMBUS_FORCE_PAGE_CHANGE, and change the page with pmbus_set_page()
in both configurations. The page change is then read back, and a failed
change is repeated on the next access, as for two rails.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2:
- No changes

 drivers/hwmon/pmbus/mp2975.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 2ad6b7d831c8..4eba171ab87b 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pmbus.h>
 
 #include "pmbus.h"
 
@@ -105,6 +106,7 @@ struct mp2975_driver_info {
 
 struct mp2975_data {
 	struct pmbus_driver_info info;
+	struct pmbus_platform_data pdata;
 	enum chips chip_id;
 	int vout_scale;
 	int max_phases[MP2975_PAGE_NUM];
@@ -457,37 +459,20 @@ static int mp2973_write_word_data(struct i2c_client *client, int page,
 	return pmbus_write_word_data(client, 0, PMBUS_SMBALERT_MASK, ret);
 }
 
-/*
- * Let the PMBus core change the page, so that the page it caches matches the
- * device. The core does not issue PAGE commands for a single rail
- * configuration, thus change the page directly then.
- */
-static int
-mp2975_page_set(struct i2c_client *client, struct mp2975_data *data, int page)
-{
-	if (data->info.pages > 1)
-		return pmbus_set_page(client, page, 0xff);
-
-	return i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-}
-
-/*
- * Voltage reference is available on page 3 only. The callers read a register
- * of the rail through the core first, thus the core caches the rail page.
- */
+/* Voltage reference is available on page 3 only. */
 static int
 mp2975_vref_get(struct i2c_client *client, struct mp2975_data *data, int page)
 {
 	int ret, vref;
 
-	ret = mp2975_page_set(client, data, 3);
+	ret = pmbus_set_page(client, 3, 0xff);
 	if (ret < 0)
 		return ret;
 
 	vref = i2c_smbus_read_word_data(client, page ? MP2975_MFR_READ_VREF_R2 :
 						       MP2975_MFR_READ_VREF_R1);
 
-	ret = mp2975_page_set(client, data, page);
+	ret = pmbus_set_page(client, page, 0xff);
 	if (ret < 0)
 		return ret;
 
@@ -1072,6 +1057,10 @@ static int mp2975_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	/* Page 3 is accessed in a single rail configuration as well. */
+	data->pdata.flags = PMBUS_FORCE_PAGE_CHANGE;
+	client->dev.platform_data = &data->pdata;
+
 	ret = pmbus_do_probe(client, info);
 	if (ret)
 		return ret;
-- 
2.34.1

