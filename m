Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C06BC56201
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Nov 2020 18:17:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1B0A24199
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Nov 2020 18:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="pxOKJyag"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgKSSRT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 19 Nov 2020 13:17:19 -0500
Received: from mail-bn7nam10on2082.outbound.protection.outlook.com ([40.107.92.82]:42080
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727673AbgKSSRT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Nov 2020 13:17:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSp+nkiyJQTahVolCjieqn89i47w0d79Dg0liw77vef3WbvHDPbKETZcpXsMqK5Hbtsn+cMScnDFV/rfGRAgavw0iUfw3eXOZ2jvah+Txk+r58yjMyVatwHwQacaWO34/Z2MUkjZLB/nxfXLs7M4qx4McQdbX1UFUYtxzvAeN0bRxDma/uxHEUKqyNTUx5MfdfNLQmdQHvb3xh/tyXooO10ijdJxNT4dwcCDJOoIkDulcjTGf6cm/5zGlQ6qnNFwPNM9dXo4CpP00nDRet+I12eCYkFvWKQN04xuQSbOXyIVXNprteB/6B0cXlgbH3zt9m7dGUnKOykxU/jTEgq86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnOkb+PrdZe57aTyFaT7suT7oZyQbA/uhuqbNtfCEvc=;
 b=fFTyWZ2gfJOGaFn11l4bIT5Im+pkqirlnWYL3HxL7vQBwqiom7hEsaT0d4iSkrgFr5EeWwVI+mwbKtab7DwvPqzkcyJmaLygeeIFsKzCJkS/ZLkH+2fE+nHARImxLw4CKUq9AeKwkeURaPZUE6XHvvqv5cAx4u75NM8WTL9qtyh1hzVJ3xWfoISwr2zrdHyiwvg8lKQ44MuTRbXYovUQB9x8P+/eyE+7u54wh4CI7NYvKs5CmGdpWSlkRk0od5bBy8CzMtWh4U8O39NZ0BzhZ3ysbBIYXeY6aH9fppuf8a3FEWPWKe9JFAH+TvcFigTcVYrWH6udlJ7sMEfx9ZAOuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnOkb+PrdZe57aTyFaT7suT7oZyQbA/uhuqbNtfCEvc=;
 b=pxOKJyag0ANd08RbOkSQxe5sz8EUg84J+C/RmtpiqHADdwEyf1CKAS2Fvx+IDKxWer8ehm7Sfn4vpnlbMKdbAj3Jwm8dR5iYGCVieWguoqbwIKotAzABMAjZ5RkXlPRd6K5UEuor1R9jg2bmewIjPA5Pp1nTBldXw+JdBMf8ASo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM5PR12MB1833.namprd12.prod.outlook.com (2603:10b6:3:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 18:17:16 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3%4]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 18:17:16 +0000
From:   Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
Subject: [PATCH 1/2] hwmon: (amd_energy) Add AMD family 19h model 01h x86 match
Date:   Fri, 20 Nov 2020 00:12:45 +0530
Message-Id: <20201119184246.228322-1-NaveenKrishna.Chatradhi@amd.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0081.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::21)
 To DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from SLES15.amd.com (165.204.156.251) by MA1PR01CA0081.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:17:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d781f005-03f2-4fa3-bff9-08d88cb75866
X-MS-TrafficTypeDiagnostic: DM5PR12MB1833:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1833E77A9794EA79EE059804E8E00@DM5PR12MB1833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzOuve8/fuBSd+TNCKpTevZ54ey8+pGwwwdr1+t6OR2jxoCjOTu+GaS+CqN5QXDjrk8yDTjdoUM6zToSB2sSvBUi/1k89NmElYRYnSRuI51d7UGS2vUI64CvdU0qLCox/Gq/sYSf1rA/0HqjU6x5MD2oDt9bQvfZKe7VBqEH08C7yqaakBkHEdrjKcELE97vprU/waoy3XlxCEoNm3Mqa5ogBVQ0CE8tgs2n7IqZbfFZmCKkqNzEgU6soGvEeCVLEwaDUY0i4VPILx5wmqp4+K2NfalxlZwlROnO/6iBqYxjCvvITdA1q+0BghJCKFhAU0u+HCr334+OdHTCgqfudQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(8676002)(1076003)(956004)(6486002)(86362001)(8936002)(6916009)(16526019)(26005)(2616005)(6666004)(52116002)(7696005)(478600001)(316002)(36756003)(5660300002)(4744005)(66946007)(66476007)(4326008)(186003)(2906002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: rn1p8uLZacEh4H8P5LtJ8VodpzRaL/+p1XIjOwkmNDpoUKcHWiv3U3j7mc4Y80PWtD/NrzQ9ZDyQrCKiIJTnFFRtF7AMeLSHZRfJj3ScuUee/QGxVVdfHq3GlCTZq+TzBB/unb+WrQkIbAGhni9/Pc3LruXJBMbgIPzZWeasxgVh6jyYfvr9LRDA37HpxRNZYETyPU0X3mF+5CsTwn1tJMa/9SPZI7S1Yx/qGAh8/sF8My/xnzk7VJM0KWO0EKOtea1ffix0DsE9cQ6dJYVq1Jp5BHiKn/HT1JSaeT729Ace5CnVY9mW6EhLdlwnk+GDCLD2wSavIs3Yt1aerOTLDz8AvBrXmuesUfEk0whnnr2a3JVHJjsLoZnB0+fRhynKqSIE1cS1cFXSaIkA2oCSToBJmxe/2erphZki+W6+jA3fi5OKZtZpDvJZjc9UNy2RESsdaQkzENVXTejXZvYyQNg4Nz/I72h+0C3IGxPZElFbEX5QGBZnthTAZua909awy03WrO8zO2w5VSwvua4as1WsNqbbSHK1fdohZy8fR3w6c/KAY5rj0WHMFTqV1ygzh7zIVZeMlr4N6iHB52rzy3iMaKeVhC16Ow95Z2lI1eMFM8CWLvkGFnExY5xqmHf2fKobCf2bYmyD7rTVJSmooA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d781f005-03f2-4fa3-bff9-08d88cb75866
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 18:17:16.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBjFJqPegZkVdyY576gWWMy9Z/j9caLwTnEIyW3wEOmR4UaT7vAXJQ3kQ2o3gWR3xGE6ArhNa2JACD8QSASiPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1833
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add X86 CPU match for AMD family 19h model 01h. This is necessary to
enable support for energy reporting via the amd_energy module.

Signed-off-by: Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
---
 drivers/hwmon/amd_energy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index 3197cda7bcd9..9b306448b7a0 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -331,6 +331,7 @@ static struct platform_device *amd_energy_platdev;
 
 static const struct x86_cpu_id cpu_ids[] __initconst = {
 	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
+	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x19, 0x01, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
-- 
2.26.2

