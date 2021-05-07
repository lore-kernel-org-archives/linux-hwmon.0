Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF35C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 14:59:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEDE161456
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 14:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237736AbhEGPAU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 11:00:20 -0400
Received: from mail-eopbgr770049.outbound.protection.outlook.com ([40.107.77.49]:28142
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234601AbhEGPAU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 11:00:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSWqMvcGVF32uLRwV8REUwiq/BUy2GcOM5O+iMhJldENk8buJt95+fcQGQ2FTcJ1QerqoESlslaMg/zBz/Ia5R/XxPDi3vreb3RsKpzx/Wqj7nsLAORoyGiNtxYGQ/9mhsE8vbMvfE7VSEaPKfiJ11viksupDy93zAWlu1SIrzD5UtLkjfvVjrw8/iZaEz5MWT1oSmOmzhXyX9zCa4Lr4UIkgxCGXYAUngBN5kw3C+TYzbZrhJB99UuNAQksOfk978UZTeiS0/F1xLJbfJmDX7RiS6NQT8ciIhVTUEGnfkWOCfE5V6fp/sc6++21N6+ujr3ceF80+nzwBhq/yOJANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=Mtwl/O/J08DX1L1+nKnMCEmIMGq1IO5rvEVZH6L1Yzp8lBrZalL8jFWxkl7nYb+TlrBoV/fnEuRD+ebI2J6m8FKPRdmcrn1sqvYkpNvPouJNJ1sk4wedla9shNGIeGQrsFa+Kb8lxZ25jYe22PWiULQRkU9bW1RSZOZHT+vJkaV1cN0657l2htG31IUnsee6LUjhsaE115eEpFqpL1dIC/QxOSifhxEsVCiynGxINSHKsYPCk/yytA5WNEQ3B2JtjeL2pryq1FFbeU+bfJ8khpjT2uKkkqYurvNCeNZcmSwcYJTuL4JbZgYI3+oUc/5O9bUPtI4VLQf6wQfH1mbV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=IYl5cMnE04P0WcGgslIWr3/EBXVryDWC3vE9xzgN/KTc/GECVhLMYgMFWkzyz+9P/NBw+7mRcyhvyVpA1dlnBaMySveuktj6Fh95Y+VT3EFESCQZ8twV6lzESqTJK/rCgIGrfJG+ESUfbiGG53sg7wWAMH9lQLVGlkvnX0YalDDZhlWkRlyOpDaRar9nR+fR+qijRTPtp7pnnAve5DLnO5gzPd1OK03Bz7PuUKkRHBXLLgdxijUuITWvLRPcfkfbGjPPTIJKqPeG3ZypsW5FgCYXJOr35jCuP+P4YpJNZm9WmLIG4UTkoy1uNsJk8I852Y7zIG+HbW+xG38ia5JAWA==
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 BN6PR12MB1923.namprd12.prod.outlook.com (2603:10b6:404:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.28; Fri, 7 May
 2021 14:59:18 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::26) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 7 May 2021 14:59:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 14:59:18 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 14:59:16 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v5 3/3] dt-bindings: Add MP2888 voltage regulator device
Date:   Fri, 7 May 2021 17:58:50 +0300
Message-ID: <20210507145850.420889-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210507145850.420889-1-vadimp@nvidia.com>
References: <20210507145850.420889-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f18d8a30-aecd-49e6-920b-08d91168b063
X-MS-TrafficTypeDiagnostic: BN6PR12MB1923:
X-Microsoft-Antispam-PRVS: <BN6PR12MB19230785C105A00A69C64B7DAF579@BN6PR12MB1923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L92EUCiG7kIInVvsL5rbUY6HEckadI8zHbOdJgg3qdU6ZTPlreY4oAnvEMnk5HojSFh/UNvh3M8kp5ra2B6GShdgFmYHFU/jLvJ13kRoX8eBi9p685UJ5qI5fvf+SqKAfD0fpr1/Ea8xuLHnV2PP+myo7ORtqXvrtqkqyMvqmGEgooLkTvWfRFrkBF2VHaQWI5zS3CaG402dgBu3hWtzAvxrr21QBCAkhr3Ah0yfaX00dbHmxSNjU3SOg71KAFOszIF0DJq9C8c7f2iJlQGZbtY7xwt88YtRMfq93FLFYp7SxLEfgHNqL8ClaUkP+UIn4aT1R7F9t5v4dYGfTEmHFEQrnJw6TYbcxytbHP1/MzUruFBuTvA4Qf3dGnVZm2uNfi3+YY/slxGhFhxnJNMtoYwevXcG7hM7uX1yt7McJ/3ojw2NCVSJ45XFBM7QVnq/MatE6uvTdMFNuHAjZvQ5rXLs5Jn6LI3NBzizBQr6oMXW7SaZpnw3CoAmQduQn8LDdE7mLXw8KTvhae+ppsFYZGIFEplqlY3oB96t6p3lDUfscrzdyIT1Icc/lOLswiPyl+zHWSoaLTbqUvP/EN+nfIctHTl9p1iHdp2C5EA8cW4ruOEYudsnCAyPuynN6g6MNkYJkNxR3nOTcY4L9nobEjI6pS0lfhDNgFn5ai9zivw=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(46966006)(2616005)(4326008)(36860700001)(8676002)(54906003)(5660300002)(36906005)(70206006)(36756003)(8936002)(110136005)(336012)(70586007)(478600001)(186003)(316002)(4744005)(6666004)(1076003)(107886003)(16526019)(86362001)(7636003)(47076005)(2906002)(26005)(356005)(426003)(82740400003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 14:59:18.2172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f18d8a30-aecd-49e6-920b-08d91168b063
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1923
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Monolithic Power Systems, Inc. (MPS) dual-loop, digital, multi-phase
controller.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..4f6d149bfb3f 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -98,6 +98,8 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # Monolithic Power Systems Inc. multi-phase controller mp2888
+          - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
             # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
-- 
2.11.0

