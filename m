Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA918CCA486
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Jun 2022 16:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiFWQwi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbiFWQwc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Jun 2022 12:52:32 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57777FEE;
        Thu, 23 Jun 2022 09:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwbTBJdTxH0jsFYw3pSHdZEkAJe3JkhtobRi335VxcGZFfxByD19V+zecIExQt6vB5vOYoERROXFcyNHjYZ02wAPO+ZDvfQNHcUPza4aqG3Xb4Y4/kFWcGrToppFz/WwEgr4VMLGSVdlQFT/ak9/8TWQupbrTAryayQfqZTUjVuuXf0YiQIMEfQca494VIyrZ1zeEy+TF3Ko7OZ49ORGUk+OcykzlChxVUkzTx+syRpsSVluwlQyAP3nVtZ7PT1D8PGRYbt5gHwz1MBrgcWLS2RSP7B0ebYX6e2Y+bW/Gx3XJoiBsrhMFDpfXOubvWHgHcpInx9WYWB47adxQkTQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6p5cjt4uSL+FrmxlJ6tElUmbAsYErEGSXWJFwSIFnR0=;
 b=ZWTK9A48xU2QYWRkmO4slmrBLSsi6PE2Rw7kT+3/REsNbppeni3q4Z/YirinJ4yPkXlCiou/vk35FV+Ph0BlfyR65wxRVpwqxQiFIAVET8LkL9teysfiI1Ny4jkf7Y6GYAvjmqC4nOD7IE6eOTj8A/VTdXKC1Ik30pbm9CbY+7aXAd/gJy0lEYGmO+n3jNNGBWXfbRN42BbzHqpS/5mO4w1Z8w2Zfmzpt4cYbASlIWA6XsduwyyzNexfar2QvmeBJGqPVYtqXzj3E1dzwj04ppIO3JOLwgED3vhW+1lVoMurqkah/Mz+JVElaOuiUNjq7VvcgY3byMnu/TJMECiKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6p5cjt4uSL+FrmxlJ6tElUmbAsYErEGSXWJFwSIFnR0=;
 b=cBX7yrYFkEEOdPQ/mmkt+SCmiGrBRts/SeBdwrxPuUcFFvZuEya9g7cSMmE6GvWZ1iRgOTn4TsJl9M1KbGLj51Ih2T8yE2sOnjvwwusbXd/5UE92m0nxfheg/YnJoeQMJcPKYXT1gJXanvfnwwH2AVLvTN96fNk2T8ctiVoN8Lv1hPhXJflRmxt+5Jdc2Rhd3r8ie42msZioF7V8CIPonA1529pf9V2sWsAr2ASE3qpSKR/729DANtOoSql31Aa4mgAw1/tjoQbP5WvF6CHTMt34WHikJTsX/+jHhllAXpYkxtTMKORI6vUW73ZNRVi4EJ1B3C10AsOYHeJ9YpAf6w==
Received: from MWHPR12CA0068.namprd12.prod.outlook.com (2603:10b6:300:103::30)
 by BN6PR1201MB0164.namprd12.prod.outlook.com (2603:10b6:405:4e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 16:52:26 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::b) by MWHPR12CA0068.outlook.office365.com
 (2603:10b6:300:103::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Thu, 23 Jun 2022 16:52:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 16:52:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 23 Jun 2022 16:52:23 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 23 Jun 2022 09:52:23 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Thu, 23 Jun 2022 09:52:21 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v4 0/3] Add support for EMC2305 Fan Speed Controller.
Date:   Thu, 23 Jun 2022 19:52:14 +0300
Message-ID: <20220623165217.59252-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 733dd464-33db-4e72-16b9-08da5538c048
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0164:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3Nd4ia+eRE9pihRG5sloUbGfA02LTThAzjGX9tQHzA8QbmlX52aVksAonpNzm5MUj6UCG7k/IYr/ZjNKpFQtXW27natfMGijrrdbtoBxoY2M+J1n0OQDMw4Zjxy5VHE7E3iNZ0lUvG2wHzKc5xpT1a0CoPJDbF5Yi1dzFTvgWHjECY3kg2frR/SS1n/klz4UWXNL/AegSHiIfx5gy122VJsFB8U9+EzbUIm1mvt1+NeF5NX3ZykTROrcuuMoizChiwtwI66q+7Vj+lulGRQXWRgHyzcAwhtQo+fdSs6O2+pDDSSuoOFyq+iBKVCBiT+/g8UkOFR6eJA01jydGFNFnVRRQTDlP26KFXaAkv7NUJ5zrnabgHQPq85pDMS+BPcw14h40sECXJ8Xeh0tAhiSkHzOQJcGynNcR0yZcMptkLtFKp32/O+4cr76/s9aoJeN+sgfhxw/TEi2sybg517v1f6mcInmz5ZbIDJI0pe23R2wzrHtha5byMnkiKNEFVjaiFl+bL4qcU5MXhJuFfV5Qmcl3/GByDhlJOc9JiLjCZDyUvc1vtsMyjex5kIproPoNXaKcd55OJMzxoCOVKBhs6UbYQRgm1faVc4Pn3YwEdk2Wi0H+E3j1/RGVnBxDR38vDdLubFdpZdCXKSXmmeFvseKcUX+/X4yBoOSm4Z+WrbRoZsmE9gGD5RDRH93bUenJ3S8NSUzJZNbPtHHXgjnJAqapYPPQL6+1oVR688Lu5VXb82Wr1GpcmafmTvkMLkkU7fElDqL4v16hCW1bZO02Hjo6Gp0wSivaiclFOY/aD/ymxUo9s8uMoqFT55MW6P5oKWMFUnqAGM8yZOw/Mjjw==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(40470700004)(36840700001)(70206006)(26005)(316002)(86362001)(107886003)(82740400003)(6666004)(40460700003)(110136005)(1076003)(2876002)(36756003)(70586007)(82310400005)(54906003)(8676002)(4326008)(36860700001)(2906002)(2616005)(40480700001)(356005)(426003)(41300700001)(47076005)(186003)(83380400001)(336012)(478600001)(5660300002)(8936002)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 16:52:25.7732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 733dd464-33db-4e72-16b9-08da5538c048
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0164
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Introduce EMC2305 RPM-based PWM Fan Speed Controller
The EMC2305 is an SMBus compliant fan controller with up to five
controlled PWM fan drivers. All fan drivers are
controlled by a programmable frequency PWM driver and Fan Speed
Control algorithm that operates as a directly PWM-controlled device.

The closed-loop Fan Speed Control algorithm (FSC) has the capability to
detect aging fans and alert the system. It will likewise detect stalled
or locked fans and trigger an interrupt.

EMC2305 offers a clock output so that multiple devices may be chained
and slaved to the same clock source for optimal performance in large
distributed systems.

Patch set includes:
Patch#1 - add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
Patch#2 - add microchip,emc2306.yaml
Patch#3 - add emc2305.rst into docs.

Michael Shych (3):
  hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed
    Controller.
  dt-bindings: hwmon: add Microchip EMC2305 fan controller.
  docs: hwmon: add emc2305.rst to docs

 .../bindings/hwmon/microchip,emc2305.yaml          | 106 ++++
 Documentation/hwmon/emc2305.rst                    |  40 ++
 Documentation/hwmon/index.rst                      |   1 +
 drivers/hwmon/Kconfig                              |  13 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc2305.c                            | 676 +++++++++++++++++++++
 6 files changed, 837 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
 create mode 100644 Documentation/hwmon/emc2305.rst
 create mode 100644 drivers/hwmon/emc2305.c

-- 
2.14.1

