Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924E13E6392;
	Mon,  7 Sep 2026 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767770; cv=fail; b=LxQh83H7NEgbx88olGZ9Puj4UZDSyssJbmYk0b+WWyEqawVqhdXpdOxweHRgL7sjjRfTi+s3/UE3PpYXRUZeVvPPA6H8JtDCHw65bAc2Y+7FYh9x30WtAtzPKqKnmVk+28Df0oh9+74B9sDa1ZvGNz9Dkw6OJvvDjPdtEnFIgKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767770; c=relaxed/simple;
	bh=HbdfhRTthX/yQf0RKTZMGU7NkZolQZJMJeiRHB2FKr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=AHfL1y9+ZPhyT+AW1kCcp6ym4FXb7nQzoKQGIFalpWPMvopSi0qKPCnLM6UvNNCKQn+EqVcYCaz9kGgrboNjqx2GRFU9xYZBBquumo90+GnChb8f8jSyIYLgkohaosl990eKlWS9S9qwwHM/y0rzjE+F3aj6qgJuDPtAaxh0dXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZA8hR4jC; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZA8hR4jC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgW6zeDyjpGo9uHUJqw/KGQcAKfbW1a/5fXyG+oYxoac9+VjeQg27emZJcgK1vr9m7Ot2lNPbiWqbKZQ1nZmsOS8tHe88tAnvsT8SGDyK3cxv+wcI0fKDX0eRokfqGZvtyAeZFFgQ1n/Ls3Ci+jjqVsWtXn4YiCA+dfkGwa3f2KREAnEjG6swagllooVpJlgWU0hVuf+kF/eSq9Lco2Y8tvTv8AyIlKhlj8vPwpDQWdHgdG+inlea5/ehfsq8o0cbEHIjN6Mk81U2AqbcalHMUk5WRvYs+f1Vmg/yRJxn6AvL0v4HpNBujlGG56Qb0oPvpcRW+MFYR1dOsM9e5gF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6rbrlNVz45StkH4KZxK7RKedJ3asJ145oZpS1mgUjY=;
 b=Wrj+sb/+GxORzRu4VdI1QUZ61kwg7FCHtKPCzQQncG0xfYMt3ykSOb4P2642+09KV63DKJn+r0k2gWjehckc77J2WW2LR+mBHDDEvc9Q7ugD7EPvzIpMO2lYI/o7fGNWIJ86b/0A5kzM8lqyRYgYCWUbn65LUYlzQUDmpUiZIjb/YLlUyZYh8f39ZxlJoeYK8WzXrVPUI25u5OLv3vUCKvPE1DXK8MGBeTPh/cNmLrXwgKFyKV67Lmxvj6uUmf5K9HcefoWbZF/Cmw2UvB5tMgrDft65Xvq2PpJCPdxktDQ/Kx4GLEwphtDT0024DMF1UF5C1fpMIpznoWc12tK4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6rbrlNVz45StkH4KZxK7RKedJ3asJ145oZpS1mgUjY=;
 b=ZA8hR4jCbFIkHpxmbXGJbylGL1DorC/QiaYaUhWtMuI3q09R6ewpNdjJVce33ERf0fI2pMynqahfA6+LQ/gxaF40313GGJ/1+hWOf9ZIrfDBlJJaq2A/KM1lNi0Sf+dx4Wgqr7JI0bMKadVpO3a5dFpQHzPbn5w0NX51bv5cptA=
Received: from PH8P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::11)
 by BN3PR12MB9594.namprd12.prod.outlook.com (2603:10b6:408:2cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 07:54:52 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::51) by PH8P222CA0030.outlook.office365.com
 (2603:10b6:510:2d7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 07:54:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 07:54:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 02:54:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 02:54:38 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 02:54:37 -0500
From: Carl Lee <carl.lee@amd.com>
Date: Mon, 7 Sep 2026 15:58:32 +0800
Subject: [PATCH v2] hwmon: (pmbus/ltc4286) Add writable shunt_resistor
 sysfs attribute
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260907-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v2-1-5f47f7e5a1bb@amd.com>
X-B4-Tracking: v=1; b=H4sIAKdunmoC/6WOQQ6DIBREr2JY9zd+JAa76j0aFwhYSAQMIG1jv
 HupV+hu3mQyMztJOlqdyK3ZSdTFJht8BXppiDTCPzVYVZnQlvbt0HZgXi54WN20JViyZJT3IJS
 CuPlsnYZkqoCok005RJDB5xgWYGzCWUrkquOklq9Rz/Z9Dj/GyuaMf84fBX/u35MFAUFIQRUbB
 DLkd+HUVQZHxuM4vq6AuPr6AAAA
X-Change-ID: 20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-44b1fcc18d38
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Guenter Roeck
	<linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788767922; l=6000;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=HbdfhRTthX/yQf0RKTZMGU7NkZolQZJMJeiRHB2FKr0=;
 b=STHDU2NsEwv5/Aez/gfXTO1he+dXl8XoibAviUS/13IdXF8IAPB8P18Pn5ttA6kvYrLLyaztP
 PSiF4oHzkY7AiOqzOK6n4yXh/lYGe91XVAKiPlIDdCWe2FFCPaUPaVa
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|BN3PR12MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7819ed-17d5-4354-ab40-08df0cb54c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	g1UKeHY2L5Zag8tAbAgJfMJ8dTcey3EncHW7z0TcAfWsZkDIsI6viAplJvCHNkYd1Y52oJ6U7OeFkHJopjYwkpIuI8rN2BiIzs2JirO/IMmBYmuMpu8smCIzfnKntHBHEwU1+Q1ywZ3Gir8uJXuOCjebyodjfaVxbfISdaA0qo6BICX0uxWpdA4udDfN6QlzOFujkShELhFkzYkJ6SGXtDiYj7AH3MRCzDvwpR8OQJUSi9Ip3mY2RmXSGDvhN/amomIauYklyFE76C8diFAeEADQVRqEK1e/bnamTQamOcDXz0ACynzWHUqCDFf3UEEuhkzX+4TpQ6FdDvfeTKnijVflVKFx8sdCiVvNhu6Kh2JNKnOARnlPpD8nEJGmyJi9Gzt9X+ri0b8lhQ6OchHGsT7/1iQ76UWLG0Gz+8k2X9+Fgvh4jCy6RtIhNquthv0dvO00EWNibbK6a5WyRVa6URSWd+Txx03xIiPfH7bEvhUNHk6gkdg0dqUfFHF+ZKxpOSkxvc0rdH0ZUggBda3vm6ALGLmdC1l5iFr8Jr1/cvVS7advGkDfSdnXrnM35uvGDn9bY3SgX5LJER7tcSYh58wNzj0a0PJbyHDaYC0fDc1WYKCV9eH7TLC3Em31x6e6KK5bWOoA3kDEdlrQ0AYONTxHeIJ9rAlsY8QMXk0RUw7yKx7ynyEqFjI1DrYfIDACwgLyMrEqm7W9E2r3HKubcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TgwTAO2z9FM34Eg4IgNqfvJ7ysWC89lAFBKaTaGG33Up6vc716T1v1469QBWW56lO1jt7uuj1bfQrkX2iP4Xo2oDZWQo20smYCP3pQQyRvBq1R2oCBUgSj5447mqG4uNaBEqHRVRIVWctVJjPhUT4YqwMOyjrOxzy7DLjR8oKXj4JSWuMaIyaGcuq/npR7AzciyEt74XE/odVKH8S9hJRZpLf9EoPxY1BPGMRutWwTQWKtZiphYNLGH5K+rXhoWhIwJpR99jIqd2TZXX2tFClf4N+WjRP7w/OAXVXi47NESaHglIhRnniB5vML2447VM2L7lx7Z0o5hocHOQI1rkNio8BKupnERsk8Z6lfUEweZsEbVS2wL0o/4KbHmUOrJySgUmAnHFsjdzyt0lQrKDX1dwQewVHVrzNK7yWNUYRiZa0Hx4u+7M88jMc3VONRc4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:54:52.0904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7819ed-17d5-4354-ab40-08df0cb54c74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9594

The LTC4286/LTC4287 driver uses rsense to scale current and power
telemetry. rsense is board-specific rather than a fixed device
characteristic, and may differ across qualified BOM variants using the
same software image.

If rsense does not match the installed board configuration, current and
power readings are mis-scaled.

Add a writable shunt_resistor sysfs attribute so userspace can update
the board calibration value after platform identification. Initialize
rsense from shunt-resistor-micro-ohms as before (or the existing default
when absent), and validate runtime updates before recalculating the
current/power scaling coefficients.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
This series adds runtime shunt resistor calibration support for
ltc4286/ltc4287 via a writable sysfs attribute.

Practical use case: a single software image may be deployed across
qualified platform/BOM variants with different shunt resistor values.
After platform identification in userspace, rsense can be updated once
to match installed hardware, preventing mis-scaled current/power
telemetry.
---
Changes in v2:
- Clarify the practical deployment use case and refine commit message wording.
- Protect shunt_resistor show path with PMBus lock to avoid read/write race with store.
- Link to v1: https://lore.kernel.org/r/20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v1-1-aca2d49a1418@amd.com
---
 drivers/hwmon/pmbus/ltc4286.c | 96 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
index 8715d380784a..8190706d1beb 100644
--- a/drivers/hwmon/pmbus/ltc4286.c
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/err.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -16,6 +17,85 @@
 
 #define LTC4286_MFR_ID_SIZE	3
 
+struct ltc4286_data {
+	struct pmbus_driver_info info;
+	u32 rsense;
+	bool vrange_low_enable;
+};
+
+#define to_ltc4286_data(x) container_of((x), struct ltc4286_data, info)
+
+static ssize_t ltc4286_rsense_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct ltc4286_data *data = to_ltc4286_data(info);
+	u32 rsense;
+	int ret;
+
+	ret = pmbus_lock_interruptible(client);
+	if (ret)
+		return ret;
+
+	rsense = data->rsense;
+
+	pmbus_unlock(client);
+
+	return sysfs_emit(buf, "%u\n", rsense);
+}
+
+static ssize_t ltc4286_rsense_store(struct device *dev,
+				    struct device_attribute *devattr,
+				    const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	const struct pmbus_driver_info *info_ro = pmbus_get_driver_info(client);
+	struct ltc4286_data *data = to_ltc4286_data(info_ro);
+	struct pmbus_driver_info *info = &data->info;
+	u32 rsense;
+	int ret;
+
+	ret = kstrtou32(buf, 10, &rsense);
+	if (ret)
+		return ret;
+
+	if (rsense == 0)
+		return -EINVAL;
+
+	if (rsense > (INT_MAX / 1024))
+		return -EINVAL;
+
+	ret = pmbus_lock_interruptible(client);
+	if (ret)
+		return ret;
+
+	data->rsense = rsense;
+	info->m[PSC_CURRENT_OUT] = 1024 * rsense;
+	info->m[PSC_POWER] = data->vrange_low_enable ? 4 * rsense : rsense;
+
+	pmbus_unlock(client);
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR_RW(shunt_resistor, ltc4286_rsense, 0);
+
+static struct attribute *ltc4286_attrs[] = {
+	&sensor_dev_attr_shunt_resistor.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ltc4286_group = {
+	.attrs = ltc4286_attrs,
+};
+
+static const struct attribute_group *ltc4286_attribute_groups[] = {
+	&ltc4286_group,
+	NULL,
+};
+
 /*
  * Initialize the MBR as default settings which is referred to LTC4286 datasheet
  * (March 22, 2022 version) table 3 page 16
@@ -55,6 +135,7 @@ static struct pmbus_driver_info ltc4286_info = {
 	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
 		   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_VOUT |
 		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_TEMP,
+	.groups = ltc4286_attribute_groups,
 };
 
 static const struct i2c_device_id ltc4286_id[] = {
@@ -69,6 +150,7 @@ static int ltc4286_probe(struct i2c_client *client)
 	int ret;
 	const struct i2c_device_id *mid;
 	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
+	struct ltc4286_data *data;
 	struct pmbus_driver_info *info;
 	u32 rsense;
 	int vrange_nval, vrange_oval;
@@ -114,11 +196,14 @@ static int ltc4286_probe(struct i2c_client *client)
 	if (rsense > (INT_MAX / 1024))
 		return -EINVAL;
 
-	info = devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info),
-			    GFP_KERNEL);
-	if (!info)
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
+	data->info = ltc4286_info;
+	data->rsense = rsense;
+	info = &data->info;
+
 	/* Check MFR1 CONFIG register bit 1 VRANGE_SELECT before driver loading */
 	vrange_oval = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
 	if (vrange_oval < 0)
@@ -126,7 +211,10 @@ static int ltc4286_probe(struct i2c_client *client)
 				     "Failed to read manufacturer configuration one\n");
 	vrange_nval = vrange_oval;
 
-	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
+	data->vrange_low_enable =
+		device_property_read_bool(&client->dev, "adi,vrange-low-enable");
+
+	if (data->vrange_low_enable) {
 		vrange_nval &=
 			~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6 volts */
 

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-44b1fcc18d38

Best regards,
-- 
Carl Lee <carl.lee@amd.com>

