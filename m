Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazhn15012042.outbound.protection.outlook.com [52.102.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88B1A0BF3;
	Fri,  6 Mar 2026 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817420; cv=fail; b=SQET/B/+eMmXBhqgDKrZ1VUkZIvLU4Wji04jheE6WHP7kEGPMAf8TDHbYIr5Wn6YnFiHiRRZNWhJfK4eqDAKXLt/8kFldMhA3bvGFLaXfvEQQXvfbcbuUZ4nmfJt4lp9FtXhBz7fFGolYl9yLd1rAyaunGQh+32YBtvGTp8Fj1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817420; c=relaxed/simple;
	bh=s/9lELoMDUsu4SkAKjkqz76u1klJhPco+VMxHx8RFLQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fLJsGbfsi21UTERCDgUZBEq4l8Q2kxpadW5R+U2OTy6zcem+Ip2NTtEF2WsG8g0PCLUEdmsUq01Kt6TiTMBWywvnJMfrpHw+IS+9v2VIk0fGf32xTIFZBClQccvVVzXPYn4xmpjRKZ20BCggKbOltS0xux5LTk1iQ8CWEN0NfNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vC5tWU1h; arc=fail smtp.client-ip=52.102.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vC5tWU1h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYmxP5oFYbKP6kbw2HoFIGFncn6ttpKCt0/sf5CfmU8t/gsD+0B65BnESfqRXLGBJdSTcj3n7lvz9w28QPM6IZrSc9b1lMGZR9QhcuJq1id/Hbea45Rr0XOzsqC+dvlonRicbNPkyrrOAiRRCiRDstdVEfDBWLpAFKGS5+3rLN27gdjAGRNjVLD4BW6ifE6pnngrg41bFLLqwhzXq6tOdQL2PZXY20XMmWTD5wA0zHj+SxAqW+bWExbxPSEuj01NDiOjQN0uuRsrbeE37psjtVKYQVW1bi2ZOV49bO8qpH4TGf3VNC2vV1i4b+zgD0Cmlt+hrPSbJSLiPQ/rkfB9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebkRgSHrpNvZpCaQ/msFrwJBbw4EcvLmFDi82hOX970=;
 b=JeqvYovZNRgjM7ZIxGcjNRC+RFUsdLzBkBHmhVOZzRKU7rr9MQ86u8oGJnbJGFis2ddG9ZWd8CLoBhGR5sTx38iLdGMkqLjZlgvjVVpQi5+bfa+mC5GsDNsf2yuShTbrpP7aDHuPnFj3lQoCU/jTdHSLUYwzIw8NYZadWFdQufgN4QCTA+nvM7wBAqCnVSxrfvA0s3w9jWGhhcLwdIveIn3goIcXmAPzc25NGmHCrkxT8xFfecgwcPktwHuJKKOeHTVoB8DXXqX+BK+fD6AqfWv05erNw6c2M5bz3f1qNr+nEXLLXVr5i2c0w+onqJHVMYzA7I6fD5ga2hu+JL2QAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebkRgSHrpNvZpCaQ/msFrwJBbw4EcvLmFDi82hOX970=;
 b=vC5tWU1hHhgtDPw8qN2pM4N3faXeKjXExqKc59XTU/ZiJL73kLyfMkLzP/LLJ0JlvFr0bFQ5DjFpDPrPM8XFSfrZxj/RLZfei7fjVtcSKl+RtMuiMw5JYY7eehm2GI4dAjbZK3aNogfRpRuVa5qOMvUKRWwo2+0VJswq+dOQiXA=
Received: from SA9PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:6e::24)
 by DM6PR10MB4379.namprd10.prod.outlook.com (2603:10b6:5:21e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:16:56 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:6e:cafe::7d) by SA9PR11CA0019.outlook.office365.com
 (2603:10b6:806:6e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Fri,
 6 Mar 2026 17:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:16:56 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:55 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:55 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3f491523;
	Fri, 6 Mar 2026 11:16:55 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 02/11] hwmon: (pmbus/ibm-cffps) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:43 -0600
Message-ID: <20260306171652.951274-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260306171652.951274-1-afd@ti.com>
References: <20260306171652.951274-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|DM6PR10MB4379:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9db426-75e3-4b6f-a072-08de7ba42b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|36860700016|7416014|376014|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	c4ut23A7pbW4vmUQixI7V95ELVRmkurW5rQdhL1J9UimHDB/qdDluc+bXTyva+9M068I0QVzvoZW45IeMETkPCTx/fgO0a0ZV9YiVIh+YJ+UXxYnPy1MuxPLCG8KgtF7fpAzFWRTDLXfu6exopYk7SkdEfnMzDdtjI1f8XgOekxvyO495glNBOo4UbRRtTSBhQLuER/kdROrhTS2bR/8XNYJVHNQ7NNyKuU2HbJlLx8khOQgi/bYy5nj2EToiRnpvozf67hnjPq5te/+7117JHom4xpIVFhUjXN5cFf6jwEUpu1q4rc55ny7pmcydEF+k21gvektlTaf6mAG6bszgo7tRg8rjaKuUDPXjqtJzujuNlIE//xpQOm8ELPNcQf37crut+fEXTR53BCeQf2NO4U5Sk/IiROgEUyYxid8cV78ISt3R+2WbdKZYDqKQGZUSr9arze2AllFRpYGYp+vO0wH/J7O4fzPx0BmNQhmbWmjiV6JfbXE5nGux4FSJ4nyHrYqpFhJDh3FBQeHu85RhEKVDFwyaKLme1yFLAHLuyxQXUWCduSPxYnHTtIe47KaVMRHDxVEYR1Aa/G9B4X8FVj0m4mdkiX7QAaDzlUKKNK0wIBre5Yba8YlBnV80nXJgrUYeW8bvYiiTrGp00FOVEqHqRvko3Rl4XsVfcnwReIq9anI+kFqKb0Xno9xqNZt7G/NDUnM/b5Q4onSqknn/Fhzv/RTMq5DZogFOkALYvuATctJ2AfNf7+Wne3ZjGMga9Z8c/cJ4UWUuSsmwgIzEg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700016)(7416014)(376014)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Akt1QzGMV8N3yX81YuxtdWAEd5Fx05LW08a25PJ9omDxRdVFMh+i9g9JIlxA0GYD7yOdKqHWEiLgiMSI+h0bSAROEf5Z0siZA6bEF2H7svjn8c+yPAkH5s5BerrdKbxh/diWacAZNJzgU8dJ5KX3B+PXnR7OrpB7h39VLAr02CqphK7wRD4OokJ2lAovRpCGITP8qk2DrMY4alHoOil8M/I0ZH8RKMhGbfx/zbXpIN16Y0VXIEcgG0LqiiQY1AJfIGpF06LFyK8gUF3oYHAHp3Rc669TcYlXJNPkKViZvMjK8pNA857aLPuzG38FOC6n0J/57RDtbXSxiUeYpLndoNYxnvyA1g1Nn2zZIHeXqVgNvEFZ/w6GQ7AB0bEXrBXavi9JzWLuW3VYAxpBcFqBZBxO4Fd2RTJtqlH0g2ORiOtQA3ohfPRqKJHe0OCFIkpo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:16:56.2787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9db426-75e3-4b6f-a072-08de7ba42b3e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4379

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has another benefit:
 * It also checks for device match data, which allows for OF based
   probing. That means we do not have to manually check those first
   and can remove that check.

As i2c_get_match_data() return NULL/0 on failure which also matches
the enum for "cffps1", switch around the enum order so cffps_unknown
is index 0 and existing behavior is preserved.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index d05ef7a968a96..6c7256d997f46 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -58,7 +58,7 @@ enum {
 	CFFPS_DEBUGFS_NUM_ENTRIES
 };
 
-enum versions { cffps1, cffps2, cffps_unknown };
+enum versions { cffps_unknown, cffps1, cffps2 };
 
 struct ibm_cffps {
 	enum versions version;
@@ -482,19 +482,9 @@ MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
 static int ibm_cffps_probe(struct i2c_client *client)
 {
 	int i, rc;
-	enum versions vs = cffps_unknown;
+	enum versions vs = (uintptr_t)i2c_get_match_data(client);
 	struct dentry *debugfs;
 	struct ibm_cffps *psu;
-	const void *md = of_device_get_match_data(&client->dev);
-	const struct i2c_device_id *id;
-
-	if (md) {
-		vs = (uintptr_t)md;
-	} else {
-		id = i2c_match_id(ibm_cffps_id, client);
-		if (id)
-			vs = (enum versions)id->driver_data;
-	}
 
 	if (vs == cffps_unknown) {
 		u16 ccin_revision = 0;
@@ -534,7 +524,7 @@ static int ibm_cffps_probe(struct i2c_client *client)
 		}
 
 		/* Set the client name to include the version number. */
-		snprintf(client->name, I2C_NAME_SIZE, "cffps%d", vs + 1);
+		snprintf(client->name, I2C_NAME_SIZE, "cffps%d", vs);
 	}
 
 	client->dev.platform_data = &ibm_cffps_pdata;
-- 
2.39.2

