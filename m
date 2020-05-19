Return-Path: <SRS0=LqIa=7B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86677C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 May 2020 15:51:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D908207D8
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 May 2020 15:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="g/mHUQbh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgESPvA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 May 2020 11:51:00 -0400
Received: from mail-mw2nam12on2050.outbound.protection.outlook.com ([40.107.244.50]:39680
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728534AbgESPu7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 May 2020 11:50:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdkTK++ClntNEv/hf2Iyg7oJ1Nk6cyyxnHTOi5wEN+/M+LRBQLjEAwKhstA5QPpdXkJoSu7yDTcdcQOp4WFVI0xuzbYX69C6KDt/fb07NPU1/RARoBlGjuN9GClSpt9CNq7ju/WFTKAsJ5N21MN5dlFC+CJNEN7AX0lpwIhHk6Gu3vb4H7wsBt5HqFNi/a9uPaeNyoWIsbluQxd+cOiAtGiCxEE9svylpdhhT7X3SHFp05fvQ9Z20Zx0H0Lu0dZUqtESqb8xQ+rafeIORZGuC/n9nzCcGZosCacWPRUhmNSe9tHhmNa13YkTSQ/G8V3d0WQIN9POmF6KZIgFAbmWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XmiJdFVZjIdUVeYHoSzaUVLmGesmjp5n1oFXXp8W3M=;
 b=RZKZ+oD60/eHxzR4ms5qWD8vie6ooiM3Vf7EOaval/vRryvAs+Jt4pf1muTGga9M/DNV/b/Twl/En5ClP4zAtzgITuBbnl6ORXGkfHS4UUkWvino+bZobIgLvuCZVv6GkyMeAQXxc9VEeOfOFWHOH3tGkAShyOuvIfcFxBPCeSu0SINDF79SZwVR+iOOIImZBi2U3nwyESRz2t3VcAyJYf4osk5qWPTdPdVFZK1gYZaNvkGDTm1oMXWIC0cYhcmjyeaoorV9saCTfxWFUidC9+s+PHN0CyvBDDpcb3JQfd/+f9XCXEJOgOA5HScPX7NUNzFeaIYlTIWBJmqRBAPtgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XmiJdFVZjIdUVeYHoSzaUVLmGesmjp5n1oFXXp8W3M=;
 b=g/mHUQbhukP02LgTHsP+NB0xUYryTWymLyoirPEgEtX5jue7uC65c5cNlGEOmtY0rXK1XzKsEpmdUYb+XAccFv2aSREuiheuVRjPP93BiVMIw1rEP1si2FwDpm6WOzfpU3TGy8CCV9eQG/VOie1OZSPKArcukoWMWjptQPuWgQE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5SPR01MB0022.namprd12.prod.outlook.com (2603:10b6:a03:1a3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 15:50:57 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 15:50:57 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/3 v7] MAINTAINERS: add entry for AMD energy driver
Date:   Tue, 19 May 2020 21:20:11 +0530
Message-Id: <20200519155011.56184-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519155011.56184-1-nchatrad@amd.com>
References: <20200519155011.56184-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::12) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Tue, 19 May 2020 15:50:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3893d29a-59fa-45e4-b689-08d7fc0c6ba5
X-MS-TrafficTypeDiagnostic: BY5SPR01MB0022:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5SPR01MB002245CF01AE58FC207FBB1AE8B90@BY5SPR01MB0022.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3dao1+ClqdObJagq9dsnZgcO8fkMThoEfi1FuFF1Yyyk4LhU48yi5brq+6zAbPnmKitfhPe3JkeP4/euJpbIa3D/N6ASDhZiJVqa52XpEzoCOppHEKcxS+bWVt6sBDBoDj4PriJj3ambCUgl/soN9+xSvIhwoD39QQu6MThYfcYlfJD58gGgbc4cX4xiSk+R/Nxt7uh5xnURZyPEbWvMgBSASiXrt3YQRqzTtbKE0+dpSKCg577f23d+w6qO1x1X2jtC+uDdcm+tg6vL5j0Mm3fHWREMTqR0lEzDspWaGdGgXPIJ0nolAFxaLhhXGdXuLxBBbiyuv9Dx+ApMhkFW2zGGxmlr9WVVIp7JdO6Jj2kV3jIwzI4LTsQSou2BMhkk+6/h+aZ+GP6rMW2GzFL3OjScGrQTBvCJgQm1A3KVbM967PtIBU3tXWQgfhwhUtP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(8676002)(2906002)(956004)(16526019)(2616005)(6486002)(66556008)(66946007)(66476007)(4326008)(36756003)(4744005)(54906003)(7696005)(478600001)(6666004)(316002)(26005)(6916009)(8936002)(5660300002)(186003)(1076003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 7sH42NnDQNNkop9roOrGF0Ccjo8D4lmD4PRAXzESf65RFyqQt73uLb+saDYVBSKGo0LYaFsFt0kcifzVxii2g8Mly7p8MxUOIZzl6qdGVGEB21s48RW2zz2/v6tybR9pBYc7yEfQxnlGwV/RloT6r1j4uaIOIIrudpzSrCcxdiwl+9qlSwi+WAvuPxJ0/SIFu8NnvIdVMezXgF9ODf0nM1eYGCpc2Ez/eNh4fKzultwh3kPHH/H9jFNAOUq/4+fA7iuuekVfKftKK4Qg6aoHGkn/SyAWtpUOA+faKTS00H+wAYh8jgacdKdE44lqtQBWqkgNVJhe+j4Ilp9UC97MC1vN/I8K0xp+XUtPWYRtUsObRXT02KdICqNa98MFkBG4kqgP439nhBfUC2YewOx6V8yrFdym77QyVUhygHDVvjOLaqb0TBAd0YMV9sXSK4jxB2agE/RwauLEEurB80HTaKJ5DQ2wCUse8fdgOwmq4yLWT5j/gfzVz2bYoBzRDABt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3893d29a-59fa-45e4-b689-08d7fc0c6ba5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 15:50:57.6066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPifPkdMdkWtZiKffKAz46lxTkY1CIIM/g7H/XF3dMcSv8I6aGwAPB2SPNyQsIh0dBP6GDmozS7DpF/GrrMctg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5SPR01MB0022
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The kernel driver is part of HWMON subsystem.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v7:
None

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 091ec22c1a23..7e7393f9a0e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -842,6 +842,13 @@ S:	Supported
 T:	git git://people.freedesktop.org/~agd5f/linux
 F:	drivers/gpu/drm/amd/display/
 
+AMD ENERGY DRIVER
+M:	Naveen Krishna Chatradhi <nchatrad@amd.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/amd_energy.rst
+F:	drivers/hwmon/amd_energy.c
+
 AMD FAM15H PROCESSOR POWER MONITORING DRIVER
 M:	Huang Rui <ray.huang@amd.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.17.1

