Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE83C00143
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44DB560F44
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243300AbhHZSmU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:42:20 -0400
Received: from mail-mw2nam08on2061.outbound.protection.outlook.com ([40.107.101.61]:41761
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243337AbhHZSmS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 14:42:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iER21YlpHvxBG4jPaIkhhJvqA86KKqz9ysCTm1gI0yyUsdhvc47s7sBwfQofpoM+icxBOrjL45YNH00RQS2xxI8FGE4lVlaICGfRYSWsX9652Y3mjMyjJAUB59xrjlTEEKja1Rw45FVLj4L4+6UZ60Zj2RWH3ChGURj9sObnQZORWX6Tki8EAcUKYd32byPk3Z/EUPYD31Leow0qQj/413m1xKU9SzgeEoOOCJ5QBsxdpPNVWOdlNaP7ZN6Zgbg5QM8XuhMehiQ3GvyJdnRls8OJpvm4sbYQExBZZ6Oj22WoL0j+WYng588viUFOmGT9he3llAQWoAlbdLNN6W+/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VY4KglMCpRkjs0EZ/60pt0Jw7v0If1JVhni+Y2qRnY=;
 b=RyLeRTndYjL76KOusDQ4ZLvwTQVi0Nm4IjYPwUmzpQnadBLFEdpef1XT9/lbTjQmSRqk5mOSCjTXfk+zYVLNAJs940860k2ExKyifMWf3eqOw9WPdC+hu1HIJPewnAXl7bDwLawl3YLHMIoUPSSvFrb5eG47jMKHsC/CjVUg9n/7OJGxN4hvttPMYtBiwzmFzTlSPZXpNrYpo42Ya4OM4bxzqlFxgBVeek+taywJylU3z+ED/KxGNyA/1wCdhCnUHwxXbIRRcvmSeN0LSV7P3W41qYB6d4RELmSM8qUIFE+UP3jgo78eZM8TnzyWGGpZbtL6qcfz+jPymgK0+7khbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VY4KglMCpRkjs0EZ/60pt0Jw7v0If1JVhni+Y2qRnY=;
 b=W+X23zdnA6XOI00yA2cUv1BAMbiRAvEjx4VrKTXYR5ku2y4Ww0FL4dyFCbWLyLgApu5v827nKE8woZM+Sf5S604TIgYcQY7L0/4Fd98+1NSgHl1fW139ZslqjKdvgFgJfXbGu/Lvh3Urt7S/3+bkGc6Pbs4njVnbXnse2rDfNso=
Authentication-Results: ladisch.de; dkim=none (message not signed)
 header.d=none;ladisch.de; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4573.namprd12.prod.outlook.com (2603:10b6:806:9c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 18:41:29 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 18:41:29 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wei Huang <wei.huang2@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 6/6] hwmon: (k10temp): Add support for yellow carp
Date:   Thu, 26 Aug 2021 13:40:57 -0500
Message-Id: <20210826184057.26428-7-mario.limonciello@amd.com>
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
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 18:41:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2c841fe-c73d-4c2a-24e3-08d968c11e46
X-MS-TrafficTypeDiagnostic: SA0PR12MB4573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45736874C81B544BDD914EB7E2C79@SA0PR12MB4573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFGDgiauooKOKZxWZoQ6ebghKLaQ7Oh6XglJaCxM4TrHV16J4VFMGCkb3dHx0/ckN1wQOt8yKx/9/LeJDKKQubuJ8sK5s9x5VL/TJVesv16sCMiRpCgw1PiKP9ervZzp4vejB3TAF9IPSOiZ8GtypmZgsYu8paEPJILsooZcPrllWTsy8DvBVKt1k+tKVCqTFaGhWNB6mzdIIml4g6riGQmzcJcgRbdj7oinsY3cT6JK92iFDxnAy7toZtYr2z9atYmgXPdZrIaOf+uqRBUbi7FP1xGtt8ZFz3kg4pSsRZBr6qK9V9Hb1omhvvArNqGt4ua2BUCl/mKNHcpu/Y/5HAEXtmLXkaKPP0pF5smCrV/maeo9fMxR35aeORLth577258nV24uPYRE35UYP+7ObzQFN+I4dCH04ygLRoM+0Q3NEnRPfzyE0GOQH1m22gNGhhy17oNb2DRN4C1EXihhO3wX5IsvxLDhy5Xbb8oitebBmvFnawQ+rK3PBoEm/aPP4ph2BhrY0HIuZJF7mFhw792jmDWgKyPC0NKWkywoW17NGL7CHz5flSXkWTHjUSk7oy28w3zydbJrN8Kqfgb+shFMwQwnSSfeG5bex+rb6pzNo58KLIa6/D7VPVLa2zrRIjay1RZkLFnGHxQRCNE8Cn0kJ9btLlW2Kx2s1/Q3PAopParmGOK8LNUeT2pnNRg4RzoujpYGMHFDwOFH/0sn6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(36756003)(38350700002)(66556008)(5660300002)(38100700002)(66946007)(6916009)(66476007)(8936002)(478600001)(86362001)(2906002)(4326008)(956004)(26005)(6486002)(186003)(7696005)(54906003)(52116002)(1076003)(316002)(83380400001)(2616005)(6666004)(8676002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WsbVOgGbe1+y+v0snU+esjTCXnSW7Hjrt4Tm4WFPLunUJwb4pLXORP+brmDB?=
 =?us-ascii?Q?FON0tJ4eHcOW0akQpJ79TwmaMR8k0ynMvZ7XBAlh6Mc3xJdtGjFAjnp468Qr?=
 =?us-ascii?Q?ecPRU6koe0og7+54Gwi09+e3I1inqVi2BGXca/zei1+j/WRDx+vuQwXIGd4m?=
 =?us-ascii?Q?zOX8iyjnvRe6zcksRg4Qmz9nesAu5lkZ0yViFWZGu5pxJ+TxUPTa3ZJd6LSP?=
 =?us-ascii?Q?jEOb5q1JUzZKAPlvRFpM91gXSbjJjCfFLPg0t4WVbm143BPmTuW1c0NmeUjS?=
 =?us-ascii?Q?s0EjEyH7XUF8cqT1A5cR6b0Vcq5g8PJ1aXbzzsffjScDp6k3ekcKPxlCbXkI?=
 =?us-ascii?Q?sctev8A1wzhOmDgYEzp/HaQ36ATAR3wpnaQb45unsuhBlJtvwK6j0lijvzI4?=
 =?us-ascii?Q?zqX0PrG8oYCw2CEfzb5AdAkgjEau+3dXb2dvgjSlyQpaxz35fRGYUEYHvA9u?=
 =?us-ascii?Q?6aPU0ikb1TR3v+2ctGD+R/vVTEL3IGc3Byor5fcmj3eOxPTephC0h4HmoGD4?=
 =?us-ascii?Q?ml/x7ryTwFDqGLyKyj+8G36HYSZOliP3VuvrHccfqshAOsCvIadS2Y7tvp1h?=
 =?us-ascii?Q?tjrrw/IxFh9DS0qvZbW6H1afMvwLIE3KJDrh4W3iXkC0i9R2yX9Ap0sv1Ic/?=
 =?us-ascii?Q?yHJL6ipV7mnyX8KtrjXVGp0bpnm3XzMz6h+2aaD0ExLJvPUYsLV6RHIgoTLq?=
 =?us-ascii?Q?c9JsF9D0mNZmirBghY/T+5LBQa98mdF6fEXsujbvpljUuIiEDt+ktVy51mT7?=
 =?us-ascii?Q?2wFBiFBpo1ssYm890wTMgP5T8ZTBGxtW885Xwoo180N+jZa9JbMAVUDQj+p3?=
 =?us-ascii?Q?9HUpwtXA8EZ8VIsYi7Y0zXfrJ/Ma9Q3c3wtgiwvrDl8D6miEbiPl6aeKbvrx?=
 =?us-ascii?Q?8tBJNAj0DVjkYPLar3pSaKoXWpKRWtSQGfJNB5PQHQgcnonfQdPn4DUqRpxw?=
 =?us-ascii?Q?Je/oFKRHPAxqHSeZcOn0qWVhnMowCPoVaNQvxQs3ukWamms1LVexj/5Rg8dF?=
 =?us-ascii?Q?4NrxX0lKiaOEISknSv/vW9Fs/KIDSyv52p/EcD0p65Cl/kllGFMzc7Rj/1RE?=
 =?us-ascii?Q?7YV4nY5xiuxbUggcTmK+kJH+P6bgzbZNQPanVPvJi9SKacAhtj0dufpwzzIt?=
 =?us-ascii?Q?8iqxXUdksG8LrB5qTfEhOwijneDtOz89RHCsuuJ+WSr0nCIAVbJeCV9Q2Gsg?=
 =?us-ascii?Q?nty0WuB+WvIsz5dDaT9FDKVlSY6RSc/IuCiEO2YGYAqfgihFsFaF22HTFVf/?=
 =?us-ascii?Q?4pzUGr9LHX6ppIduCDFGiKJNsE/ElLltzE5/BCkS4pPDEH6NNrzGmZOBLx4v?=
 =?us-ascii?Q?7osj8muUn6K+Krox2Ez/DGBk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c841fe-c73d-4c2a-24e3-08d968c11e46
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 18:41:29.7228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCZMjsG3bNm2lZO8ANL+j6s4kvowb8e2D5/KpSXGFAmjlDM2NT1M9WkGpD9Zdb7/QLb5gom2l/4B8nkUF/PDfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4573
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Yellow carp matches same behavior as green sardine and other Zen3
products, but have different CCD offsets.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 arch/x86/kernel/amd_nb.c | 5 +++++
 drivers/hwmon/k10temp.c  | 5 +++++
 include/linux/pci_ids.h  | 1 +
 3 files changed, 11 insertions(+)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index cf41fd7faad7..ba768fe1d0ae 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -24,7 +24,9 @@
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F4 0x1494
 #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F4 0x144c
 #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F4 0x1444
+#define PCI_DEVICE_ID_AMD_19H_M40H_ROOT	0x14b5
 #define PCI_DEVICE_ID_AMD_19H_DF_F4	0x1654
+#define PCI_DEVICE_ID_AMD_19H_M40H_DF_F4 0x167d
 #define PCI_DEVICE_ID_AMD_19H_M50H_DF_F4 0x166e
 
 /* Protect the PCI config register pairs used for SMN and DF indirect access. */
@@ -37,6 +39,7 @@ static const struct pci_device_id amd_root_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_ROOT) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_ROOT) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M60H_ROOT) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M40H_ROOT) },
 	{}
 };
 
@@ -58,6 +61,7 @@ static const struct pci_device_id amd_nb_misc_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M01H_DF_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M40H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
 	{}
 };
@@ -74,6 +78,7 @@ static const struct pci_device_id amd_nb_link_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M40H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
 	{}
diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index e8ec0e36fc3b..cd3d30b6237c 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -465,6 +465,10 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			data->ccd_offset = 0x154;
 			k10temp_get_ccd_support(pdev, data, 8);
 			break;
+		case 0x40 ... 0x4f:	/* Yellow Carp */
+			data->ccd_offset = 0x300;
+			k10temp_get_ccd_support(pdev, data, 8);
+			break;
 		}
 	} else {
 		data->read_htcreg = read_htcreg_pci;
@@ -505,6 +509,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M01H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M40H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
 	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index b2425a1574c7..f84ffa154db1 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -555,6 +555,7 @@
 #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3 0x144b
 #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
 #define PCI_DEVICE_ID_AMD_19H_M01H_DF_F3 0x1653
+#define PCI_DEVICE_ID_AMD_19H_M40H_DF_F3 0x167c
 #define PCI_DEVICE_ID_AMD_19H_M50H_DF_F3 0x166d
 #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
 #define PCI_DEVICE_ID_AMD_LANCE		0x2000
-- 
2.25.1

