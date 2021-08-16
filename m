Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D0BC4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4EC4604D7
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhHPSRO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Aug 2021 14:17:14 -0400
Received: from mail-sn1anam02on2084.outbound.protection.outlook.com ([40.107.96.84]:52806
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229481AbhHPSRM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Aug 2021 14:17:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdXCEBe3ioKkG5GMbwc0nySPN7W3TESPXPx/gM6l06JtqBED4R3DfPYzR4DFantRn/he+ysc7o1otFbhbF4fHdW8OU/WVEJBw3hRwbawpxFtzhGMhhsSGYr/boz+FIisauj/+vIYH5yG9vOyjZJN2wN2Ryc2xGaK2gtvrKfv3jn9EQyBcu6tSFHKeMv0p+rayyB9Fn/ygK5MA//yW/7bA6dDZ2/2d6wduHul3QKs9y3gIJC/8IAStBN27zOKRR1O4Z+V/BMLvJ7YSWRMbPMqRdt2TZjh04h5+Qjs3t1yr71ap0UH152iLJxiLqKtZmuTjlQv1udQldDP3yZEGtt5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/mFMI9Zra0qHuQXJydlOrl6OiXlhgRK18YXfiJax5k=;
 b=Fj5bHhP4GIL3JyWNRutQy3SmVzHNQDXC/iLGpFsHsUHlwx1WI/cunZwTfuAssch/BkLzOEIo5F21C0UDgF5dkTHaUCUeePmlQQxin0BG0Ex43nO6ez/bBhDVneFQ7HEz0uL40SWxot+rWWlvTKt21MlOduj7ps4CPE6D4BxdnvIcfaf1RJqob9Cx7G+4k1j4TYc5oGL0l0FVd6/Z6EtDxkT2TOlIphPqHiBpQPp8MjAKaMskZxtbPju1WkGyW9HTmzPjFXT7B7Flof1KW/bES5/4B/U0U8x67JrjHuEvbYYbEf4lvRwpljr36mkHsh8fDFOj5RGVeQ+kHmbMy5jOxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/mFMI9Zra0qHuQXJydlOrl6OiXlhgRK18YXfiJax5k=;
 b=RFBnAOrG76USAgxd8yE/lRWG5/1Ol633o9DsEAdr9NQXTycGzREWFp/Q6gdKfsm6b8e2JJfD2m+89OVrEFrXiRT3nk3O9kgsJp+9+0Rc1dbDk02Z86QiXwN6HvgTQGn5J9akqgeF4emfY4ufXnibKS+gso9sXSeWET9WjsH4m+X+IzcL/bW0yu45V9AZRFauODPiyvT+AyPiRBAR5J1LbuP7bIxJw+Oo92fAphwqzDMFQqP/Kekr2kcNjPPGhUUHzDNbMDM5HMZRjJFYAw//L9GeMMr+AF5at6glQca5dMu1ciWAe5+fHoOJ7Q7f0hNS5vf2l6ppp9lzTBQ1ttyRag==
Received: from BN0PR04CA0156.namprd04.prod.outlook.com (2603:10b6:408:eb::11)
 by DM5PR12MB1132.namprd12.prod.outlook.com (2603:10b6:3:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 18:16:39 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::d5) by BN0PR04CA0156.outlook.office365.com
 (2603:10b6:408:eb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 18:16:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 18:16:38 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 18:16:38 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 18:16:36 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-hwmon@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 0/4] i2c: mlxcpld: Add fixes and features for transaction polling time setting
Date:   Mon, 16 Aug 2021 21:16:11 +0300
Message-ID: <20210816181615.2625662-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b7a2991-1577-487b-d22a-08d960e1fdb8
X-MS-TrafficTypeDiagnostic: DM5PR12MB1132:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1132596D807A9D93B426521BAFFD9@DM5PR12MB1132.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ksTQlW2aU32BFz2CJBv+dW6a2gVKajrztXsF5fplNNmjl+8uiix8dJhItedAP2CJZeNjEclEu/DSDG8ECPOlMZnKX3vHlqZW5jaZdXkcgqN6Ot1L0VvosiDy2s9mhD/2XitlmK4rTi2C2i3BjB29CxeuIEN6ptxayivoCXmnPEDaeOnrq0pw+/299ne2Ze+bOXOdSiDfteqZh+Q+CSKerU6VUlBGLBSQb9Fg3+TCNVGQfW05yygwlA+cv/y780J2ftNShkR+7aa7P4d6qOyBTxeImt+RaHcAm71E4vy9qnbJMUcSG7EvFUXNcsLdVqsBF3b4O/CI+ETMPsoXk3bH1JWzhPwVfykWQT52Spdq0ygBrvwP+lGXAXj+sCH+qRLgnXCJCS7XBYQ07dWzcucr27Rnbd7ftY78GHdtrF58XBz39Y2C1lXbYgcZPHZXtjP/qAgBINSWd7l4dFqkZ9D1nvHKGcma13Cc71nON1/AYsB/QgmzU5cYyXCKdBSa14IT6ZGzEnU6GfFFKK1iA6KaXE2sWQaWCPVa9iNzq40+K0WhzYgdPo4TWFhe3HOorlw/EbRvnBVSUlfyvaa2isWxxk85pPsDyyy9+zdeegZRWmfeBwD2bpQQWfTMm6i8FmyQge5g1uAZQaD1pag1prCvwh1AiLwqASvf/XzZfLkBiC09bUweOobai4p9nB38/+JaCnEw4sTvaayWE2XnpHLCsBA4K0AAyz/CKwmMnrXnXm4=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(2616005)(6916009)(70206006)(70586007)(26005)(4744005)(83380400001)(7636003)(6666004)(356005)(478600001)(36756003)(16526019)(5660300002)(186003)(8936002)(316002)(86362001)(1076003)(8676002)(36860700001)(4326008)(47076005)(107886003)(336012)(2906002)(426003)(82740400003)(54906003)(82310400003)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:16:38.8642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7a2991-1577-487b-d22a-08d960e1fdb8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1132
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch set contains:
Patches #1-#2: Fixes for frequency setting.
Patch #3: Reducing driver's transaction polling time.
Patch #4: Flexible setting of transaction polling time according to I2C
	  bus frequency

Vadim Pasternak (4):
  i2c: mlxcpld: Fix criteria for frequency setting
  i2c: mlxcpld: Modify register setting for 400KHz frequency
  i2c: mlxcpld: Reduce polling time for performance improvement
  i2c: mlxcpld: Allow flexible polling time setting for I2C transactions

 drivers/i2c/busses/i2c-mlxcpld.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.20.1

