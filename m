Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592A8C43470
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 14:18:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 352696024A
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 14:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhDHOSy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Apr 2021 10:18:54 -0400
Received: from mail-dm6nam12on2046.outbound.protection.outlook.com ([40.107.243.46]:43105
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231779AbhDHOSI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Apr 2021 10:18:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpVBhNye8QSQc+CWJIZqj+uuZti9FUc/u36Adv2JGWEKl4xN0OZ3Ok5XaAFvlkliPy9SKxEF4Ubzx4LUkDxY2e8sRDlX6JCWqEqSRBb+wuOR49cAFGmBmVV2o2UqQbAZ2kYi3003+PocGnegCmOveLPQBTGX+UICX5SAdIjMppWM3cOgHMpClsQZmLA4uYvt5j/DnhhgANsqblTsruy9nJjZYNMGVbm5bUimiz7WaRI6UP+Ypxg2dTvdQBNjSGfeJ52HZTT7fc5+D32oev81r/GaxpqOG2Q2Liz1rMV6mCNtZcbaowRJihvE6+gnd5fzPHsLbPDF9kMc/sf5wHX1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fnow1vugbnJ00MyGOTN9e+ESrKBcq9CXV2FZ9KKQs3I=;
 b=TW3+QpScl5XDgCMnISrYP/6AO94qd/GlS3RhOUrmeZZG45+Q4iC2k53rMLW7TKdaF9lxbuObqq3vsw/DpiIhnq1vi6j1IJDIswKmwoxKaq8Za/2OSIFYP+Ls/ulFTYvWZ1gM4LX8GY/Pvx8Dci9rOqMNEVLB5cKfNN76IwVTVOox5v4aW0mmzRgab5jAc/hKlVKZi1yZePwsxa9M5jprr78vLv529ILr2FypTrrHWcWIKYnZjKEKJT0IytYa6xhwxDWRAWUT/lb7uMaeaRoigiN9eiESELYa75gVYHkxSQIJmRtqsaP3DZIPFK7bV1KjzeSWLCQDez2X6E6+wbOCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fnow1vugbnJ00MyGOTN9e+ESrKBcq9CXV2FZ9KKQs3I=;
 b=AiYDthlAGXhBWlhBF+Rgii37OCweV3IzFe1tveBwPaC8X8kIyx91HNt2F7YGeBYD2bryRmZwQF/V7EjY9MbSV8kGBS4XD+w8YarkCJBSmvd9fVwL4hAz3y+U8MFKGhv+XIzjbX3fCxvOOFoE3hNCxdQyBbZbri7GZX8uL2Jy8hr3OvIzoLGYLZsOQXMpUTItIBB4kiQK33V+QiimxYatBpNvmFkU4uAANSQRArHTj6pqeEpJsYfDY6v6m99m3m3InVVcsryo2B0P4fRswL1LohZAhp5M6k7YU19wP8WEKA0Sx1GNI16P8OvNWYKgcHYmjDZMA0Cz1LChaUV0qYsIpQ==
Received: from BN9PR03CA0228.namprd03.prod.outlook.com (2603:10b6:408:f8::23)
 by MN2PR12MB4063.namprd12.prod.outlook.com (2603:10b6:208:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 8 Apr
 2021 14:17:56 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::2c) by BN9PR03CA0228.outlook.office365.com
 (2603:10b6:408:f8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 8 Apr 2021 14:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 14:17:55 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 14:17:53 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 3/3] dt-bindings: Add MP2888 voltage regulator device
Date:   Thu, 8 Apr 2021 17:17:26 +0300
Message-ID: <20210408141726.2561683-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210408141726.2561683-1-vadimp@nvidia.com>
References: <20210408141726.2561683-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21d18261-b869-4177-0f38-08d8fa991ad8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4063:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4063E4B2663277F3F13E364CAF749@MN2PR12MB4063.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BGYlETkc27+8+lZGGQDLsW6w8OFh/iqPaFiYkruO9pi9CHqVofPW5aC244pI+pxzc+bqJhNf+kH+QcXhA6MqhuMZ8yTEJNatYW1e/8J7k3yFMGaoMjvDIUzlw4/CKWf6Vt/Ew7mEzIkoZbVCUktzDgYw/G10kB9F74ffQzOxb19DzdLDFhYziPq1hSKbJ04ew4f9P3RPM54MZQQCNnwo5XwbfByWNrml2XFzwWzLKSBjffeC2R2LIBAGf8FdSK1yVMQWHpl9PEI8SdO/OF/EILtj1rEyRFxGhPqbSmC7WzXLPBLgVVCA5VradVauqi9BPu6HQT+S6zgnNuwnyVamM6rNTU6IQMHxvslo7QO2MW6TSHovHpqRSWfFe2Hmzf8lQmeIsmY1qe8DDz15Ba8F089q7KAFpnXWsvnELoVeWGAQBAv9ip6PaxnGI15XXXJubjxkLcDHuhHcezmf4mWokX5hIPxhNgNkVmHGtLHa8IeSAy58xnN4YbF6vglLDUt2REyTdtTc4F2hU7x8n86/TsIByBp4JRYKF3kUcGf7qWbQb79MkrBf2cM5/H64sdBOMI++4WTidSjYHASusK3fOmnmpkOGPFv79iAnwnvU9vX2mu5MFGP8T5RVZr/18vJr/eTyvZnTK3/jzyhh/Upj87oJpZKBRdWIpjctZJ9ixc=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(46966006)(86362001)(2906002)(6666004)(82740400003)(82310400003)(47076005)(26005)(186003)(36860700001)(70586007)(70206006)(336012)(478600001)(2616005)(1076003)(316002)(7636003)(4744005)(54906003)(110136005)(426003)(36756003)(5660300002)(8936002)(8676002)(4326008)(16526019)(36906005)(107886003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:17:55.8493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d18261-b869-4177-0f38-08d8fa991ad8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4063
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Monolithic Power Systems, Inc. (MPS) dual-loop, digital, multi-phase
controller.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
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

