Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991C0C00140
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 17:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbiHJRRF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 13:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbiHJRQ0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 13:16:26 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF67566108
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 10:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtU5hU5Z6lOAdqrUbCf0bwQmIH2MOS86oVhVmsYQqz5Z/s1MXAeh1oapBW3ywPFnZT2u4bke+oBSw9FonxhYJ/YX7NZa5HjsKBwiDZ0z4iWtOdoRYhxJMWDEYNgcfBfHXHk2PqxOYJb0zGkvTy0TMFcyVr7vRNkQVorSY8MheWSuwlVVvShAe8mnHE+/jpzMM1JvzTumruOybEYVRD/LYDV6u3SblShuk4Gny8TP1MAgj3Qsg+mQqKy+vWXu1vvgkyAPqoxsXZmYN4CkRus4H2+c3uYfBplqVm0ozxnFYm2RD33s96VgviTWPLc+v/GsBvjOj8HHfP2H4eWl0cl9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VoLPpq8AH7JsB9I7wjef8CYtdl/gaxzJLkNOP7WiIY=;
 b=SzFHru1LjdrAiuGKwy0iT/IVr6VuaAjbdx4sONJ1XbL7HKplUNCVv5JhGTfTno43Cv5QyNXWHrP9OmhyyP3WzAFzqeieGcAjecfyhwAysrjppLeY+IUIDJnfkAIRvE0qmlDwhgO6aGIL1PuT+tJPZ+XKJOvAxdLyr9X2Lam+Rv6UQMkvAAmIQDqHsSSd1XPT+bB1tpH8dpE5PFncCL9fCgVz+1mh86sJ6OfdkIz+/wbHOZjPJ8fm1rtk82Ahy7tQZyUdXXeICQaXnZtPhdfYNL4SOV/gheInWlj1L5VPxcnAvQQd8j43lwozMUSrt/lTdMtTVqjv22PzHOMFdxbTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VoLPpq8AH7JsB9I7wjef8CYtdl/gaxzJLkNOP7WiIY=;
 b=cnDiJ4dj/EcVFVEGOy9Fp36cGyDidnuw2omhMrg648gxk7yfIkl2wobCrtQDkC37Puw1ao1K/k6t6Tkn1kn+vNhG7HaNjS3mqAjbCHYPLfDuBoRBCdxV9KxJEdac+UFh43LLtCmfLlIVpiDFAG1tD/9knk+EZUus+RIXlOktW3sUsftHTsw0FY0erOyN/+F78YSbN3X/qk+Wm2vZ61i2ZGGa71Rww0BdN17QNWVmG9hRrZb2hVkEyns+Np83NNhmNuAhyVdgwug6+FmsjKr0TR3Y9FvPXzaMx2EzXuW9q51NtGKMDj+ihR0crWXIPdCcApM/+z1NdZiUzXZyCiCI4g==
Received: from BN9PR03CA0664.namprd03.prod.outlook.com (2603:10b6:408:10e::9)
 by CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 17:15:57 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::58) by BN9PR03CA0664.outlook.office365.com
 (2603:10b6:408:10e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19 via Frontend
 Transport; Wed, 10 Aug 2022 17:15:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 17:15:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 10 Aug 2022 17:15:56 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 10 Aug 2022 10:15:56 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 10 Aug 2022 10:15:54 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v5 0/3] Add support for EMC2305 Fan Speed Controller.
Date:   Wed, 10 Aug 2022 20:15:49 +0300
Message-ID: <20220810171552.56417-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe29d2ec-d972-4470-a8c2-08da7af3fd72
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +kmMJ69FCHKf6bAPcAq3T0iTC+aDHwkAGIt1oI3qTQ3gZT6IEHHIaSP1ew6y8Ssw4q9aOXYxKStG/PMMsnQ1eDrRA2t26jcsyTEouePj4gy+/ivUMeniZ5baz4dFqIdiS0UFegclR/ifhWVbi7yTiGcT2FJAmmBS8V3NYVXpdazyf+C5i5jkIYq1F4l8SqtF2J6eST+NVA/9vxQWbD6qr+46Ibygq0OwJ2bzE9Q53puLdREanAdWXb+32WjnNDdowW73W3XE2nTsF1qIb2k2U372xfhZqLWnGg8mxd3WYZOiTY24CgukTnwdr4g9w8z7b9BPjqFwg8RmYBCbhv3H6ukKOobz8zWUcj0Zx5bvXKeMbHVpKJC3GqYzFrPUuBWvVNblpRAplQEKb1Qo0Fjx4+Dv1WKWFelIqevs5LiDAP0btSbp3V+Zp6CQO7siRpRU9FdQYRUwOFVW/7xYSqjF0LMvUFEuiz3etcbfjBMWMNAj80a82NTNyS3T0DLzvmJGqgAVVs92YjTanofIjXS0lip9vckJb86WP6cS8JEh6URAI3imw9zn34GrQvo46WEicrGwgI7+6Mmxo0eenok/62Rnw/xNnnlzK+D5j4HWvm7XVV4Rt4JVHsiLlCt1NuziQWsHmJfvEZrv0w67X8E/Rp+5zDzZr5HO3hEoHD8mPT5EAB0+iFGE+uqarADeCx2RhvWdeSY+DlxXa2Zoq3gzI/Px0QcxhXnJ7+a85er9NWkMl116BQUuB+NhPyRFZZ554f5U0mAsqmGgM0w0p2q61D8bWF2pF46TqovavZjdhURwmh39Q5QrxRtkmpIawp7m46k+Zf+PH1syoT+fARDVRw==
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(36840700001)(40470700004)(186003)(426003)(107886003)(336012)(2616005)(5660300002)(478600001)(47076005)(1076003)(40480700001)(36756003)(6666004)(41300700001)(70586007)(70206006)(86362001)(26005)(82310400005)(83380400001)(81166007)(2906002)(2876002)(40460700003)(6916009)(8936002)(8676002)(4326008)(54906003)(316002)(36860700001)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 17:15:57.2419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe29d2ec-d972-4470-a8c2-08da7af3fd72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
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

---
v4->v5
- Remove former patch#2 from the series. This patch provided a basic
  description of emc2305 driver device tree binding.
- Add patch#1 to the patchset. This patch introduces a platform data
  structure for EM2305 driver to allow configuration device PWMs
  and thermal zones by passing required platform data to the driver.
- Renumber: current patch#2 was patch#1 in the previous patchset version.

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

