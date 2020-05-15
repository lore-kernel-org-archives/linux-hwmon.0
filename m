Return-Path: <SRS0=MVeP=65=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46146C433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 May 2020 18:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 154BC206D8
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 May 2020 18:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="UFnYWvNY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgEOSxB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 May 2020 14:53:01 -0400
Received: from mail-eopbgr700061.outbound.protection.outlook.com ([40.107.70.61]:23904
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726144AbgEOSxB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 May 2020 14:53:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjnTFaehwPo/12rGEFp39pDUH8FUOv4DZVXZ9Y3uuYB8QcIfmO2Kg2/Zir14ZdOq5nBtvAPrSnWyqpU/J48jTmXxKALFbr8u9oJFPptr1jWHa2qoHU5JkErPriZ1lfGFZXKzKtQ1HXGSaFvbAJpucw7HWk/eUXdCnFCAJX/deBDtGBYf6+KOTugW2Q6YxnlLvVnQhDRWbk7/BieOEacHYZUay2qCXXwsdWuQV8TAuK0uusQ/sFLeX+5f/YiWwwH1THKhWy5Rtf7jD8Z5jWAX8g9hJ/A+uxa/p+BMjRaIXcFht4Cn6JP9OJsZGPNIGLAes0xatV4KQPQmk6jTSyufSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb8cIk+3E8YbhwNG2ftK6AU63vjk07+cDbSEsuJ4mfg=;
 b=BNJKsBdMpoigwWtWHnjGBgp0ZBFZt1LLV2jWFZd8bF2Xm4cU/dv6nfBllnU7QtqS2BCSlJTRFThH0SA/DwYY9H9qDJp4fGxYvco+dJQOlOz8n8Zg76oly7zjNfysAeK7rYTRADNRT3N66SrRRHUKtQo48piI+EC4zfQ3Is4ZHWnnAGMXbdtsokQ5bH45S89VukEktKThIFUlCG07ulN1uL7TEETwxhIw9aYueHEnYe3o1pSH4tOWEQOFx0MbDohdrqLUTtu9vzVR9HCQM0R9tre2PaUDkMT2TqidpiE8JfIdpdRImwlh/scK0sFZ6r3gkxBqOSBJEhx8yML5867VHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb8cIk+3E8YbhwNG2ftK6AU63vjk07+cDbSEsuJ4mfg=;
 b=UFnYWvNYCtUnJI2Qtp4l/nres2XspKz+U5MrHFzbfCrMJ+1Evr7wkeS4tsouY7620qsVQxLYWDIRV2zZJtC0VqhOXEDajp80O+TipkT7OJHSFJmpI+Bn44NUYHNf79XsY7XocKsSr/pNs4IoBmGVG5ES6KU43mI2tVERrHiMaAg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3860.namprd12.prod.outlook.com (2603:10b6:a03:1ac::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Fri, 15 May
 2020 18:52:58 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.3000.016; Fri, 15 May 2020
 18:52:58 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/3 v6] hwmon: (amd_energy) Add documentation
Date:   Sat, 16 May 2020 00:22:33 +0530
Message-Id: <20200515185234.30687-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515185234.30687-1-nchatrad@amd.com>
References: <20200515185234.30687-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::20) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR0101CA0034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 18:52:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d6c3325-3a71-4445-3e7b-08d7f9012f5c
X-MS-TrafficTypeDiagnostic: BY5PR12MB3860:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3860DA00D584ACDBD06E5C0CE8BD0@BY5PR12MB3860.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mr9CyKQj73VNog7OjV5NBa81OcqOgZ6LuRh519D5iUTx5v4FbnDJFX8hSlFzPLZH8lAocvclQkdqNVUUx2VKLyeMS8416IRdimqFlWmdlM5r8T4Vz3OhvN6IHCO0UfKh1u9UbzQ1JALLEEpRqt1ajAcOaTRFbiZyvkPNVHEQ8P/lJAm+cFl9c1Uc3C7H9gUaQdfMwMTwdA60DyKYpIwcMLdzbJgAvgkl6R1j4nAAvgyFLV3ZPKhzC6HcaD2ayubZddkUczRmnUw8f8/qMOzZR5W6GDbFkokHdNWOSvvJu9koVjHVpPe2L7Zne5/3brhO+/k99SEaAy2G/eps5Gm/1BeuZxljrFhGWSBp/bOPtYcYWng8xGHmD+Y+vRnMNMCjqKYSiK5XMjY+khHmI2thNb14kMJT8CZaDSezi/LSCQXW3XhrEo6QKrpxs7JjEpfUAAc4Oq4JQevxx873Gqwda8xdZ6XMJJdn3Nm+N4Oo7fCbBWiSUH1NaZE7QFz6L/gu4Awy/Qrkiue7DQjESX8rOwHlPme3mONS3PTrXKQmrSgHWbdyYmMWXsbL4AMORCQJnfVxqQuKe5xCmAX8ujQhV9PbEE9ELOR5SuTvQgU8iUo0xgJKuge0Lr+YX/C1PpJa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(2906002)(36756003)(7696005)(6916009)(478600001)(66946007)(956004)(5660300002)(66556008)(186003)(4326008)(52116002)(1076003)(66476007)(16526019)(2616005)(6486002)(8676002)(8936002)(6666004)(54906003)(26005)(966005)(316002)(24770200002)(43620500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0Z7AScBfq9IhV3Epy6wy8huA6fU2q1/ZCbZfVvLG2qHEhliESbTA8CHcXdwxdT/djiAnjiXdGHXwxqAX73VONsV6jcgbIVt4GhXyNYMuPxLAsrByQZJlkM91ncoPgeatuHMwCar8tQCXNH8aHPllLTJQ7cmvOAp3AqNkLJa8qpZYu3n7evYr7UoZmLTYDWyBjX2x1vxs+MzD2+hk8Sbo3M5firjabSlrDR/m3PiIvax6YxcZ1yVyldhj2VfkxgY2QAwPS26YY+xT0876gGUcGT9oM5Tzs/mdr2QDbDFEP95fKXY+hZ+kOTTm2sFK+Ad49/nDUgDG03fV3LXPEt3wi65FIBgPYhL8MegDEuLlJRnttWZ4SmDuSJNl6loCbhB2h/QafkYJsoeBV9cknjHO7GPH3qpLr7VES1xYVGfWyYJ8AlNCKWSr0aiIG7r7/XHYcWBL/M9pZ1hvveD6rz7mh5rgpwoSkoC7RsE1DbTdaL98q1ovzv0cBwxaidGiXDoO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6c3325-3a71-4445-3e7b-08d7f9012f5c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 18:52:58.3053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/zjvrYJjfkOl4SHfaUcXnPknrZnsTaPpCFv2tMFbcSi565FB4jU2wcLoASh72OMY+eSadxhjOO3onHGUwWJmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3860
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document amd_energy driver with all chips supported by it.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v6:
1. Update energy accumulation section

 Documentation/hwmon/amd_energy.rst | 103 +++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst      |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/hwmon/amd_energy.rst

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
new file mode 100644
index 000000000000..4bf5997db22b
--- /dev/null
+++ b/Documentation/hwmon/amd_energy.rst
@@ -0,0 +1,103 @@
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

