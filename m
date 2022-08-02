Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D749C19F2B
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Aug 2022 08:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236239AbiHBISr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Aug 2022 04:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233640AbiHBISo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Aug 2022 04:18:44 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB9F19285
        for <linux-hwmon@vger.kernel.org>; Tue,  2 Aug 2022 01:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4MSqqVeQTZkJGj+5iB/PMPe36rTVXUI3XT/kje5A1NFd+rBPL0m86BzVxb2KR8xEc6dPvxGPnzL/Yz5Dbm56si2OkrNyxbpEoACSTwJTmwQvzoC2o7m/3sQLm2vIrtv6MliJVMPygDi2Z15KXZi8ioq521f41DhEvRsS68uaeV9t9bhwgJIyzqh8u6xHQDoL+d2MtIr4Caq/xL2CuVoPT5cbJrNg9PBOdzzuNhlOgonlLTEvIm2drjAAl5iJ3tirpC1GTwMhRacZQ6UCRx+56aBztGs/Qy6CSrNJ5lUyEOufj6EGAy0SZdDxS7DONVFfZ5X3eyTyVrdC81pjd+J1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjSXwKRU812WrGsCGgQL6P1//RbE6sS8XMgiVxdp84g=;
 b=XAXABHeTW9ty03WE773OyCSkhimZoXPful/oNTqD5H2znvD1mKBkHRYU0LGTp7hVM4zckgo5iUx6Bn2ZcRrI4f/pk31RDrDFh5tSOfjf+EqxSiIH5/jBN5F0thUNhr1KUw3FHYuWd8MiWMC+BHnfYD88LTZwrIjBm4LxTuX7kIo4r/k0+mFYwV5s9iN+WGJR4gb1JzIYaZvBn071SODwUs9hraBXIoNclf+XrLCH2o4szGEKfApeRflJZLl0By3MiatPB75qfCAgr2ssL9vtalF7AG9nTdOUXIQfoeoiJuStEQRc80jd+Ir1Pz9YxMmnHoRCSdH/wkQHWi+7IsjH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjSXwKRU812WrGsCGgQL6P1//RbE6sS8XMgiVxdp84g=;
 b=LU9KdWpum4X1Wb7SiE6hVny/STj6VJFtxRqbIYRAowk4k2IaOexPYuXAwgbaJZRK1ffno+o07U+XOsVOBP+9zOcgwOc8WA/eRhYEdZYbYy94hSc98L/h6xw0+qWAbLnlmBry6vNo5Ccxde9chSPPnrp2JCAc+AjM9Lh6LpagmhlRcV/ZHbj9hU6Pa2fhBm2N+yE+/BbbNsU1c058V9pb1vosyiqmcGbRW1N4LZDLIEWeXCvqeddc0QEJL70MBzD/awcV/uUn5eCMp/9WPaIHpsCUVuqzr4dDIS00xshFuJotJhapRMDEM0m3VNUek24+CSV8vLA+kS8UcuMx3D186w==
Received: from DM6PR02CA0090.namprd02.prod.outlook.com (2603:10b6:5:1f4::31)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 08:18:39 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::17) by DM6PR02CA0090.outlook.office365.com
 (2603:10b6:5:1f4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11 via Frontend
 Transport; Tue, 2 Aug 2022 08:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 08:18:39 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 2 Aug
 2022 08:18:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 2 Aug 2022
 01:18:38 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 2 Aug 2022 01:18:36 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v5 0/3] Add support for EMC2305 Fan Speed Controller.
Date:   Tue, 2 Aug 2022 11:18:29 +0300
Message-ID: <20220802081832.6692-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c9dd9db-a2dd-4d8e-6217-08da745f9acd
X-MS-TrafficTypeDiagnostic: PH0PR12MB5679:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1cVggPc5dx1Jsi3xFV7wPGuNC3fEsDqqCB8+7kAcN+jtlK5Bw2bIZIdYMm1L5Qr/jz1M9XYJUNLqWTofCER4RpBnv3qJt3CnnNIkgtVSdwjHX4Zgc+B8e+kGbWEx1PwCJFumEW9qf21jimtm8HSZ7tPmI+x3C0SDBJdha3EI3z2Swqpgtev1GPDbmPjc8hw5N972nbApehirpoNZXgV2pTcejEGqAtp+xj82K+9U7N5FpHD0ByKpMMhlKtxBbgNSQ41do7sruSApYoQ9IkROIvEzmqezeIr/wBUPINCYXltR/XbZpmpvH8QauXz3eXDcAGxCBfh3ZkYiPo9UaC2mC9KbzvWdARVvw2SXji5BrR8DXB7Q9hSM+bCZhS4GukzQXLOQm37MFdAdVISgSRp4GegfuDT8dXlfbQbcF4zQ7Z6RG1Wa5WikzIMYW/HrpaLW3n3thR4KRgHNQF88JDbf5CXKSkc6i0QGG09RHRTiSnXz8BTdjLtrX14+bH5MxcwPSfglWWlUUq0prnn4hlDvScgHalotzQdkd8hfYZ5bf6jTQnIa78PGRWOSW17KT0p3u7ElfjDjj9xvwuRnsg6cD8JkjQ9FSxTwIwzu/mv+fLZJM8139Kj0x21LbzQQPXz6XD0f9wTY4y7eHgJeLwlz/7ONlGkoZQ1k8Js3LH3TcPpPpBmuhZMyNLkR/gKomz+5IlFrdbNt5ZwQvrc1QfDzHTbHHv31JbE3u16k7OYMHEwXjxRN35oNVaNSVrZ0Cr/QSeH5ScES7pvwpDxv+Wf1uobTr48Dxs/6sgeQEa4+6i3Zh2PrWQ1IgEMdGxY6p+1cqKWvrTz/ypTFyb/UMOm1g==
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(40470700004)(46966006)(36840700001)(336012)(107886003)(47076005)(186003)(86362001)(2616005)(1076003)(83380400001)(426003)(8936002)(5660300002)(8676002)(70586007)(70206006)(4326008)(36756003)(2906002)(2876002)(40480700001)(41300700001)(478600001)(82310400005)(316002)(6916009)(6666004)(26005)(356005)(81166007)(82740400003)(54906003)(40460700003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 08:18:39.2962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9dd9db-a2dd-4d8e-6217-08da745f9acd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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
Patch#1 - define platform data for EMC2305 driver.
Patch#2 - add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
Patch#3 - add emc2305.rst into docs.

Michael Shych (3):
  platform_data/emc2305: define platform data for EMC2305 driver
  hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed
    Controller.
  docs: hwmon: add emc2305.rst to docs

 Documentation/hwmon/emc2305.rst       |  40 +++
 Documentation/hwmon/index.rst         |   1 +
 drivers/hwmon/Kconfig                 |  13 +
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/emc2305.c               | 624 ++++++++++++++++++++++++++++++++++
 include/linux/platform_data/emc2305.h |  22 ++
 6 files changed, 701 insertions(+)
 create mode 100644 Documentation/hwmon/emc2305.rst
 create mode 100644 drivers/hwmon/emc2305.c
 create mode 100644 include/linux/platform_data/emc2305.h

-- 
2.14.1

