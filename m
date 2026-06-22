Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD6E3B585F;
	Mon, 22 Jun 2026 13:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136740; cv=fail; b=bS7R61HNqxCF16VxjFdzlhNeIAyEC/eFzVlGH1wBdbAP2y6iiW+SCzdfpjcZPngVAOji/5qjfdPQ17iS22GAKn0QQrYVfiFGwA273WuF7XqHIeGYL5VEkAhb6HoHT1bIGLTl3fzNn5rFzICoFwbTck6eBJfvo4gWRsmvF1b8Yi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136740; c=relaxed/simple;
	bh=THyHjBK8UFHAuOkVMrlX7BCtAhVrpKjvr0ngBCA4s4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EM2Bi+uQM1lCIRsHUSZwlKkR4th/K79Vs7zQ+2iEfATFGfE52gGft9TgbcWO00SJ/thaUTeMqA1faUvuWBP9Re2sR4ePrIZF9HQDhxP6gHCf6FCUd2OtqpdD56UC/xdR+0ItiTo5eggy7VpQfALDerhPtp3O+ywDHtOR0Hjj2Wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sxZh4G2r; arc=fail smtp.client-ip=40.93.195.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sxZh4G2r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0jLW2BUjNDDSGKm8kHSr0m28+tZdlHQT8E8ViIva0WJ0ab0eJ9rnZgJr9X4f/MYwxwDRKkrNFFkTbHhIjBJW+kU+cMXJnZb+hFehbQn4XX2EB3vCGD1CaCWguPschqyWFu3qegAWxXN1aPbrth45T2/ozOMmR1kbYJF1NtKSUdEEDmJQoalaYddRGgJIqQCEAqi5qcBmJCrqCktAVatvDjcPTcSP3WrvhvbfPZNxWwytpETMYZPOM/R/mhOoohoAuFXGfQTFm/zQFj0f8EAVP19BjEYWGNsmC4Dl+1CxUguLIc+9DASiXtb2Eps2Lx2BkrsccvgyEjxZGjcMGEQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9V8Ca1waewgVOjY15z0shWtwV1uH/puwT3jLqknTJw=;
 b=UOJxMkDZprDoXB3cm7iK9kFxfnEY7kWt7zXYAM3cvUnQALm4LBd7U3+QebIkgAdOK9Bc5yH3cxZeK8LY/9d/9sEvlJHKHZb32WJM7CvVpReBMrjbJofYpFOVUzM58eX18f6Zq6Kx4fCl3vQe6JF/LcTSyOEzZmE3bvEWyiPmmp0m1z6QydRyHvxutjnJimqHQQLBPM4HVQzDr7bLke7C/AsblfF+Ll2B9Ck0UR7Ixq6C9uOBDc2QFaQm8EkQXWGE9UUC/SmeFZwnk/xYo+Be1LZjBtHd0pvFiWkf+WyGlWsGljs/W+qSFX91JT8o3x2JVq8APskQqhCN+6bMQCPdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9V8Ca1waewgVOjY15z0shWtwV1uH/puwT3jLqknTJw=;
 b=sxZh4G2rTwzjs5//JYkktSRH+olqJCw+Hb2nKDpyss0ugbwPtw/HpYDNDvGVs4NQbrC88zz1fez9FfrFUcdLTHuiw57oLu0eLaxu9mRiliWf1Cjv4xuOlVIkWOeNB7Xdgfv4JcP0DzyuXsosVnh2wImvwkQlPvOC8Ryl2o4M6so=
Received: from BY3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:254::17)
 by PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 13:58:54 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::62) by BY3PR05CA0012.outlook.office365.com
 (2603:10b6:a03:254::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.7 via Frontend Transport; Mon, 22
 Jun 2026 13:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 13:58:53 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:58:47 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 2/8] hwmon: sbtsi_temp: Refactor temperature register access into helpers
Date: Mon, 22 Jun 2026 19:28:15 +0530
Message-ID: <20260622135821.2190260-3-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|PH7PR12MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9693cd-291e-4978-4454-08ded066656f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xxnFrLEWqVgbx3+jB64x8jcdyT8fBjNXuUL6SWzDedXC3nTB71veoVsh7PR9rqow57ZQW7YebBrunL4I8P6G1yGrVWTvKN4LtRnoQN9BPGGWJ7uxYQlIj8OJ201+lMwe5KIYd+x8kBBGfvsbiV6bXg8UeacavCav2xJ1rOINlghtneh5TrfKWVQ1ZjNkrdRTHK4kuz3G79cmk+eRc6BY3Cge4aLU3L4ncAVtH6euBYFt/AsTUEvdngNbLoaTeRYgXSSWtdGStS54ndaRDhISafGwFJvzGHGy4t+81M7YeG6FKRAhb1T6djM6P5AaGYNf23rQnnbyoAiO/tinrCIhnSD8CvI3IWZyq+vP+5jFZp272er9WfIlWMOhRlKN5Po4HU3EvIL1s9avlnAb/TbLJ5j8nqgOGpkKK2DEYSPN6BGt+k9jcydGu606mfFpin/oJm3QqxjGdG0YF+nn/GzVAM2XAHSIRWQd96GHed3Pk6qzmseABfIocLzOXJH/ZcmBj0Qt+Vqw4NfIBr2TC3fn+1S9EhMCsalhQelisThTT9Y/wwXtc/yoJhSdiGvZ7SjkVrNbko6GsJSm+LMR4DIhIPVdbpqnkznq95lF9Y0MeVOr5+5H2E7Jk0yHoapLIZY+fvtMjIhNeO7cz/2W6aYZF8zH3OmLQwx6W/ETjlaXwcMp27l0TZVoC/ewY2es6cz9dmuB4VpH/tMod4pXHDhJow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CnFwmmfE9cN5FnLuyPqRRjbtURjDg9TK0nyVDVl4JJZoPUMjb347Sais85NeH+3I4K2Bhf9sUvy2fn3unQVE4WOCRa4t9uxmqf04qVEkzKBFRmr7og/Tk4v2AueBScaEZsq+eNpPxQNKmIxHAB3qVR0St+4k+83Z7b7Qcg+PfpBL+20cMCcxkcyzSU3lgcvl6tkLTCJl2RombmMqbK0pZOARqelk27sz6DWyHpvlyqb3cTQ6nSpryPvOhhLwymsje5O8Oq4fEToHuSYJptL9KJlUmtE/jTlBv+fkc1ejP5mgiM37tZo0hrq+z5+wRNPnKqmHUTlB9+T6A97dQCipoi1UY62/OM+qppVsSEVUYvwiwe0w+tQiZU9COTpOFu9P+TSB0uNpkr0dFPuAyGcST5Sw407O6Tcj1eAripW8YtnHAbrBiHWnrVsO5vnVry/Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:58:53.8875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9693cd-291e-4978-4454-08ded066656f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331

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

