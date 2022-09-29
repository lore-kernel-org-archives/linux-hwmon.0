Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2867C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Sep 2022 12:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbiI2MRA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Sep 2022 08:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234968AbiI2MQ7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Sep 2022 08:16:59 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AFA12A484
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Sep 2022 05:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM20bu8KEO9rqR+hORVDeQq+AOxZoRjMjyHRkdCzRgPa1wifNJT9YIIek0RsiMBF0CJGDEEFoaNBFXM1l8+M1swEj1rmTmnaIIpHWkceTtur13AGZ7GvYo8AjrrXQ1snLg0z8LutEa+SO2dnwTMuLrHj7VCfOOsQZzBsVormA0G2azcG6Vn4nTgW7E/B0SRNEXMyz6Hr5bxKR1pIJQbYHrB8RhWN1HWH03InO5jxngdtswK4CoyA4u+JdqdBT6IckZUz8FM++FEBHS8/eaNOjHIPYX5r1IAaJe9jWE+g57fxiei5CjVgTrWQMVKQnKZ775eLWCcwY0NaF8UocLLX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ul1EhHP/9u8wQTbxgFNgdfWon0NzBySm3FV6dEOj4L0=;
 b=fONE5Uz0dF2j6jQb59LZzlXPG+ElPKdfcVLIVvwDGbD6/WN1IHiEXRsooA8027XaSAc4vwNlFClokEjRXl1Hrjq3IIeT6znsNj/pDMOyfgxYpxFTU/OPPoK52XuGcVs9b2csd/hRMlTstgMh7O9qi5xD1uckd4SIeLw3sNNRPQVpj4/D7zJhq3tIfB0rhCnQ4joirEFke8lyje8HQQcw2EzfrIYat/gBB6hNzzSgesaTpApEuD8MZE04LvULxhTUvp5rTYxE8/rccYY7VLphSjB+4qMx686YkI74DxHbET6KkB01QrLOXbCJWzpp/7LN2ENRVwGlC4twGxMID8d3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul1EhHP/9u8wQTbxgFNgdfWon0NzBySm3FV6dEOj4L0=;
 b=jKwrOMICFY9/ppQEi2qLX556AemRVp1PM+n7S3/O5PjY3wb6e7wA2NpEsyPGXg0aV16t8lDtGb0oGqYCVySI8SrKT+TJnAn5u09Lp4ppset8Rva/o18PlBABTbf3RbcVHE3KE+UVvMOlhcrV0H/bEvZP86oQ+2U9r7t3zTLYdfll7hHFd5VyhCC/S4/OSXkPXlPWoI36mGy2/mSXWvxbkHR5a6VuftXgBIl6VgTo2gGQgXSgfYqOobb/wFiVPVpsVLOmUpq1O2L1qHG6XrQO3WGLYvWYaOrpmYXNCOWmPsnXU1zkGhDzWlF2j08IyPM1zTrk9i63zQCAMsfQ0CV7iQ==
Received: from DM6PR02CA0135.namprd02.prod.outlook.com (2603:10b6:5:1b4::37)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Thu, 29 Sep
 2022 12:16:57 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::b1) by DM6PR02CA0135.outlook.office365.com
 (2603:10b6:5:1b4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Thu, 29 Sep 2022 12:16:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 12:16:56 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 29 Sep
 2022 05:16:52 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 29 Sep 2022 05:16:52 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 29 Sep 2022 05:16:51 -0700
From:   Oleksandr Shamray <oleksandrs@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <vadimp@nvidia.com>,
        Oleksandr Shamray <oleksandrs@nvidia.com>
Subject: [PATCH hwmon 1/1] hwmon: (pmbus) Fix sensors readouts for MPS Multi-phase mp2888 controller
Date:   Thu, 29 Sep 2022 15:16:42 +0300
Message-ID: <20220929121642.63051-1-oleksandrs@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT038:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d49c01-4c03-4bba-43c8-08daa21480d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HrSjaVz7Gf/o8enO8hK6pzynXZh3RnwMCQyNhHdqhzbre8EfzZU2zNeJgPKvpHXEcN7F+w1MwZBq2evWMWhItgfiuoDXegF9KIOBcVI9+NC8szk2RHJFvK+qW6U/iDA3mqtgOVg36gbykmL1baB619a00TohHHzVPZS5xJXTDJ+ysR9iRSWt8dLRB4o7wQE1B9StnDkIQftLOhw3w2X+nYMzQCgJllG42sBHQnUsBszxr7rf3BvbTumL/+YXdH7V5rP7Svw+ogkPis4w+N8lzd4Y341UPRZFVVnd1F17DiU682baCK8g8AAMP1njkJAu5V43QVGqFZPidDVAEAaBBK+AN/VcEll+/kS/ctZkYC4olQw6TbxthRWXbdMRCP+kl9vswzyLnV2donkSMeSnN9I/icp9RYp6CADZTpTF73hxJw8YSm9mGd9TkIH/EbPkssfrG/OEOpKU9YaVd7udH9JUG0OKVqiqNjh6gcwazvgu+LhI3uJXojIzTNfm9cZv4FpijTC3e8huk+CsfAxo+/ajYnGB57k0KLvgRtl15EUqJhhJeZ4HK1H3s0/8tzc1TXwiqwo9dcBMP/S7LPlnv7xYqfD3z0ESrG1txp7sVas8VO1MXwWBmNlYjjm7JCNj8V1viCQMvmsAE96Qn+Fr00LdswdRa3K1Hl9hvL/JTOP0kQM9V4p0h4m0nX5W8CNdzsM01U+9xEvA8iH4zPiiuBHrgbdba7SdZkuefIYQphzoqhY1RkgQZn13ZPlb/UsT5+YyKPTaByhWnVsqHFBrg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(82310400005)(36756003)(426003)(7636003)(356005)(2906002)(40480700001)(107886003)(5660300002)(4326008)(41300700001)(316002)(6916009)(36860700001)(8936002)(83380400001)(26005)(186003)(336012)(40460700003)(8676002)(47076005)(1076003)(70586007)(70206006)(86362001)(478600001)(2616005)(6666004)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:16:56.9642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d49c01-4c03-4bba-43c8-08daa21480d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix scale factors for reading MPS Multi-phase mp2888 controller.
Fixed sensors:
    - PIN/POUT: based on vendor documentation, set bscale factor 0.5W/LSB
    - IOUT: based on vendor documentation, set scale factor 0.25 A/LSB

Fixes: e4db7719d037 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2888 controller")
Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/pmbus/mp2888.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
index 8ecd4adfef40..529eb3c95bb6 100644
--- a/drivers/hwmon/pmbus/mp2888.c
+++ b/drivers/hwmon/pmbus/mp2888.c
@@ -109,7 +109,7 @@ mp2888_read_phase(struct i2c_client *client, struct mp2888_data *data, int page,
 	 * - Kcs is the DrMOS current sense gain of power stage, which is obtained from the
 	 *   register MP2888_MFR_VR_CONFIG1, bits 13-12 with the following selection of DrMOS
 	 *   (data->curr_sense_gain):
-	 *   00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A.
+	 *   00b - 8.5µA/A, 01b - 9.7µA/A, 1b - 10µA/A, 11b - 5µA/A.
 	 * - Rcs is the internal phase current sense resistor. This parameter depends on hardware
 	 *   assembly. By default it is set to 1kΩ. In case of different assembly, user should
 	 *   scale this parameter by dividing it by Rcs.
@@ -118,10 +118,9 @@ mp2888_read_phase(struct i2c_client *client, struct mp2888_data *data, int page,
 	 * because sampling of current occurrence of bit weight has a big deviation, especially for
 	 * light load.
 	 */
-	ret = DIV_ROUND_CLOSEST(ret * 100 - 9800, data->curr_sense_gain);
-	ret = (data->phase_curr_resolution) ? ret * 2 : ret;
+	ret = DIV_ROUND_CLOSEST(ret * 200 - 19600, data->curr_sense_gain);
 	/* Scale according to total current resolution. */
-	ret = (data->total_curr_resolution) ? ret * 8 : ret * 4;
+	ret = (data->total_curr_resolution) ? ret * 2 : ret;
 	return ret;
 }
 
@@ -212,7 +211,7 @@ static int mp2888_read_word_data(struct i2c_client *client, int page, int phase,
 		ret = pmbus_read_word_data(client, page, phase, reg);
 		if (ret < 0)
 			return ret;
-		ret = data->total_curr_resolution ? ret * 2 : ret;
+		ret = data->total_curr_resolution ? ret  : DIV_ROUND_CLOSEST(ret, 2);
 		break;
 	case PMBUS_POUT_OP_WARN_LIMIT:
 		ret = pmbus_read_word_data(client, page, phase, reg);
@@ -223,7 +222,7 @@ static int mp2888_read_word_data(struct i2c_client *client, int page, int phase,
 		 * set 1. Actual power is reported with 0.5W or 1W respectively resolution. Scaling
 		 * is needed to match both.
 		 */
-		ret = data->total_curr_resolution ? ret * 4 : ret * 2;
+		ret = data->total_curr_resolution ? ret * 2 : ret;
 		break;
 	/*
 	 * The below registers are not implemented by device or implemented not according to the
-- 
2.14.1

