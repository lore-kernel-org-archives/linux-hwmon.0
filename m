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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EFFC4320E
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52FFA60F44
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243261AbhHZSmS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:42:18 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com ([40.107.93.86]:29519
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243300AbhHZSmR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 14:42:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPU13EihSNNmhI93ZMZYbH6GtIhe7Jp4cLyRQCZrrmmHLXUZE/kiyAPKZfyUw6gcWlQI9igYQnzRgD5jkTqal1thyNVpc7140PB0e+Hq3+E/V7slOw1Ed9EjXMYZgHpaJRBdbiW8cdsFQDMh33RKxHAsSKPmVWK0UsF9Z7myIqHEWryrfdW8s7Nl4VvKY/4mgRlLsAGP0uVj2weJ8acG+GFc3OxkaY4E4Zn8LmFlQ07jHcJVtZxUt49e8GStIWB5j8zZ6B+6kLoGA6ZOchrtup9WBsmMwghBYYMan/Xt0wb2CS3KKuqm7wDU1oYvAmrm4y/s/Ioq37SAX/HGKDBPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI28x6EreQPEA5kkz3vEaDIIcMtRPdxMvAdfS8uO5+8=;
 b=D+D+pfgS6jS9p9s4+NbdniL8KoRycMVspbTdr/7cVxnfVa2Sg6WtQnJuX3Yqg950RVgSKVZVzFC6JmMfUyYA2qJHhD4Ao1SUdxZbnzfEzzVlq2fi2o5QtP7BCnM0Iakw7beRpsP0LXPx3JWY/XeYog7PCXuLCKKwlTeOCFe2cDXiLyb2e6sOLl2W+Y7VbmCCd7cApq2HmYXHLG/JYpgSEP0ONurJbrNNNf1RUOHfkX7tCfpYSWk+5PTw38Y29OH3kvzG8Si4Znp4t2yUZAiIk5db7Z2jseYshz96+D+Ue2o+L+EByWdTdBivJufigwI8lJFQfXZN3ghctqhGJucT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI28x6EreQPEA5kkz3vEaDIIcMtRPdxMvAdfS8uO5+8=;
 b=xu1zxpls+vvxd5qdpF5csTiYWSmN6eJlY5y7/4BzV9DC5OX/l7xHvdr8B0+mwq60hAAHFXIIxJYeWJyrfX1sR7C3RLVETqJfD+ltdpw5pTF9cge5a/xd6JoUciDX1oQ8LgpSIM1wnmP1JrjD5aQYSxkfmfyKJT+xaRNFTbIUXmc=
Authentication-Results: ladisch.de; dkim=none (message not signed)
 header.d=none;ladisch.de; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 18:41:25 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 18:41:25 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wei Huang <wei.huang2@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/6] x86/amd_nb: Rename PCI_DEVICE_ID_AMD_19H_DF_F3 to match specific model
Date:   Thu, 26 Aug 2021 13:40:53 -0500
Message-Id: <20210826184057.26428-3-mario.limonciello@amd.com>
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
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 18:41:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93224c6a-d1d6-4f94-5b7e-08d968c11b9f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45104E405C3AE9894639FECEE2C79@SA0PR12MB4510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2wxQWMsnPfumeQXmNpUWaZr8Qj/5LcbermgwEucPxJnxqWMMkTGpZMlsPplQj05Ewdgif9D3k0Tx+lRYYR2JarQwLKtuQq/14U0e27++DxO7pOB+4OyI4XfSJA9ShOyiQbQnTS1+jkfJoFRrva1+PZG1jXzTF2d1UdN4IBm2qzGc0JWrT4Gjg8vE8PBSnip22UZCfK3TExaUtYmIsCBlaaX3ADRq9qJcg+BU0HSbLlVTx6232X3TtVvlnvNbe1XhiSohvekmOsVE0v9Pro7c0YymbfeD2Pi3iGaFmrkSmZnTTqHCktLiQgz0HFNHTBuE8ZlgE1YrNI9WNas+Y306KD5vrtuysuN6QA34kSoGF6Urh3mU0RHc+ZDUiJ12HHyp85nt91kYuExYnP2H1qljG4LSWFViWc1acgLxCc3kRB7BPq2xXFCi67jIQEAM/8EEPuZIDYLVlSGchlW1qZaONQs614Apdi1fLwGG/udRC8ZMyRvHMyXY5sum6fqzJcwooyyofkjy9MrcCfqIjXIkN4dPb4FLcQpKhGdeubpZ710Ui+hWRGGdzPfVrdemzZv0riOQLgXd4meW7ZT2QXYTeQHKo/sJbelVzMgln7l/5TeVK5KFIhca/W+a5zKWE6gV7Cij+29sio2uv/nCJspMl4fVr+p26kGitC4CLOTOXPzhia68RR7lWAXlXOSBI3I77ydEyiRgXlzza6YH8/J5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(4326008)(38100700002)(1076003)(2906002)(44832011)(508600001)(956004)(5660300002)(66556008)(66476007)(6486002)(54906003)(66946007)(26005)(8676002)(186003)(36756003)(6666004)(2616005)(52116002)(7696005)(6916009)(86362001)(8936002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?88ryfvRbikFZNMQMIWYs0T4wHODAZCEqgoqSmEJX5o+WfRq1BytJkgbSg0I/?=
 =?us-ascii?Q?8abuLFDuIammpGLicRtuP+JK28cIXD1ds+lvFQzvPfMXUjX9sNO9/xmkhMy7?=
 =?us-ascii?Q?b2ph95phbNda8atW/vYj35IX761yg6kL3TpP2qK2tEvjLYFNr6taoXaWm2Bb?=
 =?us-ascii?Q?19DMJGYYBgNVGIlpp3g/m6l5gErWZsmMqTl0p/Y6bxtKIElAnXK+LdLsuX1T?=
 =?us-ascii?Q?N7kzwe42/WGefVn6ez9zqmjuxmmE3liAcge0QaQIbYW30Z2nWhj9Eg83rq4R?=
 =?us-ascii?Q?7AW82qcfVrhjhzo6aVkWKGf21Rhh1I2kSqc0T2u1Y84O8crXtVr5F4ulCJe1?=
 =?us-ascii?Q?TXJfLVShn/SW/9BjIJn/RUfGGAuTyFrPLh/+Y7GoQgK469gbYVAf/FKyKr/3?=
 =?us-ascii?Q?vvD4p8Rqle8MKBPTmxJBjNiwm1TS40yHK9An5ukL621IfpYNYrzHoL5C5uIr?=
 =?us-ascii?Q?JomaleH3LAXGHbCCNSL6P7EL8Gc5OJiSTzNZKoMwypVz3Y77khz/D+HO/krj?=
 =?us-ascii?Q?m8AebBz/WVdfAw1NRxRbsFGMfbkU9StmkKvsxktiItJhpGLSxtmdRixcVqnX?=
 =?us-ascii?Q?R6yKEa3tyZgI32iV7rQMhYmOcKhpZ3xRia0b2wZy2231qZAY3jPuKkSKOQOk?=
 =?us-ascii?Q?rpaAQ1ra1iSh0VymPgfAIz3cibRjXuKoiYC1r1fz2A3aF9z2uyLeguwaXK/R?=
 =?us-ascii?Q?R5sYYYYYpOOd3EAXQJc4fVawPUnRMR6kWbSudYTOZxRK4r5XDaWPBfHHqeqJ?=
 =?us-ascii?Q?RJf60ebWSxtqekSdaMym3gWH67NamWwLtzODOFa1gEw6KgwRuiH0N/gOep4n?=
 =?us-ascii?Q?2eyTcQXJCI4A7qGxPDjeL/tmlBZ1nExpaQ+cTCW4ED+9IRNnCab/CpDgAHau?=
 =?us-ascii?Q?0muRtbZcMRHtlkIgBU6Z/PSDp/5lpZtiSVf+0LWXdF/LS8uspQKtzMVskxzJ?=
 =?us-ascii?Q?S+12Xf8IdW7ZC4ZqfTNnsjQwCIjOw/an3E5tZlxrkVHPjmHYnuLy1AUSkrbl?=
 =?us-ascii?Q?wcbsOiMSennQqnNv3thDk1FmmRKQhT6ODL1KcFpJpY6n4NkeBx/ieOB1lPaZ?=
 =?us-ascii?Q?35Ccuvyn06E0TuVT0zWttwqdHxj/sSfvj+/H4XdQMVswu6FeOR6KelNgohCa?=
 =?us-ascii?Q?aWC/18IQCGr+CalwQzwr7/ymBLbQk08poYQZvoHGupXJmRr/1Vf97My+Vmev?=
 =?us-ascii?Q?XE9cMdwSamvTiZR8EaV7bFqUho5RJh/D0PEEs2WmrESx4kH61/Dia4v04uMi?=
 =?us-ascii?Q?y8Vs09OUjv46zhos67ASDPNaHuZ+3lTv/yelqbbDH21KsgCii080gjfMBBkt?=
 =?us-ascii?Q?5Ppn/xHxwMYHrMm2ha0Cz/Eh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93224c6a-d1d6-4f94-5b7e-08d968c11b9f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 18:41:25.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKYczn7l3XoHTMEixkwpRNgfy8oA86TPuB95NfsAWblUnUlOhctzDhcZBnd9OL9IqeDSOSqh6Vba3kiJkVlC1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Upcoming changes will introduce a different model in family 19h, so rename
to disambiguate.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 arch/x86/kernel/amd_nb.c | 2 +-
 drivers/hwmon/k10temp.c  | 2 +-
 include/linux/pci_ids.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 23dda362dc0f..cf41fd7faad7 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -57,7 +57,7 @@ static const struct pci_device_id amd_nb_misc_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M01H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
 	{}
 };
diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 1d3c8d319941..9e704338230d 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -493,7 +493,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
-	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M01H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
 	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index fb1185155394..b2425a1574c7 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -554,7 +554,7 @@
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
 #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3 0x144b
 #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
-#define PCI_DEVICE_ID_AMD_19H_DF_F3	0x1653
+#define PCI_DEVICE_ID_AMD_19H_M01H_DF_F3 0x1653
 #define PCI_DEVICE_ID_AMD_19H_M50H_DF_F3 0x166d
 #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
 #define PCI_DEVICE_ID_AMD_LANCE		0x2000
-- 
2.25.1

