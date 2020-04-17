Return-Path: <SRS0=fRLa=6B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326A8C38A2B
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Apr 2020 19:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ADB320780
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Apr 2020 19:05:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="voGzHGUX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgDQTFX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Apr 2020 15:05:23 -0400
Received: from mail-bn7nam10on2082.outbound.protection.outlook.com ([40.107.92.82]:40225
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727845AbgDQTFX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Apr 2020 15:05:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hj3rHN5hgW1By+WCuhbkB/aEF9jdK6Fdlmx9rZIMKfHrCAE9oik/GhmgKM0VBclODfjPmKwKvjTk99tFBP9dpGOE6jJ6QDhwTHxzqaG4LRHlVsAqTiNI/IbrJOpWBFzE7TaZVepXV80JtOh00k/WxOeH0H6GoH19vIpMbJRWoWeT8slWBNToGwAhvrVpY3Wc2Ad8R+wpdAMaYHfwrmXKl+cHTuRSOvEgp561uULu5cHWQhv6ONyS8o+gCAXeuZ/hfrQfTXFWWuud+2TWLlDR2dK9I9rd0kravvmtpdQqfVUeFr0UHkytl15s+YEnmlMsrPr3mQFCNBRBhsqeiV4EXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jISL0y4o3Du+RxdFEJRo7qctwVyvXwdv4Tb/6l64bEE=;
 b=htuQPVarWWftPtUZhpO38+UOt8b7yi3cF47AUecAaDwBqsaY2ah0n/9VBUlNbnyXpbMMN0xbpxb7WfHqn4PkEECtp03Im/x/7dAfHJog4nyLqtqoOBbBQKhSmAtrIM/DziIj+qgzdYQrrKaG9IguuIpa7nGtunSoPZhRXVahpO/AzX/4+7S1DWQ9+xLriXetXE3BgDREiAYA1Qc3+VChVQ8ySEVTwQUv7BI4sWzgdfYweHVBRwG38P2Mog2eo0hFh6KPxMNpUI1F5s8r19vE2L4OUNcSeH5fYM4c8usEuv5ODFWKX/nNJweG7VjHfv1PliA3gZIyprmaoHDZA5S6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jISL0y4o3Du+RxdFEJRo7qctwVyvXwdv4Tb/6l64bEE=;
 b=voGzHGUXHoGyQQarA+8Kh80XkAoJukzwtPVsrPx1f1fS1FmCXpDLUwBrtqJ9BOQR2UcGo7QfIsLYExjxsxjeP2tWPNI9A2k1qazO+y3GBgE3ejkR6qyAkApwqy869dKU/W/CPqHuU7/rFI8vtF8hz3asciya/3UXT6RQT2R56fU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14)
 by DM6PR12MB2939.namprd12.prod.outlook.com (2603:10b6:5:18b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 17 Apr
 2020 19:05:19 +0000
Received: from DM6PR12MB4219.namprd12.prod.outlook.com
 ([fe80::58f0:5661:ff16:c269]) by DM6PR12MB4219.namprd12.prod.outlook.com
 ([fe80::58f0:5661:ff16:c269%3]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 19:05:19 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/2] hwmon: (amd_energy) Add documentation
Date:   Sat, 18 Apr 2020 00:34:59 +0530
Message-Id: <20200417190459.233179-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417190459.233179-1-nchatrad@amd.com>
References: <20200417190459.233179-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::15) To DM6PR12MB4219.namprd12.prod.outlook.com
 (2603:10b6:5:217::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Fri, 17 Apr 2020 19:05:17 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38c26788-9b7f-456d-7c08-08d7e3024554
X-MS-TrafficTypeDiagnostic: DM6PR12MB2939:|DM6PR12MB2939:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29392627644D9EFB217B0F57E8D90@DM6PR12MB2939.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0376ECF4DD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4219.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(5660300002)(2906002)(6916009)(1076003)(6666004)(36756003)(6486002)(8936002)(54906003)(316002)(8676002)(4326008)(478600001)(81156014)(16526019)(7696005)(52116002)(26005)(66476007)(956004)(2616005)(66556008)(66946007)(186003)(966005)(24770200002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hR2Dd6BfDcSxjuCt4Rco+lsCrFJBzHG6wwOQGfgeU0ExgO1VHvrJ0AoESjOr73hfnaQKoRM0xhp+BPqwABTsb+9ndItoyddNCmqYfrGdQSa9/B+YuyMxNjZGZ9FINR8XmYe5pUsiCq+fFk4pqAtG9xQR/KgrqMXSbvm+lrCmAQc5WId709By+PI2uuQwqV6IYb9qpX4yOG7YkYKkzE2LuPGzE7QeK1ydzHsxJHb/X6Z8nZdDrIX3WaT6msDn6b807tJtQAdc3alOMiJ3fYeYsx3g4tGdc+kbr2BKljieoWN/8OpYJfRfVmjAeOWMILyO/GW03J34E/jTjkVp6A24VTWp9jq7aeWgNxMPA1zw6i4Qq1CW5cRn4Vg27GIGuxLIPvBOwL8FZW5t+yW4mq2LXh3T9nzNZ66OkqoMulmO1gGi4lw79lHwzsupDKqK22RZjZjJgbPcCeQQp+BaGYUJqyyXD9TzoJDU8j0mMW+O42mb8MiFZGg27hUDKgxwe702Wi/gmSd0GpQBJKpgQh4UYq3Ko8j/cMc+MipSPTh86CgiOEULxuIlneXAuIOV9ZFYVaEX9l5LJ0m/xp1QugHHw==
X-MS-Exchange-AntiSpam-MessageData: lN0PjLyInk1LIVgiCNKG7hz5X/a5IkNcbtdB1+7ifbR+t0YJY+RSLN75qfndsdrtlV4jj2Kjf6W8FShDP6Y8Pl/S2oOn4vnSTP6SqfJnEtiYRTlc1sEKTrLp52hPLDA11kGW74O3wcJ6axZ0sgNykw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c26788-9b7f-456d-7c08-08d7e3024554
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 19:05:18.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daud5GYmxvsD1gxzMEZyFJHjUj/+5hV9p9OQuzWTiHSN8dic1vLGGh7gMR5LVFN6zgN1kPec1b8eg84lLDGGCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2939
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document amd_energy driver with all chips supported by it.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 Documentation/hwmon/amd_energy.rst | 83 ++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst      |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 Documentation/hwmon/amd_energy.rst

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
new file mode 100644
index 000000000000..3bd5855b4a6b
--- /dev/null
+++ b/Documentation/hwmon/amd_energy.rst
@@ -0,0 +1,83 @@
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
+  * MSR_RAPL_POWER_UNIT/ C001_0299:
+    -> shared with all cores in the socket
+
+2. Energy consumed by each Core
+  * MSR_CORE_ENERGY_STATUS/ C001_029A:
+    -> 32-bitRO, Accumulator, core-level power reporting
+
+3. Energy consumed by Socket
+  * MSR_PACKAGE_ENERGY_STATUS/ C001_029B:
+    -> 32-bitRO, Accumulator, socket-level power reporting,
+    -> shared with all cores in socket
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
+
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

