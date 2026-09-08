Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F78D36493C;
	Tue,  8 Sep 2026 07:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851096; cv=fail; b=BiVgqTpSwrnLE1s8samv0GnYGIG3F7v4KzdAoKVdrOAv8OyWXFiPh+5Ib6zGFHfLBnKD81hg8HDMuwjQLpsNEPhgJ/XOFparpZmk+3lwc9CNL4zE8jZ0Xk1RSqmNavZJDgisA8+/97hupxxjCPqHQEr7dfcFqmVbfg+RV2rG/4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851096; c=relaxed/simple;
	bh=zjoWuQqV8+hz2UFtU85XCbDb0SBHz6IX2UJy/ggDKYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qQZs5VOaW5JnvXBa+OXDoo0jSpxP7J/Xa5W+qEWcerxBOcpFWONwvQ2CA0Fj78uey3khCQ+v8iAaYskWZtjGeo/WZkF0B7Ivdgy3QyOs5Ne6dvJO7yOwtmNoRSSZLGGjP4FL00PJjrvQvtHtb/EuV64vzHYQRhQgXKvnBMjcOGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ArWTaPd2; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ArWTaPd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIelkGGD7aV8BWElN0BYl5RCxmLXRKaGv3mFgi1uNtn7u4U+4GOuekcUgOAReEbMDaJ4I/0uMhmh9UbIAMyWIZTILJUbo1niq4ZdwSeDaIQ2fLCOEStbAOsOQE5KBRD6je/8RPwBISBQkn6plbghafQOhx6SGnawEs4dCyBNKYVGclvtME57Dm1Z84c5TNXprAfkorYahmEXsY4zhOIw1FRwD8UcGeU/lv+xkLmbjOwITv7KQWkPxP+RAuThkdRawTMIZ/hHsSfl/qYX+ufI/jBCDtb/xIi7zzq/KuUtkhAJEHrdBDUA/BD67bNMkjiHRj4Lr52nio8QbJ+KhL91xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CNCbzq1KFcCg5cWZgeXn1gBUufsOJPlCQf/xddfM7c=;
 b=mpHnG3ElLMYZTEtTKmDOYuUd8K5SDOl1SVv7T1XjVOjL/UXO21yOWxdwR6PGOA0xN60+ax5tF9CYvyXrWJJ9Lk3bpwjoiAb33hW7gsSxFXYuucqob+vqDeiTu+fpb5syxACMmgX0syIVDaPKUAdMnJTH+257nWbL0e2KR0xIcEemxs3coYRYkbMFUW1f/o4TMjYakPGiP8dsSgGx77lFE0xd5D6MkjgA2pWa2IGtNpwa4sF2Hmd4Y+T6evlaBYtK/SLiI0dc30qHgOZWURU3f3XSl7tID34WQRuKc0xx87DLxIwULcp9pueZ5S8jHtRt9Ukp2/7Ck8GqvQS7fPAmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CNCbzq1KFcCg5cWZgeXn1gBUufsOJPlCQf/xddfM7c=;
 b=ArWTaPd244wXTWV+zjGF74ybHlKQ58Jlr+rQK+f3z8xY2LhfAGB5BHYw0U6YrS00RHtiQ/NoDwi6z/9kAUDb8sPLz+swE85umE919AyPBevyJsZFbP60wMWBn3uZUw5/PzsJmpHRNRi1/ySh1pUg0ZUOkGaLWShKzJebsgsjd2g=
Received: from CH0PR03CA0221.namprd03.prod.outlook.com (2603:10b6:610:e7::16)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:04:51 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::30) by CH0PR03CA0221.outlook.office365.com
 (2603:10b6:610:e7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 07:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 07:04:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 02:04:49 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 02:04:46 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Tue, 8 Sep 2026 15:04:26 +0800
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260908-add-raa229639-and-raa229640-v2-1-83c75b61139d@gmail.com>
References: <20260908-add-raa229639-and-raa229640-v2-0-83c75b61139d@gmail.com>
In-Reply-To: <20260908-add-raa229639-and-raa229640-v2-0-83c75b61139d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788851077; l=990;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=4j2sSdBQXVJZ6YIuvWNAazGijwYX4gQpDN5CthsWMho=;
 b=oY0tiO1Rt7pkxs+qWxQ8FoMvVs9T91ZSUWhmkQLygUACORlPKXuglUpacyNmUjRJytvjaAadE
 dmnJvASlfarC36h8dbSaS+wMpoQZmbigUwFiR5QfTQk7c50zrXT0muF
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 000591c9-9622-48db-b9e5-08df0d777a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|7416014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/gtuJ3CGKrD67iOaFFXZZPKKhEAanQiA9ye43ZB0lCemSG4+ggHU35zjc8b8PbgHbWn+adUk6rg2y8GXaw84EWilO7zgbDSZ61B3RwTiOSZdd5LGRWkhEXxtPuIYcd1/Dp9BsDF5MDVbWiT3vZJJKMoyP5KWwkWApmjoF4/V/PfVCIr4INP4WBsv/Lm3Fd7qpmCice0/B/tM1GVslZikbxCX06ToZTFXfrZDi1vyRL5hqZuazqdeCpo/nVsBVQPTlVwYqvd+Tla0tIzMg/bW6grWkUZWE0vlgZLLF5rzB63CLYc5CqnyL+rZ3cuQO+8M6I0woNHpEqLFm5RkOfPCCxtE1ZmAl725F2+BtsckLHv68/Ss9JzyHt27ajqcLK//a3J4lXeBJyzx6CLaDucK2HSXP8K0v4/m/o/Mc3VcnBZRssY3k3oDPLW2Ev/9LZW5a4QVzOidSGdQw/BqtyAyD1Mqtzg9QSQ9QRnLgaUX7AAzPZffoWmVHzYjPvpTnAyCv/b6nHQwUZm/ViRcYnWurF4VIIWaEb0gphnntAREc6HEa4w5zJPEBngxmnGvju/CBSWLkkKK0cRWArAVYLEorFKOL+KPnvp2KCW9hFZreieCUFrPKCgjQSceysL+MrNcOCZ2Q7zJ0Z5sxeKtOiN86pyMja148SnrFW69tHXOfhf0Qi0Z2Gv7W9urMUjKQ6HWEDtVYAxuRkeeVDcInLBAJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	09bXTcTuxEv5+bM+Wan3twSexak+o+T/oRHl7PkKTmesJ7JGKmZddpCSN2vFZDqk5Vjno9fJOIXHBVbT4gNlyT/gQMyLqg21D8qo4h/8Hmg97bqjdqAmwzrf9AJ3U6GhPv8/xuayZhiwDQ11Wv+3WCnCNbiaQtt7odoQK0doqUgLMLmEEtLK/1SdFFFgB9ObZeL5Pq8+elt45JYRbM1YLiuz4FiKOYX01K1f1DJLCkpGRa8mqQ65QixgtP7o81QD0PVgJf4Yk/yDAzhvocPedWen8avfXgmbTC0UQkMSGHQbF/ZJZd104G28PoLsd0Ors0iQ+YZSK5eaW97/V/KB7M5nFEiwzj+wmUK/OzIpoC2akI1r3pDmezXPQCndrAuDObQezbUXh2nbiQB/WkK5UJPF1oq4WkebTaHrW2UenO4x1gGEgZeE9XkWeMpsbYov
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:04:51.1001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 000591c9-9622-48db-b9e5-08df0d777a23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824

From: Colin Huang <u8813345@gmail.com>

Add Device Tree compatible strings for Renesas RAA229639 and
RAA229640 PMBus devices.

A fallback compatible is not introduced because the available
documentation does not establish DT-level compatibility with
any existing supported device.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index 8216cdf758d8..3537c7ddfb09 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -60,6 +60,8 @@ properties:
           - renesas,raa229001
           - renesas,raa229004
           - renesas,raa229621
+          - renesas,raa229639
+          - renesas,raa229640
 
       - items:
           - enum:

-- 
2.34.1

