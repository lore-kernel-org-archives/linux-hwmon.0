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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87434C433E2
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 417D020760
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="cSrS9KXb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgIEOdA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:33:00 -0400
Received: from mail-bn8nam11on2063.outbound.protection.outlook.com ([40.107.236.63]:2133
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728364AbgIEOc7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Sep 2020 10:32:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl+fGalg6hp2fOG7kiP4wJa3fxN8szbj/IGjaSHmY42fExFdD19k5fMAgc7nv+XwBbwsajanjbQadIit9A4k6tVywJIeU9znLVNvvcssSY6SOg31LP6OUfKrA4IVPxohSVdiRsgMLLXv45sbwRpabCQ+YCYEgUYEjtlnLL3bVFq5oFIS/GlL5PmRieC/mGetUZj3QX8nZ4sskiAA67ekTj9BzoyfgHbzvywexAwRuvELeL9Z8E1YwCwC0sBLNzn8yAkZCXZYpUNCuH3degcDlOqG7DaHCO+Pryk9vgtPnsqtPucL/vBLjhYHXG/VpuGGeIimKd205WDdeHublqNLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dW4OKpuI0vAUXLtunRkn5QcoQInc/2TI2+JTMrRHwMA=;
 b=QIC1cAefvCtHhBnRzjZUTb889JV81SwAX8jeIa7Fy2wMEsfspcYJf/owLDDahMfAKFqb8fQ2oknEJyh/bkFrjHlpPa4MYrJ36HSLETXL+Y5J4GAlr5A9f22QDaVztiuSbuigebW2dMP7T+lVmWaDLfwLFrBzITdP5OdlApX2HzjUat99qAN85VfxWk91SlPTWzCuDTqdr8E5HQm+0KEMzTieq3q3GC+YyrN8hdLKsBWxLpskLCxBsQUHNxDf/9EcjjJ8qLsJ/slhjGBgbSpHBJXUpI71UMYmgoE4iqaoNcJuqkYPD8A7bcSzaMS1vgEdLMyky0Bnc1E+Mqa4pzcrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dW4OKpuI0vAUXLtunRkn5QcoQInc/2TI2+JTMrRHwMA=;
 b=cSrS9KXbFD7vFLP4CKnprAo3fwdAj41Bhmplvr/+BZxoCEpaWIsbLjS2hsEE2GZJV19/DHEI1MDqePUBwUMofDeBDpQPopngRB/dqnnayXu25nU3T5f4LczQ1Xd3Wh2MSf09IBybr9xY75/A9p4uKQqkvGysWSxZNhUls1GHipE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 14:32:56 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839%5]) with mapi id 15.20.3348.018; Sat, 5 Sep 2020
 14:32:56 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 3/6] hwmon: amd_energy: Improve the accumulation logic
Date:   Sat,  5 Sep 2020 20:02:27 +0530
Message-Id: <20200905143230.195049-4-nchatrad@amd.com>
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
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 14:32:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 325d4b30-0529-4387-487b-08d851a89459
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB311492D3385804440DB680E8E82A0@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CElCDBCGy7M9VxCIsWe+QS6YGSc6N1ZL5XSnzyGYKWK53EthHJe2wwIguABucyEn1c97XzCJjOvqQbmWYx2H1eVxE+Ha3woomxYtmpQkFJxiKwD4NxnyOCk9O5JnkW8zY5DJ7oKWq9UtYWWmVE//PW48zufOZb1zysb8gaFb6VWADjf7Lh0BWieo8mT1BRDJO+xxNbuPVqy5xPCvkn+l+HLbSIb4Tk1cnM1bz0bvk4tZiVo4oWpSiWDx6LL2Sao7+jV5afrw/7QOLZiUQt/SI1nYrK6eNJDZXNOKlmzgawg9zZ+zed2XRGtotU5jHCWSvATLbmziMh13bbEuzDY79A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(52116002)(316002)(478600001)(66946007)(8676002)(7696005)(66476007)(6916009)(66556008)(26005)(6666004)(4326008)(2616005)(6486002)(83380400001)(5660300002)(956004)(16526019)(36756003)(2906002)(186003)(1076003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: bnoFL7gFaWAjYnIqRYyM2zEbo7agiYj6bLlnDCgLnu3pqelZqGFyu25ZdYrWGGd30WuqbwuhUhWq3eB1RPdF11qnOnMr10YAMxoMQu4sgYeRBCNUpWxb4sOS3v7n07DACJpzaKUbnLtarlgM5UVUpI9piMHPFeqxqU5Z+pq5QUjGSAckWO1ksMtCaG1KUhmhsXJuLgw2eBCdJwJMCod7cMBmIQcuecGmpMS+u3wlNsgLPSAsJ1FZTFP6C9E/a+pINAn/2c74iY3EJU/EqKz3v8GuwoNN0jQUHOxHrzCuDFSrKYeLZHwzWEsuoZhfxD+1SI2NFndtqSHVsSNmhRYJBoTIdjvQoSxXeQ1cfST3qibZHmOVaaUG2Ol/H/Ingq+VAizx4ovG+0g2E08FEasqWAEH0TVpCTw5QrHGk2eqm//GDVZw5H79fi7tVymVE6Z+3zch1RoQG85nNdVYc7UkYzAEGvggL6KQT1Z/0POyBaoZApkEWPdRJG82lTIuCX3SXO7fLMqBU5nT6s2saO8Ka5blKNvipQ+Wb3sTygqzwRHuzUWx5USAlAbWO52bFkhn4ovUmkEede/T0A3x8rPtJq1+YLHzjWMV7rTjVQBb6l8PyBUEDdXJr0qGOIirFwk62zyEIMxyy1wnCllJ5oUKzQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325d4b30-0529-4387-487b-08d851a89459
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 14:32:55.9384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZVkcroh/GWlosWI9STVRiq1KLum7mWzNboKWdP2VkPPdGxdaH+Jx84zLpdlkUzZHo/Oi0DjKCBgXTLKC+szXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Factor out the common code in the accumulation functions for core and
socket accumulation.

While at it, handle the return value of the amd_create_sensor() function.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/hwmon/amd_energy.c | 126 +++++++++++++------------------------
 1 file changed, 45 insertions(+), 81 deletions(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index f0a13d6cc419..96c61784d05c 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -74,108 +74,67 @@ static void get_energy_units(struct amd_energy_data *data)
 	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
 }
 
-static void accumulate_socket_delta(struct amd_energy_data *data,
-				    int sock, int cpu)
+static void accumulate_delta(struct amd_energy_data *data,
+			     int channel, int cpu, u32 reg)
 {
-	struct sensor_accumulator *s_accum;
+	struct sensor_accumulator *accum;
 	u64 input;
 
 	mutex_lock(&data->lock);
-	rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
+	rdmsrl_safe_on_cpu(cpu, reg, &input);
 	input &= AMD_ENERGY_MASK;
 
-	s_accum = &data->accums[data->nr_cpus + sock];
-	if (input >= s_accum->prev_value)
-		s_accum->energy_ctr +=
-			input - s_accum->prev_value;
+	accum = &data->accums[channel];
+	if (input >= accum->prev_value)
+		accum->energy_ctr +=
+			input - accum->prev_value;
 	else
-		s_accum->energy_ctr += UINT_MAX -
-			s_accum->prev_value + input;
+		accum->energy_ctr += UINT_MAX -
+			accum->prev_value + input;
 
-	s_accum->prev_value = input;
+	accum->prev_value = input;
 	mutex_unlock(&data->lock);
 }
 
-static void accumulate_core_delta(struct amd_energy_data *data)
+static void read_accumulate(struct amd_energy_data *data)
 {
-	struct sensor_accumulator *c_accum;
-	u64 input;
-	int cpu;
+	int sock, scpu, cpu;
+
+	for (sock = 0; sock < data->nr_socks; sock++) {
+		scpu = cpumask_first_and(cpu_online_mask,
+					 cpumask_of_node(sock));
+
+		accumulate_delta(data, data->nr_cpus + sock,
+				 scpu, ENERGY_PKG_MSR);
+	}
 
-	mutex_lock(&data->lock);
 	if (data->core_id >= data->nr_cpus)
 		data->core_id = 0;
 
 	cpu = data->core_id;
+	if (cpu_online(cpu))
+		accumulate_delta(data, cpu, cpu, ENERGY_CORE_MSR);
 
-	if (!cpu_online(cpu))
-		goto out;
-
-	rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
-	input &= AMD_ENERGY_MASK;
-
-	c_accum = &data->accums[cpu];
-
-	if (input >= c_accum->prev_value)
-		c_accum->energy_ctr +=
-			input - c_accum->prev_value;
-	else
-		c_accum->energy_ctr += UINT_MAX -
-			c_accum->prev_value + input;
-
-	c_accum->prev_value = input;
-
-out:
 	data->core_id++;
-	mutex_unlock(&data->lock);
-}
-
-static void read_accumulate(struct amd_energy_data *data)
-{
-	int sock;
-
-	for (sock = 0; sock < data->nr_socks; sock++) {
-		int cpu;
-
-		cpu = cpumask_first_and(cpu_online_mask,
-					cpumask_of_node(sock));
-
-		accumulate_socket_delta(data, sock, cpu);
-	}
-
-	accumulate_core_delta(data);
 }
 
 static void amd_add_delta(struct amd_energy_data *data, int ch,
-			  int cpu, long *val, bool is_core)
+			  int cpu, long *val, u32 reg)
 {
-	struct sensor_accumulator *s_accum, *c_accum;
+	struct sensor_accumulator *accum;
 	u64 input;
 
 	mutex_lock(&data->lock);
-	if (!is_core) {
-		rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
-		input &= AMD_ENERGY_MASK;
-
-		s_accum = &data->accums[ch];
-		if (input >= s_accum->prev_value)
-			input += s_accum->energy_ctr -
-				  s_accum->prev_value;
-		else
-			input += UINT_MAX - s_accum->prev_value +
-				  s_accum->energy_ctr;
-	} else {
-		rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
-		input &= AMD_ENERGY_MASK;
+	rdmsrl_safe_on_cpu(cpu, reg, &input);
+	input &= AMD_ENERGY_MASK;
 
-		c_accum = &data->accums[ch];
-		if (input >= c_accum->prev_value)
-			input += c_accum->energy_ctr -
-				 c_accum->prev_value;
-		else
-			input += UINT_MAX - c_accum->prev_value +
-				 c_accum->energy_ctr;
-	}
+	accum = &data->accums[ch];
+	if (input >= accum->prev_value)
+		input += accum->energy_ctr -
+				accum->prev_value;
+	else
+		input += UINT_MAX - accum->prev_value +
+				accum->energy_ctr;
 
 	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
 	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
@@ -188,20 +147,22 @@ static int amd_energy_read(struct device *dev,
 			   u32 attr, int channel, long *val)
 {
 	struct amd_energy_data *data = dev_get_drvdata(dev);
+	u32 reg;
 	int cpu;
 
 	if (channel >= data->nr_cpus) {
 		cpu = cpumask_first_and(cpu_online_mask,
 					cpumask_of_node
 					(channel - data->nr_cpus));
-		amd_add_delta(data, channel, cpu, val, false);
+		reg = ENERGY_PKG_MSR;
 	} else {
 		cpu = channel;
 		if (!cpu_online(cpu))
 			return -ENODEV;
 
-		amd_add_delta(data, channel, cpu, val, true);
+		reg = ENERGY_CORE_MSR;
 	}
+	amd_add_delta(data, channel, cpu, val, reg);
 
 	return 0;
 }
@@ -249,7 +210,7 @@ static const struct hwmon_ops amd_energy_ops = {
 
 static int amd_create_sensor(struct device *dev,
 			     struct amd_energy_data *data,
-			     u8 type, u32 config)
+			     enum hwmon_sensor_types type, u32 config)
 {
 	struct hwmon_channel_info *info = &data->energy_info;
 	struct sensor_accumulator *accums;
@@ -308,6 +269,7 @@ static int amd_energy_probe(struct platform_device *pdev)
 	struct device *hwmon_dev;
 	struct amd_energy_data *data;
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	data = devm_kzalloc(dev,
 			    sizeof(struct amd_energy_data), GFP_KERNEL);
@@ -320,8 +282,10 @@ static int amd_energy_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, data);
 	/* Populate per-core energy reporting */
 	data->info[0] = &data->energy_info;
-	amd_create_sensor(dev, data, hwmon_energy,
-			  HWMON_E_INPUT | HWMON_E_LABEL);
+	ret = amd_create_sensor(dev, data, hwmon_energy,
+				HWMON_E_INPUT | HWMON_E_LABEL);
+	if (ret)
+		return ret;
 
 	mutex_init(&data->lock);
 	get_energy_units(data);
@@ -346,7 +310,7 @@ static int amd_energy_probe(struct platform_device *pdev)
 	if (IS_ERR(data->wrap_accumulate))
 		return PTR_ERR(data->wrap_accumulate);
 
-	return PTR_ERR_OR_ZERO(data->wrap_accumulate);
+	return 0;
 }
 
 static int amd_energy_remove(struct platform_device *pdev)
-- 
2.26.2

