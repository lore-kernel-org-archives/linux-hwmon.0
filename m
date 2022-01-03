Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F5AC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Jan 2022 18:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235440AbiACSSn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Jan 2022 13:18:43 -0500
Received: from mail-dm3nam07on2048.outbound.protection.outlook.com ([40.107.95.48]:61824
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235437AbiACSSn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 Jan 2022 13:18:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRHZluMzU/3AqStjOAAb0EfkVr/IN9TteB5kD11VHxBHiq2oCS6SHDM4G2+2WN686vF3saMCBUPapuAJ9pA0st61K23Ul9qX/OvuLCf0W9OaUnETSqoRiI+bV3I7MtMaKb0mh4ghw6tczxRU6DGNgXadBsqfcxw9xVcPfsMhnReFShalIQ78mukyY03oVOFBN+T7SloyeNEMHerwF/wyI0xQS6unxPXq5/cOYb0sOKPBwGh6E2fWQZq8GYWbB8tqRdZ8j0sFW/XR4JkLtnUgeOxqvL5pHHj+tGPaYp8TJJI7F4cm0uNOhgOmqIy9p8g+e43srBCwCALRD/pTwFHJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVKVhkOOa28gddssouhiv59g1igzeg8v9uCgbIOvJQw=;
 b=V2dWO2n5rhWOsAlOUxTdkyLgMCXuczCHnAnNJbgn4LrNnaH2WjvqK6yXfwW33a2m4CO/zMpeJvvxGRa9jrntExeO2tKyoK28lmoEQJ7z99JxxaL2kb25qtKvmcPptSmWewrcmFEbEGMRckHA5RPEiQNZ0lXm14tOQ/3wUE85zDBlxLsBwK9pf45Z3fJL2AFd1qlQwTUEWlUIufFZVYX9KFfEtCUQKBbj+oR7Zm3hHdoHe/0ILrxAbdUV2C+n+xfO1yo7U2+yGoE4TaHYkYxiD7/cMHO/k4LxmI02vvTn3MXWGWqIBX6sUeBji7NR3bAL8INnpxDyatl66lfkO3fXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVKVhkOOa28gddssouhiv59g1igzeg8v9uCgbIOvJQw=;
 b=UbOcBqR3Lr/GpVsSntUCeTDUXCjSPQGkyqx2HTXbEigRLXNmGBs9KKRrxyEICKzcK55A2ZYxFJzz/LLXY/eDW7FspJmAswkmwGzbqvNRrvbGI1MJl3EgsXXh7BMQC6Ce4gY0pNeElakulzbJX+2ai8mGsUXIGWqTb5HgwobzXbJaazCymcR9q08MYjlHnZgyS65CzKiMlsrMt8Ady+KX8hOT1ktMKfZQJ/i9m3lnpR8kw/8Wdov9Njcev1cU7PNIWTOu4WLxFSAnUQKSj0RA6fmZVqyoKsADjmeBJUB4uUt1sH/7uV+Mz2XabKl1FpqskJuxPMUBxtrZl9qZCtZowQ==
Received: from DM6PR06CA0092.namprd06.prod.outlook.com (2603:10b6:5:336::25)
 by DM6PR12MB2938.namprd12.prod.outlook.com (2603:10b6:5:18a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Mon, 3 Jan
 2022 18:18:39 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::46) by DM6PR06CA0092.outlook.office365.com
 (2603:10b6:5:336::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Mon, 3 Jan 2022 18:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4844.14 via Frontend Transport; Mon, 3 Jan 2022 18:18:39 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 3 Jan
 2022 18:18:38 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 3 Jan
 2022 18:18:38 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 3 Jan 2022 18:18:37 +0000
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 2/2] hwmon: powr1220: Add support for Lattice's POWR1014 power manager IC
Date:   Mon, 3 Jan 2022 20:18:25 +0200
Message-ID: <20220103181825.313067-3-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20220103181825.313067-1-michaelsh@nvidia.com>
References: <20220103181825.313067-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f948016f-2af0-4835-3683-08d9cee5775d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2938:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB293805EA282EA8952DCBC399D4499@DM6PR12MB2938.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G0Fea+H/01na40T89ciFpxgdPPQEFaXCPTASNdz+5OdFI9KkJr1PR5bJf7PVZSmHwXMm5OmZrXOwUkSiYUnqJ+L/lYQr5P66dHPRxLXbA5jS18O+0O6nsVRmLa9DrUR2oTO6PbOcrsxH1VbL4yqZv0rgtIQyQ/HRAxIzQA/SgjDcJumCdEiTcea9PIk67Nxlpk0eUZaMm/alLNifHtFwPbTLq9DfBFBrg//Ai6nmN/SMcMZsB/4ZeCPaJiNdEnp6OenElUPiRc86+FBTnQOgGOu++HfDltj+jCfLZYl28hAVleT3b5rVcHElJG+X8R0LcMGWfOqNHqi1OGcx7qtkgTvv8Q1BJNdCZYjBu+mPJNDqrR9xCa0EWWEEQeIZHlUqudBnNqqsBx8PduZkRl+O58N7FKpoadHAaK3h6nL/JCkEe9kaBq/9ggHkfhZn4IoqZMkfqi6KbZilWxPHgx+md1guEl0X/lhaqf7np4V0FnMIJ9dTPSu+Guleh8IS8vm3HRTOrci21N/0EJMW/5+1W7jfu3pvN29u7CFKtmXjc7idDAz/QZpe8dVPnbQwnMV2XA9Q5saenQbgMeafmoU+mnMEeHeS/B26ZbEkR7ejWhZDOBY3SKo5FfGH26EfLunQ5I14B7VLYOPW1cooqNvFs3y//kkKTT+VB1NTTdqRuBFcxmi/NVQqC13ScIW2G4cSiXLi7ICDg9G35nNaolnxlaNAo0bsjvytkgf4eIhkfBsb0R4Uv8SUeSlLIiAVeyWIxIArysSoGb0cACL3w/dEfSrg8zs9C3e6+MDyfbcaBLl/XAkoZbBJlYH1FjUa5yzL
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(336012)(40460700001)(2876002)(6666004)(36756003)(107886003)(2616005)(6636002)(316002)(4326008)(508600001)(82310400004)(8676002)(86362001)(8936002)(47076005)(5660300002)(1076003)(426003)(36860700001)(70206006)(110136005)(2906002)(70586007)(356005)(81166007)(186003)(83380400001)(26005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 18:18:39.3816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f948016f-2af0-4835-3683-08d9cee5775d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2938
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

This patch adds support for Lattice's POWR1014 power manager IC.
Read access to all the ADCs on the chip are supported through
the "hwmon" "sysfs" files.

The main difference of POWR1014 compared to POWR1220 is amount
of VMON input lines: 10 on POWR1014 and 12 lines on POWR1220.

Extend wait time for conversion to complete, since for POWR1014 it
could be longer.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/powr1220.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 1b833781e89d..4a9ad4b5fa9f 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -22,6 +22,8 @@
 #define ADC_STEP_MV			2
 #define ADC_MAX_LOW_MEASUREMENT_MV	2000
 
+enum powr1xxx_chips { powr1220, powr1014 };
+
 enum powr1220_regs {
 	VMON_STATUS0,
 	VMON_STATUS1,
@@ -74,6 +76,7 @@ enum powr1220_adc_values {
 struct powr1220_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
+	u8 max_channels;
 	bool adc_valid[MAX_POWR1220_ADC_VALUES];
 	 /* the next value is in jiffies */
 	unsigned long adc_last_updated[MAX_POWR1220_ADC_VALUES];
@@ -128,11 +131,8 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 		if (result)
 			goto exit;
 
-		/*
-		 * wait at least Tconvert time (200 us) for the
-		 * conversion to complete
-		 */
-		usleep(200);
+		/* wait Tconvert time (200us - 400us) for the conversion to complete */
+		usleep_range(200, 400);
 
 		/* get the ADC reading */
 		result = i2c_smbus_read_byte_data(data->client, ADC_VALUE_LOW);
@@ -170,6 +170,9 @@ static umode_t
 powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
 		    attr, int channel)
 {
+	if (((struct powr1220_data *)data)->max_channels <= channel)
+		return 0;
+
 	switch (type) {
 	case hwmon_in:
 		switch (attr) {
@@ -270,6 +273,8 @@ static const struct hwmon_chip_info powr1220_chip_info = {
 	.info = powr1220_info,
 };
 
+static const struct i2c_device_id powr1220_ids[];
+
 static int powr1220_probe(struct i2c_client *client)
 {
 	struct powr1220_data *data;
@@ -282,6 +287,15 @@ static int powr1220_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	switch (i2c_match_id(powr1220_ids, client)->driver_data) {
+	case powr1014:
+		data->max_channels = 10;
+		break;
+	default:
+		data->max_channels = 12;
+		break;
+	}
+
 	mutex_init(&data->update_lock);
 	data->client = client;
 
@@ -294,6 +308,7 @@ static int powr1220_probe(struct i2c_client *client)
 
 static const struct i2c_device_id powr1220_ids[] = {
 	{ "powr1220", 0, },
+	{ "powr1014", 0, },
 	{ }
 };
 
-- 
2.14.1

