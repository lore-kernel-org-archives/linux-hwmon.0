Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3ACC433ED
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 May 2021 20:47:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B10D61041
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 May 2021 20:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhECUsI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 May 2021 16:48:08 -0400
Received: from mail-bn8nam11on2057.outbound.protection.outlook.com ([40.107.236.57]:28032
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229782AbhECUsH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 May 2021 16:48:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzaYU7T1r7LMgdSprlIpug9n3z4ZUiLh5UYMwEHJZAve+FpGdd2/dKeaf+ONYuxsdCSFUVTeiarP7I0KrXuI8vD9crxcuKOEqEmUdoM0VJszgXLMa8rIaokMhpIpNnIo0VI6pP4WGK2LRFxckLdpM/CVr4p3h5Xz+kTaaA3gyEN5ku8mB3x+hveLLT9CuG2wHUxneTi2FvJ1uqsGMHJsIEvyHp9qsx9AXMSH/IKTJU6VKkp9L8sPVXazqgYC3E+Sx3EG3Q9Nlv4G0FktDl8kZKMj8SVjZ76/asVt+aj/Kmj8iXZvqTGOmYLhIPmpfmKWlj50kZDtXjhgoMKo3rYMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5J1C+jYIO5O4dzWNakYlxGKTc0HbcIIS2YyxbfFXJ8=;
 b=cIl8/o1Fdohm1ABGySumo8juR5M0zrB+bAGxXgIlsJMVnB3r1Y2sjOgUrwyzoyz/Fu9qGX5s15GWZOE6gebb9SoEWBbgER6IyZ7TCzeDcFFa0NaaTbMYJKpWNmbaT5wbzEjyO3unE/W1FYF8/KBEA9A5reuFe2P9jvA/HpT1y7CXip+TZWXLGPmISyVod102vb+U3DWuJkgPLzW9FUYEidZKC3ZdpkZopuwHeCSIN2Le+DmVuDGcJthQ79+6DoPvkPMcw/avLrkNmtrPMaRW67cdPKlHyI0BNu9UCxgtI15YgurEDuaQeqYG+LOLhu5K5i0oa4QdGQ0ncxkLH3Ao3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5J1C+jYIO5O4dzWNakYlxGKTc0HbcIIS2YyxbfFXJ8=;
 b=cKFX18nrEQv/MovmxMgljonnCrv/GW4eHccyQU+j/+Fj9+ptQ9p50gzZsyplVdMqAoYn5hhQz/bnNYI2Xo4Oo7uPBcPCDaG0uePBB6vhj1RFLnJuVpluBpdaWhhoqZ073SUkT+sCmwIEWw0HbqPx42rno6N5fHI1U/2vnJUDZgzqVvByCHDb3Y/CcaOLl2owZS8EX+bDmULNnuTAnWAnckxT8XxR6bFmUZ6PNi2Qx6ts7l97WnrxCeWIe2TGQsX14I8+jtDxycbsfIoFWXgwrtd1RZ8BZy1rM70pQ/gPRXpPe6c8sZgAha9R7PBdqg/Ad7mMs13Yp2SbxWm6XripQQ==
Received: from MWHPR02CA0010.namprd02.prod.outlook.com (2603:10b6:300:4b::20)
 by DM6PR12MB5007.namprd12.prod.outlook.com (2603:10b6:5:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 20:47:11 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:4b:cafe::6b) by MWHPR02CA0010.outlook.office365.com
 (2603:10b6:300:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Mon, 3 May 2021 20:47:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 20:47:11 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 May 2021 20:47:09 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v4 0/3] Add support for MPS Multi-phase mp2888 controller
Date:   Mon, 3 May 2021 23:46:43 +0300
Message-ID: <20210503204646.2742486-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cad6a381-a1b7-48d1-a225-08d90e74a00e
X-MS-TrafficTypeDiagnostic: DM6PR12MB5007:
X-Microsoft-Antispam-PRVS: <DM6PR12MB500702314F9256F7BF23E4A1AF5B9@DM6PR12MB5007.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aXTZDVEIVcADCUrofzKTtB9vVMVo5rKqHmoZVRX6hIpL07sGIffTIhligQDn9r74cTYJenqS9QGycSf99NwqIP1xi2UGtGRfiSOLot5RcQljbe6CvahEZZeqfWDTh7SDH1ytdsCyymZ6DRb/JYsU9ev36QXbfiRhwNdMLRCEQyfuUYAoGL2qo+NwqjEjEXcH6IqPJi2fFYZbeEJ1EF4YELolUv7j3jlyV75Qq3E7kws2zHoODxw14osWWbb21WKtEG72ZkIDpsZiEiTVZC+WHbl721f0Zyq5QYrNM6Nw/iiW68F6vpH9tU6FKIdTDXEDybRDgOIlGJY7PaR3WMqjNn5qva+y4iFg7s9tPPJZKrW6NcDM4kKTy6qp+SZRUMS60sNELz5s+cEz1rGf3r6o2tANIaAkZutvY69MnpR3Cq0YHBwFLppjCqzQoCffblCjUbjP1s+UqEJFlct1mxbTmMmVPq385fwhg6cnCBpRQRt1xjmesNHosVRllrCmjoom5QKECrb05h0g2/JYEFHf4pRmYfVmz38XCw2VFWWvseMpgBLjFX7oQc5THO7qCFumiyPHthGCGLsW3VyTdXBoeu7hbliodZm7YISknEDF3KEcO3EfdSJ2NG8TwWCPKf1Lhl2xDt1Wpwjz+mGz/QBmt31yF3D7ZdCBHPT8ASJR82Q=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(36840700001)(356005)(336012)(8676002)(1076003)(426003)(82310400003)(316002)(4744005)(2616005)(7636003)(36756003)(107886003)(83380400001)(47076005)(4326008)(86362001)(54906003)(110136005)(16526019)(186003)(82740400003)(70206006)(478600001)(70586007)(8936002)(6666004)(36906005)(26005)(36860700001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 20:47:11.3185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad6a381-a1b7-48d1-a225-08d90e74a00e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5007
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add driver and documentation for mp2888 device from Monolithic Power
Systems, Inc. (MPS) vendor. This is a digital, multi-phase, pulse-width
modulation controller.

Patch set includes:
Patch #1 - increases maximum number of phases.
Patch #2 - provides mp2888 driver and documentation.
Patch #3 - providesy binding documentation.

Vadim Pasternak (3):
  hwmon: (pmbus) Increase maximum number of phases per page
  hwmon: (pmbus) Add support for MPS Multi-phase mp2888 controller
  dt-bindings: Add MP2888 voltage regulator device

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 Documentation/hwmon/mp2888.rst                     | 113 +++++++
 drivers/hwmon/pmbus/Kconfig                        |   9 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/mp2888.c                       | 366 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |   2 +-
 6 files changed, 492 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/mp2888.rst
 create mode 100644 drivers/hwmon/pmbus/mp2888.c

-- 
2.11.0

