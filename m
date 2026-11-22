Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795332851;
	b=BEwOO3SZlR1Cx5XmEl/U550cqGEH6XUAnF6uukCXuOIquPiqtj14Cpb5eGWJhb25C5l3
	 PC3qWqxVzcHgSWStJmBbvWNfiLVpvqq5RZEwYmnHE8oJwxuVFUkf2cwCcmLOyWZqhSLmK
	 nV+um2FMZmrlcnvhZqnCd84PAkTstds+IWMgU033SVEwHqMGOK9CPaMJpLKiNW+CrioUu
	 4AlFQ6b12x84Kq4gXaC9SCulwHM/E4WU+J3Ed8qO8cQduXtNXygTUY2yBOxC7okaJYG2m
	 5/Uw4NW8wxuA/2AOLCjv5pwvCyNgiJglbQi9b6eAo9SF97Psj5CWQqN2b1Em8/N6szw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332851;
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
	bh=Jwkys3gm0hJRpdKV0fgohlK5GQh0L/Bd6a4RFK1Rw8M=;
	b=Oe3+iZqki0QXfW4tmUM9FFRiMqjlhUAqAIaJtyQRB9SljbLOx50JriyYBNE0Xzj5Nx7o
	 jGb0iLxkTb0iulrFKJ+EQqgQQlOJJb/LGSeh9Gf/08cYmwZEOk0S6QLcTVLkmfHvyMMjV
	 7RsCUyBHRnTgu3Lz6KGUJbM7MDi+1Hrv+BunmIH6qrbbEpWRNjngDG5yMQDBG6lM3Dw/a
	 N3FOQ5ksl70NkMngQlLq8enUgHKkwYGDulWQEYs1gQ4iCv/4/XzFaXJi7eps1+MMbre1C
	 Goy5VD6SAlJWSta/YK1qY7kT8pGQJGxWzU04S5qElKVrLzY1W27Vmt4Bw2XkcLsfNjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A3RJBASu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.16
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF51606A320;
	Sun, 22 Nov 2026 07:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF51606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A3RJBASu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5V9BclW6lpANpdbtHcKCOu3N0eUkGMCtlvdl3NGd1HDFr0jOWDFJnq8+NSo0xR9JiDeMvkLEFkdmZgxDoYZs8tXnuGxZLg2jI+iEm4xg/0NV8BPJah180dXmWCDxOz/lycZrGGazXEvvTz6nIDM6mcY0bftdK9KWnjLp8sk6lcOKnSoMBmuO3NuhaUSQGowuI0cmTLV2OoMRruuuxLU+cPSXFaoVksRQAD7A/t7rVdKnzqWjdN1o1Nq91JzGKe+vLbh3zq/ULJg1SClwve01+wyNys/dSYTh2dKnrqES1/gRK4mwso1VqiCghamsD4LaH+zQGyhpmBWuI8ZxjlRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jwkys3gm0hJRpdKV0fgohlK5GQh0L/Bd6a4RFK1Rw8M=;
 b=LvQ+Ht0Pfa0HL1NQphijq3o6G1XrZRWYKqS14qQlZy/fBpqGc8zeubW4P8NAuzEzaPwK0QCmBUVn1SHx/bZ6iFUK0Q8ZxK288ePGeQvoNmn6/dJHqZoJNhvIVgOrEUCf3vSwkG9TyIAuHecEWZO+e+AdrRM0OAr2a3Q0pOyZf1Xp4EjWOF7LPydOn3foLGS1Xj5kQhApM4ur4At6yK/sG6v3tIlM0121RwBwzjD2S1QaNDhiCtsjlObqwZZ2s63v6TUUzmXzw13/2VbmCJmd0WBpz/GIU+JvctFjseIz+AT0MX8fhnZO3zrl97YmZweCuDV27UQQyM3KHxtjZ4Re1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jwkys3gm0hJRpdKV0fgohlK5GQh0L/Bd6a4RFK1Rw8M=;
 b=A3RJBASuSTg92TPlhy17QUaUBK0db9GcYUgZCQPoPC4cmyzDmH9LqBk13ppQ8y0/t3/m3kEHeZ7QRr0MXFsGwmcsUXTk56gmLULihAOwMkQCJN9KFLZxX0Ri+/+Bbh0iDAeKIkNz0LUZXx94mTAzgCIH1vYrJiNbf+Y1idD1RJvl8hV2W7MLAp7PwTfh/LcLWYNsfhE2mXvOay5bcBgND+0CN60qWECdGSjgLgdFmXj74880S/3fiRlqy2vIhI+El0bXoBNg8+M4A4M+JNXlX2QmajcnnCjlFVF4R3eE2Lh5UgbGdkOOatGgc3uhV3Eru+wftJqt1JP5cUBB/80o4w==
Received: from CH0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:610:b3::11)
 by IA1PR12MB8077.namprd12.prod.outlook.com (2603:10b6:208:3f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 07:34:07 +0000
Received: from BN3PEPF00022BC8.namprd05.prod.outlook.com
 (2603:10b6:610:b3:cafe::4a) by CH0PR03CA0036.outlook.office365.com
 (2603:10b6:610:b3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 07:34:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF00022BC8.mail.protection.outlook.com (10.167.248.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 07:34:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 23:33:51 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sat, 21 Nov 2026 23:33:49 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH 2/3] hwmon: (pmbus/core) Add PMBUS_FORCE_PAGE_CHANGE flag
Date: Sun, 22 Nov 2026 09:33:21 +0200
Message-ID: <20261122073322.1712843-3-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC8:EE_|IA1PR12MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: af0179a8-2de3-4e19-e969-08df486afda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ruIdwcosqkLZzZJJzeHdIKEDYSASDfOn/+Y8yCNHvmHDUk/fL1PqLF8juQDgj4GIwLAd0KlN2jaOc8nC+xNZQdsF5jOjGcVsjc4oZiMkFiAgH7zFHelvYHX3vfIAGhQbuqIFZAgbcq5d9sJ1JLdvzBu5qChqYbntjqXqyKhwzuI9aD4xtHTLaxh3B3ZwXBRoQGaeJGEYnRU0wzbc5Pr7w3LGfwmN1GF2sdqFXeisFGWt3LOOm6M/sSBDUStlNE3BK6a1ZJ4lWQU33OcCfTMYMj53jM0Pb8RFIxWrhnV2OQiRIMm5jj1lWT1cbKySlRALfV9W5DWQH8AjY7Ye5dx8fvz9+CoqVK+d69+quN/ItgjMt7+d9mRRcClngtPsj12OQ2Tf8EmStRMo3ukW0twJ6/uhQB2kwRJ+Nl+yKu+DD9RQYt3LOJOp8J0n8LKfW7niqwDivh6JkcNJc/ZYzx8H9QTjo6LtQK7jwh/E9c9Fu5EnTtuhF4ylGJBM3GiP283J7GZnQ0lBfOLJduCt2ssNAUtllEYZnduXYIXHnzA/iyLwsXkiie9Snd68vU0xJ6BOtTOIavu1m5DOwvSr4Q2YvfrkkovHQ8QZCtmzJxYYKnj92FQ8CcZTw+ySRqleqTUxC93lqk8BrE87MIGPNxyDNOxG0lMckGGQrkWTNa7nX3aUEolsKkTtPtPcRKCgvw2Apk5HB/qBIhOT5Y0XBGwjxA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LuBIWl052iQwTWliFAmgjLXS7EU/sRwO+c8GLcW1RGEYMjRcmujHZDbNLvYJjjgRZypXtWxRsiLZ089b+Cx0W1H7qLZASvgZWlTs6U+C+I0Zq5Kr8RevTVNEAq4I45t2aOj8CVqSJ2Qdix7hVkT/M04q8fcNX8e18rDwAp2tGKf1Q4M+o2el3hPm3mC2mRTWKoALifbvfSBJ1Mdxg9kewZUQtBa7lvRvZNv+6r/QyAZQ3cxMl6yuk3D9KIsb+1ddISM0Y7mFRKNgDzaZprCK1oohq7tB1hhaHNaRTr3S2seGP0Yj9Kmz16IdlFy4QI1TKAPOOmDsRDb2SiHrpEThlgg5OPaUTN+FccSY8gXIvTTheNFNTfsONuvYJrys7uwnU9idImfxH03KqdNbp48KECAZhs6zqk68wXskZYJek3xLzyPVjOayR9ebqgKrkmSY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 07:34:06.7343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af0179a8-2de3-4e19-e969-08df486afda3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8077

The PMBus core driver only changes the page of chips with more than one
page, and neither writes nor verifies the page of a chip with a single
page. Some chips with a single page provide manufacturer specific
registers on additional pages. Their drivers write PAGE directly to
access them, and have to change back to the page the core expects on
their own. If changing back fails, the core accesses the chip on the
wrong page.

Add the PMBUS_FORCE_PAGE_CHANGE flag, which makes pmbus_set_page()
change the page of a chip with a single page as well, so that its driver
can access the additional pages with pmbus_set_page(). The page change
is then read back, and a failed page change is repeated on the next
access, as for chips with multiple pages.

While at it, drop the outdated number of flags from the platform data
description in the documentation.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 Documentation/hwmon/pmbus-core.rst | 12 +++++++++++-
 drivers/hwmon/pmbus/pmbus_core.c   |  3 ++-
 include/linux/pmbus.h              | 11 +++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/pmbus-core.rst b/Documentation/hwmon/pmbus-core.rst
index fdfb23773148..bca387518b6a 100644
--- a/Documentation/hwmon/pmbus-core.rst
+++ b/Documentation/hwmon/pmbus-core.rst
@@ -298,7 +298,7 @@ PMBus driver platform data
 ==========================
 
 PMBus platform data is defined in include/linux/pmbus.h. Platform data
-currently provides a flags field with four bits used::
+currently provides a flags field with the following bits::
 
 	#define PMBUS_SKIP_STATUS_CHECK			BIT(0)
 
@@ -316,6 +316,8 @@ currently provides a flags field with four bits used::
 
 	#define PMBUS_VOUT_PROTECTED			BIT(7)
 
+	#define PMBUS_FORCE_PAGE_CHANGE			BIT(8)
+
 	struct pmbus_platform_data {
 		u32 flags;              /* Device specific flags */
 
@@ -388,6 +390,14 @@ PMBUS_VOUT_PROTECTED
 Set if the chip VOUT_COMMAND command is protected and protection is not
 determined by the standard WRITE_PROTECT command.
 
+PMBUS_FORCE_PAGE_CHANGE
+
+The PMBus core driver only changes the page of chips with more than one
+page. Some chips with a single page provide manufacturer specific registers
+on additional pages. Set this flag so that the PMBus core driver changes the
+page of such chips as well, which lets the chip driver access the additional
+pages with pmbus_set_page().
+
 Module parameter
 ----------------
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index dae56e2e6f21..822a092984c7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -226,7 +226,8 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		return 0;
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
-	    data->info->pages > 1 && page != data->currpage) {
+	    (data->info->pages > 1 || (data->flags & PMBUS_FORCE_PAGE_CHANGE)) &&
+	    page != data->currpage) {
 		/* A failed page change can leave the chip on any page */
 		data->currpage = -1;
 
diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index 884040e1383b..b3bc4cced461 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -87,6 +87,17 @@
  */
 #define PMBUS_VOUT_PROTECTED			BIT(7)
 
+/*
+ * PMBUS_FORCE_PAGE_CHANGE
+ *
+ * The PMBus core driver only changes the page of chips with more than one
+ * page. Some chips with a single page provide manufacturer specific registers
+ * on additional pages. Set this flag so that the PMBus core driver changes the
+ * page of such chips as well, which lets the chip driver access the additional
+ * pages with pmbus_set_page().
+ */
+#define PMBUS_FORCE_PAGE_CHANGE			BIT(8)
+
 struct pmbus_platform_data {
 	u32 flags;		/* Device specific flags */
 
-- 
2.34.1

