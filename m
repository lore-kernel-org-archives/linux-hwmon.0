Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1243B7763;
	Mon, 22 Jun 2026 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136756; cv=fail; b=gDIFaXwwAQGnDsZ7PZ/eRrrq0ypVHmHQPZu+1pLfStHbCxm0bQR3i+xBlrna+GD/+IrEDfNsKhdjc0HHFQjxaXGCxLtEo61BFh13X/XB1DMrWxUTXA7uEOD7EKQoIc1kBwkebMnHlDbGSrVB6cWrFmEkTRcO3BZVCRbaEZvIK4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136756; c=relaxed/simple;
	bh=ZIu6/Kv52RFBtwoEYeOK0QFipJaTw/BORXYCtOrBrLc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwwgsxpJoGL2OVZ9rldmdkXhSkvjaDHyYDdxhsSHC2j15OjL4pNyqCNbtJazcNKvESLzDPjMudoAg6w09/YecqFnbZXA25ldym6Am/Z1y8t/+zsc15jxL8P0/asKeLTReE3qNzXhjD+nA3XA8OcZt6k6mWEj+MobI7XP73sWbso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QLVwbWNQ; arc=fail smtp.client-ip=40.93.198.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QLVwbWNQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8LS2AaqTBudonN9oZcp0wT52+HVdQ+HY3eEs3lXMyB33XsII+Xtrj4qUy0qSXXHj3CoYP9p7Arixx1SyyxHuEqhLKzdpGf9xdGYlwqRYFgM6I32mZe8RCRYdMC82tQQ/gN5jb8AooksJktgUL1GNQnvBQ167bHT+dNKuglufxzrcAPkAOfgbZIgaYUh5I3xBGygeAEM4XfcfZBW2fzg1LmFcIHbdxu3Vb8aPdTZ3+iKaI5HbmI3bMl1kQaT80WSdHaTs6AATCfedz5P3v+SeG/YLiby6umVLYNuIrCIOqSlLQ7WDkUabuDil9cnbPw2xoPHltAmqoS996gzFLL3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0/8Fy1ZoZAvFJfaz1DxJ27z7B+GvvpK1yC6StVJGHc=;
 b=bKn0oktUE8fYgQW7B9cIZ9Q95id1QMkN4C9nDfL3wKjlUwpKDg4m/9d4KBzHQXm43HJozISvE0nqlnv/U922F8ETGdAP4omo2co85aqYamdMo3FHYEHzHtYqRyPaniOlp/mhC5ZCyCGDBu4B58YP86fHX44K0tsI4TU0eNlIKkTTS7rTvgZrR7I1djn1udJcGQGTUVswRdvKvviW1/gPibullhcds9MfwtsAbva9ynsDRMSsFMAte13OUxhc6BwSjqDzyL8JZs50wtg0dhUHs6o2DQIwtdUM9i+sMGgvwVewfv2bbBZDMN3/zJEGY4/6EpdJc8UxnStqC74wz4FKRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0/8Fy1ZoZAvFJfaz1DxJ27z7B+GvvpK1yC6StVJGHc=;
 b=QLVwbWNQCRP/1vgYtupg3D6Dgz2t4XMrD72cS6SZE2R7Wtrf3L+MHRuI2mbgR/D+TefYb1u1OFs2Q03NHzsq6ChamxH1dn3IsO/sEgiclSYN4ybV0Hip99/9FBv4LecbNVe/EKdowmrYAlaemcztHmpHxJM8Z1J622V5/uBKDHM=
Received: from MW4P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::18)
 by SAWPR12MB999117.namprd12.prod.outlook.com (2603:10b6:806:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 13:59:12 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::2c) by MW4P220CA0013.outlook.office365.com
 (2603:10b6:303:115::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 22 Jun 2026 13:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 13:59:11 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:59:08 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 7/8] hwmon: Add mutex protecting for sbtsi read/write through hwmon
Date: Mon, 22 Jun 2026 19:28:20 +0530
Message-ID: <20260622135821.2190260-8-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|SAWPR12MB999117:EE_
X-MS-Office365-Filtering-Correlation-Id: da866e58-d828-4947-4e7b-08ded0666fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	kDUDVjopzV9ZGXaBMP0KDMbAOjJ6l2K6AHJ8EqtJftFdbPAUq1oXFWsgBPR0yDJ+dJ8GmaN7L5463wvzeDqTHdltPUloa05h+V1vt+gOAkyDXaBRZeKYyEXTNjXbO7d4KqGGKgWMTrTXXXW0eMJrnccXM4RfNZ8kmj5ugRbIGWJNvgEuWfzKn5ViONCBUITgm6+4X84tiCZ6FFrvVg5Z0oWSAw4bBblK2Sc7PiEkFzFeNbUTico8S52VYxalJHmG9/btHJRXmKkdaYtXRS7OhwZXn6arSx7bZpw+yC4k9ZSbqvzKU7pDZP5RtwmGiAA1sFKzrfJIQRJ9E6JDJQ8L2zwY/W+71dlM/+lvFBc/Oe2Oc44mm3XfETU2VbF4AMje+Su9jHz8ZzNNosKtyuuMMhACpEt0Y9b/5jtzlNezjtz4CBuzAQ/1x/r1eadJlfP6BrNC5wRvG6kj+QMMU8e5HSW4efyewMb9azqYQJiIw1CREBnfRB6RIck0Sw/5QJLYeZsFLrZUOnWe294OgwqGKZq8fX5Eci9c1y6nLfolSaZVQWi5m/vadUjHwe30wh7CwLENtcOZFZgIE9jcBpIOEk0D50hzKAdqoBYz4VhikSVhuwW+HkiVyOxWElVq24//hUWewLT4a4AuiUEuSfRK+wQyLKWpY6V+2XCML4U2ZjJ8cViAD02fEUBGCimTc93x2jDBGeD2ZBQAgsADU0Dqrw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iGJ/c4PiNnW60t1CnKxaFTQOj76G40OVY0iM6gyiu1d/qC9/pyrsBhY02BcY6YhaM7METII2Lb9CE22wkfnGzYscJEqQYSwuzMC46gXz4I3qG3GtmGJKoZAjAQnzpFCHt18J1Zqyi+3MBh6oCwBFNzs9oEBnuceF6vrIX/wW4KaaIKXEWXcCHzMM8GnTt67PwWk5KIrSrWss4gWZQqsekC35PphNp6hulOXVx25Qbub3c6q5yF5bgIfXpS7rmeIl4X2ghGW+RAEW9t7rWbdM0g6WawIeNmLbTx7xoFszPO/+fmTXXP6LNV5C6DMMLoUAE5sN0g8CNzM7xc98BCZKK7jaxXR6zfLD4lbxVqPzCUrrYJfVefxC9iWtaIjhl4EblhPvc1DmAnsFN4YmcaqMsYtjnT090eIx5mcS52FQ0a6iYJPo8yACZg+qEF2AMvZp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:59:11.5565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da866e58-d828-4947-4e7b-08ded0666fef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999117

From: Prathima <Prathima.Lk@amd.com>

Add a mutex and take it around SBTSI read/write paths so that only
one transaction runs at a time. The lock is held only for the
duration of the bus transfer and associated driver bookkeeping, not
across blocking work unrelated to SBTSI.

This is a concurrency hardening fix.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v2:
- New patch

 drivers/hwmon/sbtsi_temp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index d7ae986d824c..11c8108d69b2 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -70,6 +70,7 @@ static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
 {
 	int ret;
 
+	guard(sbtsi)(data);
 	ret = sbtsi_xfer(data, reg1, val1, true);
 	if (!ret)
 		ret = sbtsi_xfer(data, reg2, val2, true);
@@ -84,6 +85,7 @@ static int sbtsi_temp_write(struct sbtsi_data *data, u8 reg_int, u8 reg_dec,
 {
 	int ret;
 
+	guard(sbtsi)(data);
 	ret = sbtsi_xfer(data, reg_int, &val_int, false);
 	if (!ret)
 		ret = sbtsi_xfer(data, reg_dec, &val_dec, false);
-- 
2.34.1

