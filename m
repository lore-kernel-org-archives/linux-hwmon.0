Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE46C120
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Jul 2025 20:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753906680; cv=fail; b=N8/qup/A0PuBfDEBXlmyU1MGvXNYMSGFfE2cADKp56XdHI/6G31PMZImlQ3jJ6LWnp2nihcUEVBzuJe4ZHw5IhjSQwBBA5RKrmOm+qElg6sbUTCGfwiEBAMZ9LoX5aH8INmBkuUf+vARG7inRwSPkqdypgqFiL+NrL8t7dUZNsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753906680; c=relaxed/simple;
	bh=DzFceSXcLcnzbxyJO67rIGZPMo3Xl51FmLx2byQlwrY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=POV1dhrzEXAaC1KWY21WVqZ2NuBeIBWThhCsEjHQ4daitoXzJr/wz/5UDozYPtmA1S5dFFf+PkdlOKCuCLE9Xs4qou0bIA8BBYBkTr/yp7iHpJukwUHoCQ0VHf3mZVwPPmjnA0V/yg197+yt9c0MA2wqfNnN5MZleXc7uNLtm2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pW4qr/+5; arc=fail smtp.client-ip=40.107.93.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pW4qr/+5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqeFIaE473e6psrZaevCU76/+VGpWLhd2i68RakbSDIjy2RTqz0rdheJOrBKRGcr+44a0d5kzgCXMABd/APtc/Ry1w2+IGiUx40M/IF6ukt5E3uCUe8JtzOTKBy1jca1QcQ8lv3C8s0uAG9eP3suXNtIMnvArZFF1emwW0tDjjvpHozpCN/9bNFlrd2AXqNasgLIAGF5QjZO6LI5epCF+8mYIJzolFug6Ycgi4n1uZwfhP9XWHWAbHZJJzi3WLTQhgmI2vIUG6lM35PtFvwcS0gT0jCZeTyZKCu3pcNKN3gHUmXgh0dPZVevJ9rULuOWD1CphWP1ZvFJ2ytCeQd3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+OR67HgD+abBeYo5rXDk6uerA+pR039SciAlxZp4lA=;
 b=g3HGMLGLuWD8KjF+RW8liCiR4vEMPLUyD8n9iHWnUZGF34Wemw5n5gscFRewOxvlZw7DHVRIpS+er6K30ykWnPIioJjYDoM0PNzGXG8lweuw+RLSbWVuBvsafyw2HIPZVK2UvgQhiGdh/8kSXZf6eenK2fUXAjupy3klbClYrUdu2I0Wg0g/3XhQ0xSkHAmxKbFN5ISM7OtOtm3JFPoyW6lLhZQ2CiPzptBvrR9BMtO4gjHYD+GX5VyKsIJ6Pfdvk2Yja7QCTysL5JMQmhpUoe/Gqp82JuD3/qCOYwSKKZ2gbrctgXL3Ubec/zRp4a1LxM/aRVYA6CjHiZTwaAfdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+OR67HgD+abBeYo5rXDk6uerA+pR039SciAlxZp4lA=;
 b=pW4qr/+5JT4JXx/PLZNLd7skABfqa6UPjhK/cEWZiS16BEIfVE1b8/0pX+HUp0nsMMRWHPNElhgbF4VUve8AbcocdLzTEY7YlRB1icUBUa4hGzAjNt01Ehg+KQiWmypYdBON+pKmvhvfDM1kQXOs91edyr3OEDMOYV8MCrPAvI9CLxrNNyHcZTp/4CuAqmErjCF24M+vNwrEf/DZYMgqbZuXZSUXEG3fGOrCpJh15s/L7PrHBNmOSo+kFn6elSI7Q9TchvcreURfEB/Ot6pY3u2QEehHosMpafxm2XRvlTPWGyYtLpAn3f9HxRqpriq+W4qO2/mpeuUyYqnrUBeJcg==
Received: from CH0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:610:b1::23)
 by CH1PPFD8936FA16.namprd12.prod.outlook.com (2603:10b6:61f:fc00::624) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 30 Jul
 2025 20:17:56 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::55) by CH0PR13CA0018.outlook.office365.com
 (2603:10b6:610:b1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Wed,
 30 Jul 2025 20:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 20:17:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 30 Jul
 2025 13:17:37 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Jul 2025 13:17:35 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <linux@roeck-us.net>
CC: <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>, <idosch@nvidia.com>,
	<razor@blackwall.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon 1/1] hwmon: mlxreg-fan: Prevent fans from getting stuck at 0 RPM
Date: Wed, 30 Jul 2025 23:17:15 +0300
Message-ID: <20250730201715.1111133-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CH1PPFD8936FA16:EE_
X-MS-Office365-Filtering-Correlation-Id: f1492712-2c13-425c-a70e-08ddcfa62ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BEp0mli7Ziy/eU0UKrp/7K2XymiJIea2nMEbHFIZI3As1NqruIOEcKdoabTz?=
 =?us-ascii?Q?drsgw/+Ez3ewjlBnfSrP+BMQK3IRczuW4Jjhymxov+APTK6VAhJOQmKb+1tB?=
 =?us-ascii?Q?ic+GkWt6ZLlGjjMlXPkIyOU9w74Qc0bMgnro4XRwQuLT0FW3vX2Rr/iWu2Qo?=
 =?us-ascii?Q?y5DtI9A+28lH1ExhQoMJhTb+l7QvzqFUu5RRx5JX4BDkbfSXXl/EC7z/IqAo?=
 =?us-ascii?Q?H+PN7dC2/44wN/2YSsWIKm6ilAror6mghCzmRhyyOdfmc5azmevaJbkcC7Ra?=
 =?us-ascii?Q?v1C21C1+rpAyp0RRGqr1rUZYVtwhACUv36WxFOItM9pONjhJT0Xv0o8SmVqL?=
 =?us-ascii?Q?v2z6pU5s5Qxrh25MFqsMyuvIQV7a2aJDDjJelqgfE5H2P5ZP9NH9oqcexglT?=
 =?us-ascii?Q?BlsQcBQ/OPR65H9nffe3bGSmKYZcP8xd7briagPFxKM+X64Qi+ph2WdsxdPX?=
 =?us-ascii?Q?F10pP5Zm8VdFS9vyQEBjS4NGFBpnVUIQ9kJ0Mza4MaxdFxlu3uqxRwRRyYuZ?=
 =?us-ascii?Q?3KSpbrR0z6UbMh2siDWsYwVMvJmiU7MrIz7h6kb/U2TFc1rHCDnIrjgZCS7+?=
 =?us-ascii?Q?KU2fnF/RSpRgE4AICBgBKYgRUpYZL4/PzlW7Q9hgg/EtvU2jaHj1jxnIU/+L?=
 =?us-ascii?Q?EVPcV4cgKc3H36HJF9nIGHdWSEON+iQbxc8uVwKRcWx70wUZSPiyzrNkK6i2?=
 =?us-ascii?Q?pWtMhxO6SoYeOAfO3KAye/R2q72HozCde81nGOseA4dmSXorVqfckrFjE2Lk?=
 =?us-ascii?Q?JKe0rIfa93m8N1MidLqKu+kZdqom3CGXvQEw7KWXsZWUsedHl6rcmd6fMZAa?=
 =?us-ascii?Q?i3R++tpS0IQAtTz1wmIWKgVeOaSChmZ/DQ2sMKwvVTbbR6osfY5U9hkJw9xP?=
 =?us-ascii?Q?QHe3tM/WrN6aiGw1D6sc4ujgmZqsuNzqVgEcfGEFFjkhAGTEONC4iE7tHSJb?=
 =?us-ascii?Q?fU+YAlbC6rwHniHYf43r9YJSPaeQs0p7gQjfTS4y9LbtTOQaMDhh2bd8CE3f?=
 =?us-ascii?Q?qtu/lmRaoYseGMFnsKmai21KEIxwaJWOxlc5FtA2Im/stGLnebK5ZDnV6nIG?=
 =?us-ascii?Q?0sov7CwGV0kTT1xuyI23JS/rbwH9rHtz/PgUw8TAYu0R3ytjZA7E6r6kQGhR?=
 =?us-ascii?Q?yb9QHrQbyFO9TMfBhYWfVLsoc9fLbLA/7AmejuddU+yFohZFLIDgZyELYRoG?=
 =?us-ascii?Q?sT3/vVSmEJeWR+yApyDkInf7uRPJlflX6IyY1unisHXaQMmltQf+ntPzoC76?=
 =?us-ascii?Q?OBDVZIR/8TV0b5xqVuy+kVa8Ff8R0KI3ze2PvPT0p6AED8VzDas3366h/++Q?=
 =?us-ascii?Q?lJfMi/E3k+50GsrBPePWWcBJ+q9wA3g/EhA3nYzwfKhWJ9eITPunG4dfJweu?=
 =?us-ascii?Q?JujBS/PEq4n1U6qorxr+TZq+ORcXj49OoPPjq1wl9g65GU2aqDhh0cZimqh7?=
 =?us-ascii?Q?j5jXcFTBJLBSs2xOLpxsp+jcWGgojbWrtL5SSAw2FQ4KmAJAeSFi0QKKnZQv?=
 =?us-ascii?Q?rOxDV7Y1MLGXKk7K/0kloXNIVD05z/2nSdm/?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:17:55.8418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1492712-2c13-425c-a70e-08ddcfa62ba0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFD8936FA16

The fans controlled by the driver can get stuck at 0 RPM if they are
configured below a 20% duty cycle. The driver tries to avoid this by
enforcing a minimum duty cycle of 20%, but this is done after the fans
are registered with the thermal subsystem. This is too late as the
thermal subsystem can set their current state before the driver is able
to enforce the minimum duty cycle.

Fix by setting the minimum duty cycle before registering the fans with
the thermal subsystem.

Fixes: d7efb2ebc7b3 ("hwmon: (mlxreg-fan) Extend driver to support multiply cooling devices")
Reported-by: Nikolay Aleksandrov <razor@blackwall.org>
Tested-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 01faf1a8f55a..137a90dd2075 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -581,15 +581,14 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 		if (!pwm->connected)
 			continue;
 		pwm->fan = fan;
+		/* Set minimal PWM speed. */
+		pwm->last_hwmon_state = MLXREG_FAN_PWM_DUTY2STATE(MLXREG_FAN_MIN_DUTY);
 		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, mlxreg_fan_name[i],
 								    pwm, &mlxreg_fan_cooling_ops);
 		if (IS_ERR(pwm->cdev)) {
 			dev_err(dev, "Failed to register cooling device\n");
 			return PTR_ERR(pwm->cdev);
 		}
-
-		/* Set minimal PWM speed. */
-		pwm->last_hwmon_state = MLXREG_FAN_PWM_DUTY2STATE(MLXREG_FAN_MIN_DUTY);
 	}
 
 	return 0;
-- 
2.34.1

