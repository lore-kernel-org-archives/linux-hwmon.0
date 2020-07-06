Return-Path: <SRS0=NDU9=AR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A34DC433DF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jul 2020 17:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0B7C206DF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jul 2020 17:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="H0DG3abK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgGFRRe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jul 2020 13:17:34 -0400
Received: from mail-co1nam11on2048.outbound.protection.outlook.com ([40.107.220.48]:1889
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729478AbgGFRRe (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 6 Jul 2020 13:17:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLN3enZ+6z51E2e0dY55n9Z19kfZTJLDcucCMifyewsHM9DrkBcoXdCIxF4LoSLs6sOwSXLMns8eqJJkemEtVTKpQCGiYMTAF/e7xebB7FkQj4Xga0Roci75pxsMHADQoMDdtIDeBxXAI2JDd5y7bmQQmlHBNGX1fro462FAUSP8Fs53scF+fwPu4lUJEtN046rJDBLUjT2gEnjIsgaOXj/+UfZOm5mlnRlVgA8iTLcG36C3TP0TyayjFfGEuYroptb2LltinySv/hw2vYD7CkP81etymfxCak+Mfrvm3V9YZ6+g8/6AZSQ7b5JGlmAqx+H3OH42NC1o1Va2Ip4ARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ3pmz5MHUS6//jVBhJBDy4s0Su0NuWotljZAtUuOoE=;
 b=Ksj0U/B1meiDBY4uKC/5adjRAXIfB+kgUm7UDvBqLHFIaHtQEstfoToJNb8Z3bbEIuNnflY/INqyoKqzf4APjsXanB5zTLSU27R3azhy1XWe/vSGTdwr/xswtQbwFU+DwTKsZ10RqsOBqOxO4hYxHYkDAq7GOsO/tKPNOZTBoOIK0z75g0AceL6n4p5H17NxpeJ0591F9Zw6ArX+9kHBTLB9Ppv56FKKs6ee52fmXDpUg8pCcJY0EsmNZJFC8HwMqTD0Kw9gWgW/EU5n2l8oiPFnDg/cGb29bzBxsAiWSfCisWScTcKW7Do8G+3r1yda6F0ynuvyj3GVQu0Jh6nIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ3pmz5MHUS6//jVBhJBDy4s0Su0NuWotljZAtUuOoE=;
 b=H0DG3abKDGU1a/PAgMEGNJDfvVIJu1RixlYtXoCI/vgvThihSArEp8aUc08N7ERVvtW2HWW6QjG8YBss4jMMMCOkKuzHC3ofJAS0CF8pkD0nua51lasayMLNX/GB2XFGcrRQ9Yml/BEjB9kwpVhaMNbQ2/y/fxBDMDMxHwvRmcw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17)
 by MW2PR12MB2380.namprd12.prod.outlook.com (2603:10b6:907:4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Mon, 6 Jul
 2020 17:17:32 +0000
Received: from MW3PR12MB4396.namprd12.prod.outlook.com
 ([fe80::5084:9420:a3b1:9208]) by MW3PR12MB4396.namprd12.prod.outlook.com
 ([fe80::5084:9420:a3b1:9208%8]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 17:17:32 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH] hwmon: amd_energy: match for supported models
Date:   Mon,  6 Jul 2020 22:47:15 +0530
Message-Id: <20200706171715.124993-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To MW3PR12MB4396.namprd12.prod.outlook.com
 (2603:10b6:303:59::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 17:17:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4631afbb-5307-48f6-d356-08d821d077bc
X-MS-TrafficTypeDiagnostic: MW2PR12MB2380:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2380866AC1CA3F6DF841AE6BE8690@MW2PR12MB2380.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUhpY/o3xqY/p56V6ahkKmEMAHCh/nXNw40I8z2DwAi1zDF8cXKpw48lXdR3xXEwgSwyW1pfyCJxdMdlCLiTvHPVP0wKKNvVKKEMyvVXl54p+DTyqX8OtPq5v3DWVuCm4mShH8ZaZXuyInVUzR8ds43uPc8gGLq9GO/2r5+ddK0QtskBjM7vEX/W3KdwiprMm4pfyp/mrHV1qIJLscbSzgzUyHw0eKq+qKSpJKgzV9Qx+VSY/NG4nR70a/Xv+cYhC2lwVV1XjM2SiCpmTtGDxnU0ZwtnIoYEGs+8i3dNTJrXDotCE8Ej394aPg2yFGxgghoTREjbG4SZQugzt3r8RSRV2ciZ1ni4zmD/H/zLKKjeT1K3ZIOe6uRNmYGUBRtJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4396.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(36756003)(1076003)(4744005)(2616005)(956004)(6666004)(52116002)(83380400001)(7696005)(6486002)(6916009)(8936002)(8676002)(478600001)(2906002)(66946007)(66556008)(66476007)(5660300002)(16526019)(26005)(4326008)(316002)(186003)(170073001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jzm3JjP3tdvhf4JSC2dzICu/SYa+HkutvzPeG/wlVnbkdibPwGnkcwHPkaOo7YWXrO2MwKVdWckhKu5tHNIhgsKRT6LrUe/J8Zr4Hb820iYoh2rxe4qCZHDfnN39eVgsHgsM1a8o4HUBPtw9JZ5yZdwjCkxBmLLyGy4Jgii6f/TnNA8diZia/tRZ3X7SRrDR3kuzGvla3YwpomIMrrd0Yjltodud57KTLkpxnnetEXuG2dkM90C7/FydO6glmqLxDaB5LtbUe8slUqReLtuZO/5txQ0K8jXqiliPSWKM5v4/8ux2Lnm+cff5Nk6DfYsQnb5aJSCgr0XA3OD5JYD4BqlB4OjEaAZBbr8MRzBXM3QVFjq34d7VS3hDUCUDhzbfCnkFpbAB2wPbieZUZPzRWiu+OOJTmE7/4fztxfs48G+gqywttweYhAAN7Yh8zwtnDVHGAlVC+lRC9+4EPoNt9/1+BgobE9cQHhj0gmbfog/+cXAzBT6G7lei3wcxYPz0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4631afbb-5307-48f6-d356-08d821d077bc
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4396.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 17:17:32.2411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UPPM8phVbNhCwZ8NLlI2vbysd+zrDH0AX0X5wmTfBqoIpOl03/2B2NcQojvm6OVKVu/74BX4bHsR/FLMAL86A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2380
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The energy counters of certain models seems to be reporting
inconsisten values. Hence, match for the supported models.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/hwmon/amd_energy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index e95b7426106e..29603742c858 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -362,7 +362,7 @@ static struct platform_driver amd_energy_driver = {
 static struct platform_device *amd_energy_platdev;
 
 static const struct x86_cpu_id cpu_ids[] __initconst = {
-	X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
+	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
-- 
2.17.1

