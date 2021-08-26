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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3C9C43214
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3E0F60F44
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243342AbhHZSmS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:42:18 -0400
Received: from mail-bn8nam12on2079.outbound.protection.outlook.com ([40.107.237.79]:56913
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243319AbhHZSmS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 14:42:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDUYcTvwHpbhH4N/lHXW3KF56+ggBIn2anspY4DJrkvjTgdPgV1ermo2ysRDCETukl6BVaxRJKC3ITPXsdx+Zu668T/X+xUVKmnohJXjT/dPgjzL9UNRSUM9yeywrcNYAaj3GDT8e/nX4iB79G+jiVYnDVohwe2+RetfCmfYWMdS2GXXm1lT4V0lD3+sLnmN0wCYw2Qn8aDIlB0NHqrdoLrmdN4EULOBRtRKzOCT8jah3lnDbOqs2Se+3AxpaS6ysr38QI9XytYuw+OwuDeeX+yJtIqGDRFD3jcjo4Jgbe3O4RZ+iRv+aHZ+J+Wx6YL5rwJ8crHmJho4uUs8yKLJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/WoGUZPK0oxiyC+WPciXQmn6uT2fiv4no/ddIKwzTo=;
 b=Ia8rDVvYZuVZ3KUGaJG0if3GZDMZd/1KKHBRZh7gxTj/GfccmqD/gamCTwA9L0T3o89CKdpWbh6B2G5JYbBKbD19Z+IG9oZ2sL+oLdGkCr4JPP4E6BosC2KSzT2g4aTYNPnrbhL7T/9rInel3ObgZo9dTLBTzk+4jhrsY7W8BU7ttMj0dhU8OsBTVmvatkCgCDmZwvLtjarrJtMMWDZTO+lYs4K+AoQGW9riipsBc2SYA0zjlqTL8Ekqi6grDwKzPWtGHzkzS0bwT1F3Kqj9KHDYbtCgW17aFWhXApNIgcXNzl0sNPu2cFxOD1oMpoqjY44Xr8dmtn4LefU2xk9aSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/WoGUZPK0oxiyC+WPciXQmn6uT2fiv4no/ddIKwzTo=;
 b=PZtp7XKsnl8Djt1q5CoCpTaKHKjxGtSVNqWA2N/ifElMKqNIRmAwU2TSylM8NNFE2bhh5LALI8lbnbhY2v2idnJMjfYLj/Rb/r+h/ME5KJicIBukybsdNy1glZ1zoVyhURxrVFEoUvO5to7DmDufLVoDwQS5gj8LAkp+zuR+D8s=
Authentication-Results: ladisch.de; dkim=none (message not signed)
 header.d=none;ladisch.de; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 18:41:28 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 18:41:28 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wei Huang <wei.huang2@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 5/6] hwmon: (k10temp): Don't show Tdie for all Zen/Zen2/Zen3 CPU/APU
Date:   Thu, 26 Aug 2021 13:40:56 -0500
Message-Id: <20210826184057.26428-6-mario.limonciello@amd.com>
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
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 18:41:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4defc85-c833-4f60-6c97-08d968c11daa
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27827E593556A13044240B6CE2C79@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3e0uAOh5KyjUrrgYBiEFrhe82QRD+0B+Oy5QBujV15WYmbF8G6j9Y5Ayg38bJ7NVLTQY0Ius7GUcus5HTBjUIz2hty+5KSv2lrBbuhxLRz/5B+g9i21tlBYRnvevSJdzFJBl4F+/AHvL159X7oOxMIOkBTGYVeyM4K0dTCo1xlrv3quuRK36fkc3krqD5kGebPjlHy3oKmNm+n/etmu8pmFfBjYRzHTn9xPDgZHfVgQZL+vs0dV4p6AXS6/rTj1ruT1KgyLpgsnbqTvvG5Q17DWbldYP6F/qbQ733r6DtU5Fa93zLfTnvbtfhbYmWcNWM36lP2LV3RHherjiQWhul2EPkhfWwmtIAWK/cPHsEvZo6kKErY53gT2yXQ3P2joL0SnQjb9+yCre2dEE5mUSLYKHoC+S8agV41zNqWM2Ov2Uzit7hSCfPRvrKrUvJV56YCjMIR7DCyNifXgQCu5EAF1ZNCOYpSAukl/EHPVmigzuO1vwxKNbjun9jg1xc88CvklimUOQAbzSFG8xaFZWV88J0s8AxxjqShHgBRHGO9yiclgMAf79qrIKqa4t1aFLRi0ah5S5QkTGMIr9PpBYWUYwHJxI5j46P8KBC4HQx4d7VFKmHosMfjavZoaPn1ZkW1g1PyL/BwcxUI99iKTKBGUdN6SrWt8+SylPYT/ezURGRobFTnlJL+hHWckowD2jQhudAedYmfaCjLF5TbA3bA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(8676002)(26005)(54906003)(4326008)(38350700002)(186003)(8936002)(6486002)(5660300002)(38100700002)(1076003)(83380400001)(2616005)(956004)(36756003)(316002)(478600001)(66556008)(66946007)(2906002)(66476007)(6916009)(86362001)(6666004)(44832011)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J1mcBZDQPim1qBpVVK5kLkMDU02Tzn7da2i0tk2BC4zO+mYDesFxZFaMN9ro?=
 =?us-ascii?Q?MLBMDm0va0O3kRwwJIa8XrJ6vtb3WXt9UFDlXco1/fIU6HTATPdGnoOKgZ9l?=
 =?us-ascii?Q?vuQ9zgzRnMWJKmyA+zT2yt2unlLecI8yIHd7tTSjiRZFmDTN6fHLYotiUVU6?=
 =?us-ascii?Q?+sxSt7rGY9hTmysayjUeoTBBtrul40GuFB8/F1PVjVoobLcUqczkCaKJSb4e?=
 =?us-ascii?Q?F2a+H4q9zrGEcvApcJIzaZcibOayrfCKeb2P1OIOUCJY7RpZN7p5k3eaj4uQ?=
 =?us-ascii?Q?/s10POmLwTMY5APWn/3pZlV50wJmWMYHf6UCK98uQYhhlHRFkrZCoQI2ax5e?=
 =?us-ascii?Q?+Ixs7vR55rL4TGMgam4gefswV/8L62RYAjOg8lk9cH2VRskJscGXxTrliv2j?=
 =?us-ascii?Q?Nt4dgijKMckanIdBdvjRrbBifYWYQGMUhYoDQF73uWtlWTcPC1ARVAEe38gu?=
 =?us-ascii?Q?DniGvMyoJ2+MWpka8EWJGYV/EVxgvHtx/9LAj7YPQ54crS0XqtF96WNkDysP?=
 =?us-ascii?Q?q9vZagdFxJ/sFzkmbdOPjG2A4q8y/OcypEFV2DyzFgDJdBpe2DhBlnDrOzlk?=
 =?us-ascii?Q?CX6ywVvIbsVDiSLNqexRb1iV9FapQXWZefGP74LDy4ZlxuSPbdvTMuefl81s?=
 =?us-ascii?Q?9FBQUKvURCE+EVIO58SfBi+8J8tNM+VtYN2hrCXCuVmLCor894nRdNhE4YBq?=
 =?us-ascii?Q?RjOrwR59lbefGPc8kNR+06lpISAnN5dfr09GiYUGTMTSe7x+/ysrMkqiGXZI?=
 =?us-ascii?Q?Saq3G2Bh1aCMx/KDDWMVTZgX/g7EkT81cgl/CH1AcX4UmhEQMIr3n025Y0oa?=
 =?us-ascii?Q?LD1gWBhODJgBVS0Mm72ta1LLJ/Ec1up/B6Jf5TbxUY+J+JEFzwKGJTmXCNDq?=
 =?us-ascii?Q?yiO13jB5oCgfUNwa41cbZYPFX/cJ+8if8DO9p1KXGO9dgM55i0ZgG0c2OQvf?=
 =?us-ascii?Q?V4tP9A8Ku5n0J1xBQos2ApVY14wXt6SggxBR+VJSPhD+cRUUaVGAEfNvdA5v?=
 =?us-ascii?Q?CXBSU3VEggL3KvZ5Ur+UWNz1xiZCusX9kU0hJLbueOpiul6l3hSHsYJARBaS?=
 =?us-ascii?Q?AZqa4+Xns2lLvt3nSkovQDkQ9ShreGbHukrYhe4nY3w/7aiT2//AJhuwlYlE?=
 =?us-ascii?Q?qBy/FIoBrpqtY1caUh4hoHTEusCZeNGYZxfAgpTMTJ6Y5LdgKXiryCepZc95?=
 =?us-ascii?Q?obIZHT1LqQ/cqT59frAwD79bKL1cboZrgmYmEk+LBdDlnS2NYanqixTF7wyE?=
 =?us-ascii?Q?bEdlQ6zC7MrP9jglwkFdWfiaYKYSpaGHAwAuvzkptepPdSXVTEqsOVLXJv/n?=
 =?us-ascii?Q?W3ZTqC3F8LCexQ2sl+q84rV8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4defc85-c833-4f60-6c97-08d968c11daa
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 18:41:28.6784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHYGVa5tH15HPDxUp9RWWI70DwrBAWsTk88bQ4i48pUn1nBl3tJd0cIXiXaWDyTcFMP8Npn+aNgiAKG8x8hUig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Tdie is an offset calculation that should only be shown when temp_offset
is actually put into a table.  This is useless to show for all CPU/APU.
Show it only when necessary.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hwmon/k10temp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 41d9c0c0a1f1..e8ec0e36fc3b 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -435,7 +435,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	} else if (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) {
 		data->temp_adjust_mask = ZEN_CUR_TEMP_RANGE_SEL_MASK;
 		data->read_tempreg = read_tempreg_nb_zen;
-		data->show_temp |= BIT(TDIE_BIT);	/* show Tdie */
 		data->is_zen = true;
 
 		switch (boot_cpu_data.x86_model) {
@@ -457,7 +456,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	} else if (boot_cpu_data.x86 == 0x19) {
 		data->temp_adjust_mask = ZEN_CUR_TEMP_RANGE_SEL_MASK;
 		data->read_tempreg = read_tempreg_nb_zen;
-		data->show_temp |= BIT(TDIE_BIT);
 		data->is_zen = true;
 
 		switch (boot_cpu_data.x86_model) {
@@ -478,6 +476,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 		if (boot_cpu_data.x86 == entry->model &&
 		    strstr(boot_cpu_data.x86_model_id, entry->id)) {
+			data->show_temp |= BIT(TDIE_BIT);	/* show Tdie */
 			data->temp_offset = entry->offset;
 			break;
 		}
-- 
2.25.1

