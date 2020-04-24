Return-Path: <SRS0=OFCL=6I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEDCC5518A
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Apr 2020 03:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A4A22075A
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Apr 2020 03:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="p4U4ORt8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgDXDVX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Apr 2020 23:21:23 -0400
Received: from mail-dm6nam11on2050.outbound.protection.outlook.com ([40.107.223.50]:31073
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbgDXDVW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 23:21:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCRPWQORj6WRMQwYvya1f3Ywc4xD1E7syV3Gt3++Cg2cQVnmNg4NSwbja9tetdNSD/cywSWatZi967BCDU27ZZq2i5L0yCKXwV8d2xQ+FCLJAFeEO/pogHhe5434aHfnfCHtsehcQXY9ViUBQ1sIpGtTBa5dVpzqVjnQm6hBMCxJZ8k1RGf/4X0tS2Md1eKDN+0mSsk5/HS7FAS/Ni7pvKW4aARHFKHJVolu7tkPSvKsndwQsK0SQm1DiXhEtdZZ8JP7u+3+2fpNK4Ds8XJicrvHjOpySC04UXdMi/fpGcKFMLCz8gQ/vDcLLQ0ZZbKroSg9V+zJJCHkk02KZZHi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSR22TUukp1gpG9OuAAIOnzx4NQnGtXa/dd87ozyB5g=;
 b=ATyL2w22j5vLBjq4erVwfNcgsylnI8a8nyRcTp0Wdr5bzQluSpb+VRuiburAWlqmmzKj50F/kCcFRC/PwDoxxzNwc48+vO510MFTH7ZDOvGqSxX+njVZwTytEdCOi7ZTZlJquKxm/zP7FZRzeltY0X6V4j0uqzVJxOlLemOc2owea7Eff13/XP+UfQZ9kooRxcEPTqNMyDMrP35BDpkwGaKuu4TrYEKwbGuW0gRaInzPyhWCvp05k2bf8+6rJhnGhOxW/wbDE1YBD45pIlrJsWqLgy8TYnHN8W9mGdOAK1cxXTvHUErIoB4fECqkxGtAxzXYd8cnOon9E0WFcIOqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSR22TUukp1gpG9OuAAIOnzx4NQnGtXa/dd87ozyB5g=;
 b=p4U4ORt8/k+nRfPY1nrmSI9MajHVOeQSq3oNssZ93YnmokCGuy8sPE700KwlPi9KMhBvirihSOvdEh7GCT/8jPrHghVL6B75dJcLaX/waxNFqQ28yre3sRIKW/XHveNWclSrBzTtNu4nNnwA6OtKhaITa4YMGqFzRExHLnbH9KI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3955.namprd12.prod.outlook.com (2603:10b6:a03:1a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 03:21:20 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 03:21:20 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 2/3] hwmon: (amd_energy) Add documentation
Date:   Fri, 24 Apr 2020 08:50:55 +0530
Message-Id: <20200424032056.16287-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424032056.16287-1-nchatrad@amd.com>
References: <20200424032056.16287-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::23) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 03:21:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dfa6377a-47fe-4c0f-c88e-08d7e7fe8ea4
X-MS-TrafficTypeDiagnostic: BY5PR12MB3955:|BY5PR12MB3955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3955175313D24EE0F25099A6E8D00@BY5PR12MB3955.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(81156014)(956004)(6916009)(66476007)(16526019)(66556008)(1076003)(66946007)(8936002)(8676002)(4326008)(5660300002)(54906003)(2616005)(186003)(26005)(2906002)(36756003)(7696005)(316002)(6666004)(6486002)(52116002)(478600001)(966005)(24770200002)(43620500001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SuhEHeqrLf6gN2eq4r1FjsmpP9P4VtRHFZn7n3kiG7HAaMthU1gyO/ctJ3EzMsi5TpHddZHd4sD51YNhkjDvh9IEd2bfcZy9+aBvAQb/RZLlqcO/kLLf9I1YcO4WnjjC/CaDDspCu8b6IrM1H8davUfxih4jqo8VRDxKuBzmR2EK02+o9lOeuaSZGx2R7xWIEKBj2yd11PMvMTqusMWHddLjEoNasL6AjM00Jb3q5fVVm66OujXsRUEQEjhVsURF9qKtWNPmwHx6auTLBCYmvAI7W6ippuFn8PUtytyZqMAaoIstiMp23MIQwsStXIDgf7rWxXHMXlAjIpEbb5m+9v0cG5wiBrO6pCpledBSUYAoH1ZvOr6ZCI7fLQDQopKxZXHd1qNmFxPrL4NIoTB+rV5mYHbGvvSx+hg8lllxXSYFYTYJQ0Mz/TO3M6wkMJmsGoJ9GE6PnQAfTIjRMC1YTllfgK1Y4izXUVaL54ETzY9VaugzbxEpYkAaFR3WY0zYw+3sc9eHDdNF2sZEePBQMG8n04Q1IXx+1YbBICAGeJL7f7JItFT4l2FF40R9AfyGPwWGNeYmIxgUmRYPPCLzk0Ga6BMfBqC6nt8VXrVwhPsGIbtZruh0guNB8uZp9XD6
X-MS-Exchange-AntiSpam-MessageData: p5CaETY+XmpB56wLNbMIRS87bymYO5H2T3ldk+YZ2VPUbPb4hun9iSAx1ePfa0LNh3sfi1ag7pWan1z6702HKZ/QR3bfkteWFhO9yoaOaP/c6LpZj+Z9uBqx96KvSEUdVBsiu18AWC3RiAQlf2hFhQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa6377a-47fe-4c0f-c88e-08d7e7fe8ea4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 03:21:19.9337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VVI0zPoVXkwk2cY/PE2kTpaOUmAJpIeFi0Z7OSLVzotOLlBMy2D0poBL6H/ll68yibMWK65G2rQKnJAnkbU1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3955
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document amd_energy driver with all chips supported by it.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v4:
None

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

