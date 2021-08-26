Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013A0C432BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB68061027
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243336AbhHZSmR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:42:17 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com ([40.107.93.86]:29519
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231453AbhHZSmM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 14:42:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT5OSbej/jQpgl8PthoozRSwF/YtioK3s/kNacFcKJcC3Pae5RUWkBK2EpbeBlMBZOWVNq/QYWfpv9Gtx+Wx6aeRWIFl9JfhYhtKmwLZGDLMqekSCXOfwH7wolWVaOqEmkptY9N9DlHRfF2Iw8QKVdNbqWbzlMIPrz2kvTCJOMnw3f1J0XfeDU4wQM3Na4LTecvaiblAW92NU0SFJHuLFOCP2qTElhtkydYz3dv8h6JaMzB5yLvrKNtttrT+R2vSG6jgrMRjjylHujGioKR86qHMTV5W7C5f2nwvK7Yove5xLgFeYZmMhsdNKKC1SWxlq5P7gpbcl968Gph9KVh9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTPWWZ41UPixzlQwqGvxatmFnBabYRfR4NatipdzhrA=;
 b=mKxNh3FTlEVsL/p+JAzN929c0DG+CsNWSrTjDGlVEAkRtOj1ZAl7yh99qt/AvZP2UDULKR10f/M03MPj0s1xOhLqxkobR7yA+GasWTgj2L9ddQxp9vBgh3GCCycxUx+HkhVgiv53Aqp/s+c1A2lQFhIs0dihJ7f6sYHXcjj61dY5y3HPBIq3/7yAbt7APRrxT/lZx9crFf+40V/dJaULLFx6ADJacRtVr06HDKm8luufTIH/Wd0dsGLRXzoip/m06wY4+8PKdSAHNS0oT5LK619f8boudtbe9C5ROyIrzUDiCVF8VqYecGCMc862WtHQWAUA8aFq7spVpvRqjYc3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTPWWZ41UPixzlQwqGvxatmFnBabYRfR4NatipdzhrA=;
 b=XJm0x66720mINT3fHaE29yAO3TPlLQu99Dz8XDbkhxFSZHiJ+S2KNLpdT6fL3fcQzPFCFmlZgVvYvcuhh2yfq0ztH2DKvJZuQrkdXY38KIU13bu8KsDoUM0XEBh4zYa6LpEOP/8ExgZmtd2l/YJHWOnzqcUhaLVvO3YXQXEa5AY=
Authentication-Results: ladisch.de; dkim=none (message not signed)
 header.d=none;ladisch.de; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 18:41:24 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 18:41:24 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wei Huang <wei.huang2@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 1/6] hwmon: (k10temp): Add additional missing Zen2 and Zen3 APUs
Date:   Thu, 26 Aug 2021 13:40:52 -0500
Message-Id: <20210826184057.26428-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826184057.26428-1-mario.limonciello@amd.com>
References: <20210826184057.26428-1-mario.limonciello@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::17) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 18:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f092c027-4496-4660-347c-08d968c11af5
X-MS-TrafficTypeDiagnostic: SA0PR12MB4510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB451073437386470F283BA7F8E2C79@SA0PR12MB4510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: REEEXh5kf60PfUY4/SFh0CpBxoRvFD+GZR8bcI82D0Ju4KmQk7Slkp01C9gBn8HpVkiZc29hme+2CiaJvteO0IPcrDiSicHQlYcOzHsj203ZIYRJR0ThF/uE0Gqk7oGrMQfeYZVF+vYBUaUEHHeeNhQ68dXyTc00mqtaW52Dq72ha14NC62Vxl/67JDViaPmOseS45iY0sPehmhuPhBOe8TDe51YXyNN/u+/0ul5aC+Nro94h9HZiPTS+zrr82jaq5I1SXxpzyrFYwrMzJGBKEY0jf8aD96XIiTR1uGgvRg5koalFtZ56HouNcAlJJIEnNkB0ODmbxOHACd5bxf1bh1OMbcP4WQ+C+Wmz0Q2MbhhQwF7Yg0aSbRoIa/BrCa/d0aJB2fdRMzYdlLoFIrB/H9imDq+YddkAAfVsQ9NDz+ZEyt2jj2We5TKEJWVJDytgfklMLO1YLKi3w00yjVRzrft3FeBtaYEaiGDbEzWPhe+x2zoAS/svsCG6UIMpsDQ+6/bWDo7XbjUogAXrHwdwbLY7TfW9kZaRLsS4CbZPbBDaFysrDEKRLVY2F5lDyIt13vBRX9fZ8GnGtFX0rKhou9UyK4PtZmU6DMvG6L7Dl+YX8LI/75q5iHIuL4arQyJ1jWlGEtXgHrK5gr68/IkBvu/oQj34OngbEmKPyzO19+yvrmmyXqoYCBCxfRudvZ9XJs44sEVU+3QR+i7/liGcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(4326008)(38100700002)(1076003)(2906002)(44832011)(508600001)(956004)(5660300002)(66556008)(66476007)(6486002)(54906003)(66946007)(26005)(8676002)(186003)(36756003)(6666004)(2616005)(52116002)(7696005)(6916009)(86362001)(8936002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XNUNin34sp/S7KCAgA2yIpVphowE/bQxqHSQXsMp+39tsN2tipnYpbafGQ78?=
 =?us-ascii?Q?GvCuzBzUOxUVWgASt35HmZVT57mZ2eunUyS9VQeal/BNmostsI8Xk6qdxSTK?=
 =?us-ascii?Q?vxhrgKKRlpfkbTkNnYr35HsC2a5R4GWZc9LgO/pPbGfJCnvmkCf6dq8DVdme?=
 =?us-ascii?Q?KKDnsYZKOHErBsWcdJ47dmR5ZqRdwNHuUd98L47s3lWUO6OABBhypFQdAOFc?=
 =?us-ascii?Q?n5QadxWaz9LFOnv952vDmhw6R5Au5rowuI5bVTQRkxlKBf5thd2jbiouROWe?=
 =?us-ascii?Q?AqRvjHtLmx7AiREGYr5ymACRnFzVbMhdt2/fp6JD6QPBN4OQvU1gAiYutXqk?=
 =?us-ascii?Q?ir+3SdWx3FMxfmEApZG1sK7L/qUVQur+GQ/Xx3fp5tqxVnVq/jj5mxbJRKNb?=
 =?us-ascii?Q?xHDkawyoiGImTk/E7dRGkWNUeK8SdElEPjVDCMvGPc25Gg9GeXB21ZD/nWPA?=
 =?us-ascii?Q?Bml4ZYnMtEkC5BIXwmSHvutSDtpde0mewiUwWPcmJe0tYivL4d8f9LtGtc9V?=
 =?us-ascii?Q?u71ksk4PVsg/qD3kv2HTlBYpvMlWcdx/E7OVE6ChGmZFBtxDpxIeMdF7CzPI?=
 =?us-ascii?Q?70v4xziCQvsZwEeaVVQlOS1bm2xqIrwoySVBTsRH02//6UmlA6h4C4WJFYmJ?=
 =?us-ascii?Q?iDkSfKEuXFVQDCPBJ7ytzwYIdPOxgQLHN3TmvKrqE7MLoBkMW2Jafb5W1o/U?=
 =?us-ascii?Q?s2hEEwRZFQ7gaociHx/E83QbgMBXtSburDkgWMX7MjU+cKosFvXORNxFlRx9?=
 =?us-ascii?Q?l+dTCxcyBarJdc4gns7z//8B1Z9nFfXDC8I3VxqkKRD8kWb9f3KIBHYem+QK?=
 =?us-ascii?Q?Dxs1mEGN9OuAFzYEOod4+pj3wKOXM3Il/BngFwjs122CSbAHOi+/56ojWLKv?=
 =?us-ascii?Q?712gIzu3pyZ6OGZnCP2zM32mvldB+DnE5kRTcgZryIiOl1PpL7fhLO+C9z0j?=
 =?us-ascii?Q?iiCdY33c21EZUHJQ8IQwW2Oq7IOKbgiexWJ2i3TUy7iUp6ckIPi5imanCVPs?=
 =?us-ascii?Q?1oJl4Hj5JTRDLtzNeT5ZkxiJSSgbIxRA6anaj6h2nBPY4pEQhcDtnym0WyXe?=
 =?us-ascii?Q?v9qGOJCpuNBBt/yNeaM505wkfhWNsYqdPJh1/ny1/9+3uYlCYOiJd+iFF9lh?=
 =?us-ascii?Q?TUBhg+2WlvNg4p9E95OGVmZVb7czYgTq0Jr115bAQSYzIFWz7/mTNkXqsdvI?=
 =?us-ascii?Q?3vgk7SgQjIkQQTURqCuulB54gyt3tbVDj5Rutatxvr1Nt6V2wu75V0al9LEl?=
 =?us-ascii?Q?3YhqUnRwXcULi9gsagSBy3KFfDc2LRLwyTsQjS2Huxwc3MoMUk3jyaUKoI8R?=
 =?us-ascii?Q?2OKSZmIX/144nkIU/K8VA+U5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f092c027-4496-4660-347c-08d968c11af5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 18:41:24.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVw+13LBYS6R1tqZ5MAsKq1dJia/NjeoWlc0Ve9ryevNJHaZ1gVF45DlnG4myauasH708asa5E3g6hw6wY6gQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These follow the rest of the existing codepaths for families
17h and 19h.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hwmon/k10temp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index fe3d92152e35..1d3c8d319941 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -437,6 +437,8 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			k10temp_get_ccd_support(pdev, data, 4);
 			break;
 		case 0x31:	/* Zen2 Threadripper */
+		case 0x60:	/* Renoir */
+		case 0x68:	/* Lucienne */
 		case 0x71:	/* Zen2 */
 			k10temp_get_ccd_support(pdev, data, 8);
 			break;
@@ -450,7 +452,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		switch (boot_cpu_data.x86_model) {
 		case 0x0 ... 0x1:	/* Zen3 SP3/TR */
 		case 0x21:		/* Zen3 Ryzen Desktop */
-		case 0x50:		/* Zen3 Ryzen APU */
+		case 0x50 ... 0x5f:	/* Green Sardine */
 			k10temp_get_ccd_support(pdev, data, 8);
 			break;
 		}
-- 
2.25.1

