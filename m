Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF640DB4B;
	Mon,  7 Sep 2026 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764661; cv=fail; b=sSfh49j6QmMzVlVID/VbmfQYMmTcw5uFHU2v3jQCiqKY86i4BJW1wWxcrTQ4MKHijVGIHDBlZdGol+GwU/aIut2eBFlMHSmV8eGbLRxKmwPOWp3Mh36TFGddksCbDrvysK1UMFLizYxKmI9SgqCU14Hiqzm41HGHHmAr215zj6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764661; c=relaxed/simple;
	bh=KPERa1VfdnOm2j74A8IEF3NUV4E7MK1NrvgPwWsPCCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cM+9Gqx04lDjMbKPcABBwI0uUaGE1PR+kqi6oGcHAySPWNH9pBTtyREET7Yrz+tnBldu9jBVDUghE0aQyXt6VGXRhugjFQa6eoqHUiLW04f86k3z44CxA3JIArf3mxDuDaBwOOHYm9kKOb/eZLZHqz6UwGbBS9MHs3KcitAOYi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bjYXjuAc; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bjYXjuAc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTWZdybqMC2sRRCQaRyaHEweMZsM6HoH4tVeWulbYK3kglx5AyOqv3R5Qif/NMc/NDgkQ5t+ITvxxG5fHgppSVLgYwc2wytMtmspXS8KK+3c6r0cnj6MpJ9qenckwNBjwSl1IkIqtO6Azthmrkqdn4B1QvSpQLS3e/WEoSpaL6oKxn+W3nu1rQp3EHg29+x3nUrW1tt8NSC+xGUzxoDDjl/KUdSOu2D5Y+W3qKjFbccupwOO/JNMptVD0ovdr9w1JN1Vf4wnaw6l4pW+xSS+Bpfpi46p8SlcXxlpuL59V5QX8xOLWTgKC4DVRdaQFPoIZUm204TWdl815LvlvwDjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9l5Kx876KBvrFlsYWs8f2OG5x3weaokd2y4+ZHYZNdM=;
 b=Ns1mHkY2xKbveVFARrpK98oqsr43Q2pBiaR6ActuVXHoXLlDFOlkWWPI7f7trDGx/JNWywGOykYHusJXd3Y7TqI45IWMBB1s9E+0jUv7znu0jLQ5z1Rwb2NwZTNB2QvXZlvDrof2jHhe2yfcQ8uc4infCUbHyBLUeR5Y5VE1ODW9I7Gs2CuJp9Y3cOZPMkg1J50lEVtV0GtrRvHi9tdAXV6VMMdEt0diY4kdDXugWQCef3X2owHpZKupd8CZIzY8WgbFPiUrkY+RIsWVVG1dcLwCWO4IvgqJoSO4vbcgFFw1o+arQq6xDjrQ3X282th1J7tNVkeRHTuKQ/haGIIevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=glider.be smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l5Kx876KBvrFlsYWs8f2OG5x3weaokd2y4+ZHYZNdM=;
 b=bjYXjuAcjjKjGkW/VDJ7jdYWsqxhDjHiL8ogI+9hGQ5u8Vh7yEd1h8P+3hU8tJfDO28zBUaIk9u1njdXN+tUnM1/mY5GfqppT1CADnGp9o4evD61FyPw17VhsVrrhtUnUw8pGz0BNmkh9gXSLPI2m/gel/F0ZDq2ng6SC2zsj1w=
Received: from CH5PR04CA0009.namprd04.prod.outlook.com (2603:10b6:610:1f4::15)
 by MW3PR12MB4364.namprd12.prod.outlook.com (2603:10b6:303:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 07:04:15 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::94) by CH5PR04CA0009.outlook.office365.com
 (2603:10b6:610:1f4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 07:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 07:04:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 02:04:08 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 02:04:04 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 02:04:01 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Mon, 7 Sep 2026 15:03:30 +0800
Subject: [PATCH 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639 and
 RAA229640
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260907-add-raa229639-and-raa229640-v1-2-8f7218cba85d@gmail.com>
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
In-Reply-To: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788764629; l=1485;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=FWnQPOOiG7keD+eabKQL7sYE2xLXvYlgqgbh5/0crYs=;
 b=D75OVNmC7nLPYxrq/N6N7kzzD6W0ak6bCb3WFWEdu7GDEA6SzstLHYdAT/HvkaKnzB8B24XlQ
 FCnEkT/lzuLD6ssP6KyZwc4TM6j38VtGqUuyOm7Bo8Av5X3qUHg7EJJ
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|MW3PR12MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7b1d08-163d-49d5-27fc-08df0cae39b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	S8zaKxJAXAcpcTaxUBCD4wDPuH+spMy+tRxT/wfcYL76YZ99YjJBqWDXEYMyok39v1fe30/8BqBeFaLnySOpVsuzMzOFKvF9xzMI6UGMzq71IlP4/HmG0FvVSvE/9oI3IQNdLpnGYgy359pwotBiycsvnjGHx9YKhq6f7oS5hXieChZbDw6ceS49yiJ7IXMqqjl8nPiIR96MXCnR40tD9p0mDW/881AJjArB/4BQSNuLVZS8nM04Vk7wm6D9xrsgh5aa40fLfEi6LyMiG5oJf9cjlJDB++VG+SrYlWJJFNF3dQvMvX8Oe6lxt4WZGHA4FPa8cEsVKToNqeH6/781V7YG1lpQOJQWFsCk6RXvgW0Auwf6/jc3/kbIlgVgD7w8OKXOjIw+m5MeaJG1fhWzGgGhYXS5uSA2Q4cpSWeOcs0TsfEVPLHgXboDdp4QCQZlVYbK+m/vHb+Dy6KOcVybu5FxwwLTpCd3kI+s0LO9yqxpNOs95g+ZtqHSyU9FTnZbaQaEKik75Gb19xGVeFh/tO4Kvaw7TENxHgI8faKYiquPNtO5kC8IHTCL9+Z/AbvQwkEKREgTbGgTrwHQuOeLjBTZKzyl6bbfw/Lk72bhjWW4qm1mxzIv3mQsfDamRnKgjTl82LI9ptvA0ldtM5SsD4465uYDpdUN1l+7IZOc041fEvfzj2lh2SrSClHUXvh/gCiGQq0x0494qZ7hXkv4Rw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n0g2KU6T/opNAAsYvUnfq5thAXUlt+SiT6ohUR3l31LE2CkD7/dxejArh+lBxy/UMDPAlTDGYhtNuGixozlTPAT4DxV+ViJSVGJMdLTj9H87kAc+ZuNItc/71ByusDO8Vz6nzROX23vObMMHjMfX93Czuz+sHEQs4s6A5npdVA767XV80T/0RMx+7sKWAMRlQDyqlqtssFfJ3E9XtCkZC6CogzlLTNdlia5WpyZ9LTlKydnT7VLcvNDT8jE9v0z5iSX5cjcfQOAUPyd3H8Mbm+nP+C06oAuqJ9Vr9pJ6yUkx4PrNAM6cxxmnqJ47COi5nNMG7HhszBhmAqV1bh0sE9DA4c1a34DEXhx6GpSSM1nIECpJvqCXYpXheZqz1eklYCGUN+YQgpN0yUqZA8b8Cw2s7KxIswphFK7svcUwn6dhYAqhBike0NzBmmSbdKtz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:04:14.1332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7b1d08-163d-49d5-27fc-08df0cae39b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4364

From: Colin Huang <u8813345@gmail.com>

Add support for the Renesas RAA229639 and RAA229640 PMBus
voltage regulator devices.

Both devices are compatible with the existing raa_dmpvr2_2rail
variant, so no functional changes are required beyond adding
the corresponding device IDs and OF match entries.

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

