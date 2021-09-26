Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEC7C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 05:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADBED61090
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 05:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhIZFhn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Sep 2021 01:37:43 -0400
Received: from mail-dm6nam12on2074.outbound.protection.outlook.com ([40.107.243.74]:32673
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229746AbhIZFhn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Sep 2021 01:37:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRa7VFjmY7Ime2StV0RbmHTBXws5cJUaK3LOxtMaBi2xIMCYIF8hNS3B8HclW0ZYa8r6oaA81koKAyXeAbI3putD152AJhNz1eeJrAVKV0UsVG/byzobRkRnMCQ1kYvutTKziF/gNCkceeKpI9Ldp5/4Lb3A6lOshhPx4D5al/rxLWPFYl5ZVL+iqVVrVJ9/GSKT44bkb62HKGboGn5sVWcSQpYYlP8Ud35myewLHTf3DPaHNSKhRXux7sPlFBBezFuSUmRa/YZh3ymQLL8bcaMHNgLszGCc6cYKKhvYAnNWi08p0ZsxZy2CpO8fwIV+NDlTGrsjwr91eKGU03T5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mv20YtRARu74sskih5CZ1lxRXqwFCB3RasjDgOz7plU=;
 b=ldrl2PUy5YhBnzg/k2PwhMXfCDfcytle6zTRv/0O+HYhDR3bCYdBphzoLp3w1HgviUpX+ZH9a5gbX+BkQrEWGUzQEcI6yO8q5InsFH+aZaIap2tdm/uaQ6spd0kjYMX59RG7tH6wTNH2xlYcMME6B3o2A6ixaWmT9+Ddocby/uWdGrLQp2AH94e29r39WprjYg7/0WdHwmofMkfHZ8pMa6EIspdwej1GVnfRvPaROwXVEnoWGul/sMEGS2Ald/f/onMaiYchJy6dFQdMx26Gweq0ZfrmZCYQN/f/QdC1QZEItb50KUAbw/n75WzO4MDYCDCP2f0niqW+/NQsUPSXTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv20YtRARu74sskih5CZ1lxRXqwFCB3RasjDgOz7plU=;
 b=I21TqIRTzF59wYXN2JLmb4VU5kAH0njB/wZ1/e8QnERrabDvxobmD5DsT9NrTk6DVpv01Yq6kzXup3U8Lf1f2nL9vSzdgH60P8UWteFeVq6Sf5h78OFUZinyPbJewQqeav13rzwTodypV44GhhWoLC65u+7zP7164KdE6J3vi1an/bNd6332AB0E6PtUbTdEvb/cBiQJrBdMX0XGVXuFpj37QaNz06NqW1IgTCmw8icaDbRnv7VmCqmN7x9rDKADPKG6uuwtnxgCl1Y0c+65baxrAsz1Uk3SVhqZa5zKKH+D74J/Z4sNblptuU5+sBDV1QUT8n2B4LwTQdfCgQCHSQ==
Received: from DM6PR07CA0056.namprd07.prod.outlook.com (2603:10b6:5:74::33) by
 DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.18; Sun, 26 Sep 2021 05:36:06 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::c6) by DM6PR07CA0056.outlook.office365.com
 (2603:10b6:5:74::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Sun, 26 Sep 2021 05:36:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Sun, 26 Sep 2021 05:36:05 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 26 Sep
 2021 05:36:05 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sun, 26 Sep 2021 05:36:04 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 2/2] hwmon: (mlxreg-fan) Support distinctive names per different cooling devices
Date:   Sun, 26 Sep 2021 08:35:41 +0300
Message-ID: <20210926053541.1806937-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926053541.1806937-1-vadimp@nvidia.com>
References: <20210926053541.1806937-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb13bb57-2c00-43e8-7140-08d980af894b
X-MS-TrafficTypeDiagnostic: DM5PR12MB2376:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2376B8390097BDE406B42E55AFA69@DM5PR12MB2376.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wvMGa9fXjnmkoJXoJGLeE/XuItp6Crhy+BUpsjjoEIROxwv9DaqS17I3D31mNOTRavXJ8Pt+wERE7Rd19eBKbhkdChCX6O5TOjCX5SZTI/ZlDP2StvHvfgzAZpxbooiN6aA92x+WZiQCpECjq/utV7JShjFyL7aThIRnzMElM4fTN3gA7g8iCrW+WTFpdzMxaOWIvUBrfw0kQc0IlVGAnkKJCN8vOsbTk1sabUyjxWH/g+NLdkZEycQ9EhFb4+WSrY09dABeGxGBwFXNQJ2npYOSgNbV9yZbTBEWmU4xP5JIrROhN3agynTM3iSYDzJdw9PnaCfm56iYALJSSetANj4XA5gGUh6ddQt0bIbG5Kyj7UMSraES0lYGmXVFpqinvmrwk761mUpwFymwGY/Lb93rxyh7xPxprpxNJD+DKNOxvQCohJz/vGoxufTB9NqDlaF7cdL6O+sUBioJD0xwGYee0hG8iQM4c2DY6+QwmIgmGd7/ySI9aXnhmSfLlRByBepYMTuPtOeJAIN7EgtWipRkL+DgkFyqWxhuZ3Bcmx1JcgBx6VMJhTMWCCbqezl5SqzHyecEGIYqO0ogg4ccBqpoTJOEXwNMvikmS9aQcIOVhKYiL41Z/54GxsZN8PQSHrKlN5MLCQIqF2PDwixuYc2Hb00IwNMoDR3FTmUnpoEv5qH7T3KM/cfepaN6+SjBg+5bPmVxAsm6gsVSyY8CQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36906005)(107886003)(356005)(70586007)(8936002)(4326008)(316002)(5660300002)(82310400003)(508600001)(7636003)(6916009)(2906002)(8676002)(70206006)(26005)(36860700001)(336012)(36756003)(2616005)(47076005)(54906003)(86362001)(83380400001)(1076003)(426003)(186003)(6666004)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 05:36:05.9441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb13bb57-2c00-43e8-7140-08d980af894b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2376
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Provide different names for cooling devices registration to allow
binding each cooling devices to relevant thermal zone. Thus, specific
cooling device can be associated with related thermal sensor by setting
thermal cooling device type for example to "mlxreg_fan2" and passing
this type to thermal_zone_bind_cooling_device() through 'cdev->type'.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 8e5cd6991929..4a8becdb0d58 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -263,6 +263,13 @@ mlxreg_fan_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
 	return 0;
 }
 
+static char *mlxreg_fan_name[] = {
+	"mlxreg_fan",
+	"mlxreg_fan1",
+	"mlxreg_fan2",
+	"mlxreg_fan3",
+};
+
 static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
@@ -565,8 +572,8 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 		if (!pwm->connected)
 			continue;
 		pwm->fan = fan;
-		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, "mlxreg_fan", pwm,
-								    &mlxreg_fan_cooling_ops);
+		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, mlxreg_fan_name[i],
+								    pwm, &mlxreg_fan_cooling_ops);
 		if (IS_ERR(pwm->cdev)) {
 			dev_err(dev, "Failed to register cooling device\n");
 			return PTR_ERR(pwm->cdev);
-- 
2.20.1

