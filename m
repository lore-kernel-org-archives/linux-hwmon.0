Return-Path: <SRS0=LqIa=7B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B7DC433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 May 2020 15:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54036207D8
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 May 2020 15:50:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="VgS7LlSh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgESPu5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 May 2020 11:50:57 -0400
Received: from mail-bn8nam11on2045.outbound.protection.outlook.com ([40.107.236.45]:6249
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728534AbgESPu4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 May 2020 11:50:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meVTBiq7rAmxWOpXt9BZebjVfdgxBvXORXyAWS6XR73d0NeCIVjp6l/AuHkIVm52BpTIFP+Xtxy+5PnkR2t1XdqzsE37dsdYjFBkqBLKK/dLidzHSw5lrT1Srgk2lgJ1wK07YDhX42Bh9dMCIuM07632ENN8Rb1V2M4V5mwW2C8DzyZhnv23XeGPZM6GLaunhZwHVC5KUXd54AC/t6LUNse+WfbegfhLngPRW41hKYOGHLZ85jo1PO8/lFookD2XxWdzu2ONL4BqRy4r1dX2VQHxOkDOHEZmeaZ3+dxnFd6/g4U5l27V8d0cMU6rpd7iNSm3Ee/CHRvRVU/iPHpsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30uEXZuvaZntmM0ICrbf0KMjruuwpqC5BhSmttMVfgc=;
 b=aFbziVtZ+u//pWmjaek1Q+OEiVE48GxIAzIHVDq6cs9Tsil9R6FlCtzPtGXdCafSZsBdcykWT4Pzyt3Ehu3wFEcWpSAiE0syiPLt/KWeX6DWJlKbJ8B9C5opL6LOGvFJPJ/lgR0Yx4sipEWXHtXJpCh/5e5T1zlf/JG4IjvjtCd/4uIJ2JTiIhNL2amCiHGW4fnqO/ofZK7aKJRUt8yWBh+tngkvSxh/mxEuqPt20zqRxPkek0zFyiet+P50ufHohCfbnKMZ1MspArdAUnH2mja+64AYMobvxvgAdAGunB9pOzOVyidiDJhIYvrnZ3Tj7RhP3bw9NXwtOw/Xt51rug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30uEXZuvaZntmM0ICrbf0KMjruuwpqC5BhSmttMVfgc=;
 b=VgS7LlShyBDK2+sWC4WanHBgzt+RURFs184dKsDizpQslyFTHBH2SxKAAkmdHSy5D3Ucv/AGWvOSgvi0tBTKrDIKLRkqLEvsddvpMqpQ+FZv14qxQyKigPXYl91sCM7x6xRlM5HWkP1e1LTtlNNo/ubgOqNBztwJCrPGFR1U4YE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Tue, 19 May
 2020 15:50:54 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 15:50:54 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/3 v7] hwmon: (amd_energy) Add documentation
Date:   Tue, 19 May 2020 21:20:10 +0530
Message-Id: <20200519155011.56184-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519155011.56184-1-nchatrad@amd.com>
References: <20200519155011.56184-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::12) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Tue, 19 May 2020 15:50:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1f6de98-3f19-4c10-02cb-08d7fc0c6978
X-MS-TrafficTypeDiagnostic: BY5PR12MB4051:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB40511DB836C857254D363EABE8B90@BY5PR12MB4051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85W309MhjtwMhDw/IV9VxW94bh4tkiBlW4bdDUeazvxIbWhm3TmO8g070Sp3OvRGFRrl3SQzMWkjQEZ9rM2e6fVa+6V0cdST4NrUt4V0GcU8rsT5D9+oYKPiHKAoKdhq6HtbVWsuUPRuFnJoXxToDwzYWFXenenO2eLp/yrILNJB79NZQ7CfxfnziSlAaV9ec00LBI6ZVSHdv+iorvCpnP+VgxKiRQg8JBeWlvgYmCreAgLktV6RXDMUh9+wmwLGzoqmqK0KAAI71GpYyq08qqVIqA0xRkPFIyLURz4Jz7HtPLFsEFPuh+mL9OW/DErZUrUslPXdFzfZS4Tx44ewiR/neHXTyV0NLAm/cD1tdxGKneQGHQWOCyi9v7GOkpFiV4s1tbH9/fEDdo8JxAN5DPro6JtNO3N+X8LrtCX3A0B+pl2usNWdREQ+f5tp2mJR4iTKlPvvFwT9rLpC0CU261lFvm/pQhF3a32773SHD1Sq19hIjwJ/1dXAMTwAR6jyuMQyhvCAPSHYR9snX4/qTrYYblZhfI7YZugVHShWlLGkU2aiW6uULKK6ANKDEQJepsw+HdHbO8eSt8coMEUuTvdYYy0G8rHoM+GXyZ0BQkBqKEwLj8Yt24PFk8spdauD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(16526019)(316002)(186003)(2616005)(956004)(26005)(966005)(52116002)(36756003)(1076003)(6916009)(54906003)(4326008)(8936002)(7696005)(5660300002)(66476007)(66946007)(66556008)(2906002)(6486002)(8676002)(6666004)(478600001)(24770200002)(43620500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: SJedrsxKs8UK+svdFbQ+6V8cPJMbahFuelU+2KUB9RgHyF4ALoh+80u2W6hOFPzDGM7g06Er8D7Gj8IKTXnahFSC05l0qkO3rhEjIFdyxrhjmxV7FYwPXCghwV4JGuejzE5JIuLMBolPbzd0k2oLqpXzIPfTLmotDVVBa1LO0+3kzdWeeZ8lqFxWPPzOUvA21v2PIOAvq9w2LQDPa46C9cteMZdsbO3T5kB+9ckNAY9bRqcq7VmRGgQ3yNtVrzbBWe3xKSodZzu+THnTYo4qddNIceSdax6ZaQEIqQ0bRoMdD2AE038K+RAS8bLPX34GoYWajxiOAxJeiURzgvvodCHsxRSuA5pW3FcvfS/y8gcusaNFpLEQP0PSVBRugGGkxsS+fNd+YO+Yyn+2E5QUwgezcmoSgJgBCo1gEWYHciO7LS5urmcU4/hTSTzbAQRlyqQTQRcXC3CNgZsGQbuwEwfiqAMjVn8A/EfCzbaxgem5lgYHwW9QWGtGYlHUj3BE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f6de98-3f19-4c10-02cb-08d7fc0c6978
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 15:50:53.7167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEVQAZ4Qo/oDOtdpHVPUBk+7RE4sXpbXX08McPcJWkEqBhMIj6f5XSNJ7PF8JeM62oFpFlaOmYrjWBmLbcvTuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document amd_energy driver with energy sensors supported by it.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v7:
1. Add a note explaining the siblings behavior 

 Documentation/hwmon/amd_energy.rst | 109 +++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst      |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/hwmon/amd_energy.rst

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
new file mode 100644
index 000000000000..f8288edff664
--- /dev/null
+++ b/Documentation/hwmon/amd_energy.rst
@@ -0,0 +1,109 @@
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
+Note: If SMT is enabled, Linux enumerates all threads as cpus.
+Since, the energy status registers are accessed at core level,
+reading those registers from the sibling threads would result
+in duplicate values. Hence, energy counter entries are not
+populated for the siblings.
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
+scaled value = ((1/2^ESU) * (Raw value) * 1000000UL) in uJoules
+
+Users calculate power for a given domain by calculating
+	dEnergy/dTime for that domain.
+
+Energy accumulation
+--------------------------
+
+Current, Socket energy status register is 32bit, assuming a 240W
+2P system, the register would wrap around in
+
+	2^32*15.3 e-6/240 * 2 = 547.60833024 secs to wrap(~9 mins)
+
+The Core energy register may wrap around after several days.
+
+To improve the wrap around time, a kernel thread is implemented
+to accumulate the socket energy counters and one core energy counter
+per run to a respective 64-bit counter. The kernel thread starts
+running during probe, wakes up every 100secs and stops running
+when driver is removed.
+
+A socket and core energy read would return the current register
+value added to the respective energy accumulator.
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

