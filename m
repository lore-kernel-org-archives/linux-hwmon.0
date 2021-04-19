Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B47C433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 13:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC5806113C
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 13:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238235AbhDSND1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Apr 2021 09:03:27 -0400
Received: from mail-mw2nam12on2044.outbound.protection.outlook.com ([40.107.244.44]:46656
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237827AbhDSNDZ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Apr 2021 09:03:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpBNTMq3zEqoDq03pi+4STMdSBmWuJvtgpCvOR5KPLnQv8ZIe+yWciC5H994AFa5VqtBNs3n8Kakab662l0N1AV95p78aSDycuUCI0gbKW9Hg1KupC1rBVM7H9GkobUMQlhE8BLaW0ZZK9u1zbWscqqQD7pTti6/GEAs4rcWxi/GBn/5i0sPu9ZZaj6tZ/qWT3v8672HO8FbaPouvYGigZHjDe7t1E8jZloJq8XgrlY8mxIeHUProeC72r92hBB3J5X5oQRXL6yDBVCso96N9AramsiJS0HCXvkFrWbDqC2NApQNGy9c72k5GmRHIdcic3i3dAk3iM44xP6tY6Xdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=e5xToTClhcrVHliSc9IKVKd3iV1YC2t/U/zv5PqR8XNDihbjaIUIa0byx61DpR1pFNcjDkl7M3bZIc8rtS7Xlldu08jtDRYHw3rBGsjzOVvyaHvyHNE+3F0jUb1f4wOHOP9KKOdqIr04kItswCjgZ7lkVfwXKblVXAYI19eEy4sCQnH+RFPf6at7YEjGoFe2s9uCSaHeKjK0djcbuH4pJezyT2uxHXdeJKTnq/lTaFAjxqXdt1k9ersg/nqmzr5Xm3F2uHKrH9ynYyO3skk5oLhb/RdvtlH1O8JJ92/Ffd7a37XVBwiAJNCsKY4M5HKjNTKDo0GBxTr2ZXow/CYJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=gn9dPeXd2jeiFuzcWA55BKLlDZs4iYXpiOf9+pvhVApmJcJSTIHEirSmaTc66UjZchdGYLk37xkqIPfYMAu4QLQrwTjieZGAuAg12IsVIcHVZyHsEp8SMLeKGSaXN7CFScGvP/BvM6TqgdmLm/ShsTwdA0lGw70hcKQvPnkr/2my0hGxeQGMXYx0x2nKQKyRamQWKsKL+iFM1zu3pfPdNdbhj5mcTNCYPPANrm584UJoMV0QZlagGjjL/RpznNCGg1PgUaJN0uTGD9EUiFaf6MAEE5JojqGtfERagHf5w/OGQVCRPRPBfDgwaQmNkxwm9CtCpScXLftEzENdIhsnbw==
Received: from MW4PR03CA0048.namprd03.prod.outlook.com (2603:10b6:303:8e::23)
 by MN2PR12MB2942.namprd12.prod.outlook.com (2603:10b6:208:108::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 13:02:53 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::f7) by MW4PR03CA0048.outlook.office365.com
 (2603:10b6:303:8e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 13:02:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 13:02:53 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 13:02:51 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 3/3] dt-bindings: Add MP2888 voltage regulator device
Date:   Mon, 19 Apr 2021 16:02:21 +0300
Message-ID: <20210419130221.3878289-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210419130221.3878289-1-vadimp@nvidia.com>
References: <20210419130221.3878289-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e7b2d10-f561-41b6-8140-08d903337174
X-MS-TrafficTypeDiagnostic: MN2PR12MB2942:
X-Microsoft-Antispam-PRVS: <MN2PR12MB29422420B043F18BFFCA2A96AF499@MN2PR12MB2942.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fa5+ufw4u+akOjsgTnIXYHBwXRVqZoTDntoqaoHQ9PWoEHjkwU9n+dPUVBePN2rAM5eq6gcw4Y14FDaRqSf505Tm7mzjsXbWcZlJC/WxcTdNREDRNbq8BFHiAXROFiTR1dm1THiun45f7TkuxjH5l7GTvnRl6uNhaTjvoa+e/chQqF0w5mijQ2TglAycRNx6xio1nwXvITjfg+2ubFhfmG6IFri7MTj03kXN5VJ/ho5+xhEZ7zeNOAHqTmlct0TGwASqUPJstZ5bh6a986EAlW58SWAZXNrrkZTpFXsezstOIK+/op5F1hNzWYlWiltx6bmQGFhqCUSCTgyyYkqLwAG1S73JhD2jSjS0Akp+7umgjJlHpEdLbQNBfg9+dIgX5ucY0fTQMXwbOqnN+XUGqRhL1InvEiMfjo9C14PcbS2DKbMbaPmvZI/JYaXfjR99yo2dZcxMwp2DxkfaQW8iio6FXH+vpNLLLhasVKpdPw76HD2WPyZWiLI8igWIu+9az/j3eISDJ+RB1Mpg82z8Xw1elDKSr0ttISzomdFOVii/Q8EkcxYq2IYAzB0dPoAVksPIfG+lqyA153F3DQGuundpKsC2rwoErU7WbdwDa/BcqyPWkUb9BclIhN3mDPp6FaIetBvifikj7Aa334ruMIDVx/2Q34CTn0PFhV0OnDc=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(82310400003)(4744005)(36860700001)(1076003)(2616005)(26005)(86362001)(36756003)(107886003)(2906002)(426003)(47076005)(336012)(54906003)(478600001)(316002)(5660300002)(356005)(6666004)(82740400003)(7636003)(4326008)(110136005)(16526019)(70206006)(8936002)(8676002)(36906005)(186003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 13:02:53.0152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7b2d10-f561-41b6-8140-08d903337174
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2942
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

