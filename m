Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795332855;
	b=UC+Fq2WYXQbwOi4KRZEl6UFYa2Y/blIO96oh/o9R7SduPF/dyWUE8VTu7AO2W5AkJZJB
	 EQWm5UqPqr4STGxWyUl85U4zgluhk/bMoVO65m9Chs/EQcme1Ve48EpECfFnNsDAcNKta
	 exOI2cVKArNXHjVKKFgVlYP1agUaN7Wi5VcRrUqPSrO22aY1ZEhOPAQJsz7Q5Z3trYEbg
	 XQLnNn/tWt1vuSg2pYvTvojQu0GBA3jSKCyY3xz15h8TIcROZ6XR6499DcKYXfDqQaQ1S
	 Jsp+dQ9zBCQTfFesAtqQEjDNBC0EWrsZWt9LZYYs2/kJoEltLounv+r80QaD0w6llxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332855;
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
	bh=6ippnZIfxt1vmZhspLJuRWkXlbVkIIf4ZaaxVue+11I=;
	b=AXsBc3igGzqWpPLXV8BP98V4QLpgPOqqR5oaCJksgvzOk9ZFSrGrHfTJ+smJ+Lf9aGly
	 +KD0sNd4QgwG5eoItoCXVyMTqHZ3LixyCN9Bda2+dhFkgmJHvUl0baBceOkDrwfMNAHjM
	 USVLeu4QYUJC33TDOsJhMhFCQEhPn+X9Mt+hpTeE48axNfdCGE5OjfnYfudEiqL/lYe5J
	 TwLf8ZDK2RCZ1SXLpxPJiQClMtkobzLBnR9ryxDbaxaOxKFsbhxicxwpn2IeWw7RQg69n
	 GbdQvEGm+2SsFCOrhTJJhHj2j0RhOqs/ZGoywJDAuYKowd97kGqD42Js7t5GQ3WID/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=d9n2C6PV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.26
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF3606A32C;
	Sun, 22 Nov 2026 07:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FF3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=d9n2C6PV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwLU45zLIM3eUuXOgqKnRFHVRTHe145XJnvvHAp7r/pBBXB+/5ev8lbHIuW7IUPPjH/Ex5PJ/2PLXrIfT/yepOLiTMXk6AgxdoXUnokBstH6YI1Yh959CiPXlXsWg6ZXCBvYQ9Cz6GdeA5Ylyc08z2Gt4Nnqrjuvzxogx07IOhY6+KWTGqL/GlXcR/nr9fJrvwdDICufD0KU1bnwlmwfpN731kp4w78aXJrvwToGy5AILDbWSoxEB3gnySmvEbjNDnCiB0TNjjjuKGsmHLd88djba6o73pD7Z+pcsmuWgFZCzJSamCetuGN5GooH2f6x6+Hq2prOC86Gr055hGkeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ippnZIfxt1vmZhspLJuRWkXlbVkIIf4ZaaxVue+11I=;
 b=FWjkkfq8Ux95yh69sB889zXXuvYBDBCf9htgreaW1/CRWahcCXU4xA1JRP8rke5TnZPFqBqlpLgl/Pgh9wReW0OWLAgRMj4WciWemvYC63d9c4rNIOedyyAn8IdEYNXHOvr7qbQPz3tA254QaS5ZOtBxw6JZqFpJCXwH6vLTFT5gtog+AOtTelXiEUWVq/gVmCjbCktxXSm/meupHqbhUnKHJJ06piWrljhFzvN/Yiy2kop3lyg4Y/Z32wABzZxBIeyyaD2kNkXBJzq1pvhDtLDyG1DbPeaIlMhnbNiLxVWEOLdEANQrfmWafct7ZY3eieonHaxJp9tsCAskihi2Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ippnZIfxt1vmZhspLJuRWkXlbVkIIf4ZaaxVue+11I=;
 b=d9n2C6PVMLoAipnhJH2GWl5T8y1b/73QTHU3MM8m+oAjP+lJtvr6HOHibfwFeiRHgatKGxb14ctBzzkfYf5nhf+JZK8ahv5gMwI9JGMQlG2VEeVMhUnh9Xjs8EQe0aRCRafqAhVFz5llgYWLc9K+ky50q+dLwyeGgwi911OYGUcLKXmfYF8ikoi2B6j7eKdHnB7c2vlM3/QaBg7O2/pVenpY4MmBgXRXnM1914dKEfl+vebBccaxjA5PnwYw5tpAuzy9nX4dFZt7FtqfCIx21mwWfPuBv24m8bPQzZVyv/MUlcRD1Mw4nd7h6//p76sgGwUPIt0dGU3zsLzjfTSzgg==
Received: from SJ0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:a03:33e::24)
 by SACPR12MB048696.namprd12.prod.outlook.com (2603:10b6:806:542::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sun, 22 Nov
 2026 07:34:11 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::a) by SJ0PR03CA0049.outlook.office365.com
 (2603:10b6:a03:33e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sun,
 22 Nov 2026 07:34:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 07:34:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 23:33:55 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sat, 21 Nov 2026 23:33:53 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH 3/3] hwmon: (pmbus/mp2975) Use PMBUS_FORCE_PAGE_CHANGE
Date: Sun, 22 Nov 2026 09:33:22 +0200
Message-ID: <20261122073322.1712843-4-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122073322.1712843-1-fradensky@nvidia.com>
References: <20261122073322.1712843-1-fradensky@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|SACPR12MB048696:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2af846-2dd1-4bfb-7cdb-08df486b0001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|261022105027099003|261022075727099003|11063799006|56012099006|261009223027099003|261021123027099003|10067099003|261102123227099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	D1kXEFU/0br1MT5gsktsc67UT/+4SIi7q/hk7OYx6ctg4F+MaN3zz+YZRP+mpGarm8II7+LD/hdugqKljo2NAFBgmVQT+sQZ6pJas+ANd40LTOFECw+zuAbyIMWEzeBGZFTR92nfpRf9hUeqlKgi4hFGMVSsbTbXDRDLdQO2rcfCNHHpV1NA3vLEXsN3COa/Bnb7W41BBTry89n307IYA5n1Ivn+Zvm1W2UtyUJfWOjhnxs3bLjA9/YUkpqN8USaoH+3aVHXV8yenQ5mOXXPDw4rr9vA5zU/73rL49/K7Ul5l8m+10KuZ99KVzpG3OL5hIYwOMOiYokL/LKThWi85dfTIBVw97q3HoV16DVdmGKEb82UaAof6w9fzltOI2c/12ldopdi/6rnOkTr8cXGXR3lKpb1KZo0sTwVjiVw/O2NXwlYxtKlxh8Ygwvdr3cmdry2OsORRZgyatCVP3avE+VccOAAbL1eWqo+ACHn5ulaP3ZdwBsCspgdCn+3K2laLYbKacGYLqOeTP/CXjBBUzZlQl7qRy08yhcPH9fNROrIN0PVBqEZc/rrTQXqrDEhA0zK1viBE8Wrpu3k33mO7gzFgnfqYu5+hAGfz3XPCU2qcQ3IV/5MYI9LQF1M3lthtVgc3bLoSAFJTDa4DUviuwKHrqaJGvdShTkC2M9K1JV68gJdR9YYawDKJyeh5ool405zgWhuEBfQkfCRjpP4Mw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(261022105027099003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(10067099003)(261102123227099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gdKQ5AYN4nxw5tYueSAQ7OCs2TtUkImAN+x/HdBQwv8mnKPNvGuH86ebrY5wbMpmf2RpUvjHlw+5ynL3FQWhJJMsAQXJyCprEOpO4ZzOXNODguV+wtPsKUUfR/PG8mvbSxY642Hi/zchxWa1LDBClzZzmr/qdA4DAcVcLpVY/HpOEzGFwb/GoJ/6wvnXeWIBixAnCSMB8opQG/kaUrMjU314ZurFan4oLz5vk2iqQdjzqj1+4wr6MaUiZZnwl/FSQyYc4TXWtqygyt5YjEUMz7UgCLyltVAHctEB0wWIZHANTnaXYW4KaFb4ZHre/0nUKl6hrK8RghiwoK67I0cp2vO0Du7HjSfixCdzZ/GlJ0wm4PYbUlSncOqo0hxTB2lP62jvvVrld+N7yD7oxDT6uQdDo3giGEzT90l9cT8nEa8VsmLKMJ7eHCSL4/yHHZLZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 07:34:10.8303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2af846-2dd1-4bfb-7cdb-08df486b0001
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SACPR12MB048696

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

