Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0E38DC5F;
	Thu,  3 Sep 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427240; cv=fail; b=IrvwfZr1ye1kGN6/6/j06ifImi2bek6TVCmi1rwQvHBC0zmdsZVh1pCJwHEIX9BH9oAfoXekDxUWGsxU+eavBwQCtUoHmxZcS9GKxRX2Iaq8R41TOUseZXFOoxfyVgdXHO+UFr3lELEecGkCaA77/9O1Z9ifJSzH5K3bzRWW2mI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427240; c=relaxed/simple;
	bh=pf8KupC5xgxHb+Z9nCvLRXjXHE1G6+SrHttQFgio6Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=sltsIuyD50QYNb8oYoA2rpkguSYIwh9BuCGIocyKN/kd6raCyEnJyVdhM/ockhUkle7gXmlYKnn9n7B8BhiiiwG2g45GeXDlFL8c06bVbHLTOCyAPCPXE1sTq7iAWAPNMmQ+WDUSu8biz05Sq9px2gBvU0+b4B/emDtycXL/tAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=okYPF9yG; arc=fail smtp.client-ip=52.101.62.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="okYPF9yG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u31qhpll+0TX461BusjJzxZOTAZHTgprg5PNNiha1zDq9FK8Bof3kxTYrzLe8PMUxWbYHJ4LIYs0xSq17Woam8deB3paWThgwPI0QsbD02O8EAVa1yQJTYqUKh1uoJv1rjzij3GHcduG9FYlX/jtakLJOcHHjlEBLiwkHpGg5JXjLIH6O2cmQVGWetMrC52rUbC4QdlJTR64oJQgEglJIzaP9AuuHgK3Oe38FKJAfKeKCr6ouoZRiFYrFHH8s/4CU5gkBN/BTmfnClxUJFMSxlP9/7KppUf6fAMLMzSWYFD3I6Pt5kKJC4wLfKlowEfUnNHMaMWXG1thA77xIGzjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVXjIG59j/ljj83sw5HGiU63Yja4LRYttbyLXbyG3d0=;
 b=ciHyOGoue2UUnQJ2T5I9nB1JCltke7NSZ3e8KW/sqCw1R6N9QrG33NhrAq8FwK+TEq7qLwOPd1DrnUB/zU3WBgU/3Y4bGioP5NHMS/88mScT9VPc8eFQKiong3ynA0cBKKJViEW2ZTsEvFemTnJRXc3+yzYxG3VbniFaWpeCKZO9deL/0WvS30jncln4FJDDNsykWTk6PRgqnBu2KRHSrQFY6ADOwPk8duxx5VDnPZeGooqjIH41gL3OSWj80miVYG//wzsbaexnsIKuhi5WISGY+u1fG2KkZuYrXjNCFHbEgYoGJK4O+jIxkVLj5ARCmSdT0JqYpVbC1rWmxQlNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVXjIG59j/ljj83sw5HGiU63Yja4LRYttbyLXbyG3d0=;
 b=okYPF9yG2vDGPxi5K3GHIrdH0Z/KWXwCH40ByjhyYP1FVQmb3K76Gh+AN2rxZPc4GaM5Vnf08rfpDP2jUJ5wYkT/ioOHcvIpTrp4Mjiu09gZOH08KadmSkIxZV4WDpiOHrFBLp4TjOuPmANEpz9gzGy6Y8Nz/uaMNFecf2HWr+k=
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by IA5PR12MB999325.namprd12.prod.outlook.com (2603:10b6:208:603::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 09:20:28 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::3f) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 09:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 09:20:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 04:20:27 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 3 Sep 2026 04:20:25 -0500
From: Carl Lee <carl.lee@amd.com>
Date: Thu, 3 Sep 2026 17:23:57 +0800
Subject: [PATCH] hwmon: (pmbus/ltc4286) Add runtime shunt_resistor control
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v1-1-aca2d49a1418@amd.com>
X-B4-Tracking: v=1; b=H4sIAKw8mWoC/x2NQQrDIBAAvxI8d0FNCLZfKT0kuqkLUcOuSQshf
 6/0NnOZOZUgE4p6dKdiPEio5Cbm1ikfp/xGoNBcWW1Hfdc9xE8qGbY07wJr9YN1I0whAO+5UkK
 Q2AAYhaQWBl9y5bLCMMxm8d640DvV4hvjQt//+Pm6rh+uv5LCiAAAAA==
X-Change-ID: 20260903-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-44b1fcc18d38
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Guenter Roeck
	<linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788427477; l=4884;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=pf8KupC5xgxHb+Z9nCvLRXjXHE1G6+SrHttQFgio6Gk=;
 b=rM1NF3XIwl9yR4QgRecBS3BumKrSLP+wY1Fb/Zcw7L7skHW/lWWahBNe2GEKeyYeekZLZkpRF
 6ilcKvCGsu0A3+JyEu+gkSeuqo6VLSfTjGvPLRZ5w+LLx70J6h0t5ZD
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|IA5PR12MB999325:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ce8be2-8ed7-4ed9-3f79-08df099c97e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	6xiw5mmQoFj5KKpVfPS+n/WNHrtpKTIVnFLuiBHHCUKESZrbnVmbOLHSyjGxgfjUHuPlNfk4CVV9I7zfLuHy7zdtuqmXkPxHcsCEw0LjtAtXEJfsfIPBGolOXYwKF2j9lMlcp1v0dl0LwjgGWrfdPmSxW6krM+IaKtG0ODkJ0PxhIgGsGgEKSGxAyh+sqjxuBj7ST7F1ukF5zSzTNrBcfSsxgZWeieM15+XSbEhc+9ukldFKucTc0hk7lrXZKFHH/q24zuzeFGViStjgEbQd3ACvI/5z3Wbrrq5u9+4QPUvAJo+PVEd0zAuoKPKqCFJ7mSYJ4O63l++S2tBkEY1iNNjaqD4gZb62pTCq/VGvc7q6+/E4X8JdxkOVO1gx8R9PHLUJ+FKq1dVLDKUvzEwKgtBwa3YoU/gtYps52AgYt2z+PL3XoM4iwRqy3rzFD15X9sGFvwMGFQvtQEXHOljhQSkDjmQmcBUXucS/A0Nsi9/UsbHz5rKOgydPDm1BZE3Sdqsdq5cmEmCD4o5sVGjUeREZskxsyQ2DCcH9c9bMilwTCds0/KvgRFKMTXzXRpB1b/gT9OYPkNa7GnNctN0YCmCy/TRk4rrw50+W8KnTcOcMvdkopK4PDn/RrF5crmusOUn17u+HhSKxkXDJ8L8RrRCz4Yf1Fjd9fqYOzhJr89K0zSyhXlGdRT8BCoo4GJCYUivDX6VQwZw4hsy33/vU5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hlVAnta6xwTLAfUdtxT9zXm72isnDCOHOFSclzRoyfd+ovpz0R68MCRv3JkuCY2YvuXVEcxAfULTccdkET+OA1IJBnjI3Yk+Srr9fDDN9bgWalBr3DbOmTgvmXFv0LcCpG5bAl31dQ252IBEmGaM6EjdPmgtvD7A8o8iELiYWCbyk4vvLjfkhsY19p8eqWfv/F2mXLsGtuD241ZPfhSHnllLGXEb++Pjfo6pdrlu0xKh4g/WuS+2+lnwDaLYP4/vTOKwFS7dln341RsumdvlGcpIyFOOFm1LLWi3A0D3dumbtBaUQeeqwyB8cS4MduX4bTwwXX39QQTbNUiqGvxn3Ov9bIzyzlsFeYJIahkKQ+zF0HvrBKRYQoqXfd9yztY75VVne0LCpyp5ZO258DeeqnnFRkj2YyPrzbWgk6r+k3SNE0+n5Lz5HoEwRtzK3k58
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:20:27.6687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ce8be2-8ed7-4ed9-3f79-08df099c97e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999325

Expose a writable shunt_resistor sysfs attribute for ltc4286/ltc4287.

The driver still initializes rsense from the existing
shunt-resistor-micro-ohms firmware property (or 300 uOhm by default).
When userspace updates shunt_resistor, validate the value and update the
direct-format scaling coefficients used for current and power readings.

This enables runtime calibration without requiring a DT change or reboot.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 drivers/hwmon/pmbus/ltc4286.c | 86 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
index 8715d380784a..e80c9ecea099 100644
--- a/drivers/hwmon/pmbus/ltc4286.c
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/err.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -16,6 +17,75 @@
 
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
+
+	return sysfs_emit(buf, "%u\n", data->rsense);
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
@@ -55,6 +125,7 @@ static struct pmbus_driver_info ltc4286_info = {
 	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
 		   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_VOUT |
 		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_TEMP,
+	.groups = ltc4286_attribute_groups,
 };
 
 static const struct i2c_device_id ltc4286_id[] = {
@@ -69,6 +140,7 @@ static int ltc4286_probe(struct i2c_client *client)
 	int ret;
 	const struct i2c_device_id *mid;
 	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
+	struct ltc4286_data *data;
 	struct pmbus_driver_info *info;
 	u32 rsense;
 	int vrange_nval, vrange_oval;
@@ -114,11 +186,14 @@ static int ltc4286_probe(struct i2c_client *client)
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
@@ -126,7 +201,10 @@ static int ltc4286_probe(struct i2c_client *client)
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

