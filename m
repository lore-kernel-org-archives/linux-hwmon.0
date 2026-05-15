Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012062.outbound.protection.outlook.com [52.101.48.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FA135DA46;
	Fri, 15 May 2026 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852750; cv=fail; b=ZMYoDz08p9nrPt0wcPhpnSMj/9wfUdb0JF3FjQIL5gxhMJAWpuMMgaPvDBbpQnxHSL+xu8Ev3Z4PY/ap5eFxcw5RzPVl/fgBsMhz3ZFbg0Z0IVa6cvQD0wAXuHcOyceTsN5OTMgWTZg9ecLA0K5dx+XSwqrlt5HrdHi2CkgKwBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852750; c=relaxed/simple;
	bh=THyHjBK8UFHAuOkVMrlX7BCtAhVrpKjvr0ngBCA4s4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ay4mBB9ti348ohRpPRPwGeE5zrWmkDp+XiB6jByFc+tRs2uvMv9WBMkXxBEvUmTojqn3xg5OF2la83UyV2jBwiGt1LaBnmN7n4znGDzYK1eHgAnAN2tALp+9pxvZLy9vPhkH/tZ3h5bUEZ+dusgWUjtnfNQ6FXOu5u4DpdbROds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XEK153c9; arc=fail smtp.client-ip=52.101.48.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XEK153c9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm3WheEHSXrSC/0DYQlso8b5ZDiqtbNGFYh69boWUeMPJibvZjwU8/8jKUOy3akoKaoQoApAt/+tYKj+fF4JTA8vKMs2AOX+z/oaS/A/RmuTvIN5bA9A69mLRpMTRL3fVv/yXD6xApaINaWPcAO4h0909zYyOwGlhvIO6CblyDn/Y0326PQI/Ifloi3Bh4BT0blfLdGOFTVuSh4uSYnq4ZjIJz1mVpXgXvyBAv3d6rjcOh2/2zP2+VoxT+BBzIcphymPkwvHvU69X0XpQKkbF7vH9ZradTljUT6ILIG0GF21fXgzI0tA9xuSn+QiyjVGsYIe2Avbk+DyY6CnQyZ3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9V8Ca1waewgVOjY15z0shWtwV1uH/puwT3jLqknTJw=;
 b=jeXI4vdR56yAZERByQX4gH0WPXXTEd4bH1uCfh9pqYD95Rxoz3mliJ/ax8K3Y2Mjl2Igpwt+3iAlIj8aNGdLrgSOMIdyinz+8BY7jNz1dcjd9vl4XHR62cIbLGk6KfxrNOXwLbweXDRPX8ho7X/GRffqGgBfTTlXr64njn737S9bSEq+GEOY5YDTqTDphZHyV12BDHpbW9JlnlLNC7PJC8t5X8c7AQunY058hlznu3zvpE0aGTnVbjj5/SwGydjuPCM+r8HD5fhVE9f3bN9Z/qqkrIhfBRtjT8BwbuSvz3V7fbWwxgJkKXCN7F5xoGYsAPgrFoDgDY7ToMCdnXTxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9V8Ca1waewgVOjY15z0shWtwV1uH/puwT3jLqknTJw=;
 b=XEK153c9Es0osDd5GXZhnGt4b+kuMcLHJwoZYDxSVbzGp9vsn6qx/rHm1616O5AzBsdU55ooQGAN6Y1ittV66wta5Mm0IZW5ZsFHSaoif2vfBRCLYt/gdyXrxdYaZnflN6CT8p1C1XgYgQfT0Tn+b3SC3AVu4H2hK2+WzaT1HUQ=
Received: from BL1PR13CA0443.namprd13.prod.outlook.com (2603:10b6:208:2c3::28)
 by SA5PPFB29794CA1.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8dd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Fri, 15 May
 2026 13:45:38 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::93) by BL1PR13CA0443.outlook.office365.com
 (2603:10b6:208:2c3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 13:45:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:45:38 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 15 May
 2026 08:45:34 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <Prathima.Lk@amd.com>,
	<Anand.Umarji@amd.com>, <Kevin.Tung@quantatw.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v2 2/6] hwmon: sbtsi_temp: Refactor temperature register access into helpers
Date: Fri, 15 May 2026 19:15:02 +0530
Message-ID: <20260515134506.397649-3-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515134506.397649-1-Akshay.Gupta@amd.com>
References: <20260515134506.397649-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SA5PPFB29794CA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1f49be-fd32-4b96-7dca-08deb2883f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Nrhx94VNTNRFVXwWZ3qa1xhYPuiKwJhRk5PbZEElIGWyQuaEhQJXyfnVUxxDxNY0k+AVsfeVzny8I09urL2fPiP41x/dZ0DtP/4WlMmhMp98nIrNyXGp/4g7RlGEgQyGWWS46RfscjpiKcmCjfYofLdoLKTr4mpAzVI9AGoiqEBJTxfVA0NVBLi3STbWxbDWuDWiTaOri7Ou1aQisCyv0J5UwOh3tmOZ1S0gyhdDDiCqCp4RrozEV8RUdRdwUMdFwWR82xIYiTpSoNBZ6wh/BagGaRkGGGoXOwpsjoVIUf54rnd9EZPPw3n3w5dRmzFP5YGTtPyCXlE+ZWven6uGA9rePLY+JKFawLEt2+ayO7nSJaQIXAprMulkBwsLj6xVo+3LYfCtfbpsc2xaSd5DyYEJaGWvuN95iVrPVKMv0pchnxBKo2J4Apy7vOd6jBqJalxxmdK02QghKDiiNeczEvK+QI5qkIJxgte4YvLBmolACGfXWU5Zyut98RTTOwadjljPjyKjb7E6zccYJNCy3ezGqQ6ybZbwrVJRpkUr8SqCOWKJLNajDjU2T/brOmeGwFRsHjFh9C10DANUh3cXCpkYM98DZ1rTI3b/GxNZhjrlaWnI3nJrLTUfdUTBHJ6dsyBjxON+SYnI5zdmQTd7hmJ7+wZpd69XSTJPX4ZD1Od5kQTgjKWyD46IxS9pLb1R7h2bAurNJ7jN12J7EIuVFJ7rDS3802fuhME02saslMk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JKgptBOIVzSxPrEkYyGqDkaHKm1Ohlp8iFAK1qHB/TWhr6nzfX8/mVnn6oIYF20aQ4ewpKBVHKsDbqmu31t3IllvttCBNPCyRirTWNrXt7ZcArccPRgD6nFcqCL5K2G5RVIJmmZEkgJyRnkQHpqqytYba0CNZ3F+AsJTPKcnMwAizE+Np0u+kipXVZSYUCLiZZr0Klc68NYJLBV9tjThmWHSG+o5EFN4iGFqQG0YqWNUFt6VTyNXNuA48CQJQHzZ5caDcCRCq7FefnNU/nv0ABTY23OIq8xwu7MRzW76A26tTVNyB0GFDoeYXw9q0n/BQqSj5dfpJYJbmyjPnoG8BC4TsSYp4rcZj/RFoXqtEuO9/pH0NN6EGcFFmcVZihCJIG0+JtME1FwHq7Zgm7UlNMfommx7rvi2d5yQ8FpRs2CTfNxd30g79oRn2CpMGY/0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:45:38.2066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1f49be-fd32-4b96-7dca-08deb2883f6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB29794CA1

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

