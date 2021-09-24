Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D5AC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B99AD61039
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245289AbhIXJmP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:42:15 -0400
Received: from mail-eopbgr70121.outbound.protection.outlook.com ([40.107.7.121]:24644
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244969AbhIXJmP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:42:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a52+SDzIyXKHR3KywB5DJwFyG9KZF9UMdkcu1P0upRj+68aX1UmVpP2kxdEDkFc4wf/yPWnaQ8SA8BqvCrn35MGwR0kaojhBWJNVneSDRJ4CgQEx9HL0AJKLOTG7pyDvaCC99FJjfXkEU7Zx2X9/fN4BE/BL6a97FKkmnezTrrcDDQMHPJ54WN8X/t7XA1H+4B6FvHb7ckmqdhQ+RcHRb7bESkpCdfmMwl0jGVZ3YF0CJqsHzwD3H5jjkbrKaXwzWlDmuG/fWFCdFRmYWnT5uvz4hdYkxJU31NY8b0K8VPmOKQ1Q5csrSRJQZjVa4mxWxK4UVaameyE/di5+5F/jqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yTpV4oZ1/lJM5wqlt6ixZaVmPvD3mUiem1pkDCZ9rQ=;
 b=LIhQXTzOo4zz0jMGvxssN6syrzuFe/7SuC+QPuLmrC56xDAGu/hz1zmlKQYI9Y5jAmWzCs+X+2FrK6glc4Dn7WXofBiChC0C3kaM4wSQqF3Ov7uj5GgZKKnZ6WKh5+3e7XoY/Zz+Jl+Ldwtq+dd5c/TQxXywVIrr5CVORr1kQdibKFrjGk/8DL2TPFcvIGOtLhCQRx6WGSK6u4Q/uBtZnZkbgr51G02uvESMpGLGqRNkeoXU9grAp5cZ/+fNoLFRUDAyQJ/V5NCuAyRfy23HuvhsauZcl1Wl1Ahn1XTMgEBfYW8gkCPTiVb7JZd6bzdD1Rqk9wfIwNrru41ota5OHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yTpV4oZ1/lJM5wqlt6ixZaVmPvD3mUiem1pkDCZ9rQ=;
 b=Q3r8ljnKWIbQXiIfvr6tVxR2jS4qq4X0V0AONB5romCKGv9HBZFbFJ3BdNirM1cFXmbJ3ZRAB5Fvwudxe117e5VGFJOpX05GQJ6u2BhrpfXKRyZpnz+wp0Nk2HVw6BrIO41qXJW+RpzW4Q8/eL5BfGKS8dBUTCPEAy0IC3S4adg=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8286.eurprd07.prod.outlook.com (2603:10a6:10:278::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.16; Fri, 24 Sep
 2021 09:40:38 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:40:38 +0000
Date:   Fri, 24 Sep 2021 11:40:03 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 05/10] hwmon: (tmp421) support disabling channels from DT
Message-ID: <aff290ac798325c45cc54e119b4cb37afe677123.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0136.eurprd05.prod.outlook.com
 (2603:10a6:7:28::23) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0136.eurprd05.prod.outlook.com (2603:10a6:7:28::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f22330d-5861-437d-3ed0-08d97f3f5db4
X-MS-TrafficTypeDiagnostic: DU2PR07MB8286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB828679CBE4D260F0CA5DADF3EFA49@DU2PR07MB8286.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wl9tp/0sPH42JBsXjxuUEYyhDYLMnmhUPvBnGGBdsR8ygtA9R4Az7V3E2iblVQlA9efD+UEPLuWrb6JFlXvunvFEtjsD3aj9eJQndJ8Gz6iebgoMtC69pivKy7ne5g52AOx/L0oB4tawraJQWtA5Y3Wxd7wKn1E8MPrwCHysHGDAToITZRlNAwImkgknko6eXGaEbirnKs14I6YDUAnR8ITpIaRB7pU/LwD9RXIJLnHzL6fCTc1wjdJ1pInns1BMlwYRk7YnKt1Mjn3fe9xMM7/tCdDbfpPIYFVBhemvyl0NMxopatWvEWCRtPtEnue1aRwGKEzVEFgAj/BbXZC+dkrOmhHbT82m4lDr/dNJoTaw1NUr9QMnIMYWG1UN0evrHOA1qS2bQkxn1XscDP/wBt/7JEwnDQHBzSM/bsQiDd1B8i2c2fLzJB+psFZfPfjpxGM9ZKD3aL5bLS2CqWg60PeANCS1id8sZADp96gyw1zsHuNe1BnU8/pH0dg6Km2BfEQ1N9zsHfJ3p+tkMOXoDAgTTQIZ1TpRhicJnkDpq0hRojFcoP+fRJDsN4oErsvpTZN76kNc4nCz7OJ0hcIrGMnGCMIMrzCZTeWuCCQr1bxBXxSe341+bRUnfuDK8IgaVJmny5bO5p5BqJIr7T4l2nI+8zcrQ0Hw4yT9cPdjlR6a9Aqdgn4/6qc3tGauwLMLzkiGccvQyXHEboUt5Ld7+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(5660300002)(2906002)(107886003)(4326008)(6486002)(8936002)(54906003)(66946007)(6512007)(83380400001)(316002)(8676002)(44832011)(6506007)(36756003)(86362001)(508600001)(66556008)(186003)(956004)(6666004)(110136005)(38100700002)(66476007)(26005)(38350700002)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HRIxW4gcFqDy+FH/vdHEQeByQW+4XLBabonM6JYctMWPeMuHsgAcryaGwgzB?=
 =?us-ascii?Q?NSaIluSimb/vhyTAOldgiOO2UMBXdAHTZAP15vw/Ywy0ZWLCmBQLciYMuvbK?=
 =?us-ascii?Q?xTh4GYCj62pzgNWdk+/WVhm7lYbC4QDXysiTuQ/grprrniTwSUGs2NpJ3s3G?=
 =?us-ascii?Q?ItLpVkz+c+8AHFzjRyrZCtt7IoCDTxMntgjCbAUUxJslA+IBj7xBtw+YnT1P?=
 =?us-ascii?Q?G4UlQUYl7S6BLKWRaVF/6eJ07I0+M1F7OiWT9XCl8alyBB3+rXRx4TNdWmfu?=
 =?us-ascii?Q?1sw/VQXSCvUSm8BwrKW5uiGzPGIM7P0nhASEkFw1ezYvQrwrDxXNHmvfYeWU?=
 =?us-ascii?Q?zRNdDFc0+Gaa6Nrh2LmRYffxwcwwSb/xh3+yrCki2bRbCZmg/8Q1v5DTgup8?=
 =?us-ascii?Q?hJpsOQcigaPYHHhp/rMRE0DWrlxsXYQcZRThVYhuiniVg8ko2YJqzDqqCuOO?=
 =?us-ascii?Q?dWtjO+SP0o9AYU2Ueo2e9Zo9aj9+5GfkNflUy54gMAq3di9IvU7Y5jkCRa+r?=
 =?us-ascii?Q?D1uQTHibAv+YrXY8yvxKhxhhrFxdEsp7mou3EC5lHH6hi/O6ed3cAt6SYfgn?=
 =?us-ascii?Q?iYpIKtPLHcg0zuCuIQJ4X4LvBuY6IbGNeRF5PPwb8mnITPTHMD3Z+m4jRz5h?=
 =?us-ascii?Q?Wm39+dDFwdrOpokH/upgT3elI0GqGpCvb/3hBOfz+92BdDMcE9M122KhrnM2?=
 =?us-ascii?Q?BZnNoIvzb2xu8YQfnNeBMtGQyCcIDabOFkjkbOYk49vRIjR/ksyjoMktyqMv?=
 =?us-ascii?Q?S5mqTPEvH1EpcXkex5xcEvYHC3YOIVP553Obz/LlsnWRk9yx4zVkUQmz13UI?=
 =?us-ascii?Q?12vxMmlB1gygmZg5rvg5TJ08GjuCaM+soqP7eGlcZhUN/miFyz6I5ZsbjlEl?=
 =?us-ascii?Q?JDGv85/7Gp4C3w/UElLjkyK5GfqW2jroKPlv0bvPQF/SFUywvlQuvrfghJbR?=
 =?us-ascii?Q?tLmozoSb/2cy8Er0t9lAYlp8CuaCpL0NMESUGgQODvsitN6KLjWjBwOdL/dT?=
 =?us-ascii?Q?TflK9AZbFD06CMiNsK6LbnwfLUB+riW47x25seG1vdUrYIpMaAG2/CWWTCda?=
 =?us-ascii?Q?y3kt8sfFbCYdlmcuGigF2FvTTN9X2Aub7f2zJOme79/rA2b/IUWtQ4gTqy3s?=
 =?us-ascii?Q?KqzkgCTNeuWwvWM7A7tQmE2xRD+NyWv/zFCYGHN9UyaDNna75NCbIwIYlhVt?=
 =?us-ascii?Q?OYuqzRYBmH154PBlSECbwOcylAm6CLTRHbrLeX2Px8TLL+A5Acz66G3lCc96?=
 =?us-ascii?Q?F9ZEgTKfnv3s6D2JCVV6EJGvuDEBXLliorJk9DvsIJkzzj5n6rh8pxJ4nJbo?=
 =?us-ascii?Q?yCwoU+lhtCKTsfBDz5uCZYtd?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f22330d-5861-437d-3ed0-08d97f3f5db4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:40:38.2760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHhUoEqIh0Xhi831pMqFWymePnDcoZAf0mT6B+EQZBy5/HRBnREmrONF0BnMWM5hfnS+k+lCHIeFfbDBQdHzj2NiRp60jV0SsFcGs0fn50o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8286
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
index f9f910d60b12..5ff60b366be4 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -89,6 +89,7 @@ MODULE_DEVICE_TABLE(of, tmp421_of_match);
 
 struct tmp421_channel {
 	const char *label;
+	bool enabled;
 	s16 temp;
 };
 
@@ -158,6 +159,9 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct tmp421_data *tmp421 = tmp421_update_device(dev);
 
+	if (!tmp421->channel[channel].enabled)
+		return -ENODATA;
+
 	switch (attr) {
 	case hwmon_temp_input:
 		if (tmp421->config & TMP421_CONFIG_RANGE)
@@ -316,6 +320,8 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
 	if (data->channel[i].label)
 		data->temp_config[i] |= HWMON_T_LABEL;
 
+	data->channel[i].enabled = of_device_is_available(child);
+
 	return 0;
 }
 
@@ -364,8 +370,10 @@ static int tmp421_probe(struct i2c_client *client)
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

