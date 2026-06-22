Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9BD3B5F48;
	Mon, 22 Jun 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136749; cv=fail; b=lHZi5FkofAZuPh+8m3uzvaQNHEvPfqBuTXCasfF8uGwK8iJMDTefnkH0yyOyU94VuyUPvszENeUlbSs/rjKvqqTePQuvowiIVrE2wdDF8wTPjSpJnBlCHx+o0q2FDFC0nvRJWVeuDH4IR6JapDvTvmn4q7d2Ljc0MdrpS+3+ubM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136749; c=relaxed/simple;
	bh=crvJDUvbMemhfIfoTkUx9Wr+i9WO4dTeVXpIY7DnTMQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uNUcwyoTv13jhG3I7Yl4ttDmhBZuKAk4Nh3s3LTpWzFQaNv3bh0g/sKMUUB0hcRt7PfhHRGjLi3O7qnz1ce+xT5XO8SisZdqIAwZjz19YyeA1pqwXYX3iTDGV/+sVgfFfapwnmgvcltOjR2f0pqEplDNuNKNwVZILvYFqxJMD+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WTU+5E2E; arc=fail smtp.client-ip=40.107.200.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WTU+5E2E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WskDOgotRid95aSTBE6HcWEUp4F180hNKCK2iXS1MPCQzWtulfXvWcmjVl6FhqI1AT/frzHD9tPmVSLPJoUsnkiDgMHzP71vGZli0hXeN2JATHuRDX10UJmWmqIZ+QrZh97QocadYKHNpxMmeDQ7XBy/jwgKh2rBbue6ntGEhMxw31viLRhyMkdgl4/NiIOCe25ZbOkwjuPgo8g8hMFFpvStzNWbGIu3YTE2gy+FpM3orMAzUaRjBny5bAsPe4XP5mrIlHRuvENzkjrayX7jvcscBQj1KaeWsjBWVjIfxb0Ioei0K3Uk9C90KDJowaOKfKQ02jce2gv972NJE9FOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI/i37O7sFj74GTx0BUx1vJjH4h2N0bdcaei7Iqal2c=;
 b=fmSQK5rd4Hb0jI+gALdBiuI2+aHvtwehNoPTNjIEyI7dAFDLxS4gVNryWOImLCEcKBAhvoPtdh80zmqowii1B5b3JCaFUK7yiQgJaYTTatI9XamQeD4IlyfhNZFMFGQHJhro32+mYkOayhoiM9raSRw6HwU7dT7nb1ACiL0G0/9kW1YDPVqXXsf4W2kmQdS6rSSvdi90LrCTQSIkv3wiFvEJLJlmuiN5Acs5+lNMmZoJEsuVqYfjQ4gSmpidZXtNkmd64bx8L6ivUqEi1MlEF4bt/cplhVpa3lQEM/bg4trmn9pkf/bXcalCKbeupfqmBDszn+J9kygHaOvlCtjaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI/i37O7sFj74GTx0BUx1vJjH4h2N0bdcaei7Iqal2c=;
 b=WTU+5E2EN/M3zH9nRTNLR/+p5+ioNKftK6X2Rvnr2wvSfCCSU1gLVn7yIjyVB5rYlDPfvzoaL3CElz6Isgdvqf6Ttbqzwo+OdBe8B8lDH3I3DX8NOjo9+fT9ZU0eFM1Hx6KZPog4ytyfLGjGjBCCg6GwSHz7Aiaohb866fTXiAE=
Received: from SJ0PR03CA0119.namprd03.prod.outlook.com (2603:10b6:a03:333::34)
 by CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 13:59:01 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::82) by SJ0PR03CA0119.outlook.office365.com
 (2603:10b6:a03:333::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Mon,
 22 Jun 2026 13:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 13:58:59 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:58:56 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 4/8] misc: amd-sbi: Consolidate Common SBTSI Probe Path for I2C and I3C
Date: Mon, 22 Jun 2026 19:28:17 +0530
Message-ID: <20260622135821.2190260-5-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|CH3PR12MB9193:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c57faa-26e4-41cd-f7b6-08ded0666902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Vqn+5R2O5ErMZ4NnKHPgMffViVsWbJrTfOBeYkMUiFjeZ1riieiXTUqyt1Vd/4kgjZ9wzp8KQJxAWuqw3m6ns7RyASwRbrm8MAsyn3BN6ZNwsNOZ3VDRo8LnlAQlWble+BiQcOKHdXBvgXs7S2+Hs5v+cSTJkWqtUm56rZHLnVZfp3lpCGIPl9PaFSZO5ThepBk8jq00vxT/0QY/MMWjx/b0CnlYCz+0qAbDwnRmpXFCeAoJk/NnKcKh4P6bUriq//Do+pfsEKlfE6apHsj9HuoSlUVIwVQRQ9nwAthHEbOzUGqC5Gxq5ddeesRuh5oELxWu2X8yNaqc1Lg0oOj6R/dqa4q5RnKCmy8qV9CSz0PxExpVPHI9ZfFEika7g48s7+OuJNbXgRua7bgKx7RzGREs9INvwzD2qxzCL5ngQ6/Izesc/Wt+KHSzXTVzKuDdPG58Z6g6N9ENeuTiSTnVA6nGH8xA6aTXCGAQR/1i/E1EiyyrAh/vCUCLWnRPtf1+ibyakdGJkgsRvvecCMbSsvoEQN+mtPJpwFL/h1yWz1/9cQ0NwgWk0D2jp+DkNLBPSPTMIfhXOZqCGPuovkcWP0ylLRJyNZ8NPei5bXCLDR+zgx3RDRgEp86L1daf8BWvC73nFw5wnIdjilEjpa4mnuVcdrrLoIh4GfdPgGgQiDHKJilgUKA8p9DbAOXYComoIWKLFGcEwr1OcTuCk68Vpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WDpOrc7dMjGY06Y3vHqfYPl697l0B45ozHaxn/6XiG6e8NV1usWffvVXYv6lahYu1DgFL38Kn22bV8CNrdTtnBmfD2uET8Jqo08f85BRuCxj1Q+3Pw+oacrUdGnUds4VtnXEirp29Iu9zs55aoG7889qgcpQ9Asg35rV5r/PkQ6Cr3ksNwuqCn17QQ+Mrzov5kpCEPK50YGL6hfpz+F8cNxWtrLp+92C77Em7dBl1/IkgiBlHu162T/IemoiyjfY4HNEMw52sy0OA3P2JcSvP9VE0Xu4DwOPsJJg64uVRZXWSs2nBTvAKAUIhExD3oZ4QIUIYda3pRrnyjCBnUSxLUb/Wv6eK4kG3UGpV4es9pBFQrr9tw6JOXGpUAu1e22ts2JR5vI4p1U5oE78Jqs7ZVmGkNvHgE211k0xP4WcLtsFbMmSUAGTV1qfZ1f9USKp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:58:59.8885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c57faa-26e4-41cd-f7b6-08ded0666902
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9193

From: Prathima <Prathima.Lk@amd.com>

Refactor shared probe procedures into sbtsi_probe_common() to ensure
that I2C and I3C probes focus solely on bus-specific allocation and
device configuration.
The utility function reads the configuration register via sbtsi_xfer(),
initializes ext_range_mode and read_order, assigns the driver data,
and registers the hwmon auxiliary device.
Utilizing sbtsi_xfer() for both buses eliminates the need to duplicate
the I2C SMBus and I3C transfer paths within tsi.c.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v2:
- New patch to refactor SBTSI common probe

 drivers/misc/amd-sbi/tsi.c | 26 ++++++++++++++++++--------
 include/linux/misc/tsi.h   |  2 ++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index dfdd730b906a..a4c7e1be5624 100644
--- a/drivers/misc/amd-sbi/tsi.c
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -84,25 +84,35 @@ static int sbtsi_create_hwmon_adev(struct device *dev, u8 dev_addr)
 	return devm_add_action_or_reset(dev, sbtsi_unregister_hwmon_adev, adev);
 }
 
+static int sbtsi_probe_common(struct device *dev, struct sbtsi_data *data)
+{
+	u8 val;
+	int err;
+
+	err = sbtsi_xfer(data, SBTSI_REG_CONFIG, &val, true);
+	if (err)
+		return err;
+
+	data->ext_range_mode = FIELD_GET(BIT(SBTSI_CONFIG_EXT_RANGE_SHIFT), val);
+	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), val);
+
+	dev_set_drvdata(dev, data);
+	return sbtsi_create_hwmon_adev(dev, data->dev_addr);
+}
+
 static int sbtsi_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct sbtsi_data *data;
-	int err;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->client = client;
-	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
-	if (err < 0)
-		return err;
-	data->ext_range_mode = FIELD_GET(BIT(SBTSI_CONFIG_EXT_RANGE_SHIFT), err);
-	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), err);
+	data->dev_addr = client->addr;
 
-	dev_set_drvdata(dev, data);
-	return sbtsi_create_hwmon_adev(dev, client->addr);
+	return sbtsi_probe_common(dev, data);
 }
 
 static const struct i2c_device_id sbtsi_id[] = {
diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
index 2d2709f1ff32..55ee7e42a65d 100644
--- a/include/linux/misc/tsi.h
+++ b/include/linux/misc/tsi.h
@@ -14,11 +14,13 @@
 /**
  * struct sbtsi_data - driver private data for an AMD SB-TSI device
  * @client:	underlying I2C client
+ * @dev_addr:	I2C device address, used to name the misc device node
  * @ext_range_mode:	sensor uses extended temperature range
  * @read_order:	if set, decimal part must be read before integer part
  */
 struct sbtsi_data {
 	struct i2c_client *client;
+	u8 dev_addr;
 	bool ext_range_mode;
 	bool read_order;
 };
-- 
2.34.1

