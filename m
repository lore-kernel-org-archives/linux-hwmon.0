Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A91202C29;
	Mon,  7 Sep 2026 03:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751711; cv=fail; b=id8Vjug6eyPw8ek3ASPnHKT6NoCw0ppdfy6gqEduXUss810IO4c/LZ2xnk8swCzoVG0kQRmo3bwXEEebkmhrYol4ua0nqLQDIQroocvCu6bBS/S+1MC5b7YgaU50lu8ksoj5Ik+p+FgJ/CL/Y2PeQC+vyceHge4Il/cWDc+v01Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751711; c=relaxed/simple;
	bh=U+PIBfsKByVAzH4OcwL+k6rnl29BP7N9MA2jA4EjYAs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HaZWranss3DGxAAyAGl5/4hgtp8nyFL8AafLOl4NihIeMji4a7E0826+oGwA7VRJJkj3y0tpywm7TDuRPYZ/D+MWzABNaz4YEyW4HhI8SXyzjJoLJuTt4Te8GSi7cJPP8138ZYjRJQ8P9Y+K+VsRt2XOtwZ/rUbc4QqfNNYpNcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U2ea3Y7G; arc=fail smtp.client-ip=40.93.194.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U2ea3Y7G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYnYyKAFnA4AbRCmJ37hhTma4zcslgI5914tk2cmiJ58cYh6/+qeTOu0aSshipi1H8nTDPhy/ivmT+7EbBw8LhwRisq0ss0hcK0zcr3bMTgD3nz9Fkxa9pZZw4jd/AbC4FfpAKQv8b+28JdqKHbA0K/5/DihGDscRfFZPsOO+TwTqkzzz/6OARHIZV0cQaMRjSvzDtD2ktjhSEbX0GVTEOxpU0X59yh1qA2/n3awfJtbGfEM0Qml9zk3CLIv2ftBDiBlfYc1wqwJzKh9NoVBr+ueY1Xg9kdeBrYE4Szs7m2njld/ceN/zEYOVoM/e0Wuuz1Cf+F1eBkP4Z5nvuiUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27GCsEGQ3krIha9FZyzU6lkdlVDTsv+Qg9bXIBHMw3E=;
 b=fIrLcVVS4IW+zoVbMg5ZXaMoubmKsTsDnfRwLJHRoWTuAzoxFZLPwjP7Zs8ps7xjJxxEeqBIVE4Ao9Z/4m/do3sUS9ugUWL3pogsHx0auNzdimiBFZWfzqJQMaygUvaaLYQuNGaOtzVVwk5iEm7nCZ5Pj6h2Zp/pBUArZJ2RwbsGXdDOuzldXowvlaimc7kmb545kq3qNe9Pf2D4NRak/3A7EwvzSwrhkHCK0ix/GViRiQQdL7BcyFzmdFBq0oyITYXtTL9b5M8vqBpmRRr0ql/Hf2bi4tROEhsEPzBIt7sB0Fwea5uJ3b+JeiI0fHBKqmYm+jZgwpkSb46Xf5FnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27GCsEGQ3krIha9FZyzU6lkdlVDTsv+Qg9bXIBHMw3E=;
 b=U2ea3Y7GqBiv7oIS/G7oF+QJcKer5BRu7e8NzEe0G1ABrW2p8TFBMsJOt2FiAd72uDZNEZjdvjmnEk2RLjUk5x1OlsvzP1pIaXvKWrP7hc7MBYhWr9DsmXbn90l/+gwQwMMIwc9E6+oy0V1PtYwYBY/q+E5oVPhacAPMlEBLTBA=
Received: from SJ0PR13CA0073.namprd13.prod.outlook.com (2603:10b6:a03:2c4::18)
 by SA1PR12MB7296.namprd12.prod.outlook.com (2603:10b6:806:2ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:28:26 +0000
Received: from SJ1PEPF000037AF.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::8b) by SJ0PR13CA0073.outlook.office365.com
 (2603:10b6:a03:2c4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 7
 Sep 2026 03:28:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037AF.mail.protection.outlook.com (10.167.244.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:28:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 22:28:25 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 22:28:25 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 6 Sep 2026 22:28:23 -0500
From: Colin Huang <colin.huang2@amd.com>
Subject: [PATCH 0/2] Add driver for Infineon TDA38740/TDA38725
Date: Mon, 7 Sep 2026 11:28:02 +0800
Message-ID: <20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIvnmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3cSUFN2SlERjC3MTA93EPBjHyFTX2CgpKcnA0jzFxDBVCai/oCg
 1LbMCbHZ0bG0tAPRtuhBrAAAA
X-Change-ID: 20260903-add-tda38740-and-tda38725-32bbb097d41e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788751696; l=707;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=U+PIBfsKByVAzH4OcwL+k6rnl29BP7N9MA2jA4EjYAs=;
 b=5UM03Xm4YN54aWMpf6GmbTNFFc6fF0bOlBerq9ev9Rxm9TQrNPgyFUWsg6SRRF6X2Q+hkOAin
 MZJl9W5bpU9DsrrG/NV0iYRw1b9L8ccNsY7wbV6Wn4IU3weLGH+6lXY
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AF:EE_|SA1PR12MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: aacadc96-071a-46f4-c460-08df0c901410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ilgfa43KRLOfSIpHXQu2k653qUkiOX5qso3TbQhKzLA2k2MAzANpPMMOOlx8yc8nUAhTiWg5kylOma/QH5vCw/M3zOgp7bfZtR3L9DzCQbxWYIuzzPZwdZFRUkhQve1s238zoQz+/9hXdf8JC7mkJJfKjH5hkvvxQMazG2h2E56s9DZGyV7tbNpLB5GrsDkzvfzz7IaY05JVvnzJrkN48jmY8CbJVwlEwdWjTtAYPmjQFoaLjQC9O7nFzGDFbk5QJOMBUQ/jHQ5yBW9DyibGl1VnrFRagr1YvrdctTcN4yz2BzogeinK8TWmvgf7KOsA9sxxtNGkPt9T+JGIUKLrNRbg1dMElQhjUE8npQ3LBUBN5moyz2J+s83qy8tXJiZQtJUMhbYVb7qYMcVZaxC3e9Eicc9p5noz2Kfct7TxvJhwbzA1li2Fn1MD9IZKKulg3qU73BSQ1S1A1Vh/HW4a2n8v9xvZU7FIWdQ7JEVNilL7at7r4FgSE+SReFXFoxNkBjuJ7wtfGIYQ7UtoW2rzvOjqi/JVJjym67mv6ZF6exAbmFg7HVHi5Y5UANMYZk1X9QFeqacCtO/ZMS0FtzBXMgVenOv9R+WEDwOXsNctQYVviRke1L3KpHOoTyC1zRStOFRTALqhLv7FUaznUa39HjVpYgHG3UOqunSQck0Incw8pqH92EZ2Wwn7NqY474Ep8voY4LTipWTdIuPbzzbE/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NbO9q2lBGEIT0guSByWltnf+twZXdHrVfNQC19YTBYum2Vkcpwxi+q3d89JdyE+A3uyBvIGRit1Bxmq4W3VjKP21L3EIicOJIEBVz5JfBGbayQVF0DzjBZXsTTLBlaG2HCEDDF+TTt8dvKGjqhIOH+rKbga1YiVAjFK+zEqdGyWzXsDZA1RDa1VCl5ZEyX7Q/bANepD8G5PaNRZLd6CMcrr2j/83yY2LjtxGRXAidQeA+sQ7fBj2Gua3wu/mMi9FOT+Yl7cd5KWKE/uWxZkZCKu8CmLxS40ae/x7tuFiE6cllcMlJnjhYxngPV+3AaETN2eRkKgu7l+NawivsfeDwfyPjuMclZmr3jDsjt/EhLIT2NhuP15c2LQ7qVXRQu0RKLH+r94YWLqgih9ci5NLrKITdplnTCtgDsqzXqRNVo4CRm1Zep6fWis9zSAGPuD3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:28:26.0086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aacadc96-071a-46f4-c460-08df0c901410
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7296

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (2):
      dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725
      hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725

 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 79 +++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  9 ++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/tda38740.c                     | 98 ++++++++++++++++++++++
 4 files changed, 187 insertions(+)
---
base-commit: ba08432bda66a7889d8f3d1581dabf10f59b25eb
change-id: 20260903-add-tda38740-and-tda38725-32bbb097d41e

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

