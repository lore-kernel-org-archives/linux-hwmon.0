Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F9EC43461
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D10120760
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="dbDZCJix"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbgIEOdD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:33:03 -0400
Received: from mail-bn8nam11on2063.outbound.protection.outlook.com ([40.107.236.63]:2133
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728297AbgIEOdC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Sep 2020 10:33:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEF0Q638qHlruAwLn3fZVVijWGsPiJDS8yF3hnjBGiSGxsrZBV9f5hqneg9Ucv83gIlwMk6igbVVXzZXYjeRIJavOPTwIC+4Ho/1Bzua4p39ssxBuTtHPtDksgpHTLI1OFljnV7Ck5CLXtn8uVLdzj5wEoi247a08uuazHzrwivGQpj21IYtg/TV2rIoLC91T5aO1g6ASDqHdROeL/5O/uFaax9O74ZraAJDnZfGsuMJRfVGMQN27muSVtqeOujIYYb9NPg48X5DgcT9k6jRp47/lZE2NdFqhiWcJE5wPoWPos1ylrcafcg6YLj9fAS1e3oiWetRPKpZqdd5+p8/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8Hqp0jthVOH+uRtBvPl401ym36PQbrYoGhvH+kIKSE=;
 b=NCyO688bkx0NzOifw8X6wNGn7feU91iA0ODGu/oO5RT3i3ZVN+hFWj2igeJHy3OTfskUL6C9XvboEDEF38+WHhYUhvpkBUpwQGScQ8Q51BjvANMDDM1P6T1Bn0ek+z3FJgm8DgWqrG8+m0vgnr1gNsyWs01912v6W+bj5mX6KnYv4q3SuZArEDns6BHf1FGaNNcH8Kk1UyBsv7vpndrNcwCA2pRk2aFyVq/uDIhCc9UgcTUy7MRdTeU+ReaFarQlRCsRq+H5i1u1JVwYDGY7YXJ8ZbmNp60bFdAa67qAHYaAUgSgbrWv/4NvDZaEu9F+249JWt+22iP9WuMenQbe5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8Hqp0jthVOH+uRtBvPl401ym36PQbrYoGhvH+kIKSE=;
 b=dbDZCJixlTscei25H0XR/vhfmDoJFHiG9T3BvSdnGmEf0KFEYBivnq9dtE64rmS+2ry0M2J6IGuuJAxWFMhwlQouS69Guxc9v9BP/l0J3MEaYuApc1V63PFP6AviWpMDXIbrQ05tBRLXsoHZPDo2hP5pP8J+Gllt1qmy/6fyLUo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 14:32:58 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839%5]) with mapi id 15.20.3348.018; Sat, 5 Sep 2020
 14:32:58 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 4/6] hwmon: amd_energy: let user enable/disable the sw accumulation
Date:   Sat,  5 Sep 2020 20:02:28 +0530
Message-Id: <20200905143230.195049-5-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200905143230.195049-1-nchatrad@amd.com>
References: <20200905143230.195049-1-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::25) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 14:32:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 007faadc-a267-4937-65e7-08d851a895e6
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3114980881D6884674757000E82A0@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:270;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQ5X0U1gqtpOHHR7DFdHiZryDjbD8Fw292Ot1NoWGYVZerlAmAJ0weWitM+bvlUdDwOx6XuJLS70IDhsVauX1kPImf7rpx5RklS4EkORaGf4sQEFlY80T4pU69U95aD6ZvlwMB2nJLB/R0IOqw7cKfPl8fdLZ4KrliqAPtQSetgwHrfgtMPJXt3NB3ncBhTNiUSRpZkWo6WdmzDCB6+w1GgnMEKacyhRZirkR6EiGnvBpyyXtmjXdmzc+soOClokVP1rrLJ7SxdlKu+XNCOX6/UBgxVjAN5dxFq1qwpLbutFBabXvqSWOkvNnDsdCQG5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(52116002)(316002)(478600001)(66946007)(8676002)(7696005)(66476007)(6916009)(66556008)(26005)(6666004)(4326008)(2616005)(6486002)(83380400001)(5660300002)(956004)(16526019)(36756003)(2906002)(186003)(1076003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: MHu2BoK1aChqqzJoBZT/ge3sHsHxdxx0d3MNbyRxKP/3sFl6jyKzkJDXsj54q7lWSZL9vWk4uVvsi+VJ/qIkUOT8TB2E4vuY7ExyXGiH5rv55YhVkOkC4EOyktUJEDU/QFLrx6OWlw9a4tlQCNICiLAYkdxdTJkAg7//Qh19UftikNP3lPQxf6gRKuQGG1pgLcIbaAnt78DdrzCHGUdOeR5MCI+dsauhRU3MkQSWlUcwA9S4wZ8r9ShfYtXQtLzrV3sjzepSly1knEXddqm9F7NoaSgydHow6cGw/DTTRlUi+Ylb52C83iQl7Y8rlOAD6XBZ/dhl6JjhEbcqXidqYal/BDRWhwzzvLJ0d2+9mN8hMXtIb4OjXreEBflFhMFyewnNwmkD9lOsiOzHWMysY8DzFooVW2ZH89PYkBQMoEjkMNloiZKAkFK6Bi4ADjWICQq4HuiAUCf5T65lBgLB3e8uOv6uUHWeCuubwWhJb9jZ3TDDMLB0nCFBHjyqsS7tpwzZabNAj/ghu3UtQKq59YeefR2EGUNCv7dOg5VZbmDWqKdOlJgHn8RnDmRIBxyXlFM2MW67Sd4hG6Pa4PvKJVoxNKlsqJfSxsfJbjLjeOHvTnjGF0Y6gLTOB0jBhkZCQa9eo+uMCF2/j2AokmmKrg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007faadc-a267-4937-65e7-08d851a895e6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 14:32:58.6037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYIxbK5Kl08NsrwiweN2bZD+g7LPwHnH0wGwHNzQdCBI6xey9HGKi6Dc0ShifKHr3vC6PraJqFqKlkJEEYd3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Provide an option "accumulator_status" via sysfs to enable/disable
the software accumulation of energy counters.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/hwmon/amd_energy.c | 104 ++++++++++++++++++++++++++++++-------
 1 file changed, 86 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index 96c61784d05c..c294bea56c02 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -32,6 +32,8 @@
 #define AMD_ENERGY_UNIT_MASK	0x01F00
 #define AMD_ENERGY_MASK		0xFFFFFFFF
 
+static struct device_attribute accumulate_attr;
+
 struct sensor_accumulator {
 	u64 energy_ctr;
 	u64 prev_value;
@@ -42,10 +44,12 @@ struct amd_energy_data {
 	const struct hwmon_channel_info *info[2];
 	struct hwmon_chip_info chip;
 	struct task_struct *wrap_accumulate;
+	struct device *hwmon_dev;
 	/* Lock around the accumulator */
 	struct mutex lock;
 	/* An accumulator for each core and socket */
 	struct sensor_accumulator *accums;
+	bool accumulator_status;
 	/* Energy Status Units */
 	u64 energy_units;
 	unsigned int timeout;
@@ -128,13 +132,15 @@ static void amd_add_delta(struct amd_energy_data *data, int ch,
 	rdmsrl_safe_on_cpu(cpu, reg, &input);
 	input &= AMD_ENERGY_MASK;
 
-	accum = &data->accums[ch];
-	if (input >= accum->prev_value)
-		input += accum->energy_ctr -
-				accum->prev_value;
-	else
-		input += UINT_MAX - accum->prev_value +
-				accum->energy_ctr;
+	if (data->accumulator_status) {
+		accum = &data->accums[ch];
+		if (input >= accum->prev_value)
+			input += accum->energy_ctr -
+					accum->prev_value;
+		else
+			input += UINT_MAX - accum->prev_value +
+					accum->energy_ctr;
+	}
 
 	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
 	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
@@ -264,9 +270,67 @@ static int amd_create_sensor(struct device *dev,
 	return 0;
 }
 
+static ssize_t amd_energy_accumulate_show(struct device *dev,
+					  struct device_attribute *dev_attr,
+					  char *buf)
+{
+	struct amd_energy_data *data = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", data->accumulator_status);
+}
+
+static ssize_t amd_energy_accumulate_store(struct device *dev,
+					   struct device_attribute *dev_attr,
+					   const char *buf, size_t count)
+{
+	struct amd_energy_data *data = dev_get_drvdata(dev);
+	bool input;
+	int ret;
+
+	ret = kstrtobool(buf, &input);
+	if (ret)
+		return ret;
+
+	if (data->accumulator_status == input)
+		return count;
+
+	if (input) {
+		memset(data->accums, 0, (data->nr_cpus + data->nr_socks) *
+			sizeof(struct sensor_accumulator));
+
+		if (!data->wrap_accumulate) {
+			data->wrap_accumulate =
+				kthread_run(energy_accumulator,
+					    data, "%s", dev_name(dev));
+			if (IS_ERR(data->wrap_accumulate))
+				return PTR_ERR(data->wrap_accumulate);
+		}
+	} else {
+		if (data && data->wrap_accumulate) {
+			ret = kthread_stop(data->wrap_accumulate);
+			if (ret)
+				return ret;
+			data->wrap_accumulate = NULL;
+		}
+	}
+	data->accumulator_status = input;
+
+	return count;
+}
+
+static int create_accumulate_status_file(struct amd_energy_data *data)
+{
+	accumulate_attr.attr.name = "accumulator_status";
+	accumulate_attr.attr.mode = 0664;
+	accumulate_attr.show = amd_energy_accumulate_show;
+	accumulate_attr.store = amd_energy_accumulate_store;
+
+	return sysfs_create_file(&data->hwmon_dev->kobj,
+				 &accumulate_attr.attr);
+}
+
 static int amd_energy_probe(struct platform_device *pdev)
 {
-	struct device *hwmon_dev;
 	struct amd_energy_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -290,12 +354,12 @@ static int amd_energy_probe(struct platform_device *pdev)
 	mutex_init(&data->lock);
 	get_energy_units(data);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
-							 data,
-							 &data->chip,
-							 NULL);
-	if (IS_ERR(hwmon_dev))
-		return PTR_ERR(hwmon_dev);
+	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
+							       data,
+							       &data->chip,
+							       NULL);
+	if (IS_ERR(data->hwmon_dev))
+		return PTR_ERR(data->hwmon_dev);
 
 	/* Once in 3 minutes for a resolution of 1/2*16 */
 	if (data->energy_units == 0x10)
@@ -305,10 +369,12 @@ static int amd_energy_probe(struct platform_device *pdev)
 	if (data->energy_units == 0x6)
 		data->timeout = 3 * 24 * 60 * 60;
 
-	data->wrap_accumulate = kthread_run(energy_accumulator, data,
-					    "%s", dev_name(hwmon_dev));
-	if (IS_ERR(data->wrap_accumulate))
-		return PTR_ERR(data->wrap_accumulate);
+	/* Disabling the energy accumulation by default */
+	data->accumulator_status = 0;
+
+	ret = create_accumulate_status_file(data);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -317,6 +383,8 @@ static int amd_energy_remove(struct platform_device *pdev)
 {
 	struct amd_energy_data *data = dev_get_drvdata(&pdev->dev);
 
+	sysfs_remove_file(&data->hwmon_dev->kobj, &accumulate_attr.attr);
+
 	if (data && data->wrap_accumulate)
 		kthread_stop(data->wrap_accumulate);
 
-- 
2.26.2

