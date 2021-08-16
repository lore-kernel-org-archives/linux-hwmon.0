Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AA9C4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0A68604D7
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhHPSRa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Aug 2021 14:17:30 -0400
Received: from mail-bn7nam10on2060.outbound.protection.outlook.com ([40.107.92.60]:40672
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229881AbhHPSR3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Aug 2021 14:17:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqXjz+NGIKopJRO58KtOp+vG1bpEgD5SVWc209nola4ot3bqjGPNqLFn9wnfp04xFvdFxV/87zIuDlIHJQdCFYep4K7DYEnUdn5QRbn5mj6KDW7hkY2S+zj2TyKdqgAPuk/qaPlT78GRog3N0H/B+I4l05USm82MlP3xdMhJJHSDJpJ/4DLb3VnQZUzwt7ku5bEYKgu+YBURXx9d/5VIw2HwKvz6SXIZ4ysmsy15zbVhH4RNAZn+qPmIvWp1+41RLGtRnwx803LmlvMkyM3iD/o+Wa6gL41zvwQ46YWXE0T+REaKbm/H4KVUaPFcR2RqVVL424N6w5tOneFqIUmPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXF672+7NF+s0+EGQHO15zBr+4vSi58iP3SEvBXmHSw=;
 b=RKlDzHNMjv1hZ6ppIaPVSn/lKGw7rxLIsCfbQP6KdZMqOFwY4JQ/mUZ4VjvVlCrRI+GI67os1HpDUxjchpVhLnBsLGwP2qLZLyL4BDyUTIcyrbfZTbp9Jk/d+BQSdkqJnVmPsmW49XGSp6wF/EqsPVsWrgv5ctNEHYH3cJVTWUp+wmZI+GN6CbTgvjBGTQ2FN3Psm3l+m1JpBLyBGL115aptrhszAXHXGP1g6F5uz7NQfSTqMNivPjPqQoElYUaAkayF0LBUrlkSRzPQsJH2sv6ui7FngKRdw4PPc1ao4gS7Z+j/atUmvYSq1Ki3d6+gEBfzrSPXKIRbYNrVqv+s9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXF672+7NF+s0+EGQHO15zBr+4vSi58iP3SEvBXmHSw=;
 b=fiHFROcWg4LkW44iL4N0U+ya7hy/saIu+Vj6V09RPUr0bBPFCfjL6WaxAUxZzkP2VWQZb+eAAepGC35Z8Oi6O29PpHcmu7nkY4kOX4IXcRKSmvUt4dnU9crbSSBmb2flSeNAQVS+y87t9TM50NlRJypmlct8farB0q9k1VZ7sqYIdo3ACeVyH3BX//Prg3G0Nwtln9HVeWCfnBsg1XzTJ2zAFigKQagFNbDiKlwGVBHlZUS+UkzSP3i98ijTTscCze9PUNKaTTFw9i/EsOr9iwvxWpS05prUH35c4sNiR7+ZDnnxzAaGI4k/7uz+irINsUCXZHcaF1cHjmxM3RlNsg==
Received: from BN8PR12CA0005.namprd12.prod.outlook.com (2603:10b6:408:60::18)
 by SJ0PR12MB5424.namprd12.prod.outlook.com (2603:10b6:a03:300::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 18:16:56 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::b1) by BN8PR12CA0005.outlook.office365.com
 (2603:10b6:408:60::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Mon, 16 Aug 2021 18:16:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 18:16:53 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 18:16:50 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 18:16:49 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-hwmon@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 4/4] i2c: mlxcpld: Allow flexible polling time setting for I2C transactions
Date:   Mon, 16 Aug 2021 21:16:15 +0300
Message-ID: <20210816181615.2625662-5-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1fd2cde9-5235-44b7-20ae-08d960e20697
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5424:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5424B3957D14B86FD2E08CB1AFFD9@SJ0PR12MB5424.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7AotJA2meChgKUBZeqJGjmDkppOr2eTLHMTN84fbzhG69PQw3c997/1ohLUj5WK9hAiPyDbU5lVJHoRGeXF3NUCBamMTaFgw14oyB4UrdNJJEDUMCz7Ajirk5sdWPlGnhZJhGn0a8eTWkih1GvVMvjbUb530z5F0JaD2e/BL8kuYTsYcYZKuUc8F5x73TH1uvH93u6XFIb1eDp/Fxaak8Q27YgqVZF1MGlVzRvzZZ2097lAi4MI6t+n+OUxMtwC0ShOTwMnr/YGJsFobxs3IZHAyV0OJId4F2szMPjuSRvW1eyfav/WO3cpSBVCzy7cTmfQDJja6pJuueYXKFetNGpSpLs8QugINOHp0IP0r1XjMmiu15zh536BTJ2stc7JcRrpqEM8PkQgm/+ZJRr4CryDNhgbXLqY0S2q4oPljiI4BV1fTo6ROq54RfaWf5p1oH/idPvgIiGLAP1Mu1D5OAbRj3WDQx/jx8jhNtfMtBgrRgw/eFDfxddxOQs3sSRs8eaR3ZTgLwJB834N+Fud4baZog6IOjDQBtkFjVg9XZ31WChh3y26njXAwhYEzQJlVsk1LZIvC9KlkuZQMPzT9XdLgJuzjDzlT3gPtf9fXpXAFyJVZ1Oqu0twAyT9cyeilz5nC1V9xUlVpW5N+rYCEmGSGm2Kpr2XXcyWEJAbW45I2z6j4nhK7/h7lUchgbzNOvCFs8wAcFzZjtdEK4C0eOK0g74bLxPnY3tEBtqdv7ac=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(2906002)(82740400003)(47076005)(5660300002)(70586007)(70206006)(83380400001)(82310400003)(186003)(16526019)(336012)(316002)(2616005)(6666004)(7636003)(426003)(36860700001)(54906003)(107886003)(356005)(26005)(8676002)(1076003)(6916009)(4326008)(478600001)(86362001)(36756003)(8936002)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:16:53.7449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd2cde9-5235-44b7-20ae-08d960e20697
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5424
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Allow polling time setting according to I2C frequency supported across
the system. For base frequency 400 KHz and 1 MHz set polling time is set
four times less than for system with base frequency 100KHz.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 615f0a98640e..56aa424fd71d 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -73,6 +73,7 @@ struct mlxcpld_i2c_priv {
 	struct  mlxcpld_i2c_curr_xfer xfer;
 	struct device *dev;
 	bool smbus_block;
+	int polling_time;
 };
 
 static void mlxcpld_i2c_lpc_write_buf(u8 *data, u8 len, u32 addr)
@@ -267,8 +268,8 @@ static int mlxcpld_i2c_wait_for_free(struct mlxcpld_i2c_priv *priv)
 	do {
 		if (!mlxcpld_i2c_check_busy(priv))
 			break;
-		usleep_range(MLXCPLD_I2C_POLL_TIME / 2, MLXCPLD_I2C_POLL_TIME);
-		timeout += MLXCPLD_I2C_POLL_TIME;
+		usleep_range(priv->polling_time / 2, priv->polling_time);
+		timeout += priv->polling_time;
 	} while (timeout <= MLXCPLD_I2C_XFER_TO);
 
 	if (timeout > MLXCPLD_I2C_XFER_TO)
@@ -288,10 +289,10 @@ static int mlxcpld_i2c_wait_for_tc(struct mlxcpld_i2c_priv *priv)
 	u8 datalen, val;
 
 	do {
-		usleep_range(MLXCPLD_I2C_POLL_TIME / 2, MLXCPLD_I2C_POLL_TIME);
+		usleep_range(priv->polling_time / 2, priv->polling_time);
 		if (!mlxcpld_i2c_check_status(priv, &status))
 			break;
-		timeout += MLXCPLD_I2C_POLL_TIME;
+		timeout += priv->polling_time;
 	} while (status == 0 && timeout < MLXCPLD_I2C_XFER_TO);
 
 	switch (status) {
@@ -498,9 +499,11 @@ mlxcpld_i2c_set_frequency(struct mlxcpld_i2c_priv *priv,
 	switch ((regval & data->mask) >> data->bit) {
 	case MLXCPLD_I2C_FREQ_1000KHZ:
 		freq = MLXCPLD_I2C_FREQ_1000KHZ_SET;
+		priv->polling_time /= 4;
 		break;
 	case MLXCPLD_I2C_FREQ_400KHZ:
 		freq = MLXCPLD_I2C_FREQ_400KHZ_SET;
+		priv->polling_time /= 4;
 		break;
 	default:
 		return 0;
@@ -527,6 +530,7 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 	priv->base_addr = MLXPLAT_CPLD_LPC_I2C_BASE_ADDR;
+	priv->polling_time = MLXCPLD_I2C_POLL_TIME;
 
 	/* Set I2C bus frequency if platform data provides this info. */
 	pdata = dev_get_platdata(&pdev->dev);
-- 
2.20.1

