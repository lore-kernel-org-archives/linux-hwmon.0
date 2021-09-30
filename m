Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC9CC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C3CC615E5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348500AbhI3HH4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:07:56 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com ([40.107.5.103]:11030
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233661AbhI3HH4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:07:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieiceHsfyioeTggo5KNHbp3sdFeVfx8mcEVaST4AVpZLEVchrYuLyP5XdFNDEVonDa9Z0cvv8s45H0SmO+mWjeM/E8prEN6SUaJg2sU48EwKUU30y0S5d659IowY3S2yfm+91V7nFvgHWlV+l4v4GvFhEXcwnDI4Kp76VnMd+4O/ioIAlWoPRwWpbmZU7I2Kdl5To2NX5WJPEiV02X7bRD52/FBxUu3gJdO8mTFUORk0eqzeITvtjTK8sjaxoRhCIoBenDl5kCLFsgP1Pi8+8WpAwxuI80FrqpJ0OZCGOlr8forJOsnHlThvi0skfC9KME3U4luKI2RbVtjzF258fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVQmyDaJVfhwOs+Grk6RToRv2jXf9Pei35mQcbv81zw=;
 b=mGg1QKVm4gSphLcHuxir3+812PIMmUQhJTquH6u4sb5Wx2UXS4lEnJPeozAMQQxqSOwtz3ZGEtf56h9XDoXxHXY3tacb4iZuKjr8DcPn0wzHMfCsCG+dBX1EVsvEvOgsYSSgAGZnH/LxgF6R5YOc/h/rZomI1Er6EBsHazvFa0eYKdZUsbHMqdFEh+n6cyvCS/rNjkxqQk1Q86U5+tB/LJpykGmw/OdeeambSEmWanwgFME/uvq+0DIv7T4bA0EYZv0Mkjzd9xC4ziJv4yoWLY8/AFbbxXgsuTnJPZx2Bf/6AChKD3AWBBSgaVhTg4lRfbmC/4M6+WZpFbMuKL8Sjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVQmyDaJVfhwOs+Grk6RToRv2jXf9Pei35mQcbv81zw=;
 b=cekazziWSCg/ZP6lxYaAZV8pkk+lYQbqoWyhercsicmvjWkFefUp4NMuE/9MHwNgHbHm9esZvrO+S3syUR0QQ6twzSuZoSKbLRd+mrFwop9tL+V6LeSyvev6Z/ImvEIMvsqtD1s60h7MmdlNhZ5s4KsiM6PFFmTgQHVqbQOToVo=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8180.eurprd07.prod.outlook.com (2603:10a6:10:275::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.10; Thu, 30 Sep
 2021 07:06:11 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 07:06:11 +0000
Date:   Thu, 30 Sep 2021 09:05:26 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 05/11] hwmon: (tmp421) support disabling channels from DT
Message-ID: <598a707e6a3c41ac50f96a3d9087312122331667.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MA1PR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::25) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MA1PR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:06:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1228dc99-a348-4934-d267-08d983e0c8d9
X-MS-TrafficTypeDiagnostic: DU2PR07MB8180:
X-Microsoft-Antispam-PRVS: <DU2PR07MB818062363F8EBE8B72063BC8EFAA9@DU2PR07MB8180.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iqnrv9qj/6Zn3FtLHxJvoBVYxUD3GLIe6amV2lqyrrz0sfwWe1wl9CF88P1A4mVogBLk2HyFA2wzeo6fKurcHaNdX76PLATjnK18QBd1eNz5Beksh9228uyektU7Nz85vwfm5S6GQCIQcVSSWEP4QU/qfJhcSOAfCZVGU2zLLPj/0cBfPdt1EGC4UNmq0GyBUxkIedOSCyPf69DlkelWeBxKfctpnrjF+R6F+tSPMxiEHM5V0d8bMxfZkyy2M8wPN8m8NV71h+8sX3WiagfVjxn9jAJJ2J1EAeOs79Zd7Fxt3b5VntGTBF25GUVYi5l/Bz57T+oXX3hNNE7yb9At1AGDzsnR1qeUxALoLM/YiLI4Rijk/QEnkKhXnyP/uyemJw/sn3n6nrV2U88NmI3lHe4ZK4E+kQCPFecUZLStjKCKfwegTsDTHiNJi4T0CtAPr6GkvGqMI+B5gWG+zevslullNHUscNtxCcobZpqSpSBYcI/NFeR7PtyV8dCRjjQit7Bs6y2sW1Z5/3TCaQT5QQYxj2NRlhaTS/qTUY1mqmCKtTZa1KReZqZ7HxhTxeldAtZEXlSG10pZLVh3RCDi7Yjm0pg/5qZILYMtWwOnFJtBAvVt/9XNPy04lDVKhlPz4XLLJDPogLwjg8UA2oai26xaE8abvLZZ4pblJQVk6fd3zw34U5p4zEj9/O+H3slyEUdUXHtJBlERzqRWzpzB2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(86362001)(2616005)(956004)(66556008)(6506007)(186003)(5660300002)(66476007)(66946007)(26005)(6666004)(2906002)(38350700002)(38100700002)(83380400001)(316002)(110136005)(44832011)(8676002)(6512007)(6486002)(508600001)(8936002)(4326008)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mnQ9/9NX3lDRn7/ZZvcrOB7a/mFZUjqyVO6x/J7P8u86oajqC4+g7/cK+93a?=
 =?us-ascii?Q?1NPfuTZx9EHyyw5wLzT2eNiOySqeur7e3GwNs0OhPyTXePzMz4c7l/Il4iGa?=
 =?us-ascii?Q?GjFn7hMP8kcwVjEzm5JJmisWC+WSPXFlm4Arjnc7Jtoo//iqmr+fr1pbsNs9?=
 =?us-ascii?Q?1/dTl9U/3+syGVTuTXgKvG8h8+/WmgeSLZtD0FJYTkHJOAZfYQQVg8CPV35Z?=
 =?us-ascii?Q?H5447cZ3MZ08FdpN2osR8J8JzYyBJCzFTRPUpt94AgI3UGiI7KaYfXlNqtKX?=
 =?us-ascii?Q?6wulApa460sA9amXE6Gu+1J+Hg+1pszhtiMMgNStKLUvY4ECdpY9GT9A3jVJ?=
 =?us-ascii?Q?xMn1SUrnFTIEQ4EuL2aCdlUUsTEgqyirlGel2LcLJmQpeeDQVKDU/2F0uxUD?=
 =?us-ascii?Q?Xa9vl1llhkyhsR2wIP+WSGYx4O5M8KXo6Mcz3mUeFjk6ixqOubwzXre+qRhn?=
 =?us-ascii?Q?qsjYmx8iOXZp50Bnwq7RAFx9hDlfNKS8hSiXuwgpqnvW9kvBngCv5Jktql16?=
 =?us-ascii?Q?CO1mDrQZHXMprzkJ8xkoYkc5LUDy0YAEz7vzBe7pOBtTPSa79owsABu5z9GO?=
 =?us-ascii?Q?DcIU7VYH3pBrSLMUP3CsCF5uriAiz6Y9sPB1FqIjshgRhaWZINH0lZilDl/u?=
 =?us-ascii?Q?jJBcZA+MDrQhhupfiMn96WnqmnDXEOzmuE8dR/Qpe91JpLeQM2AsA9MDaZVt?=
 =?us-ascii?Q?Xqp+1NJPxDnZD1Xeb0ub4VkcnadQjEs5oMLtnzPgVH8fF/QGEa2mmsmOjLuR?=
 =?us-ascii?Q?8X5OSMgDwHsx9tuoEm6VC0AfrrlmxiW1IV1gj/tSkTALVXNBrllbia3gtYRm?=
 =?us-ascii?Q?IBzaqcywbGvdBF82+5qaMTmzYhT3epf3r9ZKdrClmXkmjYgM9hWJjveZYmmS?=
 =?us-ascii?Q?+Q7TF5ElXdV/jNukspiC4cLiVxMWtKmAuG6JxGWWgdjXeqzZo0PSRpLoyhsV?=
 =?us-ascii?Q?9ok04QRjWMQhRzDFMc4HlyjjzJf21pkEv+F+MHw8++d+Uie5EV0mFi0/jMLg?=
 =?us-ascii?Q?O3jY8FR7qe+XqdKEZrBrJ0fEfylGobHsei4kJamWD4D9E4WEjkZJPufNyUts?=
 =?us-ascii?Q?PLZ0XtneRcqaNkga8MmQSaxESGe42bAygF/3kmnscu840+s3Ded7NF5FH226?=
 =?us-ascii?Q?YRDO9BAxH7+vrSZPFbACQEZEQNPY5ZWuPRM6p2lgCUuc1wF8QabtW4+s/VTt?=
 =?us-ascii?Q?EP78Y+qPEoVCXl3OQa/AojaOyemOXQbBwpi3VV4zsiqc6M7BLSP0WjwQnNOI?=
 =?us-ascii?Q?dLQ0ug0/N6qOpr3K2gk9FEq9cHupYhgnq4MqCiq6dDQIA2EuSSLPRooPweLk?=
 =?us-ascii?Q?RDQiZH0aeJMQx32vf2B9pnxU?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1228dc99-a348-4934-d267-08d983e0c8d9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:06:11.6860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeHMMEkEKwgXSQ8i/nu01CPn0MVoKX4oKphnwC4BqO3gioP1jvGM72+a9ljR1FFHJF+T5tj7ta5pY23U2bZJMJcRaOVWSIIMkcQP7FddN8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8180
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
index 7feef60a592c..30b601c157fe 100644
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

