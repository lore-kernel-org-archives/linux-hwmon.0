Return-Path: <SRS0=GqDx=6P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91F5C4724C
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 May 2020 17:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7D4020857
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 May 2020 17:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="va+Xxuyj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730128AbgEARug (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 1 May 2020 13:50:36 -0400
Received: from mail-eopbgr750077.outbound.protection.outlook.com ([40.107.75.77]:19011
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729393AbgEARuf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 1 May 2020 13:50:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUEUyW3cf/oe4ro/iaron2wGejHE1hNuDwWNLR+2x82QsN7IE3hx6Cs8QDXQ/osxC8cmLPcXLurQXm2k6GaWEd8vcMmzMAqTwHzJQGHo4dQc2MKYk9UTwr/33B1tOQdjl6beDXhLQoNEge6YK5OozFjFyALAEOxN4EY8MdDSmYFcRg1GZaTXcSAqpLX1Z2BW96RKr1UpBlHW4r/CcqtwfcrnZu3AaWRpbp4HtbV3FpuL/FztwOnGcvZKWtk3yEHBsB0W7dqz/vOoxJ36/j9Jt0IRpQViu/6j/ykgyJxyWeuei4f8iozqqkp+pfSSirCKcxv7aC82ZS35XApx7Ix1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwRQevCwsDACLASoOKoSpqaNeHxbZEE7Nxw7OmL2+RU=;
 b=EnQC14OU7rDUfElvFrY0daiWreUoFVK0IL9GLtWoMudW1+XZcz0GjWUiICYhpVMWcgWOcAES5/ZTLfmfJhylVF0jGhChFZ9Y/ti85/HJnIzloIISqhGxJdDPKm6tPNMq3p0V/x49YZ6pon51qXbWuPnAEWYQ/4Gmqrpx4Ma587bWDMG2PahjnsRIKixMB/QvBNNmGfrOG9ogHq0dXgLMW2SPzepeeSGBn3ze7H1jML815w7pZbjZtRT9jwWSHTEJq7vAaw/a8taf839xYxClcGP7DsIg9npzXSEv+x1aXig5kHtVOGsIZf4uuE+5Sh7mC380MYs9waIcsX/2Hr2PCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwRQevCwsDACLASoOKoSpqaNeHxbZEE7Nxw7OmL2+RU=;
 b=va+XxuyjBSfiiDlOzqhGjhj0L3mQuzfgbF/2D53eqM2Yp5xLcdxKt/2cjLQHZfjGfVS31qJ2bGygzsq6QNSIpZ2GYxvf4mpnOVGaHyfTLL8uYxFV9Tt/dR1lEcdgkqwZIxThAEsVoE0oPQqUwKyf2nSjelrP+Lzqy8so+MVwne4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3859.namprd12.prod.outlook.com (2603:10b6:a03:1a8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 17:50:32 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%6]) with mapi id 15.20.2958.020; Fri, 1 May 2020
 17:50:32 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/3] hwmon: (amd_energy) Add documentation
Date:   Fri,  1 May 2020 23:20:02 +0530
Message-Id: <20200501175003.28613-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501175003.28613-1-nchatrad@amd.com>
References: <20200501175003.28613-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend Transport; Fri, 1 May 2020 17:50:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e08a2953-451d-41cb-e736-08d7edf824a4
X-MS-TrafficTypeDiagnostic: BY5PR12MB3859:|BY5PR12MB3859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3859835D26D5F848C2AED6E4E8AB0@BY5PR12MB3859.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WsmMGY5kly7vlj9qyDoKlcJok+sy8t7cizyGPRbhntmYeARat4+dw1Y7Ee/743qU9C1DCogAOmHz0TiVtcBdcuOx6HGGcYNHzS9qdBfBxdlhbLQHgKWZmzSAqsatVk2qbj3BpkVUNAPQaCYG7+25qRKhYj5yDqNewCNtUR+B6awcinxqM/ryjCo56Dts+0rY0AvO8WgKvJx3mYx/ORzlxSFNGXkmeekm4fKIyq9NWONwiTYF2TjETOrm76qLnV1t5le1K5AQqnW38RGrJxyK6XIpUQXszS6IX1TX1V3Zt1rXJ/qvmbiBoIEdaUlumNpqD54aav+/Z0YATKiYqovuBNWny9Wx6lUZ3EB+OkeWDldPRSjI+d+o1RW8LRxOHRPElXTdVEGsVCXyWpp8FUmKrJ99T2bEm9+fWPrHZG7S3Ey/83L0fCT/CzNR+xpvx9EDAz6n9KFha7g4ecoHi+Zvjl3nSaBMAichDwwaX1f7GCW5AtxJrcOGIfCwSwgqH76LVbD1Wfjc+umH0uhFUxfK/UdCKiE5pIS4BdBVm97bJ4B0tgbTyqULaxKcNqtlgBxe46vPuUd9FUcQpviemcYOKyRDfM0HunJK8dk4WWqJ2CyLYrCYy6PplI3zF0FjuPwe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(26005)(8936002)(5660300002)(966005)(478600001)(54906003)(66556008)(66946007)(8676002)(66476007)(956004)(2616005)(316002)(36756003)(6916009)(52116002)(1076003)(7696005)(4326008)(6486002)(2906002)(16526019)(6666004)(186003)(24770200002)(43620500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Kn/5GBrvh6N0T0dsQlesGCkhaaKxSJm5y5zqo7ZLANg3OTObPlyagFkQ36IrECFfnCKbe4K2wobTXPauftSo8n09GiWiVijDn13WSzTzsW4X1nLf67vBk6mbWZ3PFK4Da0SF54Nxje7G6q52VT16k3V1znvVKoVwZgBkq0/9TH9HM5aMM7Hq0JbpTxg1xaOYQbXRX9QItDErA11zL0Txi6AJP3MBbaA9YyzDRL1OFAtTEVOD9GTUK07riozgU/f2LEZap6lvbFDh1teWn9699ltpdE2pK90+9e2ppLRuY4Bh37Al1fFheOPJR1ijgYsr3dRrCFuMwQSUKQoSN8LzJxFbzXYipd/X9yDhrviWHLvPUif7KZ3ABe+Fk8Dl6au1HScBwG8rmOBPoXet+pTkXKZL6vHAFUG/x8c0pdwH+qLYgOeK0ueyqALdWjD4n7GSPOBIBZE5GvyLc0y4l9Jcts+Ttg3AIWCIgVl9yfxI0MH7mLwarSDa06O6ZDQVes69qOyBgvdyQRqlozGO+5nhi7NanejpyJy73vHXDYyDrV7VNmMQjKdDhTy5GWjsT9FT3qFtGLneXkfQPvVrpmReQ4INrRn+MHhXW5w5/B060tFKaUubQfrxbjoYo3YwBhuItP01ghsKYSHUPxTRtXqJ3x44cmAakSgY1BitxATAkbcSgTSVVVhLSywdCTb48Qfi0ji/K9zMQKetEP/bJ+M860B6+AcO1ZVyfAWukCP3Y3oZTYs8d8m78tbRNOmeJ2ZO91to8UtDvZnPtKAD4S1lALZ2Tj3Or3j1h9AykeIyxfsG4oSiuLgG9FklWkehjbfb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08a2953-451d-41cb-e736-08d7edf824a4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 17:50:32.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOwhSJWsbmEyH8YdBkLmSQwQut5mOHM01xKmJuGunjGXtDyQpBAp7ZluMX0kW47S1+W+QFhdLz4QFOTpnUpWWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3859
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document amd_energy driver with all chips supported by it.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v5: None

 Documentation/hwmon/amd_energy.rst | 100 +++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst      |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/hwmon/amd_energy.rst

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
new file mode 100644
index 000000000000..2216c8b13e58
--- /dev/null
+++ b/Documentation/hwmon/amd_energy.rst
@@ -0,0 +1,100 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver amd_energy
+==========================
+
+Supported chips:
+
+* AMD Family 17h Processors
+
+  Prefix: 'amd_energy'
+
+  Addresses used:  RAPL MSRs
+
+  Datasheets:
+
+  - Processor Programming Reference (PPR) for AMD Family 17h Model 01h, Revision B1 Processors
+
+	https://developer.amd.com/wp-content/resources/55570-B1_PUB.zip
+
+  - Preliminary Processor Programming Reference (PPR) for AMD Family 17h Model 31h, Revision B0 Processors
+
+	https://developer.amd.com/wp-content/resources/56176_ppr_Family_17h_Model_71h_B0_pub_Rev_3.06.zip
+
+Author: Naveen Krishna Chatradhi <nchatrad@amd.com>
+
+Description
+-----------
+
+The Energy driver exposes the energy counters that are
+reported via the Running Average Power Limit (RAPL)
+Model-specific Registers (MSRs) via the hardware monitor
+(HWMON) sysfs interface.
+
+1. Power, Energy and Time Units
+   MSR_RAPL_POWER_UNIT/ C001_0299:
+   shared with all cores in the socket
+
+2. Energy consumed by each Core
+   MSR_CORE_ENERGY_STATUS/ C001_029A:
+   32-bitRO, Accumulator, core-level power reporting
+
+3. Energy consumed by Socket
+   MSR_PACKAGE_ENERGY_STATUS/ C001_029B:
+   32-bitRO, Accumulator, socket-level power reporting,
+   shared with all cores in socket
+
+These registers are updated every 1ms and cleared on
+reset of the system.
+
+Energy Caluclation
+------------------
+
+Energy information (in Joules) is based on the multiplier,
+1/2^ESU; where ESU is an unsigned integer read from
+MSR_RAPL_POWER_UNIT register. Default value is 10000b,
+indicating energy status unit is 15.3 micro-Joules increment.
+
+Reported values are scaled as per the formula
+
+scaled value = ((1/2^ESU) * (Raw value) * 1000000UL) in Joules
+
+Users calculate power for a given domain by calculating
+	dEnergy/dTime for that domain.
+
+Socket energy accumulation
+--------------------------
+
+Current Socket energy status register is 32bit, assuming a 240W
+system, the register would wrap around in
+
+	2^32*15.3 e-6/240 = 273.80416512 secs to wrap(~4.5 mins)
+
+To improve the wrap around time, a kernel thread is implemented
+to accumulate the socket energy counter to a 64-bit counter. The
+kernel thread starts running during probe, wakes up at 100secs
+and stops running in remove.
+
+A socket energy read would return the current register value
+added to the respective energy accumulator.
+
+Sysfs attributes
+----------------
+
+=============== ========  =====================================
+Attribute	Label	  Description
+===============	========  =====================================
+
+* For index N between [1] and [nr_cpus]
+
+===============	========  ======================================
+energy[N]_input EcoreX	  Core Energy   X = [0] to [nr_cpus - 1]
+			  Measured input core energy
+===============	========  ======================================
+
+* For N between [nr_cpus] and [nr_cpus + nr_socks]
+
+===============	========  ======================================
+energy[N]_input EsocketX  Socket Energy X = [0] to [nr_socks -1]
+			  Measured input socket energy
+=============== ========  ======================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8ef62fd39787..fc4b89810e67 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -39,6 +39,7 @@ Hardware Monitoring Kernel Drivers
    adt7470
    adt7475
    amc6821
+   amd_energy
    asb100
    asc7621
    aspeed-pwm-tacho
-- 
2.17.1

