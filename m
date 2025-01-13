Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E3233135
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jan 2025 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758187; cv=fail; b=PieVfmbHQkrpZxVF7NtcXAr3uZfWJr4yaoB0cHLB0W1o20jBL6gxOudb2mYhKA4cZae1cGDBBR9xB0Tw+tvTanFmlJHpSNtfqIJWsukd/uJUFz+gis4ZBob1ps4bmoCVzyUpBqFbR+fO16IILeWQur3SmXTLaJacuekUPKj7TUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758187; c=relaxed/simple;
	bh=btos7t/AYf8xeQ/fv46ONVesO6E/UYVTbK5lqCbYCjs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5P62/7U3CXdas7e8OhZmNGXQwyBmlLgOCkbQ6GEAtf8eUc2QQAAPvOpYMHmgNJ9cX/Dvfl8KYwXkgsrpdFi5quyNbMaTtv5Yws9zTXHJu6fVVrsRq0DLQA696ugJ0Zv3NWBgBTKbCrNX9UoNDHqL/y0YklsJk3gp3GT4Gd5wNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D68mK4zF; arc=fail smtp.client-ip=40.107.212.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D68mK4zF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbKJKGHCYFZ7xVZTfBxS8l6oDhFgu5fba9VxQrMR31xpK80o9Po/uqZlwLvuH8DdwfITVZ0xV4t5n/WLgKKi33O4zybDqxux6KOBnQuvtA54V5EyaJY2A/JoCcJk5DsSpZZH6VOUPxHCwjXiyri+VGWDT2/4QZGxc/QgRuz5OqG7vbMuEoN9l/QzJ29dcDnkmXzcDLb1ZRXYXqp0iEYg/d+YPjaPvPqtUITYltfG/GsGGY228DlU7al53nFekcEuHQTPk8/aXmR/sXg9GAvQQudNxen0FfzlphaIFAp2mILHjZFzS4ryJLRjBCtHZOIRCU5FGegSgELXxIL0utr6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JVK76uWPmaMy70gCNm4VSAA1Iqtu75Llud0yAYqkvI=;
 b=HgfZOH6iJtsvKTeeG7CNVATDjlFeVetjcHQFeJ/pca+n+NZdVZ3Db4obrVMI/xpR/F5T08M/reiJzX2LOhaDoeEXqrYINbdM3emx6GpAnmTqne8+LPVHLbqsUMPhk3rsIWC8lAvJ1NKWh2MADZiFcJUgHazrd6K3675BPPznqRwQGNsCxrxWQqKxpJyn9cyVA0Ob5JJ9UN8SCGhzsuhN2Vg78206MCHpOO1o15KwlRCfJwqjbz8B2dJoHvLKkEjJxvPttCU3wmH8HpnwbTTi81N7a+zfF+gFHMwcplS1CSYcD92lGDvIAhQfIf9XY6SR3xTAkno9gm+4V44BiLgXdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JVK76uWPmaMy70gCNm4VSAA1Iqtu75Llud0yAYqkvI=;
 b=D68mK4zF9cdCdkfy0Ac0Yu36KZ6WkSOQRdVaPva48XAjzU1zU8rfwaswI5+6AkZJXQp6AtjEJWkfnLeaz2/a9rfMKague77a/GUgBYH3TkvycLiMAOZ/xlqHDN4esWY7xUbRsXu9eAczCYsdOt9Jvffu4cxznaBpa+R4OmXjpBY/VPxqCOCtOc2BPx7gWRG1qbEa8NkmWjsp9zn2ez6i+YPK+Zx9bO2uH1TUT46++qbyGZFoNebXG0b93g8ijCklSUXsRMTgi0uwZCnpNH5F47mr0nXqEvRX9yhphKj+icAVg2AZ04WrBi7LK+M/HGYoF2WvL3G3ZlKvfAdesmeeIQ==
Received: from BN0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:408:e5::35)
 by SA1PR12MB6751.namprd12.prod.outlook.com (2603:10b6:806:258::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 08:49:39 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::78) by BN0PR02CA0060.outlook.office365.com
 (2603:10b6:408:e5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:49:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:49:27 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:49:25 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon 1/2] hwmon: (mlxreg-fan) Separate methods of fan setting coming from different subsystems
Date: Mon, 13 Jan 2025 10:48:58 +0200
Message-ID: <20250113084859.27064-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084859.27064-1-vadimp@nvidia.com>
References: <20250113084859.27064-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|SA1PR12MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: da620b46-e105-40ed-e896-08dd33af36e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XxipraXePoiyiXIUuc4ISU8QCJn+T+vNERBOa77FWHnpEDfn+6Uoz+POHfmk?=
 =?us-ascii?Q?wDlplL96Est4X+OpQ2z2Mu2lgeZouhWbNwEsrXDjn0zXf2tTGWhmBRsbfyfF?=
 =?us-ascii?Q?HDHZEzRLQN3TnmxzLyJmottk/cDvh3tBX8NtzPnwvrJBQGE9cqcf3cniLsbi?=
 =?us-ascii?Q?cKlHVUclBfRjb+HRKwaw2W+l3WGfQuV7YTvCV9rvsVtuzyBc8Y1Vn3D5y6tT?=
 =?us-ascii?Q?pEn876AJmMcuXY4vFSoAHV9FmMh95Fh5G7eSvs8k4aW9H3x7F02xZUGiEPmM?=
 =?us-ascii?Q?bGPt0kaFbP3B3Ru41acR+//SRdCdzuaTJkBejgt7VYqY4aJBw+9WT5L+hJ/c?=
 =?us-ascii?Q?8rLqV9fPXOqTQJKIc9bommXwIme+WucE57OP7NN/gI7nM4unPPhFHrqu4AEj?=
 =?us-ascii?Q?2AWJtNw9Zpt0/3fGYGOU4t/3QRzQcmLD0nN4+qfDa14IePm/AxUSJksQBG4P?=
 =?us-ascii?Q?06t7jf/ml6LeEdtm7h9pGyy4eCM8+J9k0lNFait4KADSXOJ1EkR3mIH4hTkg?=
 =?us-ascii?Q?brGs5/5zLA9PT5JBYePpB+/ncjhAu81eJfLxxWmmFs63XybdViL0PIdqGqKj?=
 =?us-ascii?Q?2uEgfX/cb4EneruYcsqt1CUh+i3qTlyxmovvNhfh6Ft+KhkJVPhdDRhqEOEg?=
 =?us-ascii?Q?6hLxUrouDWsLYXPIksdPvMYJcuD6T7oF5/DON0Yb/L5/a+w6gbPF0adYJxZU?=
 =?us-ascii?Q?josBWVzzBS44KB4uReTseN/m6s6SezE2rd36e1EHvkgUIMglL26IexYemOzY?=
 =?us-ascii?Q?zxanMf5eW77eG++7IrKctx84T+CFpK9J1cpR1IwFPLOFHxXArbZqYJqSE+NK?=
 =?us-ascii?Q?1y2CNZhvKjrHiFwcjhemwiqXO4VVgZiP1S1tPTsWU1P2HBYKPrf6VAcN3Ho0?=
 =?us-ascii?Q?tfUEzcCOD0R8ZmYCG2K//yG3tFZucMzyDHPblhsrmEfwcnHnykkcKO4M08rb?=
 =?us-ascii?Q?63zkjQ8kDk8IJ1z+HWKr6NrnYFiLkK4JP7Z0jAa23zKvYnXky++IXPLqOPNk?=
 =?us-ascii?Q?KehglNMzWg5GtYkmLrTGNbVSkUk1GlTiE7Hud4HNpR0HwXoxI3hkjo7SDH1+?=
 =?us-ascii?Q?drSxKDACmKO1vNzreRsANeyD42gxbGFDbkKQ/LgmPiBT0fnRAx0zMPCpjFpX?=
 =?us-ascii?Q?KJePqZwzLn2P/iyqcMPmJM19OFTmVuaMEEbtuBAcxqX0feyV14qEIQ8cNL3F?=
 =?us-ascii?Q?k2EPRVbxeDgRsLmFD1mJkELwyfcQe773ZSGCO9NfvpU8RX6A83viWfULJP5g?=
 =?us-ascii?Q?af88YCArMPiIgrzk+9FGTDlG5q3bpMsrhXesAHhB+iz1M8MWAAPl10j9mobx?=
 =?us-ascii?Q?uWCE2eftwky0AQiNTmdBrbZE4WAIQVt3W+0S1fe22qnhosf3g9cLCKp2CFVC?=
 =?us-ascii?Q?LrGxay7PVgFVwUIWpCXWOS2UdBj2NDM1ASbtwCylOoIMsGeyEz9prjYPmW9d?=
 =?us-ascii?Q?LakRmlq6qmCC0FyIIs73hZUYEzt8AMXGwknzA8rVGmQxFQ7Smb4FYhr3ClRh?=
 =?us-ascii?Q?tcXNqX5MZ/gjIls=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:49:38.7777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da620b46-e105-40ed-e896-08dd33af36e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6751

Distinct between fan speed setting request coming for hwmon and
thermal subsystems.

There are fields 'last_hwmon_state' and 'last_thermal_state' in the
structure 'mlxreg_fan_pwm', which respectively store the cooling state
set by the 'hwmon' and 'thermal' subsystem.
The purpose is to make arbitration of fan speed setting. For example, if
fan speed required to be not lower than some limit, such setting is to
be performed through 'hwmon' subsystem, thus 'thermal' subsystem will
not set fan below this limit.

Currently, the 'last_thermal_state' is also be updated by 'hwmon' causing
cooling state to never be set to a lower value.

Eliminate update of 'last_thermal_state', when request is coming from
'hwmon' subsystem.

Fixes: da74944d3a46 ("hwmon: (mlxreg-fan) Use pwm attribute for setting fan speed low limit")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index a5f89aab3fb4..f848232c2c00 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -113,8 +113,8 @@ struct mlxreg_fan {
 	int divider;
 };
 
-static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
-				    unsigned long state);
+static int _mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				     unsigned long state, bool thermal);
 
 static int
 mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
@@ -224,8 +224,9 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 				 * last thermal state.
 				 */
 				if (pwm->last_hwmon_state >= pwm->last_thermal_state)
-					return mlxreg_fan_set_cur_state(pwm->cdev,
-									pwm->last_hwmon_state);
+					return _mlxreg_fan_set_cur_state(pwm->cdev,
+									 pwm->last_hwmon_state,
+									 false);
 				return 0;
 			}
 			return regmap_write(fan->regmap, pwm->reg, val);
@@ -357,9 +358,8 @@ static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
 	return 0;
 }
 
-static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
-				    unsigned long state)
-
+static int _mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				     unsigned long state, bool thermal)
 {
 	struct mlxreg_fan_pwm *pwm = cdev->devdata;
 	struct mlxreg_fan *fan = pwm->fan;
@@ -369,7 +369,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		return -EINVAL;
 
 	/* Save thermal state. */
-	pwm->last_thermal_state = state;
+	if (thermal)
+		pwm->last_thermal_state = state;
 
 	state = max_t(unsigned long, state, pwm->last_hwmon_state);
 	err = regmap_write(fan->regmap, pwm->reg,
@@ -381,6 +382,13 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 	return 0;
 }
 
+static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long state)
+
+{
+	return _mlxreg_fan_set_cur_state(cdev, state, true);
+}
+
 static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
 	.get_max_state	= mlxreg_fan_get_max_state,
 	.get_cur_state	= mlxreg_fan_get_cur_state,
-- 
2.44.0

