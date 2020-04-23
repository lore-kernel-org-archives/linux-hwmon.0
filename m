Return-Path: <SRS0=tzLi=6H=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E71FC54FCB
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 17:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C49B2076C
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 17:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="zkjyPm+l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729963AbgDWRus (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Apr 2020 13:50:48 -0400
Received: from mail-dm6nam10on2042.outbound.protection.outlook.com ([40.107.93.42]:4448
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729889AbgDWRur (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 13:50:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErNn0a0vLFZcT5mbaxIYlKHEuoXNs4rJINIALVdxbwOJUh6t7sDqUk3VULEoSUMggusTmcVwLBTWcO26cezmRf+UQ+7se4FjcfqrntFZ/TNTpWP7KJ788J4q3Kp46dUjz1P5dn25VukDfdf93hzmNaVDddbXnCiCrAkSeA2oBif6BsBVkjjOMK54Cz4zLoOMj9fUbNMaq7zXhdbsOSzAXo5vuwFfSdzKXi2wDNbZ5sYRQr18ZZ0TaZrYGFIO0YS0ejHO0bHWi+Kb+SxtjrTFVjuyFe42KB7ZWXzzDUluW/20BrIX/Q16nZbA1tRM4NijKTKej7RaD7J7TIqGduIV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7y++xcL7YcMP1J2QMa6BblzKAcHnK379/R5Ke+USxs=;
 b=iXlRO8uS/jkWd7RnH3CYvGR3SRFFhzOiez2lYOoaOptDQfGtSicanLNjE4ib8UQvJEH7gNGMkYyXwUuRSsxg+Cl4OiUwgj/2SZY1N1bhrN7z0MlhyzQtJnLA/iyQeQTGzf8uPMoESSSIwD5OYFVJixJFJfnnYjs+YXgyCazW+2vp+ipyjJ8xAbCiXXKOyLqmMHTDFDlrNQeP07VQdotMdkJCS142mVoM+86sQGEicDHE3G9iHxDXLUozeKF/wn0XDDnVGQN/WF6lJqJtrOOSLzq2Y8/R8vBqHot8l5vsvxAAAW3t8AGqsN7VKb07laCvN4qxNRgTHfcnlARqyz7frg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7y++xcL7YcMP1J2QMa6BblzKAcHnK379/R5Ke+USxs=;
 b=zkjyPm+l6c+rF1P7sc/0fIJZW7SfRjIZCqkmE68UCeuJ0m/8AXomxZNbdQPszkIwN0ANg0sxfqvWu8VrIlHKAL6Vo8Jxkczj2v5S5PhvWlAuh/r0el/L3jXH1TOWQxCPXxWy2aOqomuPleAQyYw4Cik2rx9iOQgOCS2A3oLaVec=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.26; Thu, 23 Apr
 2020 17:50:45 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 17:50:45 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 2/3] hwmon: (amd_energy) Add documentation
Date:   Thu, 23 Apr 2020 23:20:04 +0530
Message-Id: <20200423175005.9072-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423175005.9072-1-nchatrad@amd.com>
References: <20200423175005.9072-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR01CA0090.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Thu, 23 Apr 2020 17:50:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0572d422-dd5f-4ce5-107b-08d7e7aed926
X-MS-TrafficTypeDiagnostic: BY5PR12MB4049:|BY5PR12MB4049:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB40496701462560E99DA1BADEE8D30@BY5PR12MB4049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03827AF76E
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(966005)(16526019)(81156014)(54906003)(2616005)(66946007)(956004)(478600001)(4326008)(6666004)(8676002)(8936002)(1076003)(26005)(2906002)(7696005)(52116002)(316002)(6916009)(186003)(5660300002)(36756003)(66556008)(6486002)(66476007)(24770200002)(43620500001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Qm1OB3tg1kH3cb0/ubw+c7+0G2BiZQqaRQ5dm6OTXM6xt7/Jyu3f7g+tTPdURTRqC90Ecf6HDfCHf0xdmszS5xknA1qgmQtgU1Nmt6zRLwwyWjMMG6k6gm5wy9hCAfEJFHBFJhsuOGeMngWY479L1+t0AUcWtDyaKKsEmuHTzJN/WtD893hcSHJErDOj+hjwEMvsx8RCcU7SC7/9mPTR0/PQWml/G7v4662lnl6UW+Xq0aetFI0cTrcOs2tV9irifYyiRkHgjHWbdy7VKGUynQaja42UxvopGdKU/GHO4lC0Ft4MUrlZRB2o8dMJx40Ga48QduhLq9S1gTcf0xO7RAvZAKN0OtClFO3IzbShzlA280Kt009BfHqYywmaG/LyhU/fW3HaflQn+SjaIfDxsy8D8zQYBOmwM9HbmhQmlxF3DD8vgD20BPqS0/zgXbVIiQEfQOw+qjefjYEBoAXUF4zCCYiF65kDIze870eT/Rrry6kT4jaOB5crFWwOTeWIGNd+UefzHiLTWIwx2K3OtDgwHsjec++6Pi5i2cWQLDwSeU8/MurUTLNMwps4ueIpEDVAtjRoNQnujDcF6e8sXh1qtelkWPwQzpOcLewMl6LFPbA/zMpdCnDmJy3h/Ji
X-MS-Exchange-AntiSpam-MessageData: QS9hNZ80hzmMGn41E4tl1medpQXAvDd3fyFpnHdWwZJXUOFkcD51DBAgIe++/7b5hPhBcyGKBiZCXnJ5ahKnaWFZ/Hs2GH2ylWN8uIugQ54k/tI0byruquWsSlPwPlJVNGzpXd9CSp0yT15yNXO5CA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0572d422-dd5f-4ce5-107b-08d7e7aed926
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 17:50:45.1343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spd/nPLZJ42RWPi76ms6hUH5JaR5iciqFkCChfoL1WGHxirCkBLY8JWywUEfeorr0Pzt92ehvzzCHBoQhj0CuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document amd_energy driver with all chips supported by it.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v3: Added SPDX license tag

 Documentation/hwmon/amd_energy.rst | 84 ++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst      |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/hwmon/amd_energy.rst

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
new file mode 100644
index 000000000000..b5d176deec1d
--- /dev/null
+++ b/Documentation/hwmon/amd_energy.rst
@@ -0,0 +1,84 @@
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
+     shared with all cores in the socket
+
+2. Energy consumed by each Core
+   MSR_CORE_ENERGY_STATUS/ C001_029A:
+     32-bitRO, Accumulator, core-level power reporting
+
+3. Energy consumed by Socket
+   MSR_PACKAGE_ENERGY_STATUS/ C001_029B:
+     32-bitRO, Accumulator, socket-level power reporting,
+     shared with all cores in socket
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

