Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C17FA3740
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Oct 2022 14:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbiJ0Ow2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Oct 2022 10:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235911AbiJ0Ow1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2022 10:52:27 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD6FF614F
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Oct 2022 07:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql6XrjBQZU7UjKpJQs9oMJZz1WzsBR6JRveLUrtEs3vDBsH2+BmXNYPONO9oDMxifNW2vX0lnFkkx1pzKMd1cHuMKkGw7D+RwweM7sgtLxNssuwRCCj/lZj90+0UhMG6vKzjurLjilM0iPE+IICbhyn6daaLXLzNH8ADJRgqZae2o3X7vgd5E6fH057fX7s/ey8v/iwTx6LadGgqdC17pwjBEXAhlkBMZzkX8s54txLndqezfechZjdVA0bC0nrX9cyxefp1S8rYYL36DPSn/YBrd8P8my7gp539HPnuc2wyXDTT0eMkOnGFDN9xMxqPO15muLgwszzd9oKDyolBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Flz3LivdB9qwAhsZe4Va4fveBJVSNHL6UmAoIjfAYPg=;
 b=WvHTlBKVyhlolKuCbD5zWskG/PKHxuql5uz7t+cBe0eUzHjtTJRDnL6yxarYxwtnlbHLrwPhDKIjhbojagzgRgqUjH8iAs2diNAFIykCa3yMQLCayN6yM5c+7ApcK+XgLvhkvnkeJBTezlkKdkop5OzthaPRG7ElUwBjzyMEhFwUUb+AeCkZVG2Yey7eULgraersLkfVpDj3ZSJUqPwwZ3uloMrOlENxHaCW3VZxuvihi2KX+fdUr58Xg5CWxlds00/k9hd+Ke0Xe7i5T1WybtPgMAlovkEw2KO8QvoVTAOpsB/5cqooOUU8Z/DPsxNqcqv7zvGjK5pPlQ4u1f9/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=etas.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=etas.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etas.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Flz3LivdB9qwAhsZe4Va4fveBJVSNHL6UmAoIjfAYPg=;
 b=PO3PB9I5lsPDkC9ccEqEkpz7SNYpRl4DH6TedkHbNAVth2ytf4V6+ibD6XiLv20NH9MyF3XXVXZEVImeBJQNwDPqVRrJ6tqN4y27mnPwLAVcPsObEg4A+rtw5Y9ZWTmBlGFh/eRYLGHSaC+hrRmYLJMthCeXsZ83MOTXA7NNVSw=
Received: from AM6PR0502CA0052.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::29) by PAVPR10MB7305.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:31c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 14:52:22 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::dc) by AM6PR0502CA0052.outlook.office365.com
 (2603:10a6:20b:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14 via Frontend
 Transport; Thu, 27 Oct 2022 14:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=etas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=etas.com;
Received-SPF: Pass (protection.outlook.com: domain of etas.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.199) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Thu, 27 Oct 2022 14:52:22 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.32; Thu, 27 Oct
 2022 16:52:22 +0200
Received: from getk-dev.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.32; Thu, 27 Oct 2022 16:52:22 +0200
From:   Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
Subject: [PATCH v2] hwmon: (pmbus/ltc2978) add support for LTC7132
Date:   Thu, 27 Oct 2022 16:51:35 +0200
Message-ID: <20221027145135.31802-1-Felix.Nieuwenhuizen@etas.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <0221027133201.GA566451@roeck-us.net>
References: <0221027133201.GA566451@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7EUR03FT053:EE_|PAVPR10MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: a731f41f-3992-462c-9b7e-08dab82adada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i/7ZMqDo+7XWFvwDO1M8jEEFh1GNcuSLaMsd4QvhxFFNOAgbIAplKEJFraWW8Cq0QNa1oZAE4U3wlowxqUY/dGgdMNQGzniGq1UK0Dfiko2uy1ietmfFw85rMMy77E+mvlK2v30dhEOxheMQzr1QACUpAAqDiVav9HbVt8B6FHa4/QAQqHzKDftcSsdsIl8r3eaZB3ccqL455x+jbdVui4Tg2sPzkezGN3faRV63j0U3Lq/CH6D+ENT1JSUwazT7EIYnXMojlvel2/IH7I7oGkmeymCO0ILdKReReE10+6EHXX9vi+bD7XW1YS9Rz0YRCygTRImyYzyOI9Nd9VVOJnjgqzLGKwYninYZMTGwL2UYrOPWmfWd+HS7DanefRy1FyYmrB+86V1faP8D6Lgz+zLRFLDxo4+k3xO8nZs7qTbft2mgzIJwv7m2p3UwaNr9hPYmygWIXmoh3WC8Fs7Mrymh/aEq98PFWVn41mLTQKPRmph1v3gFo92TbEnTt6n2PfMnUQu1sy0eHV8VfnRl9Emvd+gB7GuKKuSz2472I6MN3iTeIFaZulPCknx3L6m/KSUSCypg0fMBUGcCNK2SCnjj1VtCk4x+8Eov3e+yYFCeaV/N6TrTY+/grPCe5f3vfJTL0wv13EFI4Fdqu7ZrJYg5Gki+N8FtI+HV760bvJb2GFDk2aTM14g8tmttutC0hz4NKpjWUz5YhrV7pQ392L+a/gvcgFcwjA8u68mSC2K9UfSNCYj/0KUyj5uv68CJ7Oo6xWAw5RRJonpCL0zK9WU15S9IUoteFRyKj2NpzTk=
X-Forefront-Antispam-Report: CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(8936002)(86362001)(36860700001)(478600001)(82740400003)(82960400001)(47076005)(83380400001)(81166007)(82310400005)(356005)(2906002)(6916009)(36756003)(336012)(54906003)(186003)(1076003)(107886003)(316002)(6666004)(2616005)(8676002)(40460700003)(40480700001)(4326008)(16526019)(70206006)(70586007)(26005)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: etas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 14:52:22.5462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a731f41f-3992-462c-9b7e-08dab82adada
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7305
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for LTC7132.
The relevant registers in the LTC7132 are identical to the LTC7880.
So it's just a matter of adding the chip id.

Signed-off-by: Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 6d2592731ba3..79f480b4425d 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -23,7 +23,7 @@ enum chips {
 	/* Managers */
 	ltc2972, ltc2974, ltc2975, ltc2977, ltc2978, ltc2979, ltc2980,
 	/* Controllers */
-	ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887, ltc3889, ltc7880,
+	ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887, ltc3889, ltc7132, ltc7880,
 	/* Modules */
 	ltm2987, ltm4664, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680, ltm4686,
 	ltm4700,
@@ -45,15 +45,14 @@ enum chips {
 #define LTC2974_MFR_IOUT_PEAK		0xd7
 #define LTC2974_MFR_IOUT_MIN		0xd8
 
-/* LTC3880, LTC3882, LTC3883, LTC3887, LTM4675, and LTM4676 */
+/* LTC3880, LTC3882, LTC3883, LTC3887, LTM4675, LTM4676, LTC7132 */
 #define LTC3880_MFR_IOUT_PEAK		0xd7
 #define LTC3880_MFR_CLEAR_PEAKS		0xe3
 #define LTC3880_MFR_TEMPERATURE2_PEAK	0xf4
 
-/* LTC3883, LTC3884, LTC3886, LTC3889 and LTC7880 only */
+/* LTC3883, LTC3884, LTC3886, LTC3889, LTC7132, LTC7880 */
 #define LTC3883_MFR_IIN_PEAK		0xe1
 
-
 /* LTC2975 only */
 #define LTC2975_MFR_IIN_PEAK		0xc4
 #define LTC2975_MFR_IIN_MIN		0xc5
@@ -79,10 +78,11 @@ enum chips {
 #define LTC3884_ID			0x4C00
 #define LTC3886_ID			0x4600
 #define LTC3887_ID			0x4700
-#define LTM2987_ID_A			0x8010	/* A/B for two die IDs */
-#define LTM2987_ID_B			0x8020
 #define LTC3889_ID			0x4900
+#define LTC7132_ID			0x4CE0
 #define LTC7880_ID			0x49E0
+#define LTM2987_ID_A			0x8010	/* A/B for two die IDs */
+#define LTM2987_ID_B			0x8020
 #define LTM4664_ID			0x4120
 #define LTM4675_ID			0x47a0
 #define LTM4676_ID_REV1			0x4400
@@ -547,6 +547,7 @@ static const struct i2c_device_id ltc2978_id[] = {
 	{"ltc3886", ltc3886},
 	{"ltc3887", ltc3887},
 	{"ltc3889", ltc3889},
+	{"ltc7132", ltc7132},
 	{"ltc7880", ltc7880},
 	{"ltm2987", ltm2987},
 	{"ltm4664", ltm4664},
@@ -651,6 +652,8 @@ static int ltc2978_get_id(struct i2c_client *client)
 		return ltc3887;
 	else if (chip_id == LTC3889_ID)
 		return ltc3889;
+	else if (chip_id == LTC7132_ID)
+		return ltc7132;
 	else if (chip_id == LTC7880_ID)
 		return ltc7880;
 	else if (chip_id == LTM2987_ID_A || chip_id == LTM2987_ID_B)
@@ -831,6 +834,7 @@ static int ltc2978_probe(struct i2c_client *client)
 	case ltc3884:
 	case ltc3886:
 	case ltc3889:
+	case ltc7132:
 	case ltc7880:
 	case ltm4664:
 	case ltm4678:
@@ -902,6 +906,7 @@ static const struct of_device_id ltc2978_of_match[] = {
 	{ .compatible = "lltc,ltc3886" },
 	{ .compatible = "lltc,ltc3887" },
 	{ .compatible = "lltc,ltc3889" },
+	{ .compatible = "lltc,ltc7132" },
 	{ .compatible = "lltc,ltc7880" },
 	{ .compatible = "lltc,ltm2987" },
 	{ .compatible = "lltc,ltm4664" },
-- 
2.30.2

