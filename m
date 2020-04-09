Return-Path: <SRS0=sjJb=5Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEF4C2BB86
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 15:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E28F42074F
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 15:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="n5QBJLLl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbgDIP3E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Apr 2020 11:29:04 -0400
Received: from mail-mw2nam10on2053.outbound.protection.outlook.com ([40.107.94.53]:43200
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728191AbgDIP3D (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 9 Apr 2020 11:29:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL5sSfklqrjvpsy+TNyl0qJKI07jvupY0ryJIlpZQc5C+G+5yblKn+3v3XfDNcpH0eHF3LXo4rzXmRJzBHKiBkf+tS7Je9okQgKwCAeMlhEctRHTAp+XatxezKKZczbnUguuN8xeH4WkJwxA3zg/Mw4hdgZQmRbuYdAmrLEPpicLh0TdMEuPbqXOBwKVvWeNJ1LV3JRgFcfKb1tG1bHhQ87es9oH7hr7+Wg3YUTZRTHAJe7ZSzOZJrWepMRGFAOHOWqNdLOftLRXD4Flr42deuXL6SnQJI6eA7nXgLzeu3YbwAZNFLZPSfB/X1ybQHfdALCf/Tg9nVzYBmvb4a/yzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/gvqdYYDKfsnKoD8kG074sso9YPNG7+j6s3/u0bOOA=;
 b=mGCbIqkW9UtcNU6yDCpAwFXDbG9uLTFUQfV+GfDzIIV9SAtdZs41w56ItCG0Zxqm258TUR1YIGuv02z0JutwjlDTM5tZLOmogQw1XOXYwVwVjLUswtRopj3jVVMRqVF3jz1VRWfuCVhhV8aNxCCHdeGYYNh0N0E1ft0lYMHefdgvmr5LFP4y8dXuZp3UxcggI9sGd0LZ6+SXdHoyXUiNGdc7FvGsASq1vTogHUaABZozG6FbYTq3F004OiY1CPf4iEyJRZMlO7ssf73NoWO0R/GPdndoNL8eloghdBTo8Tq/WoZA+A1AowvO1J+yjIvkxTLwA+8k3vMYN8dMJPojuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/gvqdYYDKfsnKoD8kG074sso9YPNG7+j6s3/u0bOOA=;
 b=n5QBJLLl43rzHuyqlMkhzNgSY2Nx1HaAvhV3Mi3tISOqsABUIWzPe/phrjZIUa1bVlPII179yYfcJOV+Pi6QLfOvNYPIDo6+tcSdVzKinOfyX+Zkqtd9luFijOm4+HYRZ5YKHp1pp/qZ39bhEiL81MjK4kNZwsSnLXaIWq1kPEk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3922.namprd12.prod.outlook.com (2603:10b6:a03:195::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 9 Apr
 2020 15:28:53 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::5d3c:938e:1015:8270]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::5d3c:938e:1015:8270%7]) with mapi id 15.20.2878.021; Thu, 9 Apr 2020
 15:28:53 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (amd_energy) Add documentation
Date:   Thu,  9 Apr 2020 21:09:39 +0530
Message-Id: <20200409153939.38730-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200409153939.38730-1-nchatrad@amd.com>
References: <20200409153939.38730-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from SLES15.amd.com (165.204.156.251) by MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 15:28:51 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3d5816c-140a-4f15-7f22-08d7dc9ab5bd
X-MS-TrafficTypeDiagnostic: BY5PR12MB3922:|BY5PR12MB3922:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB39227C404D3C7AD99FA58292E8C10@BY5PR12MB3922.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(2906002)(956004)(2616005)(16526019)(186003)(478600001)(81156014)(1076003)(4326008)(6666004)(81166007)(6486002)(26005)(5660300002)(6916009)(54906003)(66946007)(66556008)(316002)(7696005)(52116002)(36756003)(8936002)(8676002)(66476007);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IImqRJd9KrScit+mNGpWTcwJVD0v+Dyow8Q0zhsDJiL4bch3LyJcevR4nQGsoI5dTB+MhNFrtnrAQoTn0l7JjTxK0JhYFINskHD7nXfYamVgtieYvWAVKgEC3uJ8KLzHLnvryFwEwma9nNqDzd2v7g1tcLvAnhhZ1G+y82eaNKcgPXN+Yjkn7eDkgOPsR7gDcBoeVC1ZmfJf53Yy+GZWBYhKS4VCVH5pOdxvpGbHELcNnLJK0A3wKD/xOKug1/8xSlCsLZm1oEeeKsDcT2LUPK0TxLoRSXHRduxMXY71q933tjMr0BpS+Eid7ai7OVI+61kwZOwEfotmKkbG2+EK307UpHGpan+j0gfN94wM93/hk6N+Jtndj+8g1H+iRD9CAcSPy68ngxXt/P2EgekJ6b38YfugHdUMQYkVYhHNEAnJcNyja7wvE4Q/aN5DtOHN
X-MS-Exchange-AntiSpam-MessageData: Ppqx9W4IEPmQRpK2FnXBkrrGFq6kPs9XRKFPNzmfWqRcByEvvI1N3Hu/NqWKMsx6ZwK6lUFz4ev3GX4vJY1aJEga0HhND/h5xABkvEagiYI9gJBZgVHr4jhfjn7uG5+3yZeoDLjwj4AV84X1Rt45vg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d5816c-140a-4f15-7f22-08d7dc9ab5bd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 15:28:53.2067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imtmVEmfAEPYHc1HY3rNlNTg6l6xPpTSCoqn8S7Z1osj7DQw9F8VG8YFKNfOyW3P3Iv7+iFB4hKmLpiI+XW5cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3922
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document amd_energy driver with all chips supported by it.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 Documentation/hwmon/amd_energy.rst | 78 ++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst      |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/hwmon/amd_energy.rst

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
new file mode 100644
index 000000000000..516694d3c1e0
--- /dev/null
+++ b/Documentation/hwmon/amd_energy.rst
@@ -0,0 +1,78 @@
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
+  - Processor Programming Reference (PPR) for
+        AMD Family 17h Model 01h, Revision B1 Processors
+  - Preliminary Processor Programming Reference (PPR) for
+        AMD Family 17h Model 31h, Revision B0 Processors
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
+    -> 32-bit(RO), Configured in BIOS
+    -> shared with all cores in the socket
+
+  * A sysfs entry "energy_units" is created to show the
+    [ESU] energy units in joules
+
+2. Energy consumed by each Core
+  * MSR_CORE_ENERGY_STATUS/ C001_029A:
+    -> 32-bitRO, Accumulator, core-level power reporting
+
+  * A sysfs entry "core_energy%d_input" for each core is
+    created to show the core energy counter value.
+
+3. Energy consumed by Socket
+  * MSR_PACKAGE_ENERGY_STATUS/ C001_029B:
+    -> 32-bitRO, Accumulator, socket-level power reporting,
+    -> shared with all cores in socket
+
+  * A sysfs entry "socket_energy%d_input" for each socket
+    is created to show the socket energy counter value.
+
+Energy Caluclation:
+
+Energy information (in Joules) is based on the multiplier,
+1/2^ESU; where ESU is an unsigned integer read from
+MSR_RAPL_POWER_UNIT register. Default value is 10000b,
+indicating energy status unit is 15.3 micro-Joules increment.
+
+These registers are updated every 1ms and cleared on
+reset of the system.
+
+Users calculate power for a given domain by calculating
+	dEnergy/dTime for that domain.
+
+Sysfs attributes
+----------------
+
+======================= =================================
+
+core_energy[N]_input	Measured input core energy
+			[one sysfs entry for each core]
+
+socket_energy[N]_input	Measured input socket energy
+			[one sysfs entry for each socket]
+
+energy_units		ESU Energy Status Units.
+
+======================= ==================================
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
2.16.4

