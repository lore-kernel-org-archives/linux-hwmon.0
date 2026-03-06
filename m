Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazhn15011022.outbound.protection.outlook.com [52.102.137.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37631D5CFE;
	Fri,  6 Mar 2026 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.137.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817452; cv=fail; b=KcPfQy+Pb88ZU9s5caRXdcyplDp2qCHEyVQtxKdZ9hJYHNvNR9IxgRgysLOy4AGHRtyaRYs0WJIFc3nguVx2kgnSmKIHx3cktBroYmk5+PL73vt66xIV1ZnyPPCO+9GBGEwa0syoVyf5M1XNsY0Yqn7klkUNwvxELVdAI7vIVik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817452; c=relaxed/simple;
	bh=OMi2LQurEvX4VvSm3uHRiiCJoK2I0q2VapMEkNJhxi8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i9pMEug8sf6tq8TQprpdgaxSN6mRgNTNbhRJTOLaw78neeb//mihTcKPObSHN5kvi/mpQ/KE71FKRHmQxGLhz82eNUF56LA1Djhmz8Q/PiA2Lq19KaL9M24+wTYLLo3S82NeJtIaENWN8j3+Uauc2tbU+UoDRWPhCE424rqSnqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ry5NAJt1; arc=fail smtp.client-ip=52.102.137.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ry5NAJt1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7yO8txNGMexXk+Z6hMxK/hSLGaOLhP38LOONkc3dbiV78OyGA+PRfQVBK6jqctP/uqPIhRC+huGj6gctevmi+LZX9f7pFWbHr6s1w0oPe9SsoKHrCm8OydXMIpsrq5HqBbSwDtKEpN0NuVwRBYMozN72EZPSWcMtD3iFkL9SumYx8NniZgnzDz2Cb0ZcIA7cwJmddO9pXj9mKg8KyXwR6Ua/6nJkM/j9c9JwEhtJoqn13Bz/ymm5VghWgjNvJ/pgB9+/ok42nhMgiyr89PvTix5Wg6lLsFU4r7eV6VTciRmV7/G8Z+0ZEaMig9mqlhRnWC+ACynC52ZWuA39SPPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0VAscbggFXaerrVZXvTaUjo7Tv0uCL8ICZd1ZnItbY=;
 b=mJm4kG1vLXBp1GR9MXhVtqqFsh8vjXW5FVasPhF9DBFis1MjcGdC1ujlf0igGDr2+v2nHJYSXfDlOrG6oHf6m1EvjF+Vy5Dl7uKVPh+IuS1rYWzcNKTxOJvB8v5t4jZNLB16fSp5oz2jgvBBm+5WL2AMoDDDoOgEM8oJ/G77q4t4On5DuS23PBZIKOJoNtdMHOQtvQgCk9xQ4vEtFphDVEc7CQuNxT9Hb/hWLn0HGbWyK3DWp26J8ig+V2AFCT5RRyzyDABnwlgPzvHfNRZhJu6RIvprZeD35zEBeEnnOWIAiNaTOnlb0InB/NlKuZNGTjVqG5r6LKa2+kqh8wqjhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0VAscbggFXaerrVZXvTaUjo7Tv0uCL8ICZd1ZnItbY=;
 b=Ry5NAJt1QoK6zQa+Ip9AKNBbbhZmGnu8e59GPvrli3IeaJH5B4y7doQD3V0b1BRI3m5SQSFx/ScRIrm7lzh4S2e7DUr9CkliEkk+uwBu36fICPavUPNdt42m+5PuhMIBipTN6qHbnEosKQeBFbFV0R/Q9lQfORJ+AwqPoo8pjIE=
Received: from SJ0PR03CA0274.namprd03.prod.outlook.com (2603:10b6:a03:39e::9)
 by BN0PR10MB5032.namprd10.prod.outlook.com (2603:10b6:408:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 17:17:28 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::61) by SJ0PR03CA0274.outlook.office365.com
 (2603:10b6:a03:39e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 17:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 17:17:27 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:55 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:54 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3d491523;
	Fri, 6 Mar 2026 11:16:54 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 00/11] Remove use of i2c_match_id in PMBUS
Date: Fri, 6 Mar 2026 11:16:41 -0600
Message-ID: <20260306171652.951274-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|BN0PR10MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: 96aa5883-2632-46b3-d368-08de7ba43dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|82310400026|7416014|376014|36860700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	1wQSVBvEysqnEDZgpvt0F8lOsY0UG1Os1386+uWudWdTQ96rxGJ0veDFj+veLGCAFWSa2hOKp7CkyVyPJgQ2j/ec1S5btkq18MrDXnyGX9Qu5JzJopvVQN49+tbRq+/39vsd3atrQgUY6RDiYy7q3HChhXgYzxyP7VEUlhha3RCTsp2uR75YAk4STqM1E18587rwFUkfbCGmHwdp0o3uWzakYysgAzr1JXQs1AxRqJ2J0Da8xXmiCGNZwPFSquZSY4V/4yhV6QkSelqddEMaJL5CIJ1oXddaGzswVzKuLISD2rlQvoadi6U5l5NA5tFl3/lWLB4cPYz9yM2GPih6KrxXMw7MY7Z46ilAiIaeBfsauDP7W2FH0zhXccTRNAVjMg+A2jKVnGKJ7hmGNNvVRUtOOXXm1SmAZ52TfjpDriCDNcR8yiIRPPbVq/6UpxjL7o6oB8KY/bC0uIqsA1/9Esc2pva1o2AxPqBwacmdPCOywO1fq/fsKOjmYurD6MvrMreXXfvTLhpB7I0YgQXzplY9bxtoc64MvfJ4S9RFqTNxXMmcJPkhnGgCaFy7r6R64vo6hfH1kX1CncifJaHWYsgOjG3TVCpKH26s9hOBmlzXNn9Ev7pC2NNAYvZbhrfZ1kFlBqmU8jI5tpGmFIte7w0oDTL90NEApv4djzHbVybuFs4sLn9V3ZgLEinplEl6p5R1zIXQqteOcH3bQARjAN+HTtOSWywdiqvXLbrhY/rGBE913BvoB51pFr/b6SeGMtkAkUBpE2IqclBh/7U71Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(82310400026)(7416014)(376014)(36860700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PTKGH25aWxdXLD1Jt7V1kIhGuzhLC3fdAHZgNKLVar0PkRmgy/tE1K+qGxRM/kBqVV1pn+zhgbeaJeEe/5HFdMidpMUdC5zExdR2x7jMOSLHKrHs++50gigbKTZE9O5OWJZAH5DdzpPEQk7Nwk46+ChI0Q+I/oVWTTP3j/nhuaKkgwaFn4IvNaqiYJSba2JZUH7DH+otsvnKG0c/gTmMaCQ9MRRBVACKQ1174cGqN0/BFcdi5rIela0f2QjZusUTa390XHsChGDPMGekHN8XL9jMeqIWbznXjo4uLKRPSuw3ENaXvGYkE9CVgKl0xOk9RZ0ZvXbOQOmSTPao+sua+JXePdI9cYJhmW6XyD99dtiGYPxdyUiwhwVu1O5eDm8jrW9QQ6268NKfsmyL1uKQt05vV3aS2aVmqV6A1I/OgjY8SuHwqN5iKmBBqIcSKooN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:27.3122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96aa5883-2632-46b3-d368-08de7ba43dc6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5032

Hello all,

Much like we already have done for HWMON top level drivers,
we are removing the i2c_match_id() function from all hwmon/pmbus/
drivers now. Using i2c_get_match_data() can simplify code and has
some other benefits described in the patches.

I don't have most of this hardware, so testing is very welcome :)

Thanks,
Andrew

Changes for v2:
 - Moved enum value [2/11] to prevent 0 from matching valid device
 - Trimmed all commit messages to only patch relevant info

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
 drivers/hwmon/pmbus/ibm-cffps.c  | 16 +++-------------
 drivers/hwmon/pmbus/isl68137.c   |  4 +---
 drivers/hwmon/pmbus/ltc2978.c    |  2 +-
 drivers/hwmon/pmbus/max16601.c   |  2 +-
 drivers/hwmon/pmbus/max20730.c   |  5 +----
 drivers/hwmon/pmbus/max34440.c   |  4 +---
 drivers/hwmon/pmbus/pmbus.c      |  4 +---
 drivers/hwmon/pmbus/q54sj108a2.c |  5 +----
 drivers/hwmon/pmbus/tps53679.c   |  5 +----
 11 files changed, 18 insertions(+), 47 deletions(-)

-- 
2.39.2

