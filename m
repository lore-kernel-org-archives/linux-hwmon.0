Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80A3C43617
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 05:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A285B61930
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 05:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhEKF5z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 May 2021 01:57:55 -0400
Received: from mail-dm6nam12on2042.outbound.protection.outlook.com ([40.107.243.42]:34400
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230160AbhEKF5y (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 May 2021 01:57:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk53qE4Slf2JYt3Cm9kXDIe0bzE7jGKSzyrWcUoKA1f6Dv8L3jwKj5yBZmuL+LGgAgPgg5zYEs/uEc41nQhLoJN9UP7GYOhLi2Ao81K/WIbn+SgSuxmhly0dbd2RzJtTLwpVetgh4uly4XRvM8vbygydOzwZkE98TBf75JaTXSweK7FQ46GuXKlJ6rNaybMbERpaTf2zYW2hcHhcNLnAUTMHvSocWvZqEVG7xRHCzBVDa/TpF5pxiZ4JtRJUm8SC6l0mh79FTRl7RYgYS6whrZ7sQftk/rkLbIHYkt89HCEHRimRTMOUfFyNccVchV1LKVV9r73ssTatXlF0oCR2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=gIDGg1F7MrmU5xACRxVDpPKIwZP0g8nZ8DLTdjNtB/Vn6ivKbqEll0MCX4+QFsVwbxQVCR4E/vbOU9zhOVRMiDKu4GlR3yXTGLL50JnFcGz66xKW1coDB+r+rlxVECxZtqmEy/T5YearexPCcspPteGGyn607zEpFg0ZsI3BzPeOgnlyGS4fPmRAlCRQqkZeXcu7tMad/2Ogy6nDQF42DiJVPGx/BaXUIwAVu6mqc1nvpRGYvTftprKctp66lNTIKOUEUyNjKDzg/Fme72TMAvYsq8wus9kad4WVhHIUBZvHaQK+JlyHRmJtpm8LMzVaqtih/ve16qKucQJGbC5ycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=sBBxnrV4189Nvm0c3T9sg1b1BUJpuJ18SUSn08TWY0qSjKlMAQ4WlGfWOhVfTeSlxg+87OYxKxl4qAOIcQZ9J4bmll7O8BAiHjrFyy26VUwtD0VBTwJ4E4Y+2Keyrujjm9mKH3Wtlg1GaBhULPllt9tErg2KeuZN0SC3nzFxT3IYRy+VPrIQlgPF1yi6QaM6Y0Qu1d9IRHNHfpIhNwFhmhzb9WBkDrUmcD/UEw0ThDOTZDDuAS22Jp71w8s6n4t+cJolm87NDiQDSReai7iol8S9VKvn4SUZp+YiFK1GqP/D5/dB/xlxHhcfEHFd6BPzVrBwPAZiBv1kZaSxdfRHag==
Received: from DM6PR07CA0102.namprd07.prod.outlook.com (2603:10b6:5:337::35)
 by BL0PR12MB2819.namprd12.prod.outlook.com (2603:10b6:208:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 05:56:47 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::6c) by DM6PR07CA0102.outlook.office365.com
 (2603:10b6:5:337::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 11 May 2021 05:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 05:56:47 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 05:56:45 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v7 3/3] dt-bindings: Add MP2888 voltage regulator device
Date:   Tue, 11 May 2021 08:56:19 +0300
Message-ID: <20210511055619.118104-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511055619.118104-1-vadimp@nvidia.com>
References: <20210511055619.118104-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f436df8f-7832-4fba-726c-08d914419064
X-MS-TrafficTypeDiagnostic: BL0PR12MB2819:
X-Microsoft-Antispam-PRVS: <BL0PR12MB28192600D1D4AE81FFB5BB91AF539@BL0PR12MB2819.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWnE1a7vLOvS0ymgqAX/BNG5DaHJ2nFmLNTSkXsuFPz9dHtWeJMjJdzPLZTwAvnpRCNwtAQCiwJivTq9Dn1xp+D0zUP2FdFlnXWgF3B5tbi9AGdUMz3UBfLSRVClDsDQjyhA3JhTf3FSt5kvgKOD3roqZuUtx5Y3+yltXBqu2tk1XNMFs8tLPwk7ngFYJ8cKdjo+RG38ZtCpxCFTeTGX25EuWuT2FS/eaN1Dmhn/H+cap2Kx2Xlar2/HvybQu2Pk6EOtYhCs8/IQN8nOr43LISM32pqEOnmyyVMx1JQdmgczOndZdT2dw9Dbz2NjZCZQVeHW8uwVPaw6LtRGfG3rjWc+Bgix6mh7EOaIUVVgcjZ7sAL/+szmIAu4rhTU2Ie/Tvr4B5C/nAvnZmXafJ21JzkmV9UNGG6wlOlINBkH30S1ZfgFTm3Yoco6lOFrPgU+2IBMWvHB46cDU0WabnTFs3LWmybu1GMR4/9Zkl2t0ObH2VMRytYI2Jx0DYExdheOCZyiF3/LpNjuq/oV3eM/wywadA+vbm8YD3TcgPFm5Ak/Az0ecNDZWZKwPmtM292gOcx3+wFsPZ4vg04YmPK0iivw9llDxoVz3cOI4ECCRIHKzJiJdcWwlovK7DtzR7TnHRE8UgeEEKB9/6Vm9oDZDIyxQPXpGx5DjslihTGCZ3w=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(46966006)(82740400003)(16526019)(186003)(47076005)(36756003)(5660300002)(86362001)(54906003)(6666004)(478600001)(36906005)(110136005)(26005)(1076003)(82310400003)(8936002)(2906002)(8676002)(4744005)(426003)(70206006)(70586007)(316002)(36860700001)(356005)(336012)(7636003)(2616005)(107886003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 05:56:47.5778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f436df8f-7832-4fba-726c-08d914419064
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2819
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

