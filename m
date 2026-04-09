Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010027.outbound.protection.outlook.com [40.93.198.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38893BED2B;
	Thu,  9 Apr 2026 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732415; cv=fail; b=kAlKkKmuzokY6GHdmmSV2iuOt/pmI0KNwm2MgoEIzAn2SfL13/RMTewDO9IBs4HhmK98ETnAcaaM0C3uHspzUu8eVNpJVRWdedifUf8SOcufHgLfe5ebJd3Y01W9QryPihwmPHddhNxQF9wqFMZQ5GlWHPRixM9x7QJrMwZ87S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732415; c=relaxed/simple;
	bh=8CtB9pyhjIotHfvDXEC3V2J2gGD384A4fnKHCwV7g1A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jn1vZOeYNuzFhRNap/myOnpUH6SKhxlZZ0mW5na5hf1Q9GbmypgGU0S4sOgZNtJg47Q38ZnWnGjc79FqmbUpLJOg/x6zOyqj7y+cxAOFjDdyP547aDXPp6qlhA2kdDaBIiIGyBgAZ9TG/76TIjYjoHa3LAdkbhpMwLOm/s6CXFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eNc7h8/4; arc=fail smtp.client-ip=40.93.198.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eNc7h8/4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsqqLDaNXnNcOGS7vxtS8xkH2EdVAbGXYsCY3NAK84ehArAfY1l+xCHUACbFEQ/s9XmdtORNsf6t4DHJw6Ef/aFZIPkvatx9x0ZNkqj74ZNgjo5XMqAJotL5ZdmIgQAO+9IepjJtcmR0lG+K3k7zYWbJnugIIfSlBa1beni6fBqF5YaebZCa6ldC+I+EU4rjBKFTxUkpT/oNyW+b/p9coa7dRSESj98hMueu/ELMzTHLyEsBbNP6J2M7WT67Bj7pH5CiiNIx8fua8SI69JW2ywK0xBBxuGlLewCntklz+SR1w21kkaAlcvI9hSyaPNCH0Vti/awGwC0+Jyh2iihLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jn9fzonNS8y3CbvFAl8QWIgZVSeTM1rabBihBfPM2h0=;
 b=LQtan4XmnJF++CgR08PN8VyPHGYytnW51+gA8wY61N+L5cgtR+iiunIlI354O2ifMEKYHuLWJT4qFIRbLzcxehhEgSzAcMLUbqjUqFJ+WzE7q3NMT5ziLHqSnZJbJOEmn1nmVWOmU/Ms7K/pYvPGAzpX5rQX+JSaR7FNTqxFiqxRShAXp658Ss0gzOeoqsTgq3tCW7+8jpP+waZ1P3rcN+f0ycRyaquleqmqv+V5CpDecC/pmtV51ziZFqjyglLuPBkmZx/N08a9yz4U63ogovOSGcZmQcKxgAEAiDgTRI3CpkMLRJZl1y2SvY4QNmSUA++56uobXVJjibVwJf9Wfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn9fzonNS8y3CbvFAl8QWIgZVSeTM1rabBihBfPM2h0=;
 b=eNc7h8/4IezE8Ig0ozI1ewGRVM4z+iBDjwO7hmMygpf2Wf/d8Jzen9Zv1djp21LYRfAJJk3r0LzoOjju0072bQbPOyIrnNGT4yzuDYSfUNV4fMu1KAw1IxYWpIKTkuXDDIW/NI/GIhK89B+6NPEHzfZRg3lErPIroz9Ufwg9tvaMYQwd0aOSF341oF/yANibKhzVaUKl35+51lKUwfUSdZV1o8SNbg8BVBIZXziqh2Ly4qSsNFSKoIwcCUZze5K7vDyeCw4km+MK9Hl9vbc5bNiCT9EddHtNbiH2UWtP+vRCDZM26jynL/zgPti71sRrmqAJDSP3NSaKRRXPIZQ0GA==
Received: from CH0PR04CA0051.namprd04.prod.outlook.com (2603:10b6:610:77::26)
 by DS4PR12MB9770.namprd12.prod.outlook.com (2603:10b6:8:29d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 9 Apr
 2026 11:00:05 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:77:cafe::d6) by CH0PR04CA0051.outlook.office365.com
 (2603:10b6:610:77::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 11:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Thu, 9 Apr 2026 11:00:04 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:59:51 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:59:51 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:59:46 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 07/13] i3c: master: match I3C device through DT and ACPI
Date: Thu, 9 Apr 2026 16:27:37 +0530
Message-ID: <20260409105747.48158-8-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260409105747.48158-1-akhilrajeev@nvidia.com>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|DS4PR12MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e98a250-8fb7-4971-d9f6-08de9627276d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|22082099003|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GNfuoxJmyTQgjo4tO5mLgGJTsZNctHjIzDPi3ZCwRLiHlHocY7BuF/EVEF+xFNEowV0OIRC3m7lV02MpkLUratJn3+X5muneGDQvhFrj0CSTGzU13WZsAJN2ka11C6uOkZHk40PDnQx87WtiP8dQJdxLAwljdbXd0/0KULtrHuzbGFIX3t+Q5Vfg5CScvJbHJD3oKk47eGLDvOa/kLVtOQ2yeWwEv1kKahBMHOTQcJnaLrIpd2PL70FrKyVfvuESfqgTmUOXpyAV0zqs/9ww0OQOgwk7OPux/VzC9v4zi51PfoY5UN7vNQfbjIExWBtHrEXguAZdmRkqywm/w3gNBhoXrofpe+K11U6M51ZW8EjcJktHF53nXkmrAfWzvZecHfu0XQSxdtTMF8BSyK7TcDmecWAzSfNXkfPzC3V3xcIJV1HIrUhTylIZZJ35el5kBjQAQV07QGkza/f7/15mXH8X3O5SDqiIqClQE5aYynZmtKZY2SfsKyUsdJeZbGV+9646mhmvuAiK60m9iSgcv/zw9vWoQG9V6UAzjR3/YoN9RhRcrLImAX0Qb7pn62lobgx4JylRofmJi9mD4qvhKEJUSGhpm196RG6t1kRdBZWeDMkGMI3j8B9GY/+fcJfBEVFdEizdqHONt1ZJ5mo65phSIinqedYaFaqgelsiytLEFzGCKWnyJ1JFmoBp0675CVDBpGDpf1T56g1XdK29TMGkgYTkPYjk87h7+255ATcWkDg7UKBWtsxhQqmIUyu/dnrPopNkl/UUrXaEwewl5OvKzYzALfDnSt8Q4xjdK27hYcJ6z/fYOU/L875Rf6bY
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(22082099003)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KpNI14Tqnyq69bBexfVqCUmiDPIKtk/4Bz88tp3uH8gvNbGzwrQdvU80Y+HeUc8VvXjDDoTtyVbnpyh/SaMIAmRzETPaCU0XfuFyEnvFB1wMIYuUbWzebeFmZLJnm96fRVUxu5N5jzdzYDIGVwhizNRkd6gzELz9eGMuXQhNDhcxGkPDStCjndFRIIddU4u07NNENpwTxqmiD0D5Ymp3tLPWH51kCni2c0H/F1Dk4RPmwwuuM6m02leZCn/J8HSqoLnHysYJ/IvEpwdYT/x/myq1bnpaJK1Abrdg/UTczgNpYO6Fo088ZakzhTzOv/LUoimU7f19FaQ4BA3y9Vyy/saga1jv61HZTADvVBPVmdxjqwJwUdvhZpJqBx/P/DQmE6DPjPXa2J6QGoSRHfyp9WIFbdXKRNbFHLzJkKw2slj+NSG4M4GG9KZmly7NCh0H
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:00:04.0960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e98a250-8fb7-4971-d9f6-08de9627276d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9770

SETAASA based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices
to be matched through Device Tree or ACPI

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 324a0440724e..f9f682a881be 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -342,15 +343,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct i3c_device *i3cdev;
 	const struct i3c_driver *i3cdrv;
+	u8 static_addr_method = 0;
 
 	if (dev->type != &i3c_device_type)
 		return 0;
 
 	i3cdev = dev_to_i3cdev(dev);
 	i3cdrv = drv_to_i3cdrv(drv);
-	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
+
+	if (i3cdev->desc && i3cdev->desc->boardinfo)
+		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
+
+	/*
+	 * SETAASA based device need not always have a matching ID since
+	 * it is not mandatory for such devices to implement deviceinfo
+	 * CCC commands. Allow them to register through DT or ACPI.
+	 */
+	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
 		return 1;
 
+	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (of_driver_match_device(dev, drv))
+			return 1;
+		if (acpi_driver_match_device(dev, drv))
+			return 1;
+	}
+
 	return 0;
 }
 
-- 
2.50.1

