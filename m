Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B108C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E50760F26
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240084AbhIPNYl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:24:41 -0400
Received: from mail-co1nam11on2082.outbound.protection.outlook.com ([40.107.220.82]:15936
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229474AbhIPNYg (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 09:24:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbSJHMyg5FM+AgYRR5fZmcaY15oGRZUzvYxPgNHcZkZXGaTIcMmtzdxxwM2sYll7JqVKUNVR7eTjpE39HunvK0+1tdfAHQmpCHYA7q5/xeaYreZV9I5Gfed+IzaTifI2jSSRLVMRojuWMHAtBB9dPoadf8DCYLuZYfraurjKL37eV//gZda9zX5UaC3pqe1Dl82QL/Fvw+Lw/MmmrXobo8ntEiT8tDUrpWuTQpI5Nt+QvnEK5o9U+AeYbJ6FUlbv5o7bUe8I6lzV+i6zMX0XXNrL0GYZ4cjsLRkRq7K6n6dZqp7bb5KL9eST4XYFxJ7ZyD0rIBhkOg9a8P/6xpVfLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cT+i6ltwyTc9K7dnA0FG2RSbAYlghHFBEAQwPh8tBqU=;
 b=iLCURLA37oQ+DVkhUel4GGgqX3Op2BsB25fIfLF9qlflGp0n4WHICMNZ+MJiUOpMyFu7XsNzON3YRkHdj+yroPjF0i0EH+Yhbt7mn0PayX9arP4NjHIcfn/x4to6xOUKBht4I5Eeh1dPlbiQFHBskx2v0f2Uy3TZdtH3KD7WdkXv/aF3dWy6e84MA4ucT+hZg/SuTEAbLcidqN4Vr4nrqUGPIvkPju9gkHyIWDn3s84CyPOA6e5U2XQ5hLmsY1utEv0Qy7BAp0ryhAX8ZgbEdNU4L+5eC3YgxuH4FOParkuYMHSXWlZjyKS7isxWrNcQ0LYg8+V4B87VSlfclJJ0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT+i6ltwyTc9K7dnA0FG2RSbAYlghHFBEAQwPh8tBqU=;
 b=px7NwIkjdIFVArwO+aWNAfNu6e1BuqHxa7XF/LFjD3X++/WjAqfp8Nz7w5IdXPQAUBVBkJLKJaQnBda8CylrOybJF1nd8zQmPkUyGWZd9Y5I30a3PvvBLTMH9Aag643sXylcy9DdTXCyBPPwgsTxvtiRAViEUWYBkTlnqcVuSxWQiP1GLJU9HUaqb8QNUyy24HmoQEgQHvSKz73dmpJk8eow2sj05sVOsSUvcyMYs1zo/J2dOVkBLefQVSXe5nWkvscBXBUhStvlgNe5TLzOoTlHX9jteVPiciOT2SL7eiAyylY7OBufC/pQr1I9iFJk40aU7ouLWtZvC/WResHzJQ==
Received: from MW4PR03CA0197.namprd03.prod.outlook.com (2603:10b6:303:b8::22)
 by BL0PR12MB4611.namprd12.prod.outlook.com (2603:10b6:208:8e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 16 Sep
 2021 13:23:13 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::49) by MW4PR03CA0197.outlook.office365.com
 (2603:10b6:303:b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 13:23:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 13:23:13 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 13:23:12 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 13:23:11 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 0/3] hwmon: (mlxreg-fan) Add support for multiply PWM and extend number of tachometers
Date:   Thu, 16 Sep 2021 16:22:51 +0300
Message-ID: <20210916132254.831200-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fdb7065-c50f-4031-8610-08d9791522ba
X-MS-TrafficTypeDiagnostic: BL0PR12MB4611:
X-Microsoft-Antispam-PRVS: <BL0PR12MB461161CD3FF37CD3E8EEAC2FAFDC9@BL0PR12MB4611.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHHE86YSYUeO1ErwZzHLuBnih4MzlO+V9jgkCDLnrq/Q/EbrHE2hl7Klya/DdClxpGI63XJYtRHgQHREy4pGWDjVP8NrBx5ParJBcbINcVQvPj963O+LXLA4qbC9AKYcA48wmCvL0d3r9iBOhadUoCecMCh3FjHXmpd4KxBOdGLoakzyDStGpnLkWU/1QopuZmeslbuidh6hqwID1ZMEYyDFwxEtjhfn1qy7tAwRgZxHL1TUNL6jthutNtgGA8hCcu37guFU84oCicXmRZBAFnsns9Qdfm3o3uEh1FOxTtzImXzPfBIisyhZGNToJ4pTnVWw08zI/JeqfPUO7V1Mzyc2PnqRqn8zjV+ddQt8+lOJKluONdZwvOdnJdAlLKDpTv/iIqaUCJ15q3uMLLEgr6L/gSmZ3I9lLzqC0hWr/EL51w4Mhc3E1amP++gv9ePfNAJZwXql16+P7vSSEU2IR1fMrSYYuKsdZPSzxWlFFnRd6nr3jQJalQY9ElnoNGEZq8t6fARdI4wCOe+eMlmu/omldN9tYwdtn67idAXColjd7vv+ZH3Jk5KVIMD8mf/v1dXmOrECLf8svizMq4+djCq8TgwNRVAsbF+SlYkabzKLk6BzqCwxGL0JpTcdS2y4UwvQA7fCiUxxZY9S2bouaAv0TwXeb265rciiCH1ltgkyqFCPhx048xIiXjevejKjqArY2RJyebC3qa2KWldRrg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36840700001)(1076003)(2616005)(4326008)(4744005)(426003)(36860700001)(70586007)(82740400003)(70206006)(6666004)(83380400001)(5660300002)(86362001)(26005)(107886003)(6916009)(8676002)(7636003)(478600001)(356005)(8936002)(2906002)(36906005)(47076005)(316002)(16526019)(82310400003)(186003)(36756003)(336012)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:23:13.2439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdb7065-c50f-4031-8610-08d9791522ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4611
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend the number of supported tachometers.
Add support for additional PWM and cooling devices.

Patch set contains:
Patch #1 - extends number of tachometers.
Patch #2 - extends number of PWM devices.
Patch #3 - extend number of cooling devices for thermal zone bindings.

Vadim Pasternak (3):
  hwmon: (mlxreg-fan) Extend the maximum number of tachometers
  hwmon: (mlxreg-fan) Extend driver to support multiply PWM
  hwmon: (mlxreg-fan) Extend driver to support multiply cooling devices

 drivers/hwmon/mlxreg-fan.c | 133 +++++++++++++++++++++++++++----------
 1 file changed, 97 insertions(+), 36 deletions(-)

-- 
2.20.1

