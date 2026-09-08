Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C23403EF;
	Tue,  8 Sep 2026 07:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851093; cv=fail; b=Wxec2G5v12IkTAplsjcvlT3oTrOmT2pa+GI3mJBGD30Ym6Txw+QeAVhIPTmpD/hz7IeGNEE69KkuMCNi3uF2Ql62/7EFet7bqAaNuwmm8KnSKtiXlIIN1lDfDeIUMOgTCShJISFOrPHbJxlBIHTfqR/oiWO6JtStm7S0GFPROkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851093; c=relaxed/simple;
	bh=m0u7esIiYsmAcg279dN+FLAfWTu2Gag7JZYV+5ZbbbM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=TmNyqjKlVuCd9z7iQTc5ZG3lGVwgHhKQjHqLVW44Tdi9nnEfqs6SIyrli0Ob4sCNiUDdY/gjJg6ayBIDqn9QAzHKWJhsWDTYbtePnhYWMY//lN5LIr/5g8/9IBNh2vac8Pvl23z22hDpmY38CN4nX2k9QdLBK4neBtx/2yKLMT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z5yhXMLy; arc=fail smtp.client-ip=40.93.196.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z5yhXMLy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQPkxB6aCFtXXi4Z0tBrwax8EpSr6HAwtFYJJzQBHOY3F4NJAtdpUeEWEcZaJtTZHWCdK6/wg7R5N06IIo4gTPPQUUSlhbRzFsHLYKAB5AQ9sbmrDv2k6Yl3zFKu8HIdou5FPXVm8XUElwK4HDfUqlBhZz7QNTy4fqne3oCOYgklqh9pLvCigdp+nZuQooLYAlgdShOiS7kCtkv1oQnyX0x2wr2SeaWq2+VQ9KempDWEvmuXObu9MKvpOxUgpcn648WhOgelofXF3Yns7KjzguX+oW4YfXqZDgkvTjyYB6FdK7yY0kCjLyf7N6QJ1kJpGyhz6EWISFqwpEHiGIR3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGHX3PRvxZizD9mx1L3WVn0EFcPFMinXs3FaZVriyLw=;
 b=NmsGymPlLs7ZQ24uG3P5sIHojlpupe0GRe1+/hKkszfB09fJD61GOpS/Z9a5cxA3aTBOavz3kN+fpGYCMBfFdKwUy+fr6j7HtsO+xO3vludPhFhQJFjLxm2/oIJz0EWAQrHq0vMaO2hhiML4s+C86cjDOx4R2iqLHpN95e4UjQWdFT7fHX0UxA3kZtVGSMl8OxsRcQAMWGzMX3c7BudVEF/0eJBzMtUrGefYFDiRjTQcHQ2PX8jBuH1ROAg2anLgZG9ZitBPVyCMzJ0KBahkQLtspMJATXJhkMKoLUTPIWZ9W+IR0FboVIFJVPRVzsOAw4OhEDdaz1jMRN/aTVHZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGHX3PRvxZizD9mx1L3WVn0EFcPFMinXs3FaZVriyLw=;
 b=z5yhXMLysy9hirhePCzPT0JWpIYzaINSkCeR26GV2BaqsDyWS7AxemnY1PXnsK4lHDFka81ug4pbuEEBYx+tFJPu6EKxSBB7RD2scohwYeE7BgovM8ezDDDZBTx+4BbmsusknCW5FyyIaVqo4HsfAWuC93O99yuInDki9+lrR5o=
Received: from CH2PR07CA0047.namprd07.prod.outlook.com (2603:10b6:610:5b::21)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 07:04:46 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::57) by CH2PR07CA0047.outlook.office365.com
 (2603:10b6:610:5b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 07:04:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 07:04:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 02:04:46 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 02:04:43 -0500
From: Colin Huang <colin.huang2@amd.com>
Subject: [PATCH v2 0/2] Support RAA229639 and RAA229640
Date: Tue, 8 Sep 2026 15:04:25 +0800
Message-ID: <20260908-add-raa229639-and-raa229640-v2-0-83c75b61139d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHmzn2oC/33NywrCMBCF4Vcps3YkGbVNXfke0sWYSztgLyRSl
 NJ3NxZ06fI7i/8skHwUn+BcLBD9LEnGIYN2BdiOh9ajuGwgRaWqFSE7h5GZqC4PNfLw01GhrSi
 wJu2CIciFKfogz61+bbI7SY8xvrazWX/Wb7f62501KjShIm3sjc3JXdqe5b63Yw/Nuq5vJbxzC
 cYAAAA=
X-Change-ID: 20260902-add-raa229639-and-raa229640-c72fa121df82
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788851077; l=857;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=m0u7esIiYsmAcg279dN+FLAfWTu2Gag7JZYV+5ZbbbM=;
 b=AaR1zQV9B3ZNuGfKbfM2gj1MYjS8i+OIlUSIKqchwDELkv1E5vlSmkJ4+B3Nvs7ZiH0GHxatk
 XwvcogaayrfBUcPhln1vCGemoEB8tudJnY+14LJkDHHa9JAXqWX8yj4
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: b1eebee1-215c-49ad-4b5a-08df0d777755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|1800799024|36860700016|10067099003|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	EZt9YGKATT9lz7Bs+m5VDf4CM+ZL2EmS4NB6a2MI8DT3yKOnUSEXD43m0iBnzFWvXJd1IjGTL4h39DMfXyGCCRM/1CfwAdLgHgc0CA2S3T0A8EbM6m3h1eaoyupQslSFflDUIFADga3CYhJ3rafoNPzd3WgI0iTUS8PyF1A7Ku5TLDgu6tKeIE0r2BvNNhVJTUxi2G+3VkcngDYaUSBuZCxsZhLB6xQM48/h/XxE5+OKjD3Iy4xTYC1vkBe8sQ49vC+n5gP7yn+wEfriM/mCo74R40INWw4Mt9F3SLKL9Rjud1ECKsmjjrVRxOX+nT9JbKjYH6Qe29wAhjUCrKIc0SpGTyCAgY+3pjT4tKT8dSaYet3Is12kLueAzNdwNm6rU1DokoUPyg7TyLRo2aTMEd6lfs8RYgArKv+Tw+VSrXjxJRwm6nJdl6MBENixT0XjNnsfN+etoVdIMSSETvYKjUdMWqgOYIhIRE6LhZ4aZ7bkTLLLHqHAsNONj9a7TKyvvjCKpWxPrU4z1kLUjs/m973NViqrPf8EOIFyUG+dfZjL/50T79KjBqSN9CSZlX1jZOmFtKfZOw74onB5PmQsLtR8ufVZ8m3V9bjPaqsZzTzXm5lJ6QW9ObASYyQOXI3hKwGe67GhLPipcMlD6joS/5e0iCkplaJL9PPnpuUib7oW8kIcWvn2QY4n2UQ7edrw7XXvyjhWa2QpHpF6FPUBNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(1800799024)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XrkL8SKn0lXHMzotQCO6NVVhC2EBi3ye9jm7y9kBh4GsLnupDniwhfAA0lHFqaBR/ioBaSG6KEsVQw1tMHEUEj/B0ZFSUDV+62lR/Nm16jAi98GefGkoQDOdBVgXraWDIfi38l74W1HoK9lofLmJ6Tz7fASRP6mVCqjkOXJIVdXj9XnwCbZbjX3tco71M6NC9yb053bgkjCYN0GhBf8YurIhgWWAE66vd5Dxm0D5IR4Bt/ObYo7IVU1S5wpYSrrqewNfx2K1Oikc05+b/rsbcucNXaRp0HMB5yeatW5qUACL4URoaa5RBxuLbBICSNZJLu03/x54nvr1oUV6vx0Xes5FzZBmEHexFDrT17+1kElYPGLgvzqK+XExo3Vr0aGbgFtvUnOdrDIjcB3DjpBajfG/4UbhRKbrdSZofVyq16FLASz9SWo011iZvER79E6a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:04:46.3912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eebee1-215c-49ad-4b5a-08df0d777755
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v2:
- Clarify why fallback compatibles are not added in the DT binding.
- Reword driver commit message to avoid implying DT-level compatibility.
- Link to v1: https://lore.kernel.org/r/20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com

---
Colin Huang (2):
      dt-bindings: hwmon: pmbus: isl68137: Add Renesas RAA229639 and RAA229640
      hwmon: (pmbus/isl68137): Add Renesas RAA229639 and RAA229640

 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
 drivers/hwmon/pmbus/isl68137.c                                   | 4 ++++
 2 files changed, 6 insertions(+)
---
base-commit: e18bc3c9ca90f7c5165c717e9338d687b71931df
change-id: 20260902-add-raa229639-and-raa229640-c72fa121df82

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

