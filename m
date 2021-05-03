Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5742EC43460
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 May 2021 20:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A96861041
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 May 2021 20:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhECUsQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 May 2021 16:48:16 -0400
Received: from mail-bn8nam08on2088.outbound.protection.outlook.com ([40.107.100.88]:50309
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229726AbhECUsP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 May 2021 16:48:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGOR+yd5cDmQCKqvBh7BVYz3YWBo7qNVlkrQkJpkqpjSWixAJqH9REQOtgAZJL42lGPptjiKguuGzDFEoN8U5+ky73oOpstKTEggiYFJhgDEHqhKjCpafxhv5ZuAjqaP/43Rd0zgvee28oFgYOSk12F2wbLNjd/2VKfijblqaflk8iOlUDBfMSurS01c+Cb7gwd8o2HvaRxu5kvBbCLcZiv5DBBjEpTrqNUXeS5PGtwNYKdNom+KlJk5D07fTmq57RO+dPtGRbnHaoDwuysfMk7hjdM4HOHBBYu0bcPK+H3dM50B7/NjaIcqQzzKjMc1P2OKFtdA99ks0bZR35WqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=U7lFE3TnbjwGIlG5SWfcMvKrRE4qs1KnAPRn3zag7pexWWvjSJafMIJy2S621PQtTirAhLtovUzpazQ6sTbtQesYR1gAleh0Czgh2HgW2xqxcL+gN0xLhpp8fyelQquMnhhIF4PXy78m0/0BjSufmRWrfeKt/hV+OWveW2rUZvTMy08OW+3LUWQpMRSorwUEOb3DFuY3D8/ZXWuMIJtrBMXOjmoW4i/PgUgjzehPzQbNG0N85SxIKWSJ3iYcubMdzmPA0y0+w4JHMdkJVcUzw88WJtc1fV8hu5X9GnqpLvRMNaVSNI4CqUp1QwGK3x2PzbcTFl30LELyckqIPrWzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=Zj/GwWL3IMB9gD2Zwkt0OgHVqWDjLAnpd5Cy2EEh27qEgZB1mgWnmGoDGE2ASmbecfGMzgjijJF8AAAh4JZZTELM4BFs/dT+w1gvvSMTIM3VfBM7eM45EBp7mRfT80ztx6nlABq3ibRA+cirSPrO9iBNGwwwEsypKypL3pkS3+3akt+JLLIXejAQqlEPdVVTXwlYdoylb4HhBZaunjwIihyc+qlCEn3qLLTLEXOS41HFnKasHsB5BCJlW32BQ+T5lkVEg62a1YzYlnayqF2nJJUmbIDuIVDs03Pi3KDFfHRd/VmDurSiD8mGAQChyPFFXtAcheb81jlYurJbauH/vA==
Received: from MWHPR12CA0045.namprd12.prod.outlook.com (2603:10b6:301:2::31)
 by BN8PR12MB2850.namprd12.prod.outlook.com (2603:10b6:408:95::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 20:47:20 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::e8) by MWHPR12CA0045.outlook.office365.com
 (2603:10b6:301:2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Mon, 3 May 2021 20:47:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 20:47:20 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 May 2021 20:47:18 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v4 3/3] dt-bindings: Add MP2888 voltage regulator device
Date:   Mon, 3 May 2021 23:46:46 +0300
Message-ID: <20210503204646.2742486-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210503204646.2742486-1-vadimp@nvidia.com>
References: <20210503204646.2742486-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ba71a2c-aaf8-4a92-261d-08d90e74a5a0
X-MS-TrafficTypeDiagnostic: BN8PR12MB2850:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2850FCDF93614B9D82DD94BCAF5B9@BN8PR12MB2850.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4raZen0doSN7uG1HJg9LaQJA5Ss0fhKDc8yY6l73TfgxmSCSLskz8jaH3FZNAIMj/imhuVnW2cZL7DTtU7YhApNYh3c0dKFXGU6CjEL/0QIW7uV9xVOH4d0BnvDGsfvhhTjLzy5s8CGqOJVmIz7SKlL6vNLgdHFuDlDeCPzwxDeF/9S+yeP7OenDGcy2LdALqfiIvzWhYxYM2phHJ25WrMoz6jqetHkC+fXeDTAdti9pQRJnO/xR+oKybJeFE0TYaQeTpvzlDHEpPwdErKLYyYbFEs2z9uNUpG0G0uzIoXlY10t2qtXinG6OHygThf333jZpk/1DIBaYSY7ZMpedSaJd/2qHfneT8+tB3kOlMzp00KLjUygjtpV+f5k8rizUSC4ekkz2yncdQZSln6eyNVtg5UpENEskPOArYtl58+aGrgzAPv27wpHzkK82xd+I43iJt/jedXBFU3FA0ZOiuT3oQaVSMBGx9ajKDF6HD3H+JK1DpcurmsYhvBruaGQ4zHBzAJOO0X2VPGuAF8Cd19keU8L5XEE26MEY9b6el6Hsmf9xHVJ4Kz1tN+ajSff/TpGexb10R8reU47SYvw09u23EkJi4lS6qnPfjQx0QbQdWMdUn0nXrXTyJ/uweVbF89f9fpxrKG42OAebWbUykYPhyeZXTrGIUu5y78Sgp2M=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(4326008)(110136005)(70586007)(36860700001)(16526019)(70206006)(107886003)(36906005)(2906002)(5660300002)(82740400003)(6666004)(186003)(7636003)(54906003)(478600001)(356005)(36756003)(26005)(8676002)(47076005)(336012)(316002)(426003)(86362001)(2616005)(8936002)(82310400003)(1076003)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 20:47:20.6307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba71a2c-aaf8-4a92-261d-08d90e74a5a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2850
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

