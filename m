Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B87C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 16:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238189AbiEXQSF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 12:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237117AbiEXQSE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 12:18:04 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAFF4FC4B;
        Tue, 24 May 2022 09:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TO6YkUWcSl5Ces5qx4Itv7XSsl+/+vvAErxVIdUN+fo8BSeRyuGtjzepIb1+dQrvCk4jwm1o5ed95PCRLo/pz5M5V8uCysL4JVWkCrnOCtNo2TZ87WeLQGKQ1xwe68fHXF/qS2VHsdq13vD1w/KJKt62EuJRVeu9vdVpP67ppdFifp+i4CseqeFT6Fasfs2caHjvcSTolFWqt74NaxGKdkERMQfPjfM96sRPv7dZfEEwVxASfGDnqZC58pEoYr62Wc4pr10tlFSAxN4VFEToAYV+kphfuA1Si/+Np0JScAUYOhvxqkvgRixexKRczKtN6pnxQGFuONYH6ZhkY1/aUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06Hg2R+4C8Qz2eHLKdP8kjM/9uSEAwn+Bim117cz5iM=;
 b=oXPskJI/AZ0D+99SUaaCnjIjr3rxCpcZfyeDd8iX2XcxLlgH+BoYyP+tZ+36jfj6ZR3nh2qFOXJCvFQDEikqVqDHuuxIgdsxOwEtkRbTTydBVwMhm6ZizY6Pn+p7/zbnhl0EsmI+8FiwNF44TEhQrmuEF3vp66LmDUUaBVtvAd7rGDdjnTiJ6304+cVJPibSTKULktDp9D2+rX0GQcjaABlYcGgJp4D10UrX6CSd3jOvDNIaev+9xm5i90A0xZxSKXsmyUZmqKd2sHHPkYDDEh3qqVJIWxArnGslZKl+W+KI8yjtZuoLgfvyfzj929Nc+/Jm6JiQ+KvNFNMbfJ8hPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06Hg2R+4C8Qz2eHLKdP8kjM/9uSEAwn+Bim117cz5iM=;
 b=Rnc/XwIGSCnlrG7KfElxlgoyDPZYQ1pe+IJBDpUCmQdDK1Ni8yeMb3jauo+t3bncDrif/stne8Wb0r+bk5QoIpu/zCcHnwUFpgF848LdHlCZcnqOKBjP8z3bLpBP9Mib+dRGdd9yOdHl29HoRYRSNti2lbP4jtM++O3nXi8duoeBSTW0e4FkUZvzwrpHfmmDXJ11uFRCW0kcqpCZWqXxJ6fe8Z8xNWTuBiux7NimWmxI2EU1yiW+TKFzRDFAoaPTndAcc5YYHcDHBwGd+DOeSWKo1b/Iw86KEdtc946AIdm1fehMJXZzBiw4zfE5NQheVJI6d4FGCV1JQ66ekYGWgQ==
Received: from CO2PR04CA0159.namprd04.prod.outlook.com (2603:10b6:104:4::13)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 16:18:01 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::b0) by CO2PR04CA0159.outlook.office365.com
 (2603:10b6:104:4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Tue, 24 May 2022 16:18:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 16:18:01 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 24 May
 2022 16:18:00 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 09:18:00 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Tue, 24 May 2022 09:17:58 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v2 0/3] Add support for EMC2305 Fan Speed Controller.
Date:   Tue, 24 May 2022 19:17:52 +0300
Message-ID: <20220524161755.43833-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37d6cd72-7dcf-4825-37c1-08da3da0f96c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4047155B1F43071A07A8A2EDD4D79@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buF9GxbKI32ErNNfyFCAhO5DVnJrFDbnr5iBHKgfai5DU/OgEcxwr02SAXd85MTWcuERI4G9kEOgQw4vTo5roY7cJ91hG708ZpZKy4tuN0mSlU2B8DmwXlSvrTS47XMcI2bX0a2BHBMZgX8hgFfT8voEpFlvEl0cRjkjit5XfJC8Gp0Vcy+FZdNx1u2EzSppbtOaN8rnoF46EqKsWlulzgWILY9rY0MzrtKMTUWgAP6qwjOTthhJPusiaC7fNNz7Aelh9CcEJ/p6gTbMdlP4oD+uNvjtJsTLsmTTT/fJGmMSOMPeetjsRLfEg+Vvkql4Z2/ckEpSGkzspRcXKLUZldyHl8YoWPl91apmtFn1Czr9t5/CmLoA44WXvTLOHmmi5ApYU4aWxHMh6psmUSMwibWLePqT9E321a/OVCOpb6tvJw0pqG7jU1ok2lCV46OFqWueK+h7gDQz+0r84vLJdvq1ZWrR4n2hDqYpeMz1o4F5AF/I71vu3z76gul8xH0vZQ1za8AvgLva/OsAtUr/rF61M0D2R66co3oSUhJVWzk6la48wBavSEmXpYoNE1Aqre1oiA6k3kuhSZC++5jQbiWw/6hd3Va/h453qDhS7x7EQ+HGSExR7CUNpjIKwJr5KY+DhbQ2ooiqCoyoH2V8936B/ev9AT0PtcRhUA+5T6SqlpdSmVizarFUDx0UbIE4S1kNgfMdcO32ljTijLbmIg==
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(83380400001)(426003)(2906002)(82310400005)(36860700001)(336012)(356005)(81166007)(40460700003)(47076005)(6666004)(1076003)(4326008)(36756003)(70206006)(110136005)(8936002)(70586007)(54906003)(508600001)(316002)(2616005)(2876002)(8676002)(107886003)(26005)(5660300002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 16:18:01.3924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d6cd72-7dcf-4825-37c1-08da3da0f96c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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

 .../bindings/hwmon/microchip,emc2305.yaml          |  87 +++
 Documentation/hwmon/emc2305.rst                    |  40 ++
 Documentation/hwmon/index.rst                      |   1 +
 drivers/hwmon/Kconfig                              |  13 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc2305.c                            | 677 +++++++++++++++++++++
 6 files changed, 819 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
 create mode 100644 Documentation/hwmon/emc2305.rst
 create mode 100644 drivers/hwmon/emc2305.c

-- 
2.14.1

