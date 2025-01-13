Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8476233D8F
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jan 2025 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758188; cv=fail; b=Sr4FKZReHJO4RYzsFFushej7FdQZb9IaGt2lDnatshSPd4ab7Cb9o2SGuwPUAjwFrd+yii/hz34WLX+ZxlT0A4CrAj5sV3T4AJ0iEj7j6T6BGSjB1V/uCzBOhNu3wTVGZKuEDVE1sDqXA13gBJOsaadlhGFOOJnwIbqiC+gs3h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758188; c=relaxed/simple;
	bh=qTkzxxhuB5escHo6yyfnkRtU8Lg4SopvhfhG0wVjCMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hx0ePvzWw7Sq57T3DQspoDbXjru0M5eeXHMAdf88E9rdl3jDUSO+ATC6bKAplZa/MzNOkkJtuthr2+Q13hV58kndSCHC2L00qzUR2BecVKRSbU8UPaa4ELrjg2oKiCiqwOVxHxJAlQsl9blak/GYznHNmy2EUNK43uG8towqc5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N5rl2Snv; arc=fail smtp.client-ip=40.107.96.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N5rl2Snv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eep4uO6IdxIoFh9wlEbBKbozSZYP6Z3w0Jrhaxl6EhGOa9c2Undzd/M8hdiqv7SQUdeBCsNnMCFaPHMH+srlpNIe9qnGuPIIWWu/++SHehWPFCeA65awdGZE3gUavr/cH9JlN48o9jOjorB7nOHPT8URExrDMPdBRyOydeEpz1oM80gk1TH5qoUIp7sBP6BVcUfvAc3kmFcLn03PxIBQdh8LUDiB+LgccGO4Yg6Uzf2yz17PFZ8B/UwDJxVtmVQZJuCYDPa0KvBQNSsI97z4Z/1ut6Z+pR1CltsHyCNDobLisgY9Hx+DgktoIWHnYXeQybQJYSW5C6alr1/LnGmQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYMTSDTqs/gCV+J/1ppeAETg3ADdwBX2Ep5fbLzD8z8=;
 b=Cb4gB99sYT9RRkYh6vCC7rWMI1Zm/pKSC9Sq9OEwUAGbn9mEi4xNDoDrlKuOsOehgYYhvtv5pjHj2SDbSr3BSbYkae4xu+o1irAMvN4fj3HPnrBc5zg7/VNhdD6Z04MV9EXlBjuE2ddG99096yiTqGuCgJ3yEi/Rf+KZP1HkzzSzT0RMF1IxUH7+LNtmDvaGvXpPvWaJQxxXMDWBgMYf7RMqpRc2CBlaET3xMIW0XZcfv6OTdMT1wEKjnwQsTsP77dk0U7MeGVyqYMXKZf1ADK2RmNtXa57iOqmtHqp2LrX+TEXeHxYE2q8VKD+7HEpBBqFLkzgkc8dfTlppR4WtMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYMTSDTqs/gCV+J/1ppeAETg3ADdwBX2Ep5fbLzD8z8=;
 b=N5rl2SnvDAHLmfiVT+O1hpv3wxEz5LU0fBhhv8xeNFsfhAVjEG2udX9XlE99f8jyUsQ2zLq6klUaPFXyQ+/j7jvQcFqcFhItU9Nu6pOK9lYqTSLkUbG5ZG7urum3Jv7WHJoCj2XnnmFjmoQnqSD2qUIVdsKXksXQ86/uolFlNwDIRc1YBl/e3ydVM+wX4gD98NH7ZjP0/9+Ys67xKihA0ngiU4o0t5g6VtN1y3Ohv1ZT2+mkv8MJW3jxwEikA14Rj8xaMBImTKKjpJ6MWCKutES+gpXrHSsvE7kGLk8oFhNszy8lrDJQ6Gqwv6lO/ubvRbu4bHkEfNahtzXNWROuAA==
Received: from MN2PR20CA0028.namprd20.prod.outlook.com (2603:10b6:208:e8::41)
 by DS0PR12MB7606.namprd12.prod.outlook.com (2603:10b6:8:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 08:49:43 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::fe) by MN2PR20CA0028.outlook.office365.com
 (2603:10b6:208:e8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.19 via Frontend Transport; Mon,
 13 Jan 2025 08:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:49:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:49:30 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:49:29 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon 2/2] hwmon: (mlxreg-fan) Add support for new flavour of capability register
Date: Mon, 13 Jan 2025 10:48:59 +0200
Message-ID: <20250113084859.27064-3-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|DS0PR12MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dab9a2-a9b6-4375-938a-08dd33af393b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SfFfGwMJ2FzOWpIZGSMLd/q+9r1V0mX3on/vnscR3FjiFUbPyxBue2bMycuW?=
 =?us-ascii?Q?0TTainKtDCF79jTHbSv+ajTh9kqlqCuKMu5qj3Yiu1TybroaZo/ulHJh9Bl9?=
 =?us-ascii?Q?9rP0JvRfeEwMW3Jgt4p2qJ20uobDKkbCSCccoNhCoEw9MwiudRHQBLxP3Ks1?=
 =?us-ascii?Q?u51BgsHu+eEIhpNuHJxHAI8yng62htbA9FAJT9dl08QYjNjyR8Libki+NT3J?=
 =?us-ascii?Q?dG93RXkrKVW7whxxrU9aPJGHxiVaTfsJvZhH9Ic5LWIu4eV6zBRi2AFXzdUM?=
 =?us-ascii?Q?Awv8TT44WR6SRk+zF90fJ7T0mShlXRCZ2XXvW3eIrUX1eoVcdIH2OQ+O/n3E?=
 =?us-ascii?Q?aC2B3jsMH1CWOHEq2mQm6qSGUP4sNTnyKiRqh8lElllAvzTky3oZR69wDK4i?=
 =?us-ascii?Q?hEhNf2RNx/ZBSnKKzM/uabwJOfJ/uUFeUNtt7F9+lXRYBZWupDVQPRmiUHHP?=
 =?us-ascii?Q?v+/fmd7wRtmrkfVpikK5iK6Gz6m5aOPY3IkPUKBGAPtUXnEAptuMGIDFX6Oj?=
 =?us-ascii?Q?IqDyr67bN3Ni9IPsUfdlYY4B26zDiJYGNJ9eRGGojywRbxXG0yf9fy5KZ7x8?=
 =?us-ascii?Q?RiG6XElWWuM/MbqZqyXxjcjzLefgDtmr3yt2GxSSbDIJaqc66RBSKEnwfryi?=
 =?us-ascii?Q?MdwkcAEkt1j9x4HRmlurnFp/bWoX9/bhZqI81qhmBYxZYgOKzvQFuxJQzEdo?=
 =?us-ascii?Q?MNYMULzSch6fnNonv9ylhaMLL0FY6ZxiGzdJIDyrRCwG1i/I4pgs+ml6syCS?=
 =?us-ascii?Q?HoKoOqoBAQ2aeAEJ8lE2uXso+4V93ldWt7TqblR+gNOJFt0qKDf5EvAAnNGK?=
 =?us-ascii?Q?I7RZ2g7qB+NcM3tCEDmgRo81FY7lbX9PrJavEQ5gYQjO/wiSnPeVou13Eccs?=
 =?us-ascii?Q?zviO2Y5uz7l0hAPMeq4yuN2S3kibkJE+y18flnXnzPhFRpt43vv29nWvO3lM?=
 =?us-ascii?Q?0RHtbMrdlIhFuZj8xc5thJsKWOv/q/soco2q4mPYpPLHjrsLgZhAqrLn5sOg?=
 =?us-ascii?Q?jEk+KXNs78vFB6vdf+GMnRNBLrZ/vCKLWoLcKpG24DKp19E3VHlIDHCNFBk0?=
 =?us-ascii?Q?wj8RUYjE6V0HbAKDNdeIjzcGMrJaL3WLfE+Igks37K2kFVEJ5gxiRJG/wJy2?=
 =?us-ascii?Q?g1hkFu1tnpxXjVd1O1bAM1RM8dBaO6DroOkTVRXs7XUuueojlhlJSAEbwSVp?=
 =?us-ascii?Q?nZ1Tu8PDckjz4yPBip1fmaCFysV2m3KIQQdy6OUj3HgDqLrgHxbxB7V88OVF?=
 =?us-ascii?Q?d9YDpGThvRR+U5DM9Lo2KzNkIbkad/e8hTnbOBQb1WizNlRLibnWNKHHuvFV?=
 =?us-ascii?Q?epfKuFOSOX5koBiOtKklK7gIZzCGwAsXj2HJOhza+m+2g71xs9lBtsOXmVy8?=
 =?us-ascii?Q?dt+PawQsfACM6plArg1MRXvUBk6FW1Vgb9lVcYDriifIpGorlL7XTEGbpVp8?=
 =?us-ascii?Q?SUBM3DKaGWrsGjn4swik8+/Z3NCCFA/ihI38t+FPmWJY7U+qEeLUiQF4bb0K?=
 =?us-ascii?Q?gsigoDk5l6oTePQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:49:42.6790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dab9a2-a9b6-4375-938a-08dd33af393b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7606

FAN platform data is common across the various systems, while fan
driver should be able to apply only the fan instances relevant
to specific system.

For example, platform data might contain descriptions for fan1,
fan2, ..., fan{n}, while some systems equipped with all 'n' fans,
others with less.
Also, on some systems fan drawer can be equipped with several
tachometers and on others only with one.

For detection of the real number of equipped drawers and tachometers
special capability registers are used.
These registers used to indicate presence of drawers and tachometers
through the bitmap.

For some new big modular systems this register will provide presence
data by counter.

Use slot parameter to distinct whether capability register contains
bitmask or counter.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index f848232c2c00..01faf1a8f55a 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -63,12 +63,14 @@ struct mlxreg_fan;
  * @reg: register offset;
  * @mask: fault mask;
  * @prsnt: present register offset;
+ * @shift: tacho presence bit shift;
  */
 struct mlxreg_fan_tacho {
 	bool connected;
 	u32 reg;
 	u32 mask;
 	u32 prsnt;
+	u32 shift;
 };
 
 /*
@@ -143,8 +145,10 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 				/*
 				 * Map channel to presence bit - drawer can be equipped with
 				 * one or few FANs, while presence is indicated per drawer.
+				 * Shift channel value if necessary to align with register value.
 				 */
-				if (BIT(channel / fan->tachos_per_drwr) & regval) {
+				if (BIT(rol32(channel, tacho->shift) / fan->tachos_per_drwr) &
+					regval) {
 					/* FAN is not connected - return zero for FAN speed. */
 					*val = 0;
 					return 0;
@@ -408,7 +412,7 @@ static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
 		return err;
 	}
 
-	return !!(regval & data->bit);
+	return data->slot ? (data->slot <= regval ? 1 : 0) : !!(regval & data->bit);
 }
 
 static int mlxreg_pwm_connect_verify(struct mlxreg_fan *fan,
@@ -545,7 +549,15 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 			return err;
 		}
 
-		drwr_avail = hweight32(regval);
+		/*
+		 * The number of drawers could be specified in registers by counters for newer
+		 * systems, or by bitmasks for older systems. In case the data is provided by
+		 * counter, it is indicated through 'version' field.
+		 */
+		if (pdata->version)
+			drwr_avail = regval;
+		else
+			drwr_avail = hweight32(regval);
 		if (!tacho_avail || !drwr_avail || tacho_avail < drwr_avail) {
 			dev_err(fan->dev, "Configuration is invalid: drawers num %d tachos num %d\n",
 				drwr_avail, tacho_avail);
-- 
2.44.0

