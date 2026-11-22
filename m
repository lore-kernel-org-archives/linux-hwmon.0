Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795332844;
	b=MZVkf3uG5e6k15lRqbpkl6mYkuknZP3xmFKid65qZkzeuf8aiC5XN6uBrKNbUo3d5TJK
	 qkq9HEtXRCV4w6iqBOyqrsbYmzGwPiUoQplULxiyovOpiVxqfV6tfxYrM5vsgK/AmBPfq
	 guNv7ERsVGIb6xjrKpWLlkcDh3zW9eojuSHRxVYjbjmI8ov9OiV9nJ5eXo6OstL9CnEtK
	 ifQuHyPoARS9Sa9sBunY9auLvUpMdFr1X5SqDOnKs/HvMkJo2mLXZ15vdpg3iwBRWZ2FR
	 iTkKBkZaHR9/gJvhthXLRxKvNLa5M2ucI7RJARY3IYLAN+vjnSyeRyy9Xq2b62I8HIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332844;
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
	bh=NVQ6lZo0kYUi56uYQ/rNk5LiC5mQHORc0YCZ1fufdek=;
	b=AWXOncoY4/bu/zCLdCy122Fg5z1vvrekEYlEdUYW7pPTEOmdczW+MO+RuyBjXNhShJWZ
	 MHcog/yrCsvwQMph1tllXaGSHFcE6tz1bM9/Ep2WSg12SQZzddfi6F+fi84VGyRRP7Xtr
	 x2eedQPtkn19u2CrcYlRnqg7D6PyGrkX00kaOMowpvo9n/abcCJNHek7o8Tjfmck4+blN
	 pYoNpMCbJM8anN21+kdNxBmpRykAoQT2xjk6ZSnY4PlzIwPAqvhbEZ0DsletnuH/FPthF
	 a9I9q8FMdH4urWZs1ynWK7qy9DfyoV6XHx9rYO86RNEGxYbPz4oogYtK5SS0O//WfTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PX9dEIaQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.42
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F0606A320;
	Sun, 22 Nov 2026 07:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4F0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PX9dEIaQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDyUUC4I9D9KhgqFL9WB8Bu6lkeIvTCRYSx7s1BnZLE+hNVQeDpwiN2UQJJNxGOHkRF668Qvkgu4GPzPF8htmWNazv1u6w+QzzfuGkwWXWhLQJoEJU+gMVyps93cptuV/ZyCarBKRmW8/Kcd+B6QgGPp0P6kIbk6IgGhW2Z1XCBi+FBHvybKHDf6Pqfuf/MiGZrV1PKkQju2gJ9vt+2bUQ/yYQIO/NFqRQv0Sf3XfTqTHJ1ZTiPnDzkc+ecxNYcV3TkufAmuNEGz4u3L7/9BvleL9qggBFN+1JupD3XPgf1Rcg5jFScoboxr4dPd/IZLlk0T65tOXAaCo3ryQM9YXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVQ6lZo0kYUi56uYQ/rNk5LiC5mQHORc0YCZ1fufdek=;
 b=mHrtJQcFRUVEZBO/r5t+Tfb/i3+KqwQyRhsOL1C4lAQQsssSbkbPZI1SQM9FugpaTYE5qHklfmU1F0FRcFpvDWsbsvz45knGw66qZ99oMCAyoRFFTIjY3Yt8zisMCnmXq+FcGM2YyQ1bmdnJxbaYf0EMxgQyRPXkH0I5uvDZ90arrckZ/cnqyebxCp/SPTm9PGwLFU0Pi2QxuNfknCALDAUgcVaWeUjoI5TAkuKQ4g8Azc3Wa1lj9mkKZBlb3c21q6UrFPU+TEaF9GGIQuohrUo4f5vdqoux+kB02X6+fRE+Ag4NjD3qaJrca+YanewID8Kip3icKZBIK9HCIms3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVQ6lZo0kYUi56uYQ/rNk5LiC5mQHORc0YCZ1fufdek=;
 b=PX9dEIaQ2VBoZ4PIeGytHJGTy7OYfZj7rYCMKKeLcN3OYwxJgQJMXbNBmOX81axQBZMf0hgxhvo3yHvd3Y4QZwIXMqIRyZV4/qRStawt6HrDz7IXvPfkYKzK1BU0Qk36rf+Nf4suXrqQJs+uP4S2LUHLszILvPyLscpuKibA+ddQTOpCPhy/J55culhIBlsdrVHxPipY4aXISocJxPSgsxmKqDycBLuJOdWOqRWLA10YkOdKC4vPbD904pYMQWZjL421K2wzPwxJbT9WdhiWzhMAW1qBR0pGn+nyoDNvOs7Hq1v5F+BJSLyFm4+Tm9C051L4m/dqnyxyMJHA5ilHQQ==
Received: from PH3PEPF000040A7.namprd05.prod.outlook.com (2603:10b6:518:1::49)
 by PH7PR12MB8054.namprd12.prod.outlook.com (2603:10b6:510:27f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 22 Nov
 2026 07:33:59 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2a01:111:f403:c902::8) by PH3PEPF000040A7.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.4 via Frontend Transport; Sun, 22
 Nov 2026 07:33:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 07:33:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 23:33:48 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sat, 21 Nov 2026 23:33:45 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH 1/3] hwmon: (pmbus/core) Invalidate cached page and phase on failed change
Date: Sun, 22 Nov 2026 09:33:20 +0200
Message-ID: <20261122073322.1712843-2-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|PH7PR12MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f0129c-097c-46af-c3e4-08df486af8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|261022105027099003|10067099003|261026140227099003|11063799006|56012099006|261102123227099003|261028144727099003|261021121427099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	RCPZXDfY6cQ3nP8l6Ymy5K4mHPqcVudOu+GsU9B3yW8Jpnp/Y4p8IypW1U7qs82Qe8irmwNT323zuTMM/KXNxOhT1e4Sftf5xLoDPNn0ZBRy1/6zWJtsE8JB48Pz+mSt+4zK/l249g6+szs8p40f5BO/YyPatHvFQ54BKQOO7kWKj+gPAtNVpQV6M9gjqV+Fr2tNI355WEBFUV6x9b3/K8PWHCrgtkM1CzH4cHFYe1gHmekS6GyvBsYdnatdbRdUSq4U/RkhCKRLuEMTKyAZVM9Qvu5mO5VxrGJEdWWjNmztjk7DV3qV1JNg6agSeOwLbOp7VGpol3XSGwEjpMaYPhXi6BEnL2AidwYNl6PRsWfQEOf+e+b4raEOFpWty3ZilAfgPbPbHmkH9v5/jmUYGtUabd23fyw9F8vnOuvpFfSzVnztcZ4OmXUWJPHXXoGl+hyEfKyu9C1+F4di9cRs8SWqKX4rr/KMgwEaMfNkH9jLJkexIOBaDGihStjnxJuLCcdTiuPKnaabsmdnHzqaDu6pirNImEAJ9N1BO2VyRXCcJiyMCWYNJNzNYUOYVkZ3/drrrpWdDk8EBnfXgirK/cB+yC1YiubdmAntkEX3AiVhopvuGBl62FLs1xhHX+Z0MzMtiMFTjB7LVN3PeaZclGR8NruTlQp6FcihzY1PYeMujy204f8S0Aq03IjGtt3Fjr7Dp9h16LHZWMuSJtSsVQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(261022105027099003)(10067099003)(261026140227099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261021121427099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hFGnMy5QtU8RHES8HIaQzPujyCTDmXVkUAO9iEelvz4kYG9EGvpvFmN+opJPlNuCX/q8WaKR9IHCwfvb2q7++iXe8ZCB5zlsoIDqBdep+ojIYnZl9kaamoyUi+nCsShffmJR3BO5S6H0mMKkVVidqqZldV8WhE5iV5SHL36M9lO0D+pJwAN5a2adIDdywM1WMtWEMmeGiJ6enU5VomccVvSb/lQ1yAtTqwphkfuzjaU7soLjZFQcnLYfJw6R35ZmM0C2PZ5ZqMgIAQAZSpY1Ept88nYb1zgw/RBe/QEJVQ9BGRIkgeabUcgGQj2hQ5O9+y5UGZbNzH+LRozY0VGJgzmJ9DuOJ4aMBMQJRtRwWTr7NaoyUn2ZBs9c7fpMudALcL/enDZBm9024oZ/RDrMFR4Rfj8Rr8kw8SiMew/jv7bWoTwBn7GIIa8qWmIl+pxy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 07:33:58.8244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f0129c-097c-46af-c3e4-08df486af8d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8054

pmbus_set_page() writes PAGE, and reads it back to verify the change. If
the write succeeds, while the read-back fails or returns a different
page, it returns an error without updating the cached page. The chip can
then be on the requested page, while the core still caches the previous
one. The next access to the previous page skips the PAGE command, and
accesses the chip on the wrong page, until a different page is
requested.

The same applies to a PAGE or PHASE write which returns an error after
the chip has accepted it, such as on a late NAK, a PEC error or an
adapter timeout.

Invalidate the cached page and phase before changing them, and set them
only once the change succeeded, so that PAGE and PHASE are sent again on
the next access after a failed change.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 82dac2c6c579..dae56e2e6f21 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -227,6 +227,9 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
 	    data->info->pages > 1 && page != data->currpage) {
+		/* A failed page change can leave the chip on any page */
+		data->currpage = -1;
+
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 		pmbus_update_ts(client, PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE);
@@ -246,6 +249,9 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (data->info->phases[page] && data->currphase != phase &&
 	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
+		/* A failed phase change can leave the chip on any phase */
+		data->currphase = -1;
+
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
-- 
2.34.1

