Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD5FC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 17:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344685AbiAKRdr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:33:47 -0500
Received: from mail-mw2nam10on2044.outbound.protection.outlook.com ([40.107.94.44]:6049
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344900AbiAKRdU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 12:33:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koRA5VwPbcyUmJEAJ6PSVpAyMhRSXPoAb9l1cs6khtItn10e7FJ5euHdKHT27rxzMUtT5asWh3br6umJvva6lKKjzZ8l008S2RFcFNWfQN+eL3jz/6d9H3EHyuI1U5fZro0wzcEKWNnMK9N4t5eNxXU8FHyLLhnxuRngOWtByAAhoWS/EvcpmIkKDDMNulodx9PWCi4hT8bjTByMZjPiqhTzoFqJ/cqt6Fa0dxBwUazhXMMXCrvsM30bGRisC+99BGgGzalmOgxrIH9SQG7UceI6Em96vFGScDnS7DT4Ycmum/MEB8rW2eY9exzY3PSboh8wCWCZSu7focGzOVPMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyiq7OH3Hj5Q8YPapWJ1t3sSWPGONAtxTMn0yjBSM5k=;
 b=TSdSrX71s+sHjAMFATspcQWUswerpFaYsbJvH9r/OXk1Ml1byr9XPVmj7yDp3Wm+1tpJtUF4QXtpNN1IpQ7dVIKAtjk7PUYO0Jp8yirf+VhdU62/AqswnjuAnEiEiBi2X2vUPJ6rm06mXus9IHS8XyGzjvIUQ7p8Fq2xKuNwSfjT5ejY/OY8GkSUfbi6AFX08KIR0W+7hsxkwnASarvJ9tXw4/xyYPu8BaDYSYIjkNheV8El/P2JvhN6AB5bzU32gbDflh8T4e73V/93rmleq2ko9FpJr5fjbBM0QF35BmYd1HpwOX9V/31txtTCC54A9r2lBzrJ+y0Mrys7Jl3DcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyiq7OH3Hj5Q8YPapWJ1t3sSWPGONAtxTMn0yjBSM5k=;
 b=SA36SF8nAGT8BqF1HB36s5OcAIO2ugDfL1v1h45vnzxkC+yHvHbfChxMlNnsG9UGHwpRk2h60fPprac6+cR29IvHjn97vo4wd8TZK5Av8iQzvCu1wVf6DSYnl7KHZKaB3x9FIaky9By7exSkXHeZI/Rt2gtVjYjnJws8vpX0ccJ7EsalB78+4wSa5qH/4jygMvC/WMABHCkX8X+oy3vo3TZT+3niZdK2HoNiCGujYSY2Aelqngs6QmvWrT/2UU5Cet0altDdm1x/BTHgHtI8y8XUgQZ6bmYjXclp4yOuX5dkeP9J89nGkvLaXaqxQ9W2AumI80RzpUWEh1krwRx4cw==
Received: from BN9PR03CA0677.namprd03.prod.outlook.com (2603:10b6:408:10e::22)
 by DM5PR12MB1452.namprd12.prod.outlook.com (2603:10b6:4:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.11; Tue, 11 Jan 2022 17:33:13 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::b7) by BN9PR03CA0677.outlook.office365.com
 (2603:10b6:408:10e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Tue, 11 Jan 2022 17:33:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4867.7 via Frontend Transport; Tue, 11 Jan 2022 17:33:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 11 Jan
 2022 17:33:06 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9;
 Tue, 11 Jan 2022 09:33:04 -0800
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v2 2/2] hwmon: powr1220: Add support for Lattice's POWR1014 power manager IC
Date:   Tue, 11 Jan 2022 19:32:39 +0200
Message-ID: <20220111173239.21006-3-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220111173239.21006-1-michaelsh@nvidia.com>
References: <20220111173239.21006-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61960f0c-3b7d-4840-6831-08d9d5286e52
X-MS-TrafficTypeDiagnostic: DM5PR12MB1452:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB14522C9C227F80C265A1195BD4519@DM5PR12MB1452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UQa5gXL1CMhvGPL0pAAG8iHJ+3ul/YRid2yXghEsVS3sp/8A8poMKoNN1xiyHZvU2uTGI3ItLM+/Qd32WUmijvHP9qTaqfqJrayTBM1QcwJsRXXathjihuvOOVy6g27Hn1CNosCRk1dvylWHhXx4ZUEBBAS1uGsmoP3KUpd0ysPEl5MHBMxqE2Dj7ei1Xdk8HfaX0QeR2L0GGbaFb6t6l0rQlBf6j2mdZtPAzNv7XWfLTfXt6OCr7C2ttlTtBq7WN1fepQFLRKtC/nrrgQOMXPnoPmZrbGEAPbRfvsGOF1G5RN5mrAZMVkPTw9zLiagGD7iX9zqYSWUe69+pZZ1im5mdEtUL2mPQOWdv3micJ2/MQPtij4zfjgo0rYumM4e9ZOD44aKK8TQu0bfXbOLvVYlApOIgwllMTYRpcVcqWOy+8ijxJfM2uRZZJY+WJX1sPUoWmUlUrZiM/K8Jd9ctzjrEjXn7Uf0a/uS6GGiv/fz0ed3JqBOzxg31RJATbcdUaplvJtlEeFBRsRY+qYL+9YuA/WLSd3WR35Cc/WZtkBqXulAIZH57thdvxi7n4qISSWP8P7VsZnqvd7/FMXTtpm7GvpGtHJUdlrxUn0GbqxB+902mm4wUzfEzwBSh8t0SvfVkqLlixg8g0veu62luoHY8aZRMX2Qj4+k3Tvwm7F49hHxncZgpCIryyLJlshW2HYRR7vm9taZCy1uBCH0NhwbDvoGD2dhKskoJNpyoqzYawpeUSDwLFyl/Ho+mlwwAOhJ42oinzKI3ay40kLebrnTaqjXTStuvPT3F/BcTbYYgrre2UGt6AUO4UJzKn0l
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(5660300002)(81166007)(426003)(26005)(86362001)(8676002)(356005)(4326008)(83380400001)(2876002)(47076005)(8936002)(16526019)(1076003)(40460700001)(186003)(36756003)(82310400004)(336012)(6666004)(107886003)(6636002)(2906002)(316002)(2616005)(70586007)(70206006)(110136005)(508600001)(36860700001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 17:33:07.4375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61960f0c-3b7d-4840-6831-08d9d5286e52
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1452
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

This patch adds support for Lattice's POWR1014 power manager IC.
Read access to all the ADCs on the chip are supported through
the "hwmon" "sysfs" files.

The main difference of POWR1014 compared to POWR1220 is amount
of VMON input lines: 10 on POWR1014 and 12 lines on POWR1220.

Extend wait time for conversion to complete, since for POWR1014 it
could be longer.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v1->v2
Fix added by Michael: Fix incorrect device id.
---
 drivers/hwmon/powr1220.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 1b833781e89d..84f1508f1cbd 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -22,6 +22,8 @@
 #define ADC_STEP_MV			2
 #define ADC_MAX_LOW_MEASUREMENT_MV	2000
 
+enum powr1xxx_chips { powr1220, powr1014 };
+
 enum powr1220_regs {
 	VMON_STATUS0,
 	VMON_STATUS1,
@@ -74,6 +76,7 @@ enum powr1220_adc_values {
 struct powr1220_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
+	u8 max_channels;
 	bool adc_valid[MAX_POWR1220_ADC_VALUES];
 	 /* the next value is in jiffies */
 	unsigned long adc_last_updated[MAX_POWR1220_ADC_VALUES];
@@ -128,11 +131,8 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 		if (result)
 			goto exit;
 
-		/*
-		 * wait at least Tconvert time (200 us) for the
-		 * conversion to complete
-		 */
-		usleep(200);
+		/* wait Tconvert time (200us - 400us) for the conversion to complete */
+		usleep_range(200, 400);
 
 		/* get the ADC reading */
 		result = i2c_smbus_read_byte_data(data->client, ADC_VALUE_LOW);
@@ -170,6 +170,9 @@ static umode_t
 powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
 		    attr, int channel)
 {
+	if (((struct powr1220_data *)data)->max_channels <= channel)
+		return 0;
+
 	switch (type) {
 	case hwmon_in:
 		switch (attr) {
@@ -270,6 +273,8 @@ static const struct hwmon_chip_info powr1220_chip_info = {
 	.info = powr1220_info,
 };
 
+static const struct i2c_device_id powr1220_ids[];
+
 static int powr1220_probe(struct i2c_client *client)
 {
 	struct powr1220_data *data;
@@ -282,6 +287,15 @@ static int powr1220_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	switch (i2c_match_id(powr1220_ids, client)->driver_data) {
+	case powr1014:
+		data->max_channels = 10;
+		break;
+	default:
+		data->max_channels = 12;
+		break;
+	}
+
 	mutex_init(&data->update_lock);
 	data->client = client;
 
@@ -293,7 +307,8 @@ static int powr1220_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id powr1220_ids[] = {
-	{ "powr1220", 0, },
+	{ "powr1220", powr1220, },
+	{ "powr1014", powr1014, },
 	{ }
 };
 
-- 
2.14.1

