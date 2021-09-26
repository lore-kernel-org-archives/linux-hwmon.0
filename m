Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5496CC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 05:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25F0E6108E
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 05:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhIZFhi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Sep 2021 01:37:38 -0400
Received: from mail-dm3nam07on2045.outbound.protection.outlook.com ([40.107.95.45]:6689
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229746AbhIZFhi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Sep 2021 01:37:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLwR+8MHRPzjLnu36QPCSmVN7ANi60RISAlA/TCsx6YjUWmdHcJ2hUYQO8XTk9gnacHrRkBrpnJDDcSL1zhHFzrQOSPTx+mDJEVM6MG7cOVD8f8my+7lG8f8X7wvG2tXLbhTZb3ynA2Qz2WlpIIe3OCdMB4Ioq95pYCd/ih9gujko3ezV8FX6gqOaUOClH73REeTMtkgnrgKTmlSOSV9pUcRmQSsH6yCnpQvQ4gMK5Z/VzoLjb7UAJCEmJFWiaqzDK6OGFmaLjP/4bTopWLI8s3bF0uUn1aajagIlNDgZYbdckpMvvTOXunBzg0r4Y9caJr3DV62p3NbSg++HGlgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JWjmH5/eg+TLUZ9eWwhRE8+ydzvV+q3tToDTAawX9Q8=;
 b=ItmQSOJ8ZmB9083Hm/vOfEgLL1V5126kPhtxIh0ekpg0Mx2euQ3KtKKieAUKokYCR58O2GddcULKFBoqp02sf0x0IYniBe58L6LnnIwG0YQXJ3SadSxce8PGM3+/Eg2Q8KIvN+3lSaq75DckJ/kRwNPVx9KV6dSYYg/RaXWeKwrvoOZYdN5KoKzKv7S7PfI+fhmfpxMdRYQq3X4yTi0XvJv7g4gHgTdsrpNzpKWLXY6MYdK3HQJmzHA9ShWWInBI9DZOzc/eW7p9PMExPzs8RX2WvkNztFZO0fbgsnkcYyVhi3561EvfSDjlUXoqPARfveiwFwbBIRlE7gOqTZD9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWjmH5/eg+TLUZ9eWwhRE8+ydzvV+q3tToDTAawX9Q8=;
 b=Su2VXKLlLHHSXsDuJa6dNG4UqRf6xApLoMRyDhlww/ouy5qiZOGMKot95kUkZq3L9oTjPSqXMQl2WXI3G5lZEFnN5Cmleub2OmncieNpW29RYB/n4lB0uAoq4F51qiD8ZtMHxgfK/ic9s+GTPzXe97uixQvoIo86TvzMsXxC38MV6eQYF+gkjps9oZ56KHBQuKQsV6p5tmlViuhzRn+Huc1dlheY5rDweAxXnl3ohsNXLay22akFIE6tuDgDQ+x1dhEYennRiOEP4e1V4xZ+WF9L2PA/chYEzoR4FVjBDGZx4SddYxUCGZOgIy8R/92peO4dQBlKKn5nRGy4H36F6w==
Received: from BN9PR03CA0013.namprd03.prod.outlook.com (2603:10b6:408:fa::18)
 by BN6PR12MB1458.namprd12.prod.outlook.com (2603:10b6:405:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Sun, 26 Sep
 2021 05:36:00 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fa:cafe::72) by BN9PR03CA0013.outlook.office365.com
 (2603:10b6:408:fa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Sun, 26 Sep 2021 05:36:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Sun, 26 Sep 2021 05:36:00 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 26 Sep
 2021 05:35:59 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sun, 26 Sep 2021 05:35:58 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 0/2] hwmon: (mlxreg-fan) Extend support for multiply PWM
Date:   Sun, 26 Sep 2021 08:35:39 +0300
Message-ID: <20210926053541.1806937-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28f55aaa-8cdd-4b28-e3d8-08d980af8600
X-MS-TrafficTypeDiagnostic: BN6PR12MB1458:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1458EC5A48454056C7762D8CAFA69@BN6PR12MB1458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EVj+F+5ZRYKcP4cSXhxK7iKu88LGwIz/H5GzIgGpyM6ZmSrAFGJCBYzk3sgSFUKUiW8UU3uw+Hc49fHjUugNHeYIpr5y8RtpzVehD47KE7p1rzoswbCBhgQmFu6uIdSDO82R/N07HoA5eI95HJq+OsXuGSgVIlFBndunyYH4ikQ1HvqB0oObFto6P1T7wsFIkb7ggweWyUY7o5MVmicyMY2/2NcSz18iCayWhU8+a+qIcGjxCk2fU1Incc9qnqSpMcaWAg3HWF5eScI9KNnaKe+m9cgee17XiqSNJlQdfYASzwnBgBmXCYig+trKCrt0ZSAGhjXcMHnYjg8RkL+GfnuQ7wRKeBQ4fHUdhvFyRba6OyXdUzq+xiR70qUqzPvM8p/ks/SZGY5S4U33MMmcY/ysan5pjxTdXIGvZXVB7hJYcGhU3FUNwCsQhwRHz/xWTkAOV0jaUb7WkB/a85ATltTtfE7S0SW50x3Zako2OpbAuEiHUYngjCOA4pugfSbn+7gF8gF7b9DnxxZ/pKP6STE3kAXdeSuskE039Ciq1A0L15wwRWJ434lU4ZqyudOkYmbjH0uDes5I/eSOJy30SqThf4dpxTMoBzy58WvJe65qb0q0P/leRgbowrzKBDlhxE8G9l/hky7yCSbnPIxYaq1mDCMDCRwWKVfhKQ2LKM214TvkYXGAxDmMD40CqI6FBJ9iNRoWbfZH5K7EFOhAoQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(107886003)(8936002)(2906002)(4326008)(54906003)(508600001)(6916009)(26005)(6666004)(2616005)(86362001)(16526019)(1076003)(186003)(70586007)(8676002)(83380400001)(4744005)(82310400003)(5660300002)(47076005)(36906005)(316002)(356005)(7636003)(336012)(36756003)(426003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 05:36:00.3644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f55aaa-8cdd-4b28-e3d8-08d980af8600
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1458
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Patch set contains:
Patch #1: Change for PWM connectivity logic validation
Patch #2:Adding different names for cooling devices.

Vadim Pasternak (2):
  hwmon: (mlxreg-fan) Modify PWM connectivity validation
  hwmon: (mlxreg-fan) Support distinctive names per different cooling
    devices

 drivers/hwmon/mlxreg-fan.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

-- 
2.20.1

