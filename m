Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E171C38A2D
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Oct 2022 09:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbiJ0JBj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Oct 2022 05:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235207AbiJ0JBI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2022 05:01:08 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0B682748
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Oct 2022 02:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOfqoOUMFvfR0qA4IZGwzm7+llxPCbTnMxgb3HYFcFakqls6MwskhczTnyehl7f/lqCYylLDsdoRobdUitWaHhM1pJ7CSy0JGdGCEMmLP6H3xrBA9BmQTTty5uoHCoEKi5FO0sFn8ScQ+d/tVSNnv9vL4USaZ9swdA8vhGpgztXww8693lsC6YW+DUSwvpZW+JRh14Os2biLXLGGosY440gOLhLQT282fIP8MvxXwH4R3XgGWl0wyQcUvSHjXxgZ0wTY0AdLXF4RwQ6egufS0b2wp4wDstObFsUnJCxVnhPhIDAmFRr52Vt1Ugm3Rr1tT3xDIYSAPNmkcFT/JkSZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQNmjjl5MGMldP3sjAXF4a3u4QMhGReucfbML03tH6Q=;
 b=KeMNsgjg551vzlG9Sm6bFuO8Y14apaSFj+6A+GAwkgH6jKXe/ysm3EWBR4j+dLvH4Bu1DnqqvDQ0shFC3qhPIL3g3bNE8GBdHnEc7JAF5tnwPXHqjpWKgXLSl4aXFHJt5/1+x/Te2TR1kFyB7b5la7PPpdugvWWpieHRY9KigPZ+1KyOjqYOIBgJxJImRouIircfimuXxpl9CrVoYv0QA/8tG23G/jG2Gtar6RHZpcn9xOqO1A/m7dMGVr1oedMya+MQSH9zV0cSXYaDvaT31IDXYhqIT94jp71JRddXXJ0dpRchzMF3XczE+aZQmqBg1lGdARwuMLwXPsgYyjz+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=etas.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=etas.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etas.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQNmjjl5MGMldP3sjAXF4a3u4QMhGReucfbML03tH6Q=;
 b=Y69fhhHHKSBNjSs+pgtIjs90zj/Msu60i1vLMDjF+u+MY3Gn4/Fg0XGfKayXf3ykv3odTD4IzUjvMvaqhmVorkkX6Nj05R8p2GDifLKRsup/LrrZVXd+2QXiiCEOc3MhyEPSWF2mTCjn0LH3nkYcqqpfZx+lnXNuohfVBglV1Aw=
Received: from AS9PR06CA0596.eurprd06.prod.outlook.com (2603:10a6:20b:486::31)
 by DU0PR10MB5196.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:348::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 27 Oct
 2022 09:00:42 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::46) by AS9PR06CA0596.outlook.office365.com
 (2603:10a6:20b:486::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Thu, 27 Oct 2022 09:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=etas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=etas.com;
Received-SPF: Pass (protection.outlook.com: domain of etas.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Thu, 27 Oct 2022 09:00:42 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.32; Thu, 27 Oct
 2022 11:00:41 +0200
Received: from getk-dev.de.bosch.com (10.139.217.196) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.32; Thu, 27 Oct 2022 11:00:41 +0200
From:   Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
Subject: [PATCH] hwmon: (pmbus/ltc2978) add support for LTC7132
Date:   Thu, 27 Oct 2022 11:00:26 +0200
Message-ID: <20221027090026.9370-1-Felix.Nieuwenhuizen@etas.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7EUR03FT052:EE_|DU0PR10MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cad02a9-26e6-45ad-262b-08dab7f9ba4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YOfDBfKm1lhSSD29+ZueGqulAWbgcxIOc5It+zKFtalc1hZ0YSqLvzdfX/Fah1imIblOD3l/38gsdHQGZoQx0lAiq20u1GyF4Phhm5O1Bm/DYfYHWAjcb/j7eyjxHK11UmlXtCpBk5+HB2p+j417J/lYDNEqywX7Upx5gX4BblDqhqb8nXZuw5R5pRsHJi4fT/S6j1GruNg0fLksYNGqyVA7U1AmOOB9u7PNCt9vCDWUmZ/G6y/KKSMQJMMWtHuqZ1Jfq3jdUYp3UjoDlV+NhoOBzD9FpuGl/J0xLAM3Wfah++y1cJ5FpWkweGxgJcgk7SRvHrqHJ8WialXBE910UCwG4tNkXVIcbHHTU91T4SPYdhk1BPF+dSd9Ju69PxrtqVvexTHOiXWPk5BwN4FfAq+htNwN6YSwMdN8AWgToCcNjFbiAp7aG5LlIVgNpzJu2Gs6St+WpnGuzRAc+ggKX28Kg9eoi4hqaBPCoI6p7Wq3dqUKOre6A+ySFkXfZry2FT07hl2cgnVV1KqHOBsYjk/1KOMHpJQytnbcNSlDaSEqtU0jZV3pJoUyUBlqXdOjG9HZP4ryNpjii5HsIviwcrF+eRP+cKczgg2LscLpf7pU8A7QcM7ky6N2zvlRBNdHS6BQKD4k3Kng0uanAI/GtHrN7Li55XmuvYcNGcDqWzvnDAAg61NJY8Mm08O9seBVYVsNEhedbJO7KaJKhXC2aRVBc7m1z61RgS9waiJKnyWz1jYnq+Zxrr74Fx0ohWaW1BLsxumj0I7Ue9todhfAsR7736YDcStkDmQghPG9u3A=
X-Forefront-Antispam-Report: CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(8936002)(81166007)(70586007)(4326008)(8676002)(36756003)(70206006)(41300700001)(86362001)(2906002)(5660300002)(82310400005)(40480700001)(26005)(36860700001)(107886003)(6666004)(1076003)(16526019)(186003)(336012)(82740400003)(83380400001)(2616005)(82960400001)(47076005)(316002)(6916009)(54906003)(40460700003)(478600001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: etas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 09:00:42.5832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cad02a9-26e6-45ad-262b-08dab7f9ba4e
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5196
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for LTC7132.
The relevant registers in the LTC7132 are identical to the LTC3883.
So it's just a matter of adding the chip id.

Signed-off-by: Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 6d2592731ba3..a3ce95861a53 100644
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
@@ -903,6 +907,7 @@ static const struct of_device_id ltc2978_of_match[] = {
 	{ .compatible = "lltc,ltc3887" },
 	{ .compatible = "lltc,ltc3889" },
 	{ .compatible = "lltc,ltc7880" },
+	{ .compatible = "lltc,ltc7132" },
 	{ .compatible = "lltc,ltm2987" },
 	{ .compatible = "lltc,ltm4664" },
 	{ .compatible = "lltc,ltm4675" },
-- 
2.30.2

