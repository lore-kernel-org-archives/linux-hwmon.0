Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADB2C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:01:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 465FA61056
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhJNNDZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:03:25 -0400
Received: from mail-db8eur05on2103.outbound.protection.outlook.com ([40.107.20.103]:61153
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231308AbhJNNDX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:03:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZM8PohYkK2JmC+U3Qjw6U6lIBYIiB7pAWo6FJvjsOtGW99uz3lVooJgSAgxwDK726zbX+6TGjua8psxMQddDiqx4ChNFfaRryQlVOithbsEUL6qmhiUDNokcq9S9gp9jqjeO4ED0sD8JSBeOmBKsSMvUwg03XSk+UXXp/Tx6v3eNAfGioTJuIkJmFyd/uGz53iXA4aNvJY6UPvEU7RsWbkrnQiMtP+Kvq8WeA2bz0CIKPoRbDK3Pqx/vEnE9TDobDlIMFf57In70yqCgVkOrilCq9CpuASqsWaSwxHj/4qY/k8ozCUJjJsaskiym4GzUPJXdczGc3uhZYnZgBPBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRXSAuC/1/Eg3ZZvXEe4H9c+w5YM6cShbTJdO1H1RgE=;
 b=Nd8jrIyEMPorOox057UaX74eNDmZWqwLm06wsf9gKg2vkO/Zt620oOvdt4ztReQHyswhK9eytDxxo+s2aCjcKUPIbvHWtTIrCicJRP4n9gq9Y90xtmGFEYSjkv2gSl5Bv1sAAiq9cTkR/wFRoeklFD+Yo0RD8S76cyRVd3pKtWeai/dEC1lZNtUY9TzCYibmvfwhMZ69e93hm9yodlpKiKgHslsDxqgOE/EFIrBl6qbzAe3giM4g0j3IV7bhhFhgBenhEKoW/AdfBYcHMclgigjn55XMIYKQvBRPdtOJLrxQsZhqWA7jHMfVqAY3QFdQ+NvJkR79KyH00E2yBzWTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRXSAuC/1/Eg3ZZvXEe4H9c+w5YM6cShbTJdO1H1RgE=;
 b=d/7ROG0COhQeNilauH4Fm2fhtFw2KfFjbfvwCeuaLQicDy3RCX4nOgaIHKloFnQuVOXU/shRaDExQYB4lvnLk5XSAfo9RyqlcHNMybKFfSc0LMYYmFziFbJ37xL73PG3tzL2J6xD81kfFQqirCUN7uki9/RMGx5lIpuYtopxDxE=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8072.eurprd07.prod.outlook.com (2603:10a6:20b:35b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.16; Thu, 14 Oct
 2021 13:01:16 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:01:16 +0000
Date:   Thu, 14 Oct 2021 15:01:09 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 3/9] hwmon: (tmp421) support disabling channels from DT
Message-ID: <a85d623f0792b862870933a875bdf802f4c017f1.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::28) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1PR0802CA0018.eurprd08.prod.outlook.com (2603:10a6:3:bd::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 13:01:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 801f562f-0c65-4e26-2ed7-08d98f12b4f4
X-MS-TrafficTypeDiagnostic: AS8PR07MB8072:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8072A2769ADEE230187217C0EFB89@AS8PR07MB8072.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1tacQ7Mnzu6NGnd07pJ9kCSxreHFDe1Q6Y3AO+txke1sq2BNgswyer3k5DmC86vM+9WRwK5AT6oUi5+Ym9g4tkR+HnBRW0/BnGxj29SV/r6gviXxAKTbd5cbGbY6YT9sVAhTfLiN5GxgGEWbf3OBxK3GrLhVdL/J1L8oD7oFeUhzh+9wBHE0+K+NynIlForbi23pIcL6CpLonVN8PfXufxxZT8ZWXoBgNqsqjNQzZpSafaSFheSRW8rxTR2AyOVVEqpTI2g9OE4M//k4HG2U9Gop3YVSGKgnUCkmPWexiyNe4yHyqcgAZ0BF9l8mWvdxwcRocWhtGiFbMsy9uIAWkTW/7bigLdtopKAZeySES/cUvFn3XFwDANNPUXAGFudnM3lELr5Zy3MeA6SkdSHUkNKkjVMUo1bG1ykDHXmWAmwF+EzCHe9mCv/tz4bj7DTN5IjDGNuDjqhkPoqa7PPPc6KxR+XNzC21d2CkwqdkKDP8aoYUSyNnN3NZctj7jxjvpUHnSRqAl4cNfwsfKC/ccGXXa7mg7X5NSIM8XCBGY4CGWzzqX7upz11ghYyE4fkzpl+2Xp4FZh87TJjYNsb6U9CXRmCOb6Dtx3UyPuoMcx+ydgQ8wDbyyAXJBB5wE+QEcgUkEUbs1ntpoxJMapv/YyRKOEwooJDhTWQ9i2O2LpdD5AGpeqVdcd4CtChsZ74OrSY7JtVu7w0j653UpMG4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(66476007)(316002)(6666004)(4326008)(110136005)(8676002)(44832011)(6486002)(186003)(5660300002)(66946007)(6512007)(956004)(2616005)(66556008)(38350700002)(52116002)(86362001)(83380400001)(8936002)(508600001)(26005)(2906002)(82960400001)(6506007)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z3FAkjJAuajJXMb02a3XJi2QIG1aN7O54sy2Xke2jTc+3m+pJTVyY65w3jEr?=
 =?us-ascii?Q?G0xF6lXtRJMoQwNvGAtqLD1nfiVjDGJf+fp8RzZk5+SKvW/K7QzV0UrM+7dY?=
 =?us-ascii?Q?fy3PgYI87YYdQdBL+A4X63qTtOWwlkM6m+JvesJ94sja43FktMfmlEZGsVFu?=
 =?us-ascii?Q?VdWsewhBJCjm12iIOoZTCwPSEqeVOK9MtixKJjI6dYy9XSSztTszX9NrDcCR?=
 =?us-ascii?Q?Ukwm7NPaQVqHwDu2KORJQs6jcbVe6N3zD9oo7Y8v1G+8GBcEMK6qmGlBCCLR?=
 =?us-ascii?Q?bhZI3FQ60hANKDmVNW9ORN9w4yVmuBViPF0dQVsv0V9PQIgX/aCYkYl/kre+?=
 =?us-ascii?Q?fmxjZklfWSTuom6bF6MdBNm+LsC5Obd35J1JGJisosTyVXU3o+iVc85HRbI8?=
 =?us-ascii?Q?VJakkVtO8xGPh9LT0UzUUoZEisVfXKnr3dDt4EuM2gM2PI56L0MUm1EzQHVh?=
 =?us-ascii?Q?Hi0rj3xvJEb+O58irMka269IcAki94m3g7F93qfIcKwDNA3osGAhaP3qotoo?=
 =?us-ascii?Q?SJoyXcVDlJX7GoI4Eo1wj14hdg6TNM7akWYuR6xeOorpwjK/b1zqolXgBh65?=
 =?us-ascii?Q?heiFWyafYceokOAfjl2yXafq4rGEY+VwRaM4bogZE+K7yMiFLIM2AINBKxTk?=
 =?us-ascii?Q?A4HlSkIOeptDCMdCw385++oc1e1K0/bsXzaQnelOmIqV31dn2FY6/w0mvTf7?=
 =?us-ascii?Q?x0p9OGEjMEEIPl50qoAw1QpZTvFhQv0+0UuKFGfCDPXDbjKZ2f1XbtYgDhzF?=
 =?us-ascii?Q?55Efod6dsc6ZGFUysLDH3sUtl9btfXKd3dhp0KaY4A5AuiuYwS6cSUyamlJi?=
 =?us-ascii?Q?/Sa/VrD8mgtDskHmmV5ECINv9G1OV5tvzkLvWM74oJ2fcsBGtUSWuMWjduUM?=
 =?us-ascii?Q?1Ocb1bE5CDQ3BUHucMCEREyUWAwbeGfhb+9ylNPRlEeLIewBMNbRiD0BwoFo?=
 =?us-ascii?Q?7BsKcttwjqANdoPhq0J0uuqMhQne30hOmIvjRDeMrPv9t8pNDoIZT3Gam4W2?=
 =?us-ascii?Q?HVcPiHw6XR3qnaq1gU4qsTdDTjrzzuwX5skof+ce6jercHdBnsrZcruar1Hf?=
 =?us-ascii?Q?0N9G9seKlIBWS2ygRVwr7JC9uouGYQ8WiMpkC8uL0+BPmvmaI7HaUTlGXmq2?=
 =?us-ascii?Q?Wv+tzcltehfkDz+yvcHwu6+g0+0w0gQwSS20oCDEm9dUCWVFvpuYB+hto/mh?=
 =?us-ascii?Q?cyLcp99TpVDO6TRBKVv7lWFap9VLxFqQHYiODqszp3xibi2nQNNWTQofyDtY?=
 =?us-ascii?Q?aLlExZ/IO+03ThNXqAcMxZrKkXBxsOsuCurygzFY2WO9Zlb8tmzduiuPZOva?=
 =?us-ascii?Q?c8SxDOWlH1IFeY0N+yRNCEvz?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801f562f-0c65-4e26-2ed7-08d98f12b4f4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:01:15.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+J0tUyzLnnh85xrqqJ9jt36rjdz7QhhZijUT8llIpB2W2EyPi+6TD0NNmpcOtclE903MAhGxg9npPcTYjYs4hWlsRBKhmf08j3RKanipi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8072
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The previous patch introduced per channel subnodes in DT that let us
specify some channel specific properties. This built a ground for easily
disabling individual channels of the sensor that may not be connected to
any external diode and thus are not returning any meaningful data.

This patch adds support for parsing the "status" property of channels DT
subnodes and makes sure the -ENODATA is returned when disabled channels
value is read.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
  drivers/hwmon/tmp421.c | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 89346ca6c9a9..af08bc985a13 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -89,6 +89,7 @@ MODULE_DEVICE_TABLE(of, tmp421_of_match);
  
  struct tmp421_channel {
  	const char *label;
+	bool enabled;
  	s16 temp;
  };
  
@@ -170,6 +171,9 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
  	if (ret)
  		return ret;
  
+	if (!tmp421->channel[channel].enabled)
+		return -ENODATA;
+
  	switch (attr) {
  	case hwmon_temp_input:
  		*val = temp_from_raw(tmp421->channel[channel].temp,
@@ -323,6 +327,8 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
  	if (data->channel[i].label)
  		data->temp_config[i] |= HWMON_T_LABEL;
  
+	data->channel[i].enabled = of_device_is_available(child);
+
  	return 0;
  }
  
@@ -371,8 +377,10 @@ static int tmp421_probe(struct i2c_client *client)
  	if (err)
  		return err;
  
-	for (i = 0; i < data->channels; i++)
+	for (i = 0; i < data->channels; i++) {
  		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
+		data->channel[i].enabled = true;
+	}
  
  	err = tmp421_probe_from_dt(client, data);
  	if (err)
-- 
2.31.1

