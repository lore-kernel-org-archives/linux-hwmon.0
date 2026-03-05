Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazhn15010019.outbound.protection.outlook.com [52.102.146.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68413ED115;
	Thu,  5 Mar 2026 19:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.146.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740617; cv=fail; b=I/F4CKlKWw6gdYT5smoekYdIeZp0ooUPMNirLxdA5nJKndNEkOPEyYCf54m+12wLF3IpU6UQ8myWC0ONa6b81t9ZNkVQjKdRDogzZ7ItRk9dKtB80MNQxOKLBTE4hJZ4PueOyz2cXPkqohQqh06AD9SvR46urDj09WMkQ/IB0EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740617; c=relaxed/simple;
	bh=/8qbNfm0PPPrqV+LVMmhzPvWwdqbCx9SrXC/dzghbh4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWgINx7VVzo9ZXI4pE6ODVN2lS29M81MOH4ZSXoewmqvKhQSinnb4l9uRvAjZCeHHTTNb9mQDJU6wryh9IViH7y9vj+Tr4T2Tu1jGAG+10Y59EuldRDcHmjcA/ixaD9pHEy9SUcJd7DHr8BD9loXPmKQt+LoglyHPlYY6TKXhio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WiHWjAON; arc=fail smtp.client-ip=52.102.146.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WiHWjAON"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9sw59j0Y5RwijrRBVgRN0LbQNOrfnTrxiICY7wb70ML+1/6Y3JhGuTburzqa5nL1X8eu/dx80nZRobJsjDeXfkcwiH71/b+MajWqNzOMNALiBAX3UkoLgZfThapGpf2EqAfUYNzm9SwAv/luhH+/zcD65Zqkpl1MNN3QLeqtZelRkcZs7wqXkUYCZlZ4HsyeRiaBl1LwTkzdqXwC9ITZrK3ExLiN1dblWpK1aXVeFTzrYAa1+kyflyBkWPxYZrDAeDWp1R+ymYALGLeMwPB1eR7C7h9yv820mYKMp5IY5SfaO7TUdGnM6DHsrNjHNA6mpqv5ZoIawnoPMyS7fIQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nktt/J3SK4kqg0Ff+Gsb3bybv45QLdDDwC1k1DRDJw=;
 b=soi3w/KeXcJUdJx1UPUqUhReWvhH+JJeee3ASrErhwVMyy+fqkXY4Hhh15Y0fatYg9P1AnAYJRvKBePNR/2TPUpwDbhwwzLJfLfFFfEsW5Vj9VhvI6lbLvS+emP6HECqhl16wsELCR1OEZlmfNKjDQoycflSdNrO3NGaqAs9SLzOGboPlWEVmgvmv6WPoPZqGRLjtbhUAtZOpu7hbxtJM4O6dSBK90ffe80LatOSmXDql9Mb13xw7GW73Y/Boq+4Dg6K5yrSmpJfeatMtUSLaqEVhKLJmorkeQtj4URaFrLBygQErBgJ13c5fkZaVHXXKCqyVmjV9hFJIcofPrn3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nktt/J3SK4kqg0Ff+Gsb3bybv45QLdDDwC1k1DRDJw=;
 b=WiHWjAONTXuYQu4qzAL3XHlhc6zmCe54N7AyFFcFG7zUpNLWB5glgX4vXlB0EyXvUSkyG6vpASf6xWW2JDLFR1nK4pQAhvCoYVpMfvRNX3kE8eomfTLzHm4BG65/Yf2w4W//zSw7nRNxlrH3uTW7VUml8sQmRF09IDXDgHF0vZo=
Received: from PH7PR02CA0030.namprd02.prod.outlook.com (2603:10b6:510:33d::24)
 by SJ0PR10MB6376.namprd10.prod.outlook.com (2603:10b6:a03:485::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:56:53 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::c4) by PH7PR02CA0030.outlook.office365.com
 (2603:10b6:510:33d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 19:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:53 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:48 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:48 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigp2456638;
	Thu, 5 Mar 2026 13:56:48 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 09/11] hwmon: (pmbus/fsp-3y) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:40 -0600
Message-ID: <20260305195642.830695-10-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260305195642.830695-1-afd@ti.com>
References: <20260305195642.830695-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SJ0PR10MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: de0b7722-ed39-4b03-36be-08de7af158f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|34020700016|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	V3bX/eckxnCyut0OJbJuGP/xfr6PPILxANWeWwvmxOIeyTeyBswLe5bWSBFNPN9KxzrHC+JkIzHFzqSnOAFun5lx9ZmePHKWIdRO7kn3JhDeLlHs9+dbaxAsIaY8a3HaI5loM/vA3GAdL0L4H5GzmEh/Svj5hNfD8uhY/rJXtQ4JEX4bcJXMoPQdVPsZjyPYkGZhmw11+wXMoxtiLhu+rZyJKAgBUNQjiibFrStIYXkPgVW3BP5zWYPPXmgPaopja3o1aAP4uxsV9uPmNsQrPLabD1k+zPnRkeXssyXnwD9/mipoFwbEhanAbOjfJQh5T9N9am1Vwk2LqMe86pQcesDMvWAsInKHggaYY3XC408k+97/lGKX+EKETGOHbNpzOPwA8Qq85mtBLpO8wkWUMiSWJyY7bHGlC2gMykva3ngPXtnCXr865Ea4H8wpNNmzPluvjdRtbFOmHr0Zo7ubnIrUwytCl8/j/RUhFL7SesD4Xk6dUC6rAbklfbU9P9YSe1tNaijT4PTd86lRFlIt/4bg2bpxBHPfwVhbnkUVLlEYGcbEiubKhwc5Bc0OexOZvGXnH90/jdlLsYBMVDgRWfw8B6MZqne/+TEJfNqgGmtJ88CfGW06O/prtWzso461HR2Aes+oFlqmtk/5hGieLk9Y43i1IFYtY3PwfYYTWRoL7UG1iWycvWlYUd44b44r2EQGLTjpW0xRjEI8DTcNEsQBVulR9QOFaweyauMwmLrsUO0qp03CpMBK2l1pqwDK8dFv7RX693XrYWS+c2R/Qw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(34020700016)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y4NOiH4w7SNJhBXTwpVMHq7VE4J8Jk1ni4anVStXrcI1h42I1psdZXLVTxeK8rZdA5Nae2WGB6Efi3b3HptkKn6VF9cngfNrKWbm3c9yQjkWRJOapHPoACkLp1FEAp5PUXZaYOMElh4J+rr70FTSKm4lVZg/P7ti6V4lEzrCimXWo4O0ODT7+cKcBlRH6ttnxSReB9lF65LnEDutdcVtXf9IOLT/riz/IQ9TvY5GaJW8a8k6rCHQ8d/4Kktmq1NuKUClICo5E3pGV1VVPfdtTfXsBqdMPg/4F4nzTlAK8FkSrVlVeEe/oLGGhxazg2D59nOSG6qWGDgr4RksObx6vqyXqcNp3qUSfc3S+CiTXYbq4kEn/GnWK148ASMYABkKQ5YFzZfMiAJuMPD73ncrHiHl4O0JobF21/XPWkqM3SnIdZxjIjom01mHH1IuBYu0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:53.0598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0b7722-ed39-4b03-36be-08de7af158f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6376

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove those or
   move the i2c_device_id table down to its more natural spot
   with the other module info.
 * It also checks for device match data, which allows for OF and
   ACPI based probing. That means we do not have to manually check
   those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/fsp-3y.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
index a4dc09e2ef75a..cad4d23300036 100644
--- a/drivers/hwmon/pmbus/fsp-3y.c
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -222,12 +222,6 @@ static int fsp3y_detect(struct i2c_client *client)
 	return -ENODEV;
 }
 
-static const struct i2c_device_id fsp3y_id[] = {
-	{"ym2151e", ym2151e},
-	{"yh5151e", yh5151e},
-	{ }
-};
-
 static int fsp3y_probe(struct i2c_client *client)
 {
 	struct fsp3y_data *data;
@@ -242,7 +236,7 @@ static int fsp3y_probe(struct i2c_client *client)
 	if (data->chip < 0)
 		return data->chip;
 
-	id = i2c_match_id(fsp3y_id, client);
+	id = i2c_client_get_device_id(client);
 	if (data->chip != id->driver_data)
 		dev_warn(&client->dev, "Device mismatch: Configured %s (%d), detected %d\n",
 			 id->name, (int)id->driver_data, data->chip);
@@ -276,6 +270,11 @@ static int fsp3y_probe(struct i2c_client *client)
 	return pmbus_do_probe(client, &data->info);
 }
 
+static const struct i2c_device_id fsp3y_id[] = {
+	{"ym2151e", ym2151e},
+	{"yh5151e", yh5151e},
+	{ }
+};
 MODULE_DEVICE_TABLE(i2c, fsp3y_id);
 
 static struct i2c_driver fsp3y_driver = {
-- 
2.39.2

