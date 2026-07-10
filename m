Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19DA41C317;
	Fri, 10 Jul 2026 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682244; cv=fail; b=IKsImQQfCo8Y/z3WSZXmkAYzlXUdOILtBpYczoPk0pXAR7WUupZErv4c6PlLUdVVW9EWKAhWQtiLdlkCy2BOsdzw2p6++nvC1imfd8kIwgERIHxCovznL9LftzH7kxjT/HfFAPQ0GP4Uw+PDbB+1S2krzUHNJYZrGKn2vNTQlis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682244; c=relaxed/simple;
	bh=RygZ/hDir0wAClNLo5CWEV3qjnAvUwQkQzfjSJJn4Vc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIpDHJRa7t7C1m4X7kmE3SJURciMyTIcCobGtOMkvnC+2+yvBMRlDxi+yLBEyeKSh3nuwYGqfCqTmj33lXgT5jp+5wCn2Odw4m33O8lhlPNJMWF/g32OxbdA/iSnQht+HGJ4hy5HVwOoHR59BpqDtE0TU8CFnb9SGlbMJB7Y0Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=akw8xujH; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="akw8xujH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gg5dqWzcEFz0QJY+ibL46g3pLHYztFJjb98Nhra4cnrDRWqtzRDPRVvd0Y0VN6QWu91krvpPA53ypeq8b20IZo1xMx5SOSKbbi2TeLORXSbHU+CUpSx9fhXfHo8x9Glf+/8wBFM1bpeTD3/QZiqQpA6XC94HwbD0yMvB9fnRkuCfYQaaxueLBxZbabm+JeCg4V9LEXx3GleFUDrdjwOH4o85QwF6q3uVrSpCJHdpvTtpZRLvV4THni+afwVgXaZY+usMgoVnBacbSQIaiUI8f6Un2KyE+MI2nreka3L92GcL9cSFEGuBZKgNpzX4SpkEKR2dttXuqVwUKHvCS8oM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUUJZsMh8v65isrkpept+gCiwFckL7APUhIBENYyyQA=;
 b=HmQiNSSAYE2MwmuVhdHCvSzCVVqW/rxbg1/Fp4nvmLLsowCAixwcbjD5a5mzbKLAB1ah4PpC67dO/eadecj0XHy+Bk0jMP/VOaDdb7F8ize+Fg/Z7wtS9sJV7C80PJgVcOTMU752D2PAH5/tUZXmikpubmjXkET/kpv9Y6qVoWWMKQpM5c/lH25MH3We3hikJXrmHJWqi4biXamkQL3jWzkQ+fDvMHdccnlhIsdNpfC7kZn42DkiDQAGAzwBoJ1CNclKbwGBSI82UCbWF7nYDUXRpG+HfQToiqTSe7UIh2PkUDH0V2cg5F7vpwZee+KyH53VBo+fD+7X5CSLuRXOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUUJZsMh8v65isrkpept+gCiwFckL7APUhIBENYyyQA=;
 b=akw8xujH05jb0QqOlox7DEB0V2LVu2cxBypPja2GBcyQI7R0cVq4Kfe8GkC6x8uDf0F6Cs9HXfhfOBteiwURl1aEj7F0fXPMzj4TkMzLiTzoQ/qF58mMv1tvzBNarkSYqYxoD69d9/TdVqUq4qtDY3U6JUtnGi00YBxHi/d7ys0=
Received: from DSZP220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::17) by
 DSVPR12MB999123.namprd12.prod.outlook.com (2603:10b6:8:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 11:17:19 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::54) by DSZP220CA0011.outlook.office365.com
 (2603:10b6:5:280::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 11:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:19 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:17:15 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 4/8] misc: amd-sbi: Consolidate Common SBTSI Probe Path
Date: Fri, 10 Jul 2026 16:46:38 +0530
Message-ID: <20260710111642.850022-5-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|DSVPR12MB999123:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b5dce4-12d3-4912-fed8-08dede74ce88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	VLyJvV5Cwp9eEtkBjtBcCyPuGzONs63iTjjztAG8WV5H/jHalzxGdjYjs8jN6pp86QGDd1N1It4b9VPp0bUNS/pCGSfGHpU/AV5kCc7aSuV/sX4e3H0mxguvnv8gMJiMDvQf/8ui0Ah1fYqws76Tfs1FND67YcV8k5UqvWuBHQhnDLY8ypQ3pNj2ZEMqty7ANcY1cflcYcLoZ57UgFwdMI37uL0EHM+PoWeb6Ql/D/Qdx+ubcsr7VXJgEtMPKsgUDPxH7cM0rzWik8gJd4qTHW3ync+9tUL+TFx26GkFjWXDwbaGk8pGXnM/Wr/EKtrnJbPNuH8rsHyp3ZzeVAAWctBE0nTR03ynDsomeo7qnd4/ROJlWr7Gd1XHOByY2xVWLrW0b6GMFyhd7u2n6vf5SPWyxKfcFP+u7ezdThwS+Sj76vnjA8VXhVLYVHZ4t4GuxGw5cLXIhFLY8RnCHzi1cBVzt8m0PpSMFtPgz1pmcLPdq1jdKZGZVs45TR3sE4FFxHeVP7uQ1bAkPFM461T1YcSBdTDZlgc237Ph0sGX+Nr3xiQnJ5GtN31Fwc6A5DWTHZPLwM/e7a1m1TD1fkXoFlzcCKGMzW0BWj8aFBLg728eM+9FtZ/jWJzG7tKaVDLD4qRg8WhrDRd+pfYS+fPTlQmEwURRCDNf6O2adSezbNEAIF4adJvRZdstUTse5irXBaORcZLxWekuBU+kJRqkmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C9rsa6v6ThYUmi5Gl65h1dIHFg/lJntm9deg9sbeYe8KYonuiwQbt+ylgHonJZqr5OvNclSPC78QeeVIAnE9u50sy+t+TezyWdGg3IT0xBUaZSww1g3mbKWnXtlz7tN7tbr0l0/pEzWnjlu/Ts0bigV1XSbjZQ2nUGpOitE00WoFDVTlwYiwwWO5GOADnmAT5O8boQStc899aPpbyl2btYIzBKK59O8gzRHnDRedN3IRE4as7LRK2TJJ0Ugp1rknJ6YLoW3YHIci9v6U66m4Uxhr4gRL9tsszWr3tcZ4RmBoy+Scyv4e3gQ7BFC8cBBpbkOFQBB9amgQffWpTHypBVAqEM2meG9iIRAjYHrrfUleTHQdpGjiKf9C108tayqYElVTdPOIxDViuERKfERu2zCbc97lmtR9Fh3kAAdKJVvjZLmZpEMtYAQt2xVSLitK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:19.5069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b5dce4-12d3-4912-fed8-08dede74ce88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999123

From: Prathima <Prathima.Lk@amd.com>

Refactor shared probe procedures into sbtsi_probe_common() to ensure
that I2C and I3C probes focus solely on bus-specific allocation and
device configuration.
The utility function reads the configuration register via sbtsi_xfer(),
initializes ext_range_mode and read_order, assigns the driver data,
and registers the hwmon auxiliary device.
Routing register access through sbtsi_xfer() keeps the probe path
bus-agnostic, so no transfer logic has to be duplicated when SB-TSI over
I3C support is added in a later patch.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v3:
- No functional changes.
- Revised the commit message to clearly detail the patch modifications.

Changes since v2:
- New patch to refactor SBTSI common probe

 drivers/misc/amd-sbi/tsi.c | 26 ++++++++++++++++++--------
 include/linux/misc/tsi.h   |  2 ++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index 67d08df28429..35b9f40741e7 100644
--- a/drivers/misc/amd-sbi/tsi.c
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -79,31 +79,41 @@ static int sbtsi_create_hwmon_adev(struct device *dev, u8 dev_addr)
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
 
-	dev_set_drvdata(dev, data);
 	/* In a multi-socket system, devices that are otherwise identical do not
 	 * share the same static address; each instance resides at a unique I2C
 	 * client address on the same or different bus. Use the I2C client
 	 * address as the auxiliary device instance ID to ensure each socket
 	 * receives a distinct auxiliary device name.
 	 */
-	return sbtsi_create_hwmon_adev(dev, client->addr);
+	data->dev_addr = client->addr;
+	return sbtsi_probe_common(dev, data);
 }
 
 static const struct i2c_device_id sbtsi_id[] = {
diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
index 2d2709f1ff32..6533879cc358 100644
--- a/include/linux/misc/tsi.h
+++ b/include/linux/misc/tsi.h
@@ -14,11 +14,13 @@
 /**
  * struct sbtsi_data - driver private data for an AMD SB-TSI device
  * @client:	underlying I2C client
+ * @dev_addr:	I2C device address, used as the auxiliary device instance id
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

