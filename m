Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61948C432BE
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4146260F11
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhHPSRT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Aug 2021 14:17:19 -0400
Received: from mail-dm6nam11on2054.outbound.protection.outlook.com ([40.107.223.54]:22048
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229481AbhHPSRS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Aug 2021 14:17:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD+UU9WpZJ5m+h2lFrWXnTdSJpAL3FseMbGJLI8pLFTxQLC1971T4Ao9q6MFGuC5SvG+a2qj5lK7P+uu9U4eYmIdXZYBULXw7uQBc9Plt3jD+VH+V6xjSe4y61knfJ0saF9gnPwIrz2TjC3UN/m7ulvjGRAqYLgrCc2dhixMHrD3Yu6r38jiz7gz/cNZjZzNFScyaM3x+f8ROHpa2qab0DMBN1UJ6ch2ZhVW1YqYevo5Tjdt1IKDFd+8oCShIue5qP4xrctTrBQDgwnv9g71p4HlE+JIUZ8qpswBuAwnI22LVNd77DXFEr4D+IzQ3Nw/X2zZd3TiuKWgEixe0u2LEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brskK6KkJLd7GMYWJYj9QFsecBFsQyHMV4VYCwbPnvE=;
 b=eX4TeSpo8GJiEndRQwpWB4LLQdKFXsCSd9yXalHYG9iI3C0b9P5SgxIXiE5+qohGw0npg7SJneb1+1a5gZ+OeSD7czGVLUfuOzhAEqV6G7hs4K9VV+filxhdqKlRaQci8ALkhBykmCC2nyYbArYNMkqjgf8Tmm+Lv6+hAOuLoEQIUGtA49r9MjgvUfoWD4p07i1BmM/QHlvM5fsrFqircK0XgWQw2j8dbwkYuXw+S1tb9HaTKmaAUDqcgp2albGEZ6UefXI6IUkisLKhcBh4tRpG4Mo7cEP9gEmMpRzhTZ+URILhMbbpS4tbhSl4HZI6rTmq7FTNS9qAD+cskPs1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brskK6KkJLd7GMYWJYj9QFsecBFsQyHMV4VYCwbPnvE=;
 b=FccAZ35csxX9NF+3V+LUPa/ZcpnnvSd/TzO7t8lQlqr6Wu4xEVri7t+1z7+Om8oejDyHAI/xAj9UBmnFYi1eYHg0+laAsl31ErASu2OzLujgxKvp00ETSC9kfrwWbiU5dugqE3gOHlxA7W+kCH1VGaJiqCITWkPjMg+TdTCXkp6y124jWc7flRLjhIHYwrA0R1r8l5N0pXnvR+3s6aR1z+nltKD3luDtYlO6xIBoVGtXnOKLh0wKhw0LzTXGUen7nyFnlkUaDzKlqW1gUaozpkjvpTtwjV8pcBWbQM9NgVoV5WCLM6lyQWrOdzXL9+8568nC35gFLILr8iijNJG18w==
Received: from DS7PR07CA0003.namprd07.prod.outlook.com (2603:10b6:5:3af::11)
 by BN8PR12MB3059.namprd12.prod.outlook.com (2603:10b6:408:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 18:16:45 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::21) by DS7PR07CA0003.outlook.office365.com
 (2603:10b6:5:3af::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22 via Frontend
 Transport; Mon, 16 Aug 2021 18:16:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 18:16:45 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 18:16:44 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 18:16:43 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-hwmon@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 2/4] i2c: mlxcpld: Modify register setting for 400KHz frequency
Date:   Mon, 16 Aug 2021 21:16:13 +0300
Message-ID: <20210816181615.2625662-3-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: ec787cae-3ced-4da0-4d25-08d960e20182
X-MS-TrafficTypeDiagnostic: BN8PR12MB3059:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3059B742D896AAC2F24AB751AFFD9@BN8PR12MB3059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ta0RPdtaoyRG40EcGNdRB6mY1zqr3Zl2YNcLfCfMtC5IreDlD2yqM6+XFzwUzNL08Enj1pT77X6CyHUeAzQZVTlrIvWwpNk6+X4CujiBZiqbhsp9Tx7I0EaopgjavKYucLLTE7yw+LlbtYpg/So7J1msY1RZHY9oWiw+NBc6GnVbJJq+qjzSVAip4Qda5UWn4ElEmppY5BIuN+R8vlZIEtsAQMuextBy4TkPHMS0YTiBbPcfAv7btncTYElaKbQs4vaf8UfM3FQ71ilEq/OLyDc2GlSOnJ0fWf0iWZIhNnUNW+1W0KiJBDHaeHNSQ+okTT3bi/V6ywPSFZFKYV981BEFkWL4SaS4VN6/dBizUVlQdQKIPfBjHgmgJzAL5sssHp16seTWO+WIQ3eFFb05nnX9RUR+X+jGAOEPDv/H/gjjP9gb31f9NgxI/IGf30SHm++IJ53Xs2QRzaKmPo5R0OA2dmRaaJa03nadi2l8Gw8f4YWxpO7KbCHtqus+H3+WNa6I8EyGOFXH8bYUhiKX3KgqRCAJ94m5bxABoWKagOhVdcu2Kb/XOJ3NZNgDFBjtH502p+kt2dLghQQoRivbNP5tx3AfIVNEyTEQmMLyLiIAHuJccNyjYm4Ax9xVXLzsW1H+sJy76KMTIVLSahmfFOUovUGHu70kOSo010qgFqtjjIvEYSqW3uaCdI6itvXoEWNARCp8GFRt8TfWjRpmmP7bK8HB23qt9kj+XGTUYQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(36840700001)(46966006)(186003)(70206006)(26005)(82310400003)(336012)(86362001)(478600001)(16526019)(6666004)(107886003)(6916009)(2616005)(5660300002)(1076003)(36756003)(36906005)(2906002)(70586007)(36860700001)(54906003)(82740400003)(8676002)(47076005)(4326008)(7636003)(426003)(356005)(8936002)(83380400001)(316002)(4744005)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:16:45.2488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec787cae-3ced-4da0-4d25-08d960e20182
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3059
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Change setting for 400KHz frequency support by more accurate value.

Fixes: 66b0c2846ba8 ("i2c: mlxcpld: Add support for I2C bus frequency setting")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 6d41c3db8a2b..015e11c4663f 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -49,7 +49,7 @@
 #define MLXCPLD_LPCI2C_NACK_IND		2
 
 #define MLXCPLD_I2C_FREQ_1000KHZ_SET	0x04
-#define MLXCPLD_I2C_FREQ_400KHZ_SET	0x0f
+#define MLXCPLD_I2C_FREQ_400KHZ_SET	0x0c
 #define MLXCPLD_I2C_FREQ_100KHZ_SET	0x42
 
 enum mlxcpld_i2c_frequency {
-- 
2.20.1

