Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011027.outbound.protection.outlook.com [52.101.57.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465D4192EE;
	Fri, 10 Jul 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682237; cv=fail; b=d8P+okHCAMNdMnjjS8Qew3ORQlQmOEFwDNhmq/7j8Tfid3D4crcZEck8rejx7uLy193TOWAgCJY0gluhL78PKFrUkUeMmGTv2nlINE+/S4mmyn+IbPOjcMtFIN66FWM47jYWl44Kg6XBuNOZSHeXVSuC17kaEAQjqqTIiZfn+us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682237; c=relaxed/simple;
	bh=THyHjBK8UFHAuOkVMrlX7BCtAhVrpKjvr0ngBCA4s4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBwHku/a2VAD40pxovIAaaZPZuqW3S/ErFEX0JZNHusm5+VnAJKaXwFcL6Rpv6BgXKg/5+b7Hj5hT/3D8h9E0ZkuhYldW5PImaqtQ5DOSToqedb2kjrdVoZtk3AxRTNXfuYK6IRp91y2TjfU46PhMHK93KSIjfkepAIWYxxWi6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SYzbfebM; arc=fail smtp.client-ip=52.101.57.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SYzbfebM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEJIjHpR4Zdg6gqCM3H9mE0q4vhtXQvm+gYkJINu/czpMxjpx7cDjEuzl/qCT1rvt/lt52AOscrh7vOAB9LUV299pRRLkCbOzrwSgNuHAnUWxjReEHYRWgpzuKwpgFYM9ieHgLFdjEhVki8SMJabuRkkkvcDXxXbANDONvO+3NBiKWyzKI8q8fjS+kX9UZIOTp6ZxyJsH8fk3rL+TcVM7w6QCgCl40dGJvjODYBTsHOWF8bAn8rdr0nE3dROE7+SliyBttSO2bPqYZNVlKO7NmDmoZvcS5sWgfHasbkaTrhQffVCNkp/yJrCEh2revy+QkhXl3Jtsf9iN8dZd/eV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9V8Ca1waewgVOjY15z0shWtwV1uH/puwT3jLqknTJw=;
 b=c8kl3CHD0zHeF33Y1CmraTSJnW6469PYnzDFnAgjPlsdIkIFlJo1AD6imAPB+xIpgs7/SLiCjvYMIv35jRO6XN5/JqQyrq5Hv4Yl86xXarDaSYc4s4iGiKxoPN/Ka+weEmir6v4lEChBDncd5FAeoC9R54kyohT1YTzQo+8RVlC7zbX0hrDZjW6Q7ed+pDpc3mIyiENUvyeTFzKw4+/1p1QSqTOk9MQj042gYOfL4A2qVoXTN/qV6fgSScoFYz9m8PbTfozmyv3WJXP10G5W8r6UcRWZIwSIc/tTOo+TPUXNq2ZHL3ecbVMJm7Cd93JlCIusVOvjDCpN9Q28ESYxsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9V8Ca1waewgVOjY15z0shWtwV1uH/puwT3jLqknTJw=;
 b=SYzbfebM0MQJDrMyzQIaAui5NR9x1zT0qR1wfhts1td7hcpHYD8GWeyPOVCoUDwunG1nrdLm0jVPKleHymAKkIA/6lQhTJQ02khMbC99fNbIx/mZRwPXs2Ao/xfzJ7/uIixO12yPZw3XPF4OQPz0x6gyJDpfAUmSlsZlH0vPX7o=
Received: from DS7P221CA0040.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::11) by
 PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 11:17:11 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:8:25e:cafe::6a) by DS7P221CA0040.outlook.office365.com
 (2603:10b6:8:25e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 11:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:11 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:17:07 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 2/8] hwmon: sbtsi_temp: Refactor temperature register access into helpers
Date: Fri, 10 Jul 2026 16:46:36 +0530
Message-ID: <20260710111642.850022-3-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710111642.850022-1-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|PH7PR12MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 451748fa-557d-4104-867d-08dede74c980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	WsyKeR8qt21ZcHMksLoo2WvxURXHq4KEeZDdHf2P+aNlJqhfhhjPS7Kpm1fMjkM6BJXyfeVCr8AqnNxxcyY8HHcOiVuzaKGU0Dk0qEcAePVrFkKIxw4iqAnmiZlAh0ywhNR5mhVQ2M6uLbS5Nn/QbbWbyaGO5vdOfqPnf7fg6Pf5NBAKu/mmnsYFA8DVcrZ6rvgLi4BBbSeXVBInbyloJqdJ0wP4vsaDroJPQ4sn2ElWRuWL8tVWhstFa/v/lec1aO81D85Vm//jiGCXAXeDimeENmj2a3RFGQ529VR8IAcnWGxz34TLs8JIfir6qbIjmVGTCrBb2Dbe/+W+8/j2y4/JFZa6RLu+0U4D7iI2oNKXSdvwVCt4qdQ2rYxUG/zEWirjznWGzh3oLNrQrj+uim7zNJz0Zz0oON9s9LrtgKd9aOdJat7qo18sy4hvXQF1TRhtADCMxbaQYL8lgetqc8H5vhJb1AGhQb33+nQ4RwWnkL8IRR/HIoaaSV+6ktNBvMfkBxtaiWCN8d8vdtSXZkA8ME6cz3wBE2EohZYz1IFSzfrNn6MiPaKcK6TtNl1Sgf1q9H3S6svRsGIaIZPncHWZI0111QzZRgGPfTHIsKda2EeIy53T0zD9X/kfVzE80VTKGfPcNylMUi3sJPPgRLBAeFC3+S19AgpFDdblhnH0N/Aj/XB1fDl3Wu6iiZKymk7Exx/5yE7MnWzo0VhfnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	La++RL+Ti3zS5vTH3tTfis5jvDXgZBw8fz/aQ+7nKMgfmQ/vyKGHoCvZkjxruoyx7IxoX4hjL4EtbJ9RdfrfSEeKFii9REKsDzdZhqRe80KQov3JoAVY4yQCKim0xMADnqgYt9JWtgjcXkti1GImefHzVefqlVntw/UIY4ywvneqxkxQPcg6ATPPrYqBRg0IRO0uFxYkUAZu8a3TTI9EDsxfPYW8sioB7KlLzA/jA9/M7E5xSDT+SnwXZI6TPUWgvhm7BBy7B3MDZP/pVmG7ydhnuNjwi2nT+A5qXi5x8mFBUfoJaOSvvGE2Mh3gbHxUvYtWMiBCthx/9siwqZF3t+VNcQT2QhLSaQkhoa3r0SFFDmMY0vevKj+rsk6w6U/mo+WYRRQIGlRCOVjkVqnQ/Zoeq3mEkML80WXpQeKx9P9Cjxixr9JoF+GTQmwYOL6q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:11.0677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 451748fa-557d-4104-867d-08dede74c980
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805

From: Prathima <Prathima.Lk@amd.com>

Extract the paired integer/decimal register reads and writes from the
hwmon read/write callbacks into sbtsi_temp_read() and sbtsi_temp_write()
helpers. This consolidates error handling and respects the ReadOrder bit
for atomic temperature latching.

This keeps register access independent while preserving existing hwmon
functionality.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v1:
- New patch

 drivers/hwmon/sbtsi_temp.c | 84 +++++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index 28258bf49922..078f4ab25bde 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -61,40 +61,82 @@ static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
 	*decimal = (temp & 0x7) << 5;
 }
 
+/*
+ * Read integer and decimal parts of an SB-TSI temperature register pair
+ * The read order is determined by the ReadOrder bit to ensure atomic latching.
+ */
+static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
+			   u8 *val1, u8 *val2)
+{
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(data->client, reg1);
+	if (ret < 0)
+		return ret;
+	*val1 = ret;
+	ret = i2c_smbus_read_byte_data(data->client, reg2);
+	if (ret < 0)
+		return ret;
+	*val2 = ret;
+	return 0;
+}
+
+/*
+ * Write integer and decimal parts of an SB-TSI temperature register pair.
+ */
+static int sbtsi_temp_write(struct sbtsi_data *data, u8 reg_int, u8 reg_dec,
+			    u8 val_int, u8 val_dec)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(data->client, reg_int, val_int);
+	if (!ret)
+		ret = i2c_smbus_write_byte_data(data->client, reg_dec, val_dec);
+	return ret;
+}
+
 static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
 	struct sbtsi_data *data = dev_get_drvdata(dev);
 	s32 temp_int, temp_dec;
+	int err;
+	u8 val_int, val_dec;
 
 	switch (attr) {
 	case hwmon_temp_input:
-		if (data->read_order) {
-			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
-			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
-		} else {
-			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
-			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
-		}
+		if (data->read_order)
+			err = sbtsi_temp_read(data,
+					      SBTSI_REG_TEMP_DEC, SBTSI_REG_TEMP_INT,
+					      &val_dec, &val_int);
+		else
+			err = sbtsi_temp_read(data,
+					      SBTSI_REG_TEMP_INT, SBTSI_REG_TEMP_DEC,
+					      &val_int, &val_dec);
+		if (err < 0)
+			return err;
 		break;
 	case hwmon_temp_max:
-		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_INT);
-		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_DEC);
+		err = sbtsi_temp_read(data,
+				      SBTSI_REG_TEMP_HIGH_INT, SBTSI_REG_TEMP_HIGH_DEC,
+				      &val_int, &val_dec);
+		if (err < 0)
+			return err;
 		break;
 	case hwmon_temp_min:
-		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_INT);
-		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_DEC);
+		err = sbtsi_temp_read(data,
+				      SBTSI_REG_TEMP_LOW_INT, SBTSI_REG_TEMP_LOW_DEC,
+				      &val_int, &val_dec);
+
+		if (err < 0)
+			return err;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-
-	if (temp_int < 0)
-		return temp_int;
-	if (temp_dec < 0)
-		return temp_dec;
-
+	temp_int = val_int;
+	temp_dec = val_dec;
 	*val = sbtsi_reg_to_mc(temp_int, temp_dec);
 	if (data->ext_range_mode)
 		*val -= SBTSI_TEMP_EXT_RANGE_ADJ;
@@ -106,7 +148,7 @@ static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long val)
 {
 	struct sbtsi_data *data = dev_get_drvdata(dev);
-	int reg_int, reg_dec, err;
+	int reg_int, reg_dec;
 	u8 temp_int, temp_dec;
 
 	switch (attr) {
@@ -127,11 +169,7 @@ static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
 	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
 	sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
 
-	err = i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
-	if (err)
-		return err;
-
-	return i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
+	return sbtsi_temp_write(data, reg_int, reg_dec, temp_int, temp_dec);
 }
 
 static umode_t sbtsi_is_visible(const void *data,
-- 
2.34.1

