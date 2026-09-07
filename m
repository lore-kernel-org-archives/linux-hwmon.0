Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8203AA1A7;
	Mon,  7 Sep 2026 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764646; cv=fail; b=XqrJ9mTbn9769XvVhLQQxRuCF5PwPRVGEQ8iAb6uCFgvwVLCkE0K3D25QA/alzmQekT3q/VADQjLLnspZGbjcZlvHy2TEjg5yj+B/iD4Ri0X6g/lmXa0hXCxbka8+wOWJ8k8aDyUxAqh++QL3Acgsmze9zwd2VbQd5xBXNJLGYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764646; c=relaxed/simple;
	bh=g2kOb/gOEWDkz5tMMAO78Xd0oJihX0rxoVqetSOdbrk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=npCTNsPiM/bH/DSqKdbkzQ/FtJib/TLvklIL22HdZZGxwByrdYma9aC5yiJzxaSi/UfJlpqnG86vFtm5PosAb87thwBW6fHTjlp5rRp1A3yH4HtkwGN9HGeyxJm2w5penUB0CaVfYpRKLx6ORxnVW1oZjGKKFhTjDvp+o/+kQMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1oQjj7My; arc=fail smtp.client-ip=40.107.209.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1oQjj7My"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eS+FhykXIezEa0Frf+p/QejIQxvHLGtSo510rNy6vMJAcwpJYLDLHwnwQ5k5z2S5dApW/gWpiHEmz8y52PjixHXj7UH0uXYud+Zg5GMdmJ75rY2RGiIWuheWFc4Jw7gAzC2CmH4Txp+ll48UPPn3zKwHPC3BC96bm5nn5EaCbgQhDbgrKbyNiC651jvliL00uJb7TCsaBe8h0irgSxqvu03kRL9tt6OEdLaZZW34faUwaMj+DPmRqVFK+iq3Eh+G/dz3+6mGG3XpdAIM4pM+HT05himtoLOnEI2ZpBcFwof4dtmCKq5K0u+ZlXXQfYke+OBVm82m7Y96QQpLCTwIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDpYWtC8AjhuE5WSfX4BEyI9SP1Jue1Jrq+y9VRxvEc=;
 b=UOzrWPTdZUCuOvLEh5ixuYIDglSW7RswMJhUuncyseDNwPC/sIFPuw/P4KG1NAXD5Cr2X+tcn9Y1x/uVaSApHrFYfqXdWdUXoTINax/VNtYyDaL+IX2zZ29Oui6YeU0R5eGVlgwX6zlT4ScWHWn5YIxenJ1IkhZlpsKCzeXKdRlW23gRSfJpl+Igcx7ePIczcfa044cOLSTrGb2OvwILHqT38/q+LpG9KMPLjyGN5kHDt+U0ro9yH3VR+Kl6BmU4KZuqSW4i3Zx9eW28/mHR32bOwWKDXf+GJGDnwEoRTa5pTMlQnave+K7Sn0mBf8H8vUYncuM6BZQZ4UAb5cRn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=glider.be smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDpYWtC8AjhuE5WSfX4BEyI9SP1Jue1Jrq+y9VRxvEc=;
 b=1oQjj7My71GRxN+2Dn4Pc+5hxzn8LjCoh4IVjxBEtvlA8jd4E/Ez45XY1g1sw96FwhrkkAczOO+YpDYrkjpLDywalWjbtEb6DXnBzSjMQUdTBLgM3VhAepo7ARIORendU56GI4IT3yCrnaI1X/7k2HaRw/OPmBI7Qv/5cmk4Z2Y=
Received: from CH5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::14)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 07:03:59 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::47) by CH5P220CA0010.outlook.office365.com
 (2603:10b6:610:1ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 07:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 07:03:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 02:03:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 02:03:58 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 02:03:55 -0500
From: Colin Huang <colin.huang2@amd.com>
Subject: [PATCH 0/2] Support RAA229639 and RAA229640
Date: Mon, 7 Sep 2026 15:03:28 +0800
Message-ID: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMBhnmoC/z3MMQqAMAwAwK9IZgNtFLV+RRyCTTVLlRZEEP9uc
 XC85W7IklQyjNUNSU7NuscCW1ewbBxXQfXFQIY64wwhe4+Jmch1jUOOv1qDS0+BLVkfBoIyHEm
 CXt8+zc/zAjVUamNtAAAA
X-Change-ID: 20260902-add-raa229639-and-raa229640-c72fa121df82
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788764629; l=585;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=g2kOb/gOEWDkz5tMMAO78Xd0oJihX0rxoVqetSOdbrk=;
 b=4AVVnzEf+xWr1fXl3mBWPnD4VaU8DnLudPldaMF09Q/r1uMn/V66s+y4e02w54EVanYo7Qgvp
 WOsG//WDSR4CWxvVldCDQuT+Col/ES7qTWfnmORA8fB3EA4vGr81YWf
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9d5606-c163-40f2-7bcb-08df0cae30bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	NcR7mmauuXcQ8ezqRoH9foMkoozyJAakwqKVSsNafE9OiM8X13/OeNMnz9NBlAV8XW6a6AgVnfMTiGyAXcMwKBWZ/5I9lTV9XxsBk2ymcBCyLXwbzFv3kMKTu0vRHQz0fpaG236qrZKLuk2YSQ7q1SlvujHKNElsbjaTMRai4Gj0hmaEDgKZdjh/TI5fG2SfwMEiZvsjebKrkhJAtLnmG4xea+KW7lMGqpSYyWFVcVFHbeaLNQeSCQwl75w4KW6Sg0vBxqYSNP+RyoovYZLUqDvw6QQ9pbRlwt4k/u/LmQ13sQ+8YOv7irPFCQetnAZuH/DVt6cdB92XjBdPHo95ex+VCyx166+p3zXyDMDxbKYC7llkSpy7DJmMPPRtl8wXOKOm1skwbZ4I7MI7TwreSMwVibwb/KAL+ALcvV66+qzx708OYwAN0eZ2AS7XLoGPBmtMLd1qpyJt2xD1Eb2ERjgdI15EI9lqYsmgjp4FhDCZn7JbwI5KTnuUky+XGX7YZSUaHLkEuSafo1I5A0Eh2F692FIvPn4LmcSGjMj43XVcrv66A9tX7SThdUaA6KO+kIAYFe++nl2utcdP/tWIMsJKfnlJc3sYbgkp0h0mcPtAUImx5XBBIc53I0dqtYltz2YxZCm0+Q9E49rrymhF8l0zycPvYX2UsYq72YSerpgkb71J6n1K/KhDw3F13qvHrXxxNPeZPIiC2tR37xEDcQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FPwFWlg1gjJa3PDQeWe65QBR03nF0qheoOYH0IOwtDTvuxyAqAbtSZx17SpXA5bXuAFDb7p37fHxQpe/Jj/BkOgFPjidln2pMEJFi5IV0ANYCiGgmScVQuoAsp8dY/VKLW5yofuSPG16ncO03n23nT1QIiPnbUn3t3PSEjPGdOcni1o85f9oGHqWWETQKRbLZ1tTextjlIOCXvRe8sN6MxCPHzXQvB2Ds13pDLYDCmnHPihiESmVexvasEQJOWFGBn5wdgSypVZRYDed1bT3oDIwrzThgMMXfEP6vCobJ7vyT72Oyz3La4cxHP10Hah16oek4ew2EYEUl2w7abdSfnwA01h0srDIKybpw/t6aGMMcqxuvJgY3IXUki9cIRASCKW27bgnfKjjfN6lmmOhwWibh7LREZPORpOIF2WeuVHdqI4iku0vQvKjct88bKZG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:03:59.1198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9d5606-c163-40f2-7bcb-08df0cae30bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982

Signed-off-by: Colin Huang <u8813345@gmail.com>
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

