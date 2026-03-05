Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazhn15011022.outbound.protection.outlook.com [52.102.140.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D23EB80D;
	Thu,  5 Mar 2026 19:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740612; cv=fail; b=AlmMP7PHRzklEw26UtYtFP1McvlTeB7t6eIqk1rf+s/PFQzICjoasIY8SrU5EQPTt0mxnY2gstpYl72bO0WyJ9aljDRNmQmtJg/VvUKHyBLbOI6n4PHCZEIgrWdLuJX1EExlapcZLQlcjYt0527JStLDNlLaZwPluOaZ0KrYtPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740612; c=relaxed/simple;
	bh=JehYA250eQNq4J79S2XeTzx/0FEx8+AapGC/QROoo7k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bbjjum1KqjfF7wvhGL3XUMolmLlPa1qFlZDgfJhMujqcjPWLRXTGyGBia6dJKDzZ/dO/t6wRmjYtTD+FGG9xs+8L8Gastl58JPa6UxlTEeOLZmpRrHgFeWTVE4VAqYHSk4inQpt9WQ6sVN7lhwOd3vqgMGZe2c6bdpCr6O/ZTck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jnMH7ius; arc=fail smtp.client-ip=52.102.140.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jnMH7ius"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9BJNhPMgKQE5W3KdytrHiC5keJ7UrhwkSQLe3+ngWMMfY8DqK1htp0GsKz5Vr1rXQHKPlHRmot/F+WqY5++zvEJXmoq6SzHWENVxRoX9UAS748mgOYHLrZFUTTtHJYZ5Ml3J3RBN1Dtxkj0BPl5fBCqJM9vf8AcsHXwYxPBZAsToID5YlGDAFW8PEZ0x0AmrtK/0ds7XU2P6urSKfC9KrCsOoZSmU/NEAycpoO4uPNkndSFeBpAwVEba582hWoeaYApJA7AVnajMrT/GZo/FGevaOmvACrwdW+FOhaCKx1rCmxdt0BxzmVER3f2a7POElbEzfL4l638hz7dGwfd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bp3wOYLGs+mTimLrubWG9Mrxw+cj8WjbKFKhk4HarM=;
 b=ZPKVymMFikkOWRc30b6BwxwqCLK2bwEdz5HzeX7rQ9GAcUZr0N091ko4d6sJgUWvF8MSaKa+8X3YepzS7pq1My4+WdFOvjxutzJO/AEaROLE5e41p8+uAhDKyi1OVra8Iw4OrT+kBTL8Qeqm3a96c2Du9RqbX3ZxI4pmPh7WsHKzNsqu6CXcSOGpF6YfbyhZRQ0gWFjEx5VMFjPXMQdqUo6z2+DPenkqxiTkofI+UIZtBiE3QEQB7ghi0gc4iS4qCSWEofQ9tbb7qZ5NgeXHBgYekMnBdM0mzZQEX8AKKNk+tJsLadjeha5NW+3910uca6AKK5LSkXTItaHX8PcokQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bp3wOYLGs+mTimLrubWG9Mrxw+cj8WjbKFKhk4HarM=;
 b=jnMH7ius/6vcemJPPk2HSU2N02EeHB9OjpPdlLPyNNk64xBasWksgxqA4H7m1FABbbwvgLF7XvD2Lz0caw2pio7GFUYPBpKCQyh+XpQaWHSOmITg6Keq7BUQUw05au1yoOprVgzq0OptFrFdU0qfyeidYlDP3PFuwl2jV75iiFY=
Received: from PH7PR02CA0020.namprd02.prod.outlook.com (2603:10b6:510:33d::28)
 by CY5PR10MB6070.namprd10.prod.outlook.com (2603:10b6:930:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:56:47 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::b) by PH7PR02CA0020.outlook.office365.com
 (2603:10b6:510:33d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:56:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:45 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:44 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:44 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigg2456638;
	Thu, 5 Mar 2026 13:56:44 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 00/11] Remove use of i2c_match_id in PMBUS
Date: Thu, 5 Mar 2026 13:56:31 -0600
Message-ID: <20260305195642.830695-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|CY5PR10MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e68d3e-d6cb-4dd8-61d2-08de7af1544b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|34020700016|36860700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	thTqLQ7BnUOygaCorlU3u0nzxcefzYPd6vOTjRlXhYP2w9KqkN2nXSaHbpXOCR5Kx7InUq6IIjPnWSGpzN9MgptvxwfgzYDREmXV+OziEq/CGafw+n8GUXf6eCOvNKFeRw/n2EoqTyLcuF/gjLXM8+e/U+WhaP9MXKATKAMDSYEy1vLdn9VaOsCTb5GXFYPR7ljogPciEQQo8msDJ37YstEnwubKO2y6dVhvdkuhz8JCHQ6RusT7GeFYucN2Dlu2OOnmi/UB5l1qy//tFQ1+yDsrQxQI+bGzF8DbtUaK0PdHP/2kKBxPMQ/pTP+ngk9r5b6rXzUAyoRxzqI/LGWRBnO0tlScOYdek+oEc0qqH72HF4laOO2bPwIOxUMXlNaFNOYHWna366atqDDc1zrMWkaUBGCQ0U4d2QAf1Udb4bJ1z0e+Z4+wqZuKJeg9UG+1BZUEzGYD52RjKuHLg9Qsb71FrOg7PZC8sLC+CyoN3Ny9O1FX5AotRn6B0p3Fx2okfao8xPZl95HOtT9gA41gO1GXVIsDDrMrLdZ0asLSwDp2q54G8wu0gfghypv1bGVhQrIcQgCxh6FwnKaLFxGzmywaZ0hqBkkfKcGYnf71qro4sWc1ZvYnnfdl/olYrZyVwSPQlLbzXF6ZxuAWpoW87taUH1wzhCAXr2vRcfZqjC1vt3ko4dcc0KgPmM/ouu5ROJFTS3WhwuxroIJTzLP/PPmt/BIlppc9N47DecmNy1UJ96q10Vu6Rorp8HGD9Z4k
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(34020700016)(36860700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0PvMc65i/Qq/ntr38TdaV3eFZhWys2QroiWlSLZOoIZEnd1x98ewetAOYbf0IGJQhJCotrLcG1egDCxLfSNBfVZ98PYP14SXRKepnGAxOBauA036HhtzyKNhjlWIZKHfjfYv2LdEfAZC6gb6eQSvd0RPtoWEesh/pY79ifhYgYtcd1uY7PNP7FY4PZziMfVwaxQZgCtCuFc5QNqsfXbC2/BTzWGHnzejPtRAMcgvDaVJr6B+HMXRO2CLWYvY3dDj5qxS5oPLVno4lovSskLJtKM5wv1mYzohyP5bHkILrp+zsF7FUAQQ+XUyaCYqz/nJPfxWxUBh6B3ipKLLeDlBdYJeVEgO/RF5GuKhzmT9zQyRJulWSViUqqIl69EeuOcJ3LQye5NeQ/wS7s1JgNZ3Ri/PpDbeAtc4JPKMH5hslLDMKC5opw3/s807CM1yEpm1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:45.2248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e68d3e-d6cb-4dd8-61d2-08de7af1544b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6070

Hello all,

Much like we already have done for HWMON top level drivers,
we are removing the i2c_match_id() function from all hwmon/pmbus/
drivers now. Using i2c_get_match_data() can simplify code and has
some other benefits described in the patches.

I don't have most of this hardware, so testing is very welcome :)

Thanks,
Andrew

Andrew Davis (11):
  hwmon: (pmbus/bel-pfe) Remove use of i2c_match_id()
  hwmon: (pmbus/ibm-cffps) Remove use of i2c_match_id()
  hwmon: (pmbus/isl68137) Remove use of i2c_match_id()
  hwmon: (pmbus/max20730) Remove use of i2c_match_id()
  hwmon: (pmbus/max34440) Remove use of i2c_match_id()
  hwmon: (pmbus) Remove use of i2c_match_id()
  hwmon: (pmbus/q54sj108a2) Remove use of i2c_match_id()
  hwmon: (pmbus/tps53679) Remove use of i2c_match_id()
  hwmon: (pmbus/fsp-3y) Remove use of i2c_match_id()
  hwmon: (pmbus/ltc2978) Remove use of i2c_match_id()
  hwmon: (pmbus/max16601) Remove use of i2c_match_id()

 drivers/hwmon/pmbus/bel-pfe.c    |  5 +----
 drivers/hwmon/pmbus/fsp-3y.c     | 13 ++++++-------
 drivers/hwmon/pmbus/ibm-cffps.c  | 12 +-----------
 drivers/hwmon/pmbus/isl68137.c   |  4 +---
 drivers/hwmon/pmbus/ltc2978.c    |  2 +-
 drivers/hwmon/pmbus/max16601.c   |  2 +-
 drivers/hwmon/pmbus/max20730.c   |  5 +----
 drivers/hwmon/pmbus/max34440.c   |  4 +---
 drivers/hwmon/pmbus/pmbus.c      |  4 +---
 drivers/hwmon/pmbus/q54sj108a2.c |  5 +----
 drivers/hwmon/pmbus/tps53679.c   |  5 +----
 11 files changed, 16 insertions(+), 45 deletions(-)

-- 
2.39.2

