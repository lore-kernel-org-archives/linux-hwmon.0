Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E1FC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:28:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AFEA6054F
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbhJLJaA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:30:00 -0400
Received: from mail-eopbgr130119.outbound.protection.outlook.com ([40.107.13.119]:38147
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJaA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:30:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqM0EGHJeiW2qXujlOTG03t/AAAs23U+TXkcwMO6M+jMoLT5LKUnOD9b84gY03ezLIkVCTfzjWRPWdY89qxyK7WP6I0dPlrLkzLQH2MwiOA1tOvsgMlOWdny4nR4DMsanHPlIU7r269+VjtoYvPeMTsZJc/5aM6XdDfxCQc2aTPWdtKIXx01JIwm/ZtZjbmKy5JuRKyPtDQh/23XH9mDrU+RL6uqgctboE91aHdjtBRdai1mlK1u1wgyPGUV3SSMj136xco11P1nRfjDiBFbgv6a6/7DH0KBicsqrB4FgqCz9QidAcQCufqHveyStOVQXedXUsNQXJ9dfdvRFO1gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fny/XgvYUhnFI4TrJOhfnCqXriDWjY+TXKIfZDSn4yw=;
 b=H1H4p5RM1QiXeLFh5tXy2ipgav6zMBcbfMpENsG6O5KLYzPdRc6Yo8S2TQgw8BgDNGRIzD4HiYE5vyIlKzOvokIB3e2DfLE4JP8gPQqChV31QPYs/fB/BHImmnr4zaVy/bU9idKqAu3zOMNKiQfhA95DpN5oid3gK2FEjel3XFf/KsWbj+rQD03c+sgw6oHJqqJkrpWiFdSoNcVAcgJjaZAVuIlKPnno3iCG3y78sleUMOcAoC8vXbTwfRhAHqaX7QnkVGN4S2iNLyEq2U2wsuZI+NC35SVOE+kVrAsTIbr4abJJeBwiBTLqT9ix+qXW8QVjyTaBZZHibF+kWlB8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fny/XgvYUhnFI4TrJOhfnCqXriDWjY+TXKIfZDSn4yw=;
 b=awAZoTgUQPr4aqTByliXBgw7hN5omArCdDBMeI9iq0cC8rXT+nONXYfI54cPR69/kM2anmL+TSN5qZGl/SEVDVcY8XXVab79JMivVtLQbZHanhDe+/HADQ+p2XZ4mi2CmcVRYSXb1v1Ka6tnJPAoZpsBN2v9fTjoROl5720qLIM=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8281.eurprd07.prod.outlook.com (2603:10a6:20b:379::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6; Tue, 12 Oct
 2021 09:27:56 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:27:56 +0000
Date:   Tue, 12 Oct 2021 11:27:52 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 04/10] hwmon: (tmp421) support disabling channels from DT
Message-ID: <8a9571a79408d46de8a0276703a3de28deb0c061.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::41) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0028.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 09:27:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a32598ff-4eff-4a02-5cb3-08d98d629309
X-MS-TrafficTypeDiagnostic: AS8PR07MB8281:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8281CDCAA8E1D630B0F3A866EFB69@AS8PR07MB8281.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5uZVPBoA2LNETTK7rmSuLg7q8tXq/NA0R1d23rm5iESL7gH8F7dr4yubdEc3lgyDEWANJLe0xTvBJ1nwoXhhBiidoSOEjSSupRiI7qbqlikJFzVkagy+Lk7Zl44hG05a/QqwAzAWPzKhUuXj/oah9OKLrAKJ+6JfCRyR7L7J3i+8LS41I33+eFd839DqMtRIPK/7C79zRcZuHTkQ42IHeDSRc2y+kb2IPGz4dVmU+M3LQz/BJWwEpk2dBVBl3TawWqDEXem+gP/ukkQ+85Da4DODP0H97Qp5cgvmbbH/7qC3t6sCBxAaQqsid6Matak7XXlSzxoO5plyJeRZ350LJQkwSWH39qpuH5vpaGu94soe+FEdbm4+f7YyNzNpj8dl5qhsD6QUj4Jl9OieT2QdQRJoiJKbki6QKmJZ5J6yauNGw8tZ8uFKK4/eysvq/U9b4BApnTvdps8xmb3W4KSFmroyFANpxYsQDvOGNZtAjdYptVFm6WksAMmMTZiIjTgyEZyOoaZa11ErFIGq53XcajkugET93A2goIsBTvRkN/FrgEBrvxbnxV9poPaKE93a6m+2t7nKu3nA37L+NapI0s/h4awPQq2UbvFyzu96K2jI/QjIoQ/z9WfQET6HBenhXgQK04+Bmbw8iu2g5QcvwOHv6ApYXW9iI1Wa1vOtumbrH/srPi6s4RYFIP3ig73sSp+KXcuSDfwYV9PdlXSLdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(83380400001)(6512007)(52116002)(2906002)(316002)(110136005)(2616005)(6666004)(38100700002)(8936002)(6486002)(956004)(86362001)(66946007)(36756003)(5660300002)(44832011)(38350700002)(8676002)(508600001)(26005)(186003)(4326008)(66476007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kk4Ubi1g/16/alQSO1VwJxh7gURyE9k+cKpi3+/OTunHmaQt2dZcmuUMF2FD?=
 =?us-ascii?Q?zevF7OQ8bLpEr2DBuhrpP0bMLm0pXUIjtH44InWKUN2Oa77DCXmJHRSLSGU2?=
 =?us-ascii?Q?mH1Vxjk6EqQXObNYlqva7iBTAiOoopD4C9uqFdUcMmeH4SoVxWAbhU1Bw4lM?=
 =?us-ascii?Q?axE4LeXegrjc2JwRrc2JLz6tkWtIKp0PE1UVC9jJcxN+rtBAxCBVYvO7DLHU?=
 =?us-ascii?Q?Fjvc3MNtd6ZKB+fXqfPQgSXPnrkocuzD4jFs9h8YXpoO6u9mZDRaroMBM4ar?=
 =?us-ascii?Q?nntV+0ZV15BSdIDZcscdZ6/Ev2GGIzliGIVMXHcGnuyTmcUa0oiBEMKzq+xI?=
 =?us-ascii?Q?4aYmHbqOcV2JVFw/KjR6VYBVw3grxrLTC1MAiaHrhyLcrPvLbeMC4I4OoGLZ?=
 =?us-ascii?Q?CzyaB2QO3AetHeh/Wr/6rorfw+LQsP8uHSRVxy6IMQ3d3qWdaDxv9mWyCT3S?=
 =?us-ascii?Q?2VPP30sO0ClVz9FKTbim44yoVvi3to/6RDs0tJTwe34kyYlr5xlYab7tItQ3?=
 =?us-ascii?Q?6QgM4x+EnxevAQZxqziQwpFo7I0FlGkf9YO3AnBDcsk5EsebkYV09cOMsNgr?=
 =?us-ascii?Q?xtTxslxzMo8WjsagzpTQACrjjYk2q6zT0ke2Wmcc1LJOskDbbqLSDUOWTVV0?=
 =?us-ascii?Q?/OZtUZ1jbAFjTcVx+V2dVJ0YAEYJfLrvs726f4yAWxteXjRX+YfQE9NzATnl?=
 =?us-ascii?Q?WrqeioOS4F4Fai2jfI8yjAH5Y7D5MQ5ze9BY/oBqzXvSQn9RQsj+/mZVSiW/?=
 =?us-ascii?Q?qPLj6uAezvhAct22vS1XxCAiJK/+F5Xd/WVePZ2Btn05tExZwv8LNGeGX+R9?=
 =?us-ascii?Q?/9wU/V4gT4KyD68bFNlweMshIHzaBCG20HF3ig+ai3OHSCVwy1zszUTWx9SC?=
 =?us-ascii?Q?PVRTPLazrYxb6xPnJdqcIkwxnq4+eFb9t7wndx3VP1UcUXs0QzCrKoEdjhhU?=
 =?us-ascii?Q?rRwX+UWn+N8dwCzrZ/yEM6ju0019oZ6RmwJqdB5mgHjJ4Z1s864MyfXD8JJN?=
 =?us-ascii?Q?Xrg0j9dqTDdctpdbq2Tx/anXNyws+wxWsHMyqL2sSH68xDLNZG9S+j7+a92H?=
 =?us-ascii?Q?Hk3dZwo97X2POAjM4pMX9cJLGBmSl+pUFndmFbKMzeUKnib8Vg108fQJ7l/g?=
 =?us-ascii?Q?sNB644jvRkMq3NVxDaMOeC3ob9sQcF1R9HQ4xaSlAupuPj7GbbYEv7u8aJB6?=
 =?us-ascii?Q?coHS1XdssxKzeEMGHmXIZ+v/slaJEPAbieuw+j0uyd2+LPt0zs7iv4WJUzfA?=
 =?us-ascii?Q?6iilnwu2k4x5rgEgkoTJE1LSLj/HLVUAW8Bj21NjCOBSubQQNUdzwLqrUGkO?=
 =?us-ascii?Q?FkP9DoffVnqwHzWH9w/bjT9k?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32598ff-4eff-4a02-5cb3-08d98d629309
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:27:56.4026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIPHWQLZEH0uIk2m9zFge/P8Aqa0tdzNYRsVxxVVv+n53fC5bEAU3hpeiF8b1EFYJU6orgtaIKXqL2GF4bQ7FyrGNokzbKaH2ZbKzqMO10o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8281
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
index ab64d9825ca4..fffffd671e34 100644
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

