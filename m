Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EEEC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 15:27:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240306AbiAXP07 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 10:26:59 -0500
Received: from mail-dm6nam12on2078.outbound.protection.outlook.com ([40.107.243.78]:61153
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238433AbiAXP07 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 10:26:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=libZQpXYgGVMSYe4XMhLar251USN4vQpB0vyovZPOu9vvdbXPUZsF695d9ihBf60noiPwMWnQcnUXsJjcWgHJBjnmBTsB3bzPTH4P231jyB1bXagAOuLi86gUGk2m3+Q/k+QB8FLAaExZhG/Wrid0bsona73cg5ClqXRxM5sWsW0oxQp9FU2C8lcJPt82eBf6XFDhyzvpTF2sac7I+dkumeycluMj/WELCmkoRv6YoUybdYmYHZTB4yRUT3D5zyXwS0kGXMKSA+pM4tSUiLLRB42qjLQ7gMS9tdfY8rsCwm5M9L0mWx6X/mJ8R6MHANQRseM3qskWyH1XhkVoxyhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmZd7hqPNNEr6viduxcqMwA9EwbgsYz1w6/oVrA+KxY=;
 b=MPoJnw1I+i5qvvigTtLF/wgF6Rzfzg3FpE0mNYYhvXOZCWRe+RTX4TGlERhtuHvUWGr+fPxLk9PBRY7vK4va3JjBV2NwEc6VD4ZtrzpzwN3UdkFzFYeXL38pzoP3oilfpor7WRNfLtJOAEvAK0vWi/k2TVtXC3C9c2dCUBNCxGPZIe2UlVtHp8MjlUlzO1RSv5GCrweQERE6f0aOnpM4ngSLRtxPLXAFeoaBcIVe91jlHixoESwqdeS6o5ZnR7KvDfHiVoHCNG+OI3GjQ7QR0PSR8zsZ7eRBCrjGyKt2z7yHkYECU3nTzpVW9+d3y84A8HNpevMR9Be0mvJIwb/ngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmZd7hqPNNEr6viduxcqMwA9EwbgsYz1w6/oVrA+KxY=;
 b=dSsIk72lABxMtHRZ/dTstf9z6QBhkTPNXWkVE1ayEi5kIF+5ZfbidQKb5M/Jwwrru7J7DRzICDGha5Cq8PC/Pp96sUVAFeN2ij2hm765DwhCU+IVshKIQg36D7EzA77RfE25r1CEivVJMUUugHLSoD495H6GtqV0VSL3yZXlwHDb+EtqrLRqSwvtAKt3qunf67UkvwAPTFGS/yHRgVhApVNaGLorb1diVqZnSCz8zRBYGnESEbMccQO4UbIV1hBYw6Onw4ZADXuzKB98nV1UG2gyjyXdGGkD/zWYc8On++PlpRpHfXbDdKgQVaSm23dcndXetstkxWWdibuTvl8X3g==
Received: from DM6PR11CA0003.namprd11.prod.outlook.com (2603:10b6:5:190::16)
 by CY4PR12MB1480.namprd12.prod.outlook.com (2603:10b6:910:f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Mon, 24 Jan
 2022 15:26:57 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::ae) by DM6PR11CA0003.outlook.office365.com
 (2603:10b6:5:190::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Mon, 24 Jan 2022 15:26:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 15:26:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 24 Jan
 2022 15:26:56 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Mon, 24 Jan 2022 07:26:54 -0800
From:   Michael Shych <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: : hwmon: powr1220: Fix warning found by kernel test robot
Date:   Mon, 24 Jan 2022 17:26:24 +0200
Message-ID: <20220124152624.11004-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: drhqmail202.nvidia.com (10.126.190.181) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c018997d-7885-4528-4a81-08d9df4df57b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1480:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB148029DE5BC88C429F2DED0DD45E9@CY4PR12MB1480.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p68NuLNAgg2uH/1qmi0D2zJ65rQnsfrneXVNX2Dso0H2chFyNKkJIWAj/BAJiky51AbxdGfUowqBvA8ZucYBKP4m0XjcQjCkE7AhPWpKh4I0uKmlrDw4wj5SMGdB4G3nTXy/Hw+2kmqEREKm+aoOkRoDb2Tfxb6fxPhxgo6u3fc9t9kx19oeBn0VEm98PR8nVdeTFbyJkjCEag4zVU8RCXGWwbwmThctcElCvNdAv1MynRv7UCKhW64M4DVhoAOBp3r2WesMcpEanAkMx4Bc/P+bOkfYax6TPynKNoxbEcV0AaxicBfSJ+ISEnfOBO/23pZNxK/fvU1pIam7GoTdOK7AlV59X6/jGhtA2b4RHn7nOzeSlxH+9ZKn/7g6lDuRL3a1Z8dwciInSLd2Ja7F7qwK2vkNnBxhm+OZ+wBQuF8dLRE2VtIiOzRA5ePZfkA6dllX1HNIfH25UHCJBxImogK4zhhiIq9ofSaQyZ6Cv3Ok5LX5QZOj36GaCL8KTDs3jt8RWYMrKzAHKH1JolujLin6jXpieyyi0ecQJV502sfPIXzCtZVXv4mgGudNPQHN0n/qW58V//KXcoe3DgiF7tzcFtUoiN0xHSukDiOwDEYa9wcfCXmBX1MNG2OjYrTbq8B4surDBGKLV9DD+CSJ4S03uPB9LCSVxph8UOSaIODEZcbcPbYv8MGiyC4at/HW/enf0NU/9bDy2esqtyWJkHfg6ZDab4IHH1TfM/gtzBhUpODZxGRyhsi5wjuOp0O8V/wE1b2flh/UXJqpTEShE2NON8Hoq+ZuMfYljpnvVdYfzoplm5F3kiuIbKNXr8SH
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(40470700004)(46966006)(16526019)(81166007)(186003)(40460700003)(426003)(336012)(26005)(4326008)(2616005)(70206006)(8936002)(86362001)(83380400001)(82310400004)(5660300002)(1076003)(316002)(6636002)(356005)(110136005)(70586007)(508600001)(107886003)(47076005)(36756003)(2906002)(4744005)(8676002)(36860700001)(6666004)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 15:26:57.2203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c018997d-7885-4528-4a81-08d9df4df57b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1480
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add missing break in case statement.

Fixes: 19d8ebde2889 ("hwmon: (powr1220) Upgrade driver to support hwmon info infrastructure")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/hwmon/powr1220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 6fa4ddbc1a41..f77dc6db31ac 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -189,7 +189,7 @@ powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
 		default:
 			break;
 		}
-
+		break;
 	default:
 		break;
 	}
-- 
2.14.1

