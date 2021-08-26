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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71645C4320A
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DA5160F44
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243319AbhHZSmT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:42:19 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com ([40.107.93.86]:29519
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231453AbhHZSmS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 14:42:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTMqXZjklTUMW7lB1aoIHXoqgXe6bnZp1j1WtL8quUBlGUHAStmyiloaHEuz93kUoBX8pW8WlJg1thmOtk04soN/Pca3my4irKmAKEZ1HG3x6Hr7chG6uPDjZr0jerYvSIEokv0FgVYiNyeaNhLwkF/AWCqYSz2inHpr+2B8yzS8T3f2SniizHrPyvmsZbLkOszuSfwAYROM7RIttP8z3ARPAAeFJCRla98wYKsTEHwb6uNMNFkjvB1Hqxl7Tj9Zapf4Q/JRkvpKUTEoPBR7ZuuK+WiILjmx7IKz7/zYqdGTBmvQpoHx4k/jL/R2WlcNTM1e1ZSvtJLX1ggbCi3Tlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFfYXLL05Vk97KY0DCc14weebU1HHauI/lcgXL+XYdU=;
 b=Gy/1lj4QybTrV6XiB4D3NEwVfVzXKs76ZJ6v1oc2Ueyj262xj/wRbXoPPvIwcv6UcirfcoQ18plIw/MRApuI9qw3oEOKIFL2uR/gz30vRY4dQqKLQpc6Q3eq89VSl84HOMqEGSPtvylu4pKGGbwggaKvreVPh1J4qLJ6dXjYrHm/ZltQfA9uf29HsPzHLovdcf5hkKf+N1/R7nFALD9iaBzI6sYNlsnwH6j+atovvChsK7LEaUCrjTSdbASoyiflMZ5L/FS+CbPnko+58S4HKXRg8UZBjSxUeS0kOqG2ar+lnYpcbkP/+dLeILxj399HFFchBHeYGYESqXTTPEL3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFfYXLL05Vk97KY0DCc14weebU1HHauI/lcgXL+XYdU=;
 b=5dZfTTEXR0g/vN8N9hmidsKNXTn1NJIMp7uSb/Mte1FY53I9DSFgc/3MbL7++UQ7RJO4y+y5TZQd+uRRu5nwv7nw3920p1K2pag/b0YzqniLZ4PT5M5FkQKYuaPwfbjrNFOADWOwIYXWYUDj6h6TgwYnolSv+mnUN2YlmHu37wc=
Authentication-Results: ladisch.de; dkim=none (message not signed)
 header.d=none;ladisch.de; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 18:41:26 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 18:41:26 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wei Huang <wei.huang2@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 3/6] hwmon: (k10temp): Rework the temperature offset calculation
Date:   Thu, 26 Aug 2021 13:40:54 -0500
Message-Id: <20210826184057.26428-4-mario.limonciello@amd.com>
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
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 18:41:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d26263eb-b408-4d09-07e5-08d968c11c57
X-MS-TrafficTypeDiagnostic: SA0PR12MB4510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB451019D77C6BAD63FA72DD96E2C79@SA0PR12MB4510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTP/FQXpP9wdOWEDIMWinR/JW2ynjYBBXtLLPUsZ9/0D0/CwfEVoEdUW+YhkBBTWKSHXbwbrxd9JyM0VdQkl/WVszt3rQNjd3YEouCykKIOsH2NUKcbhxbDxrE5WZHhbGcBNYousvnqxOznkcBg5vFSyQ+hf9CEXKbatb2rIdVF4RT+mhaoCBWSAYhcIRRoNLpQJwFyG6YY4JSR/jJm1GyQOheaWaY723IsRhwB5Nmpl/07U4qJlmwLB2yZgiLy+hhwAmEOF/iSb3/GMvo5Lg83NwzB0v6RpMlKPVc/srKCFt5LvsiIMlsbKznrcvJV2wqz4H13POt+VlUHUtXngkcStuI0O5CaUOVmwS6gyZMuWS/PfiY3DFAj8qcVNCBRyruvd7OzPo2Maep4i233cI9ftz38/ZkTadbQxTwByQCAzswBa8JvkAzUWWYCjW5rEqZ03+o5Egh6JDygqQdAQKekUMx+iHuDzXHTYbl1IR+cFhtq5oVaPMsim4qq10HfAbuaebCrdqzr5OiwObMZbj8vYUqZbWTV1RlC4d9MrlEscTouAOF7Z9KNSkqDV4WPAh8Ae3B/s0NX/v8LOrf67qm8kB6zyfq1+GlEMXMHkmZqlYH8cS+Q9xU0pzm0nnlyVd62cskHLa2Ac0q5MkSvwBxw4ybiJQI4LbuKugwaaeT+vKrz68wxyID8v11FNHir6Fq1tNLj559o7RkU6Yh2oUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(4326008)(38100700002)(1076003)(2906002)(44832011)(508600001)(956004)(5660300002)(66556008)(66476007)(6486002)(54906003)(66946007)(26005)(8676002)(186003)(36756003)(6666004)(2616005)(52116002)(7696005)(6916009)(86362001)(8936002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6SpNeONdTsBXkIfwDtJKf2n5L8zM5/RL/jTvcf8RveDygRiTKMNjMwA5HU9H?=
 =?us-ascii?Q?tJ0djfgWQFPQuI+RTv3iNE4Axw2thImLITE6L0Tuw5iCJTxWP0F6neWi0XbT?=
 =?us-ascii?Q?KIMbMrULuhilcJpoIvNR6GYfOKgOtgD5io1rZ4BMJr7sHu712mOqTIMkhq0d?=
 =?us-ascii?Q?py0w3lSHWEuoNlwugoXKdNdSv49Wr4/JOUlCzgrLLGt/SPneRn3/LtaKdgyC?=
 =?us-ascii?Q?v4D1Z8fqcKXuURENwJkBv4Su9zHMQa80IVdb19ukZcnoH5vEgCg+T2S4Geyo?=
 =?us-ascii?Q?b1YYoVqkWAi6AVFQOXo5BQ6Nd7s+EuFq6WObkwNpR+YoRFi0l3S2drCvjHk8?=
 =?us-ascii?Q?iDbTPBr4AHk84Phd/BYX+7/9NKR0c5m6w0PRNVEWoonydJBYs2NMTJ3ux8yF?=
 =?us-ascii?Q?MvGsxwCwJcoAZz0/KygrYk2+cMVv3+jAMpeBF6Y7cVvbvdYt/LB1icPJDyPO?=
 =?us-ascii?Q?PxrSvgjy+s82cJN+Ef73qY1XOQt75M9jsmmHW5Dev6uOAddxhPiko18ROH2w?=
 =?us-ascii?Q?FMFzOzKaTIxzORHeTXhQ1wjKqJ9COna/E/dmjOGpjElcrohi4aos30H9UoP+?=
 =?us-ascii?Q?Jd+bQabpr/1X+L+cYLtxu7AysNkZyjEtMUgKf0sAQlQASi89vBW7bicTrWf3?=
 =?us-ascii?Q?cg+qEGSOlXkUgJvlTn1B9uGpZas44AcVjzl1pejJzDBeX0B2r+Gk753otNH7?=
 =?us-ascii?Q?6Qq6VY13Rmyp07rrE4tQAMal3xMJQNNOdMy2lvtkpux0ZUkBNaxOkFItXOjG?=
 =?us-ascii?Q?gsVwJc3vscaiqCeeJ6hBinYCrST0zbQCIDKjthVDvcrWHD+/h/Vd98njaEKI?=
 =?us-ascii?Q?l3PSpWo8TXmm0TgfgMWNo+vJ1WJzyXEVYjgM7X8uQdVOdM0dIVDflVvZ6Aab?=
 =?us-ascii?Q?Nw32sz2hkIKAduOKN3n44+MCKNsnqHNI9rm533j9Spp+4UNbknlufI9SHVGu?=
 =?us-ascii?Q?aZJ46+hW/sGSe5L7pmYqxzWGyp3lV6fIuRKzEOzuGSC7MowwX5H1CkDBBOtV?=
 =?us-ascii?Q?sHiYzXpJVVd8oTFF/eat2HxF738Xw1c3j0vVWW293/pa6SpsjuPIOeJWANnS?=
 =?us-ascii?Q?r41B/Kd9myyPG1y/29/543uyvvLnLiKtFJhHPJNruZewAFy3QgBSqD8S3Ogv?=
 =?us-ascii?Q?HrB+IbeXCkohjGjdJwwne99zXkcVEin7ltpy3ghHwbNRZ+1eFTeNBRE2v4dj?=
 =?us-ascii?Q?YwplmPij2mfz3b7ZYFJGFnRN4OB9dH8+6XEsUy9L+jJb+V3wc995a+XwfF2j?=
 =?us-ascii?Q?hIrsfflyKpjFx7JanoB73Gx54PenKWdpTHpmbhANAmyJWRLLCDWpZjmh/eLv?=
 =?us-ascii?Q?Jfa28rj+wn0Sdi7TX/B1rozg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26263eb-b408-4d09-07e5-08d968c11c57
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 18:41:26.5776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eeii95ZZ+iYBDfTDutFjvwsd9lqW8x6fOtQ8AHtpx1knS3xT8S7FcoNqZ4ax/9/OvCnOj04GkuiZQbvO6bK5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some of the existing assumptions made do not scale properly
to new silicon in upcoming changes.  This commit should cause
no functional changes to existing silicon.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hwmon/k10temp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 9e704338230d..5c1aebf7a56d 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -65,10 +65,11 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
 #define F15H_M60H_HARDWARE_TEMP_CTRL_OFFSET	0xd8200c64
 #define F15H_M60H_REPORTED_TEMP_CTRL_OFFSET	0xd8200ca4
 
-/* Common for Zen CPU families (Family 17h and 18h) */
-#define ZEN_REPORTED_TEMP_CTRL_OFFSET		0x00059800
+/* Common for Zen CPU families (Family 17h and 18h and 19h) */
+#define ZEN_REPORTED_TEMP_CTRL_BASE		0x00059800
 
-#define ZEN_CCD_TEMP(x)				(0x00059954 + ((x) * 4))
+#define ZEN_CCD_TEMP(offset, x)			(ZEN_REPORTED_TEMP_CTRL_BASE + \
+						 offset + ((x) * 4))
 #define ZEN_CCD_TEMP_VALID			BIT(11)
 #define ZEN_CCD_TEMP_MASK			GENMASK(10, 0)
 
@@ -103,6 +104,7 @@ struct k10temp_data {
 	u32 temp_adjust_mask;
 	u32 show_temp;
 	bool is_zen;
+	u32 ccd_offset;
 };
 
 #define TCTL_BIT	0
@@ -163,7 +165,7 @@ static void read_tempreg_nb_f15(struct pci_dev *pdev, u32 *regval)
 static void read_tempreg_nb_zen(struct pci_dev *pdev, u32 *regval)
 {
 	amd_smn_read(amd_pci_dev_to_node_id(pdev),
-		     ZEN_REPORTED_TEMP_CTRL_OFFSET, regval);
+		     ZEN_REPORTED_TEMP_CTRL_BASE, regval);
 }
 
 static long get_raw_temp(struct k10temp_data *data)
@@ -226,7 +228,8 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
 			break;
 		case 2 ... 9:		/* Tccd{1-8} */
 			amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
-				     ZEN_CCD_TEMP(channel - 2), &regval);
+				     ZEN_CCD_TEMP(data->ccd_offset, channel - 2),
+						  &regval);
 			*val = (regval & ZEN_CCD_TEMP_MASK) * 125 - 49000;
 			break;
 		default:
@@ -387,7 +390,7 @@ static void k10temp_get_ccd_support(struct pci_dev *pdev,
 
 	for (i = 0; i < limit; i++) {
 		amd_smn_read(amd_pci_dev_to_node_id(pdev),
-			     ZEN_CCD_TEMP(i), &regval);
+			     ZEN_CCD_TEMP(data->ccd_offset, i), &regval);
 		if (regval & ZEN_CCD_TEMP_VALID)
 			data->show_temp |= BIT(TCCD_BIT(i));
 	}
@@ -434,12 +437,14 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		case 0x8:	/* Zen+ */
 		case 0x11:	/* Zen APU */
 		case 0x18:	/* Zen+ APU */
+			data->ccd_offset = 0x154;
 			k10temp_get_ccd_support(pdev, data, 4);
 			break;
 		case 0x31:	/* Zen2 Threadripper */
 		case 0x60:	/* Renoir */
 		case 0x68:	/* Lucienne */
 		case 0x71:	/* Zen2 */
+			data->ccd_offset = 0x154;
 			k10temp_get_ccd_support(pdev, data, 8);
 			break;
 		}
@@ -453,6 +458,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		case 0x0 ... 0x1:	/* Zen3 SP3/TR */
 		case 0x21:		/* Zen3 Ryzen Desktop */
 		case 0x50 ... 0x5f:	/* Green Sardine */
+			data->ccd_offset = 0x154;
 			k10temp_get_ccd_support(pdev, data, 8);
 			break;
 		}
-- 
2.25.1

