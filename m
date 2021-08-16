Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C89C4320A
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5F9360F22
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhHPSRS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Aug 2021 14:17:18 -0400
Received: from mail-co1nam11on2043.outbound.protection.outlook.com ([40.107.220.43]:35169
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229781AbhHPSRS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Aug 2021 14:17:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7xlFPgaUWJUr1LNu1uY6YcsYHkhd47RndpE5dVJYKhrxKiR5k1XNwFzXeerRMo5tc4sw25YxPldK3KVL0x8be67DzhT5VgopV0ljWamILztJvWu16n+UnSSP7gC9+ztXRYRiYWyShtVGLF13ZMoMtaBepmI08R9Je3nSWDuPD0H47k9Cjtxl4zSizw9F4zcG22QicYkah2r1dz+g1Te/xFCVJxPIBPTkGMThwhW+Zy7Xp/HdB2OFeP7oaop8F7clJrO4nRL+xWH/oEIfp1mVal4qvLoKY4R6BRc6eSF1jroLrrmFw+1HLimrBn3a8OIwVj73FAPLuYpOZfE60ikHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDr/Ue3yLTW8MnswZmtHCpqhXQ/0n7tW17bYRAsbhuc=;
 b=aQ3tYsJk8ScDnMnoHZJoXeLAioTszsxoW9kzMFsXoEn4VkT456CvCYDj99ODKKB483vGFapdLKgGZoOZuRK8tV0GXG8lIxAvhY4TLMsbT2o3gymTnZCiYsNmEzIqbJaMb516E1VYxE07ppjVjBX3HFvtIYVhweqa4VXxluhqsyZWJ+pfvoAYY5HFNEoQXRf8Ex1N6plHyFGYxRj7xbiZC3Wzhm/gcjE7f10O20/xW4mpp2pZSjBw0kprke0vjKNe9DCT2u6PKyOtodMA8L2nbwjl+2pHp8aqiwjQlkcZbLKIEB5Kyjpg2eq89Q/46J4ttR2r2c5kW/Uvk0iCDf4L7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDr/Ue3yLTW8MnswZmtHCpqhXQ/0n7tW17bYRAsbhuc=;
 b=V2Uit/HZqd81RLW+/PErWRt3YM+lrXD4x2Iy4/mbTdiyYzaTlMTRA2nWAdnyssNA9YUV9l5D60V2DeGACpYXk/PCzCJVR0EoVN+CycMSo+0GZWEOKuEGtZcayUHAQGBq7BxtVQ0dlYcXFFp0H8JsYZ27WwSRslf0b3Uu0/MAd5Z6SbBaHq4a1GSaQJLWugDx4R7Z1LZdcEeWU3rPpKoLlTu3HKcg6loURye9ORlQZWu+6bdqG5xY5/loKUIrj0Fx5VBbvVYBTwlfBJDjlL81dOExDlFwZjdKMx1x68Dy8fSYhmGhAq9EmF3X7dKLRlsoc4tNe/0qX2A6EViawDpUAQ==
Received: from CO2PR04CA0085.namprd04.prod.outlook.com (2603:10b6:104:6::11)
 by BN8PR12MB2978.namprd12.prod.outlook.com (2603:10b6:408:42::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 18:16:43 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::50) by CO2PR04CA0085.outlook.office365.com
 (2603:10b6:104:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Mon, 16 Aug 2021 18:16:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 18:16:42 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 11:16:41 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 18:16:39 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-hwmon@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 1/4] i2c: mlxcpld: Fix criteria for frequency setting
Date:   Mon, 16 Aug 2021 21:16:12 +0300
Message-ID: <20210816181615.2625662-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816181615.2625662-1-vadimp@nvidia.com>
References: <20210816181615.2625662-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69bb6a22-95b0-4092-3761-08d960e1ff9f
X-MS-TrafficTypeDiagnostic: BN8PR12MB2978:
X-Microsoft-Antispam-PRVS: <BN8PR12MB297883B88E7537664C6DE86AAFFD9@BN8PR12MB2978.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dMKAx0W50pk1+XdjAg0em4YGcWYkaVddzUFC5c+FCu3WU844ALzvTIqUeMUtNODrmevR44BTKdjOkcWKwzrvzRSp0iknXHp332xoEHnJAwXCjMHJKtgFahtFO8Uxcu0LkhESgxZNfjh4HtwYOxBkCjQZRnIyyE8VWrGahiRBzp3byefw9vuG8Kf7EUKHtBePpqio1X2n1A7Oy+YRHXZLbC/6aDNp/4/YFIxTMTxUvpHf3NoKGGB3Z8xuCRU2LHAmtu8AO33Rgw569W+/j+WhxAu+Si3RmGQmfEeOpFZuCpkTCNOjupb/daNjIcMpARl64mIBN+RrqXRkU21bZyn+iB9gYEzil1b3RvQTnpHKYiisLzhZQNqGpz0SFvNtmV+pTxYnBwNg4gyNQAP8JiARjgi72sZtSUcwy/4JYWDhdTpUOqyjtmv6kfCZBPxQDiaKoLwcdQNfpFbWKpnYk0Runli8E1zHKIhfSdduta8eoNXq/XxEaCKjS6T2uEf5TFEumPA5IT+1ACpizlgO+muhZJ7rUCofYctLvO0v4PqSdX9cCjEF55UtUAdrijpu5yBha6SiOXGahM4p8uTl1hse2IZUFtYbGT79letMArYXa2d0FnvvgqeAhASd8g+xuKzpTW17UJbD/txbhe9P2LplOg8/N45yh66u6OgaNp8RLvr2ySFkGP8nk3HRTh7cZWz/LTMuxTP4aAeaYTjIBH5IGdZ6FQIKnYXQzfTh6RwnEGY=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(36840700001)(46966006)(47076005)(356005)(5660300002)(70206006)(316002)(82310400003)(82740400003)(36860700001)(2906002)(4744005)(70586007)(6666004)(36756003)(7636003)(2616005)(86362001)(8936002)(26005)(186003)(16526019)(426003)(107886003)(336012)(4326008)(8676002)(54906003)(6916009)(1076003)(478600001)(83380400001)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:16:42.1069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bb6a22-95b0-4092-3761-08d960e1ff9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2978
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Value for getting frequency capability wrongly has been taken from
register offset instead of register value.

Fixes: 66b0c2846ba8 ("i2c: mlxcpld: Add support for I2C bus frequency setting")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 4e0b7c2882ce..6d41c3db8a2b 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -495,7 +495,7 @@ mlxcpld_i2c_set_frequency(struct mlxcpld_i2c_priv *priv,
 		return err;
 
 	/* Set frequency only if it is not 100KHz, which is default. */
-	switch ((data->reg & data->mask) >> data->bit) {
+	switch ((regval & data->mask) >> data->bit) {
 	case MLXCPLD_I2C_FREQ_1000KHZ:
 		freq = MLXCPLD_I2C_FREQ_1000KHZ_SET;
 		break;
-- 
2.20.1

