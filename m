Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20725C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jan 2022 07:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343740AbiARH4i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jan 2022 02:56:38 -0500
Received: from mail-dm6nam10on2076.outbound.protection.outlook.com ([40.107.93.76]:10496
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230082AbiARH4i (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jan 2022 02:56:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHd8Ys68jf4UpbWU6hl9r5mmaD+/+4VqJjoR150NnCKCJnS2+qG3/xf+SX4PLPNQ//OokIQnBpeYDCU350BU3tKeahsMTLTpNMqNZ8F9chxUggfAV0N3r+t2gBQMpUkYW1WJpAunHln3fqbmQy5scdmxa4xOjsuYP/Y1ADbd8fhim9Xt+CD41xq9M37Av3W6cc5LxIjGVxfGn5pTrdjy9/T9zw8Mf7AKNxT1E067HmgYQ410f9Qd1a51wj7odVAKbDikwAI+AijldSdDKKZc7sZVpJ69pEC9m8BfLWiI5YvKXXYl0O7NmYp0TSL9OsAFr9O5et+NqQSoHf4fnwL/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFpcRrlDAYYrvtmw9fHkzfKDEhdo8HKNUHVMQdtJNw0=;
 b=DKmKKaCDZhTnWKeBPOz6fN7EXlnX+CVswi51DDJc6NyZXpXH28baWWmEf2nlU1L5t1eTzykaqb/Hfkw5nYlxlYTg3U13KhR1cGam8dL13Ox6o5vsZ/zXhIMraYGI672htVbmXkwEsxfTL/dcNmquOdoFofNoCf98Nvbo6xh5V0a3mb80uLEUg+BS1g5peJysoORKXKgCy68mdUOWnDzxPDsMvps8NpBf2ngWR5gKkaoZF9foctE7VlFz8owGTTqUk3b7B1F7kqFwokB3hnYjTFe7V2UrwjGqzb403I/nusSvYSQY1VcydV9w8nUbCFQKaxEIjy7jJOhAJD6gsvQEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFpcRrlDAYYrvtmw9fHkzfKDEhdo8HKNUHVMQdtJNw0=;
 b=LCypScjpc4eErCGQ7E1t5c9xTRNgX5CO8YRhtbdJ/DTKQQQrqoZ2IgP2Exi+kyY47rPZ9egE5DsRnfir54iJ45NEByDb+5igTndWEXy1pRBu8ESC9HXNwpRxX8PGSj8KDsgpVREJ19nUvHIK6Gb/DOVMgc0/B4c84FCO2Bd8ni0tir+wPJ317FtxkbmopbGsUwp/9KT+sv7JtSNdpPjbLZBsdYFlL7K2kwThRBgcGkZd9AjoHL/LH5poJG7RWea0TR88c5B1WDnajFxDqW4+uxSwA+7nptPN3HSRRUTdqQqbhOZ3Pgi7wcXxRm2eHeO2E2KC77ebbQbMLyXJdDlorQ==
Received: from MWHPR11CA0033.namprd11.prod.outlook.com (2603:10b6:300:115::19)
 by BL0PR12MB4867.namprd12.prod.outlook.com (2603:10b6:208:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 07:56:36 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::99) by MWHPR11CA0033.outlook.office365.com
 (2603:10b6:300:115::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Tue, 18 Jan 2022 07:56:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 07:56:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 18 Jan
 2022 07:56:35 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9;
 Mon, 17 Jan 2022 23:56:33 -0800
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v3 1/3] hwmon: powr1220: Cosmetic changes
Date:   Tue, 18 Jan 2022 09:56:09 +0200
Message-ID: <20220118075611.10665-2-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220118075611.10665-1-michaelsh@nvidia.com>
References: <20220118075611.10665-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.127.8.9]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31d0f1fa-f02b-44eb-2bd4-08d9da580d37
X-MS-TrafficTypeDiagnostic: BL0PR12MB4867:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB48670F8E43132986636B2A4DD4589@BL0PR12MB4867.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ZJ9keARGpjJkFgTxga0KHrmW6bWfbgWDX8Bib13NXTaIar5A6Mjp83q6DkOIZTUGNPz9TsYPm61zuYs7+/BTZa7xWRu9Hy61hla95O7RgJXcDnohCD5bNGbyNtchEVlcl15JqJ4Ny3TS6qQCzSad/BoZQuSfY4IjFPWdZVePJFRqBvjRArIDU+7XPvCsBjYrEhKYPGEeW3pmUdpX+Wml6WFL77oDRUVoqvu7Oahv2f9wD1ytHuwPfW9ImvqjAWlF8A/wsWIkYP+qjDLjDDz2MLtQu6pCs74C0pQQycQOcaPPAPhH824ptykuHmjoQ7/9C0LTaLG1hXWhlCsTkWcr7l2Tza6NEBDv+V9fvZ5dWaHLebo5p9Cs0vWRtoZxh/d5WQFrC4ldLUO0GklSgYesHPdoLyxiHVXKGws+fu0OSONi1gtLxuS27GrZ1xbyULQuKgI4SNEyAvsbTVSiqSKMGigybzY8MSWtlsSB2MLw1tXrEYnjidW7BPOQ2288yq+IL3Q1IchM1NGFFMTK6AqbWfe4WU5fVebMkwR0R1sJXroniR+WnLDlWZpB6mbhBJPjQ+ksjV2p24fGNWL5oPWg5ZPk0QJEqEYbJnVd7LM7otFNpA4eVG+bc5CA3niAYCrSmp7I0LiwlFaypgZh9dUK5ptPCju2AXJKln7kdfamGBEAe20QjRgDNtud/S/Ls1wynG4+A47pp5hiiAFIAT79NkEowB2UpyDyAR/Th//ONQ4oWhmm+Wf7QHNy2h7PEfqujTZQa7ndd7JIZexajGQNnRGHvhB5NyuIjrCIrLSsKMZxe3G0icOj+shHN9T8KFq
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(40460700001)(107886003)(2906002)(2876002)(186003)(16526019)(8936002)(83380400001)(1076003)(70206006)(70586007)(8676002)(86362001)(26005)(5660300002)(316002)(36860700001)(6666004)(2616005)(110136005)(6636002)(36756003)(81166007)(47076005)(426003)(508600001)(4326008)(356005)(336012)(82310400004)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 07:56:36.2238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d0f1fa-f02b-44eb-2bd4-08d9da580d37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4867
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Update code alignments.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/hwmon/powr1220.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 9e086338dcba..542e4a7b0234 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -111,7 +111,7 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->adc_last_updated[ch_num] + HZ) ||
-			!data->adc_valid[ch_num]) {
+	    !data->adc_valid[ch_num]) {
 		/*
 		 * figure out if we need to use the attenuator for
 		 * high inputs or inputs that we don't yet have a measurement
@@ -119,12 +119,12 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 		 * max reading.
 		 */
 		if (data->adc_maxes[ch_num] > ADC_MAX_LOW_MEASUREMENT_MV ||
-				data->adc_maxes[ch_num] == 0)
+		    data->adc_maxes[ch_num] == 0)
 			adc_range = 1 << 4;
 
 		/* set the attenuator and mux */
 		result = i2c_smbus_write_byte_data(data->client, ADC_MUX,
-				adc_range | ch_num);
+						   adc_range | ch_num);
 		if (result)
 			goto exit;
 
-- 
2.14.1

