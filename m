Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01C2C027C;
	Tue,  8 Sep 2026 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851098; cv=fail; b=lNyItoE0QtpXSn2euIie5Ww9zJhLg/qNkaC3rhKLTC6G471FzaWOqsTqt7RoWSiOo9RbJCOkpFPuHWJdOwerZLPA1Z97j3+q+gL0S1jWYPVZBG8umEM8uaCmHTI5Hik85jMhSCjPdU2jWTENd5d1NxkZ5WmUznhkpV8aj4EPZKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851098; c=relaxed/simple;
	bh=7joaTSGpIw8JUAYzJv3ieOaIXzgi5LtUyIgjFlVcjww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GaZAs5GSvfNbkNpfJ7zQyvSYIM2C85y7yaz7wGAYp5yXCrHE0ow+zarZiyyMN0efd7/Wd+LrIDpwXlLt4P9wl3507Lhvm29sRm168pIkgNcNQWBJrn072gp20lCDWZK5+GFjySmQB51KLJiEskLvzVvIjpMZJfcZ292kNGnBMWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sALOFnvW; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sALOFnvW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw5sapwQx/5KmkUVy51OebaOYMPZxd8z49x7siy1yxl/cUj6U1pvy58bH3RLlNFK9cvqZjaGX4OPkZdizl8qvdltwbMCyorxucZGk4Tx76uB8D3SC0wOIPMXurDl+X5eilDpFBXS33+H62+jX4f6mEGcU7wUzEk7Lw1EKnehVtr+GvRRZlXg614KW/v7viWgZ2KBO8T7hLI3nxV7AfqjA1YvJCBsND1NPS5FwM8VUMMYckOHoacqyzvFcNfnx3aAY/py1GAcIk6YsIXz+TyJuPt+hrkJzU/UmltS5CFtyS2/B1Ig4CDNrgvXxL/4U6znIe/Z7aSDb9qWqCiyUGebCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10s+Ci3Xd0oDkO34aVox1mWLuAGdsC/6vb36FRjXzzg=;
 b=wtUTp5qgD1y3dgPQffIGRUVZdDPgn5NawPcCNdIPh1vz56GUQw2hAkpx29H3jLetHeMOGOxaGc9zDsj612NIjLbIDuAdp6H/qLNl02M6p1iQcqYw4q+0N/2L4GgkcOpBWSZYbJAWa6GTe/12+3r4cdbdTwqmZYAaNwXnUwzqnmeOb7X7vDD11WDpkX52/YYZQTYTLtIQAh/r6U0olG8vdljMFax8NMs2SWIOJqp36o8yzgrPu2I2qLYQTlQA1sDoHL1bCB9AbyHYPIPnQbw9EBmHC3PH8jLypaZyMlAfqUmW18sUJr8jiJnnJ5M9Xmp7HDL56Dc33aorOI23ANqMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10s+Ci3Xd0oDkO34aVox1mWLuAGdsC/6vb36FRjXzzg=;
 b=sALOFnvWUVrR6IdXaYKCz8nSbgy9TFNf0HyvR79ThcPuruLqgrPvwN86oLhQamdrkf5kQeOr4mBBFukJZjSEkc2PmMGDOb7bteUyEbyoExmFkdMjd8eNSs65OWjJWSgecPaxTI8R4EWiPJRTA37NGNK5AkBVwco/OapMwczgtoU=
Received: from CH0PR03CA0438.namprd03.prod.outlook.com (2603:10b6:610:10e::14)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 07:04:53 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::9f) by CH0PR03CA0438.outlook.office365.com
 (2603:10b6:610:10e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 07:04:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 07:04:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 02:04:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 02:04:52 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 02:04:49 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Tue, 8 Sep 2026 15:04:27 +0800
Subject: [PATCH v2 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639 and
 RAA229640
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260908-add-raa229639-and-raa229640-v2-2-83c75b61139d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788851077; l=1489;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=O20V6BM3pl9I3r5BCIHK3+YSNSDKK/ZEj5/J6mzpFiw=;
 b=MakTj9IFxQGVmXfUErbpRs2Li8OgSaZVI5E/8X1wAvhNkTQ5kzYn/f1eC5TxZdFyiRvqb+G0p
 4nXlk0z5OWADlSeGXUqdINszkEgaa1sbbzO3M4u/yw+fwYMcOsVpS8V
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ca1c09-8984-4afc-2505-08df0d777b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	wRmXSRPTv9Az1s53udyusiylgbrqr0OvaE3De95mcJKtkxEh3lP8lKzSlMBkCbeeD/NuV/WTChOnRZTzugY+XZ4TfQ+GN5Qcmow+jIci81sRRMBjZfIP22RDCJGcwcyt+u/sRaA1G9FSKSd71QJ1Yh8UXinmgvOq1xqYiXP5xdXt6+bAAiOjHF8t3KYv+RbtOJnxRsbuP4zfGvOzth/Nkhppn5qoT/m6VCgI4a/OLOOEY8HojViPAPOpxQrrHEaonnXC/l+frLIhEahvJwbQ9l4F1eXAVQC69ITJr1dxaU4nq+C837PqKlGz/SY6mnSgVcl7jZuT6G4ibB8NeC1KBUqeHKWIXxKxI1kte1YrB6wMsiFT3BJ3nK5HhNjvKMJ50AQrPJnI2GXIEZsfez8ZamFmjdXfGg99NCMZoNcUjAUe8Vt5QxVqHC4TeFLEskrBcDBx0yzpofxHchhIa+FoPk07vZ1/MEdiyiRXNPwZLVv12LWLnMoyBFkhyTThf1/HMNbq8F7F0/tuPvdAyX1ui12dWsNghtxon4agyQB2gc1yHGHi+pH3tA/ofQxFvkP2gKl/IXECdajNrEIEf4PCcLjVF9PLgleJ3LNel7x5x62FpiBnh3nULLCrGZA68dGIhwMrb0QZFU73PAiT5LvV1KxkxDxZlG2iZh2P9LsqiIYBTDSYwzmZxQqd5dAR/zDrK9J8Sj0IstJFAddSxcjK/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bpVt2yAhyFev+2o9nnmEBBONkxGcnOHRUT6LyB0XYPqzMbxoigY6zwnhGd3UFdnm9YmOn6Y9lZoHfBfPXVAPpsQD+Zgw2kEhvREvmWLgDCUh5+/t8Xvw2TmsSryepjsG5MKuL6ilxxGO8NkT/vTPHBP+y17vXsd2cKxXS+TNdtdP1y+2nUMnh/9c6w1LdNCAVIav90ASBYQ+r+brkHwZcQi91XwjONOhXk7w43RxnAw2wDZObJKHO3zu8MPPF5OlpQZQBjcNJzQFCoalu+lFRzh5Ig/0n/Ynmxhg3d96RpXBBE9ZlmvdrT1CZDIyQSZX5OeYN2z0egzyLZT81cOPmHEwcfaxvu8Lthj+i1/2NiyeBzq/KOwMAo7YtoEgjkMd4sJLrmMiPJMqtd989JoA1uc7NxIEM+bi/FaHr0kz75AMmmfak7C5gEsha04b0B6f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:04:53.4283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ca1c09-8984-4afc-2505-08df0d777b8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770

From: Colin Huang <u8813345@gmail.com>

Add support for the Renesas RAA229639 and RAA229640 PMBus
voltage regulator devices.

Both devices are supported by the existing raa_dmpvr2_2rail
driver variant, so no functional changes are required beyond
adding the corresponding device IDs and OF match entries.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 drivers/hwmon/pmbus/isl68137.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2f7f825bfb69..53b44775ba1e 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{ .name = "raa229004", .driver_data = raa_dmpvr2_2rail },
 	{ .name = "raa229141", .driver_data = raa_dmpvr2_2rail_pmbus },
 	{ .name = "raa229621", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "raa229639", .driver_data = raa_dmpvr2_2rail },
+	{ .name = "raa229640", .driver_data = raa_dmpvr2_2rail },
 	{ }
 };
 
@@ -506,6 +508,8 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,raa229639", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,raa229640", .data = (void *)raa_dmpvr2_2rail },
 	{ },
 };
 

-- 
2.34.1

