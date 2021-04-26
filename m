Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A62C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Apr 2021 22:18:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09C74613AE
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Apr 2021 22:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237341AbhDZWTG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Apr 2021 18:19:06 -0400
Received: from mail-mw2nam10on2085.outbound.protection.outlook.com ([40.107.94.85]:59104
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234113AbhDZWTG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Apr 2021 18:19:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRBOgTBON6fvYuBAYrH0Y3vVWVJXbjsDNUBmsWfXLDcdL65bSW6cQQN9bOCLMoUVvEveor1kkc+n7K/tusNJeKhAQ+laAX619f1MCFLc2TClyHrzKFQgqAge0LC2nPNxe1JBz6VQrXLMVUFi4/bqBsk6YjzSU25bZxpQOMivFOlfD/5vu6s3FuzEfFrFGBC5M6HWRgHWeW3otZOSSBbAYXneK75FXSRbPxX+U4Vx/yEwmmrp5gA8nwx95oSdNbHKn6aoc6RxKpUxujbdQWU2cDMhf1S37lfB7uHXnRi3yVBqtkue8B0twKwr+5ZScF6VVSNlnx8SEGyGaZrDj6H/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uutU64B+N7Lyxxvfny4tMsaMtqnId/Qdgy7rg/bSA24=;
 b=aVeAX6hRJRAiVLBK7GHnQ7Scs8XHTBGzlfRcz0ScgTnSEm83w6y4iYrPDu5XP4fSNAJPdjxU+bNQ5UfgMAn26bOM6+TO8p1Nlp8vE5FSo8MkaI5wd3J1+mvVo0EtADsoMZ8VteHaqEM2hT27pI01TLw+q+zx+hzXhipzZkp9jigw7G+N57po1ADa7MEVWCOH9yTR6tEHgE6F4W+Gmj4IjAI5Jvx/9TDYRgjOrM//40b4YJABRp/LVZzcUCRKXn7L3LoMQJDk0Dfp48nvtX8PcTAS9mAILsssPeb6UKkVYwiHgHS4pI3wEFUuZRdI7C1NPFRN4rW/c/BcoGxx+f0dvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uutU64B+N7Lyxxvfny4tMsaMtqnId/Qdgy7rg/bSA24=;
 b=SftiVjRWJ1CJ7Ix1XQN6WIcaoTQ/pC3tVcukTmAIl+mnjBCJ3pIZiNlQMkBnDwN3eEVocnyih8MLbni3EfNebyCVSQYV0Yb+Z6p1js06Rp6ARZ1kXZF6wvv1cXqXFTosChNu+VwbXBeMhtX2cO3Pfggbf1Q0MNVqKnRBcvJ3DQQzNxpH6PGqIGcmwjZATqOIOigjiKyZUCwYmmeB1cwN8PEZgwLpu/k8O+eg8dIMhiaPl/0Zbxsy071Hc6CC0Z3VWUOpAeFPvT0JpYIlwZuXPBbK4TR32GBAVg75yNuREm0PTGQPTMErv+/g67JS0gP8RZVyD2oMAk/ljZi6y/v1rw==
Received: from DM5PR04CA0067.namprd04.prod.outlook.com (2603:10b6:3:ef::29) by
 CH0PR12MB5249.namprd12.prod.outlook.com (2603:10b6:610:d0::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Mon, 26 Apr 2021 22:18:23 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ef:cafe::cf) by DM5PR04CA0067.outlook.office365.com
 (2603:10b6:3:ef::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Mon, 26 Apr 2021 22:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 22:18:22 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 22:18:20 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v3 0/3] Add support for MPS Multi-phase mp2888 controller
Date:   Tue, 27 Apr 2021 01:17:28 +0300
Message-ID: <20210426221731.1718613-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d77b851f-9c47-49c5-f85f-08d90901346e
X-MS-TrafficTypeDiagnostic: CH0PR12MB5249:
X-Microsoft-Antispam-PRVS: <CH0PR12MB52496ED85D4F03DB77025337AF429@CH0PR12MB5249.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rdHJhbzNzqi7STKeNCDfuJuvuCLeBOwSZSowt0PVVjU7N341R+emM8S88ssOPOktPx51EcROiQtp8nwWp8V6XMA2l9fXSWOcVo9P534qAyLaQrGBFqEVlWEKH9m9rL3ssEJ9d4Nw40hePvMYlaGvub7/HVVFergr1t2i7J+WNfTBl9gdNDYrjBMCbuUr4yrdBAMyo6zs/TEl5AjRMHjaw4qvF5NfOIOfCODH8GGm4eoB7RKI9qIOz+Hw4caekaipzULZOCAFhETZrgz4CCyJvEtqxL2iEJpMcLvmAG36oFRFws3VmT+gots8X+3AiaSEjEDzDPmTqBBPrpvxu4ShxSzv6Gn4ZsL0TnCn3C+On0PjrPKhGPFVjexZmlWXhzbsBym14QJDrp0armybqKP54alIq+zwOVhnPCVBxkv30rbf56IWZifvga1qM52wmKi1HXumaqb+0XBC0aZPtxJZNRLIis9QSlwxtkvcw15Ywn3vncQPB4Ngkd7Dls2pHaP5h6pBnZNTRWo0KKgzg+kbPj3pYDpPfUtTG/QjTGUx15Y2yIk+u0FwI4cQ663SnryupacKaO/K92B/YpR8qkXZX5tQ7aT8LQ1LLMPc9sYAF0pdcxCb7Hx7rV4upIA0p3kRopP/UsIzBtBSubKpiGYxAVqombURDgrzytnW9ehPa4E=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(36906005)(316002)(186003)(82310400003)(16526019)(478600001)(8936002)(26005)(4326008)(110136005)(82740400003)(356005)(86362001)(2616005)(36860700001)(7636003)(47076005)(107886003)(336012)(426003)(83380400001)(5660300002)(1076003)(70206006)(70586007)(4744005)(2906002)(8676002)(36756003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 22:18:22.7911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d77b851f-9c47-49c5-f85f-08d90901346e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5249
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
 Documentation/hwmon/mp2888.rst                     | 111 ++++++
 drivers/hwmon/pmbus/Kconfig                        |   9 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/mp2888.c                       | 387 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |   2 +-
 6 files changed, 511 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/mp2888.rst
 create mode 100644 drivers/hwmon/pmbus/mp2888.c

-- 
2.11.0

