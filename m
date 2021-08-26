Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80EAC432BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 808DC60F35
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 18:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbhHZSmK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:42:10 -0400
Received: from mail-dm6nam10on2041.outbound.protection.outlook.com ([40.107.93.41]:48225
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231453AbhHZSmJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 14:42:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0+eNmcZiq+/Azysq7jTnB+yLDC3n4BYFAO7J+Uwfhz/aQC2UOdKgivdlqwkwSIz3n+dF1+E23Lfdh44x5wck6soX1ZHGifWzmH4vYWAIQDMth5GI/HRQoNUlxtV3f0c1AOKNqZ3BZX0sUCtapcUkebWhMVswr7hqNAlWlx3GPbfy0m08Rn9Bgs9paomhTU2299U0G8y6Jej33s9z8oWgLD5WbE+oM5E+bVTtztyZvfi2BTe+oxFeXOZ2fWTZf0W7HIqR7P9CcMZgs+CR6/V3RGBrGGkIR4bj5m6tLDE2Rm8UUezX1RcQRFl3Zt7/f304j9vV7ntF2P2czPyWKa/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G/Noe0/UW+yGIspyGxPI2GJunFDPNsSu+qL0ZfBRnU=;
 b=Q+iPaBaeccRfCLE/cdFkLf+QRaGaHqlvEcnl3352ENHidbeUWB+1osbCljkM3XTr6QbXph/4W5p/aBdfB7I10ducxS1+ee5YNzNgnSuGci00jkH4Z+Y+q6XRkbWd4zMFJKh3G4SQdPfGt316qIMwRh/TiNV5p2LuPfMGX706osO1vPa7NuWGsRadqyVKO1X2pLnLakL00dqyYSvcUslLXZfhg/a5rGmglC6Y+6xyQuQ6qLiZBnbu/06Efo6G8F5MwrAGlcd5xwzjxcA6+yWgf+nZ8Y8q01EpKp5y9aC4PZHN/RvVMtTFA6WQk+jbfijOVUlaBR4Yhh12FkCD+sensQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G/Noe0/UW+yGIspyGxPI2GJunFDPNsSu+qL0ZfBRnU=;
 b=L+xL9aUdH7GGxtZA/9M29PWfg8CvWOGH5zlaINPnc7z8WaI033t6DskHB7He+mryG0nBxIr1KHKeihr3HFQTw1uGx9NzSBs8oHUZdlNXxcDUgSnyvq7FmIqpvZgr/FmjA40Tyd/8RHsz7cu63e7SJto3WA6n1quk3Ry576e3iNI=
Authentication-Results: ladisch.de; dkim=none (message not signed)
 header.d=none;ladisch.de; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 18:41:21 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 18:41:21 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wei Huang <wei.huang2@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 0/6] Add k10temp support for more client APUs
Date:   Thu, 26 Aug 2021 13:40:51 -0500
Message-Id: <20210826184057.26428-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::17) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 18:41:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d0fe35-048f-413b-2827-08d968c11913
X-MS-TrafficTypeDiagnostic: SA0PR12MB4510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB451076A02C7E1A76D36CCD80E2C79@SA0PR12MB4510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdNlO20bG3jvSxS9UjDofy37hHkUML6D5VU1VV4RvEacNlhCQTDmTZaegKxcn9RWYrTpX7SvZtQqX8stbsyZIn90MvldH9lcg4dnhvwzRUwf0tPVyfy+o+lPI1W+JWoZl42pXvebEcnF1wEcngN7Q9sS1hyr4W1L/NmK91ohyLdp6y1/vgnS/g69efjCFSnhkkFsBsqTS8PBHK/5MABNfydWAY9iAVW41rBpFNTmXU5BJ4tQN1TrQkIOhGhT6naHM+eO7RvwptL69NlobF039AiGB8vIOiSCsFrKfzuYeuIDj5LHC9XKWl3uZ57IzgetaNfyHhSbcfkqcumxszN0MVWUyeamz30mvXP/Dw8Iru64zRyiqqNwEvSudItSbrrun9oSehc3KeyOm32yPsTbLSnGLzWALK279LJAvJFKQt85O//yIcPFX55Q01JGAvaHk5+X2jFgPZkNCbgb2vC0sPfOZ0BrK9vaWZdW4ZBLTT7UQT57ZsxIzoUIusIn4NaVCGgrBzCSRdxDq1XI5/hFtwVJRykN4ANCWFQk9puFyR6jiYWKoGQh7pkYW6YkyicYFPkw/8hywbGYFuvxpJy/xQI64HKZIz96ue//155lrhRh1BfMBtS2w+Plbn0rpdG4M57mzWOZxAjoIqdAgTf21WGsixgpS+AcaEqXcJkZFEGjdSbXVx4iDZxT4bqcpC5DPe/Dr4LqfNSiygd3wEpQ9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(4326008)(38100700002)(1076003)(2906002)(44832011)(508600001)(956004)(5660300002)(66556008)(66476007)(6486002)(54906003)(66946007)(26005)(8676002)(186003)(36756003)(6666004)(2616005)(52116002)(7696005)(6916009)(86362001)(8936002)(316002)(83380400001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g/uCPhEbIe1K3699hybwJDZnBV2+yM27D8NEZFUqz/sa/T+8aptftBTn5kTp?=
 =?us-ascii?Q?1Zu9FDkHzFXOIf1OI77oSIZyMyDtkAuNWTb4INCqVOIFR0IuDI8i6IPK8q24?=
 =?us-ascii?Q?I7NrjxYIotESOSaUWKGhFKygl8TVPgRiAouIF6fRtCFUnhxjbdFyGSfj7fmG?=
 =?us-ascii?Q?DrlrB9WQmPIme6XipzQxxGphxOEom9l5IJKo4/NGTFoacR4p7uM6z0X9fjI1?=
 =?us-ascii?Q?7E9Q9tRFRBbwl5TjnjYcl15Rws64AUVphUEZj+TLI2mMX+5Up6crT3KjsKqn?=
 =?us-ascii?Q?ERIPQPaBk8aDVDzaJDDmIE7t77yQ43Pfi2mHEV3Tac8bozXuEoE5rueY5SIs?=
 =?us-ascii?Q?dP9Gn1BFK0IkU3LimuxtTa+BLBJPcZgv/RPyelS5c4MYwpHKmIbsau1EEr9Q?=
 =?us-ascii?Q?TejAvBtKl4OvC0GuBgf16HeEN3N0NRmwOIGA3BPoK5ICjAgelDCWmHhRjed7?=
 =?us-ascii?Q?DDzO4Fj1+M5Sww3MrCGVTG6Zc3c4lJZvNf0e4xcU7Nix4WB17fCjpPFI09Q7?=
 =?us-ascii?Q?qqsBvS+UareP/aSBsnX6fHMkkGzdLFtai9k0wWxcg0UD7bqseFVk3vtzfs9t?=
 =?us-ascii?Q?A/+Epd2mwE6EvSj0WdiR5kmuCIR+Ok6M4ibnprWfQwiMMxJsB5n5YjUqUlzU?=
 =?us-ascii?Q?w9VigDmtdb4IdMQMUsbWsWs7sq6lfuVxrF5nJ4FoipHnmHQnXIjrdiBeo4jI?=
 =?us-ascii?Q?X/rI6FI/B1amtzAr2yRB28ggVs2mOKcODmJ7E5B8F41In1hbXoL71eGAv8HT?=
 =?us-ascii?Q?CKr0owakgC6LyZSc2XJlPpxG2ycMJPLAwN5OeBF1D4VJR19WRE7PibFpjK5J?=
 =?us-ascii?Q?2hmw9NW2v43NAVm8GYH0SRXrXXRPpkhs46JdMMle7Hbx3U1v/p4kKbmOUVxN?=
 =?us-ascii?Q?ZxXlBdHhYMu3GJD+7r1hjZCq1VcH3skWQ79tW4w2D8z+5AZQIRTKcYWspGnv?=
 =?us-ascii?Q?Q3Qa9ETqCnvo5tISbRK1lsYf8qQWhFs4X7VRs8hon/4flrmElLRmNb6/I4cZ?=
 =?us-ascii?Q?rbR2eZmtFAD1lvxI7F5DnrHN7yvNMxA3zh3OCPzSXNhFEvsbQiKAnxwM3w6G?=
 =?us-ascii?Q?QbH22t5DMEiznwN8kiEQ+Or+KXQRiZ3E/T7RxjgQO0+/wkq7qMNa+vsQmbER?=
 =?us-ascii?Q?LHar2smbycLGfFVQvosB+rw6nn25BoneLNXfUW/jnGMB7X48WheUQt3ZQvQa?=
 =?us-ascii?Q?E60TWYV6CQo0QGTGr/BPxXhFbp1Q2LbwobhsgMHbRyKSo5jO7jRlFGlrzfC/?=
 =?us-ascii?Q?5DEPs2OQvI8FJzeSfzS/4Ev2q2aiR/PbTszooRvUVB5deY0T4WPBUGGCwavd?=
 =?us-ascii?Q?cfV1CaAi5J8WjOatmic8Z0wr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d0fe35-048f-413b-2827-08d968c11913
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 18:41:21.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BC5UN6BrwQE6gCJ+cC2wXs4RIKHlIfAWcdD+aKMqxcePzYd07w+egbzK0XdSJ1LTGAwahKqq/mK4zFnspC1J7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend existing code to cover more missing client APUs.  Some logic changes
and failure handling will make this more scalable for other future APUs as
well.

Mario Limonciello (6):
  hwmon: (k10temp): Add additional missing Zen2 and Zen3 APUs
  x86/amd_nb: Rename PCI_DEVICE_ID_AMD_19H_DF_F3 to match specific model
  hwmon: (k10temp): Rework the temperature offset calculation
  hwmon: (k10temp): Show errors failing to read
  hwmon: (k10temp): Don't show Tdie for all Zen/Zen2/Zen3 CPU/APU
  hwmon: (k10temp): Add support for yellow carp

 arch/x86/kernel/amd_nb.c |  7 ++++++-
 drivers/hwmon/k10temp.c  | 44 ++++++++++++++++++++++++++++------------
 include/linux/pci_ids.h  |  3 ++-
 3 files changed, 39 insertions(+), 15 deletions(-)

-- 
2.25.1

