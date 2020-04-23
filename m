Return-Path: <SRS0=tzLi=6H=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E71C54FCB
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 17:50:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2AA620781
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 17:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="y8Gm8tbx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbgDWRuu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Apr 2020 13:50:50 -0400
Received: from mail-dm6nam10on2066.outbound.protection.outlook.com ([40.107.93.66]:37720
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729889AbgDWRuu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 13:50:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHSYfDa1VnVoUyJMuaLRcDziH8C5qvZiRBZDb8gjIGzz4hxr5/y9wpC6ONoeUlEvbOhLnguKm2K/BFezCA3+t5NsdzJAQwlMXkR0gFahWhdSi3TyxzxcHrHXu3sPaHH84G+1FJVVb9Aas5FFK/xk4XHkmkeK9zllnQVCGEAYc7wxQwZN9e+wsJcAmxwV0Aj/otIpa1Om4Yme1Kp2gVFV1hpWHBCSO3+uSYI6TAz9wD8VBn9cU8f02/EgXQ8+1K65tQduUGxGKRYORmG+1EQ+snqaKE4i8E6IR9mvbT8sbGBZZtXoEyDRxnLTaGwvCSZ2qDZU4/sT4BMULdlF9b24IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmnHVP8/Cf4A7kvvGzRySXAfvfDw3jSBTzl+ia89Sqg=;
 b=GHC6LFHJDQ+k8K8mpwKt3S6KbnI48rdVvEnZBwnQTVG8EQw2hMjpvWtrvuQkUADiTMhGAAX8AuuzlRgaLMu7SBHahhWM18x/U1S7RUx1hKr3uUAN845DI7/6V0fD51mgeCDfYseqqvGVoR0nWqo0htn4tyi3lJllGZB+oSlPWdbg1Qc1qh75UhymUHDSmVjAsDLgvk2sTZdXn9blX7FYVBOKKk/f3edJ48ZfKhXO92z9UWQUXr7sGKfs+QA8RHRTT8AckO/Qq4AFN+1T2QFKx19povV5q8reNSpM188IcwNgpg6PRh5DGIywvKPXocfRSU0WxNdjWD6lSrIvZH/icQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmnHVP8/Cf4A7kvvGzRySXAfvfDw3jSBTzl+ia89Sqg=;
 b=y8Gm8tbxLOBgnuK/ph9uIuakoiFipB2x3jHMvyugBoZlUuFcjnNtGD1mIUUXV3+NWfuRlMzpSp6S9Xvn0lHF/vt3UHZZM+c6GPj/+BNCHnTMaBhFQOJ4zxcq4Hz6XHOjdnCIcRrhx/T5PqkELV1CA3i+xuxrTX8MleeYtD4XSX0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.26; Thu, 23 Apr
 2020 17:50:48 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 17:50:48 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for AMD energy driver
Date:   Thu, 23 Apr 2020 23:20:05 +0530
Message-Id: <20200423175005.9072-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423175005.9072-1-nchatrad@amd.com>
References: <20200423175005.9072-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR01CA0090.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Thu, 23 Apr 2020 17:50:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1d2d3ef3-6559-4afc-525e-08d7e7aedac1
X-MS-TrafficTypeDiagnostic: BY5PR12MB4049:|BY5PR12MB4049:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4049C4A7EEBC244377401758E8D30@BY5PR12MB4049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 03827AF76E
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(16526019)(81156014)(54906003)(2616005)(66946007)(956004)(478600001)(4326008)(4744005)(6666004)(8676002)(8936002)(1076003)(26005)(2906002)(7696005)(52116002)(316002)(6916009)(186003)(5660300002)(36756003)(66556008)(6486002)(66476007);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0Gv8j1IW35hyN9RxWV5SMUUEcWBaLraZKTjg+E5IjQBeAnkQT9ersWrpW8GKTiErzFgQD2/R4sWhME+yZOnA+FVTMrWSvOZE/Gzbj5GZWMijp5C1fKz21avT39y1u/ZETdcDTodPsuu4cY0TXKcy5MjuvEFlvtiMxSkmZ/IJbrMfI+DxCCy3RUiqzy+zlZwsSj1HwR3vdemZ+paXfDoq3O3d9ZpOCgGY0HNabQayDNcl21D51XXPFTBQJN/gmhmca/H6PZ3fa9fHSx/6Pg2dAFx5YwZbC6BDGVnmGCoWDq5xcRqg7YaO4KcstSqJg82y4nvFfTeigBUmi8O3/0lR1/O1VMgwEt9O6KEnbpkFmcELQjY1eNfUOycnyBj15ZSvqVHiCs+VGdJztVjWyvSa7fYonjKZ6HvGTv00CTzukNy1eDlzXwZGqCo8PkoR9xT
X-MS-Exchange-AntiSpam-MessageData: wxRzlut7OpeDH4bn3N2wd+G26z2U1RJXifGqjbSqC7zedxcNgmdKTcsUGuXvJ7f5Qg+/Z1EhZCXDag5450Hjp9V5Y+EpDynvt5wqFvN+6jiIswTFiN3uU/I85aFQHhnobb4IrQgoRx+diXJev7auug==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2d3ef3-6559-4afc-525e-08d7e7aedac1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 17:50:48.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k55uEGSnf6sKnWk8aPMU873RBvjxsk8yBORX5ConToZk3AEuZtst9WjbN5l2wrW52Dbbc+jlReZiBuuguerJsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The kernel driver is part of HWMON subsystem.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v3: Update MAINTAINERS

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1175fc0aadb..112ffd7742aa 100644
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

