Return-Path: <SRS0=NIjz=DG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3234EC4346E
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB427207C4
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="DTuroris"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgI2Ky1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:54:27 -0400
Received: from mail-co1nam11on2053.outbound.protection.outlook.com ([40.107.220.53]:64809
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725535AbgI2Ky1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Sep 2020 06:54:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icMtvZQmkWT3z/7ixhfqnzktqiIP5cKMEMRjHvXgsCDfNco1A9Rx2oRomEOBdxssvVKrvKJ7ttxmVQcOZ0cc9tHJM0LRbnkgdN8cVbnPYJBCM1t+rRDLGgxr2eCy5hyZ+dfyT/UP1QQZmug4z3+HKJU1RGtuS/uMYGW7VkUg62mq/2omFNUyGlARIlOdIdep9ar468WRJoLo6tJqFcO+URN/MsQvV3hyUTi7GsShElmvxHfBZdL0zP1eJ+c3E2FncZuBu48wpBTHm4OAOWw0MGz00xeOnCslcIDRk5q5Hu8aGDXxS1dFeWJECMRtI/59U7TF7G1z5jkPAl1CvsJWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPtP89LYKGNbdvqAA318yGKkj8+mK8BIQZHIA5sufN4=;
 b=E5CNBKyGXBFWkQ1gDj3BsOYfqik0LQywu5zh7zrdxJjtQkUCDNsIesf4R2vjgOFJjD3nk5fNuiLDvtRMl8m2w7Enz3HN7hfttV71Tg8/9uIexUhvMoQZgC2Ari20gNJxtTusFX4lFqdxDNicKbVhrGV5U7fhwMWRhvwdwuLrRjwOLxFt+W5PCxjmZ179qnk+y2uZi1Kk1kBcSQSwbt1aOtRzxjPXYWPJh34NUobZSJqVJgIotlSBZQoRS7lwsU/Upx29l79ciuJ2+plrJE5aAtblykUR0L8seJEwFhmQRqNah6Z3HUd5Fvyu4K2ltbKzLbSTfanT3KYySfMJVJoVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPtP89LYKGNbdvqAA318yGKkj8+mK8BIQZHIA5sufN4=;
 b=DTurorisfVt7XjUwr/NtKITwCIDrvrF91TEq8BY4R20fGdarDrNhQb3qcL7I+wl8W4Y+b25hQpXRBgbu+WMtW2rbbkZId4bWs62DwzFMPnB4brYSDlGsd1bAAxdHDnokex1Zaf7Dt9yQmabperfIgPuaWA7SEdKuyVpHqnlEvWA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (20.180.254.74) by
 DM5PR1201MB0105.namprd12.prod.outlook.com (10.174.106.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Tue, 29 Sep 2020 10:54:24 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 10:54:24 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 3/4] hwmon: amd_energy: Improve the accumulation logic
Date:   Tue, 29 Sep 2020 16:23:21 +0530
Message-Id: <20200929105322.8919-4-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929105322.8919-1-nchatrad@amd.com>
References: <20200929105322.8919-1-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::32) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Tue, 29 Sep 2020 10:54:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e59306e-ffac-4093-98b6-08d86466072c
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB010552DD30C983093708C8A6E8320@DM5PR1201MB0105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:245;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzldHhMYaIUGWpc2Q9Ej8JN65szm/EsIhtpGIj1+Bx7xMf/MpJBaDP35Zc+6m3CwSey1UfHUykPKnu5k0aclAuVgfUo9UopLPm7PTVNn8O6yoWrsFW8yi6JpRVfbAD/Ui8/u0N65FiJjXldDBWubjy95FHsG/lE2at0WXudvEyCAVYeBwy/ci+kWs8jJLNE6QZTFxGxRLpmn3elwHabRlPsrear23SRqzJUT79WiLCw9TWDeV+ta+ufclTPGsFyaz6My+h+21pE1w3KdQJALMT79BZXzyBao5XM3qIrTdzNJ9HJ2nPfszvJa2QFC/q5E6VoDk3f5+wffT4nWdwrp6iY4hDBomalji/pBx6/4p4H/D0oleOSWW5NCnoCJsJhh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(478600001)(8676002)(1076003)(316002)(83380400001)(66476007)(66556008)(66946007)(7696005)(52116002)(36756003)(4326008)(2616005)(6916009)(8936002)(5660300002)(2906002)(6486002)(956004)(26005)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cOaGnEKgIoalOkBCniwosynb85mn4I/hiyH6BrRrBNj7RPPWGwmGiOdU7y9Hn7WuUp7vV0D8QpfZLDdD5TjttZdbQMIrov1mGDYsyxLGTSwarn7idDQHhBNHnK1TKo7F3joZWd0hfK4NfR9/Sa88Y/2ZNCkG7IY3dd68k7QgB34zd1VV9SxoOF+U83iFTcADb5ypeZJrMuLxcUaoGd8rne9LzyvXbQBhEzPa+69gOmE2d7bXCSWS658QL1WFTvzKrCDR7rgr7dEF+ZlStIMToznjm2J4MxOuNyQFgOhAuvEfimAmCA7DaonuCgmqo2BifrOA9Venx0f98YLQcz5g8VW1ejzlDngqwVbAQmb6GI7UUF0I2jetdiGv/d6rRC2RXJSns065b7Baq6DEFWQ6Y7TVtD5az+OT1umifwJgAsu+kuC0Oa6HiQmGMhGAR3uiBOf8+pJlsB92MNdWu4sFtekGzRbiKj+EQ13DocbKkVxqrEmdzh++hg6ys0qa0SKKdj2mP/1FgxfVPKhXFkb0zrn8fOWns4AqxVMl8lciCQ7++xN7WH3MnPeKeiBVIxinxYapKjjKMjeNMzYe2vogF4MLJvSD9JNpMXYjgCAxLnMSBz41c8liqHZNLpdQKoSEwi/LJRDC/M5epW9P1Lvsrg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e59306e-ffac-4093-98b6-08d86466072c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 10:54:24.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4Zyh5hWCV5gnqocY59NUjYp+DpF2F9Tbh9l8pfVyIXVNsWtvZ58GQ7Tizo0i7OGnkCs0Aad8CQLRL/r8uhMXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0105
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Factor out the common code in the accumulation functions for core and
socket accumulation.

While at it, handle the return value of the amd_create_sensor() function.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
1. Return values are handled in the probe.

 drivers/hwmon/amd_energy.c | 126 +++++++++++++------------------------
 1 file changed, 45 insertions(+), 81 deletions(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index c413adfc6a73..cbc6a6e466c5 100644
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
@@ -242,7 +203,7 @@ static const struct hwmon_ops amd_energy_ops = {
 
 static int amd_create_sensor(struct device *dev,
 			     struct amd_energy_data *data,
-			     u8 type, u32 config)
+			     enum hwmon_sensor_types type, u32 config)
 {
 	struct hwmon_channel_info *info = &data->energy_info;
 	struct sensor_accumulator *accums;
@@ -301,6 +262,7 @@ static int amd_energy_probe(struct platform_device *pdev)
 	struct device *hwmon_dev;
 	struct amd_energy_data *data;
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	data = devm_kzalloc(dev,
 			    sizeof(struct amd_energy_data), GFP_KERNEL);
@@ -313,8 +275,10 @@ static int amd_energy_probe(struct platform_device *pdev)
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
@@ -338,7 +302,7 @@ static int amd_energy_probe(struct platform_device *pdev)
 	if (IS_ERR(data->wrap_accumulate))
 		return PTR_ERR(data->wrap_accumulate);
 
-	return PTR_ERR_OR_ZERO(data->wrap_accumulate);
+	return 0;
 }
 
 static int amd_energy_remove(struct platform_device *pdev)
-- 
2.17.1

