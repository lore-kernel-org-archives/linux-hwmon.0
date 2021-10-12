Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA9EC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C974060EB6
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbhJLJ3X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:29:23 -0400
Received: from mail-eopbgr40135.outbound.protection.outlook.com ([40.107.4.135]:22139
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJ3W (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:29:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl3dExUNS+aUi7z2GFFoGGqM7eKu9sASifIvduC/RW18jObo278Gn40nBGaA9wlAcPBQwRYALAcWv1SGAVCcrZob18w6SBm7Ubl41GIn5/j8L6qqWVqolFCHS17VDV2pfmanOYRZPiXd1NUQvhBZWgbMgAC/eQpFU6Hb4IYELlJRLpJibCZvpEBmCVSLdYFG2p0w+j05KXn9gLQ4BRdKLPKEaudyg6xNplOvCfZDj2boGWb86KsrFFPL4XmMIsilAKyhzxHfn4kd8KWpsd+wkRRxCi8cDPXsdh+ZOu+499hzD4+vVXb2J8eIwipIRr/gTdNsrrf+lEifAT6Wv8Qh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtGDPXxgsUTM/W7IU/tDKDItKRtcF0xMo/xYd7sMwhE=;
 b=WGUlUYeUwGYpY1NqLdqByyXrfzgSrlwRUmX8mMx9id4IN1+jLP3sm8WEhzTxjEuukH7eB0m9deIPwvBwzXwVlND+iw+58vunf38HX4fRB/W98wAESkTIrTvC5cHf35VIboJASChQoTqFSEZg6TP+t5VFCpnHxQQAhno9RR905lpuI+THmin6OE2QWVU0rw24whBM7uvtI+PZ+AEvklCQSdE2fIg+kU5vr5mG9XSoYKZRXGzZ/6p6eY+u6ck8GlTff15HLcvqb5nwt6C2JyUG/rnaxsbdipC6WTENvguFZdxpcw2La1XeP2tzIw8ES+CyGC9XJIDWes793XnrTievow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtGDPXxgsUTM/W7IU/tDKDItKRtcF0xMo/xYd7sMwhE=;
 b=tZdsvkpBxk6jhoTYSrkIxh8Jm+GPAF2dfAM9KHJ7j5DF/N76mmMAFBVtQ37npzCENIG3qonr3BYGlmq8LtSo0RD2f8lLdY+MpH5CvBucgCmLQi4XL6qFx6Y0WkhjcMrxgiwMaBzvN6JyjjfgXXISUNB9oUgJKXd/JupA0pKrHYw=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8070.eurprd07.prod.outlook.com (2603:10a6:20b:359::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.9; Tue, 12 Oct
 2021 09:27:18 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:27:18 +0000
Date:   Tue, 12 Oct 2021 11:27:14 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 03/10] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <887624ff580a34d3bb16d03228234bcd1635f3e2.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::33) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0020.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 09:27:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c3c4e7b-b66a-4488-7ed6-08d98d627c3d
X-MS-TrafficTypeDiagnostic: AS8PR07MB8070:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8070B441133CB1E89B36FAADEFB69@AS8PR07MB8070.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UQXoJcMhw6dJg39YAwYTxGgi+bBuwlcM2SZpCOVImTXg4KNmh1kgXGDvdPYtZRJdJ6+nwFpHXLvUfpVP2v7yC9M/iYrRfF7Hqo8LW+9nWJUQM3RRCoJLc87AJ2jOU6K4m80zTALnyInUaCpyqSZTOtHRkx3O67ceFj2wjBDN/UifCGgz2HuOtqxuJ64piTpeKZjqIkEdSoUJjmyphnIt1xk3HMalC0IYpRFUPOyoiZi7Z9ohCAMGV0c7zNinrs1xoYSCXVkI3eRheyadFYvLqmhWBEnxSIA4RM/nwal77v/UWL3+hsU9giuXEbLy1/Ru6V9ZO/XoamqBFN/T3Nf2PONT1xAqQ2Qb2k8opmfCXl9EOjYeL43VCSDEXZFe4yDyiI6AhW7NDMSNKWE+O9399G9BZiRVBlGEb+aqgJnZ3jVQ94BjJh8nbp9TmkdAyDmMTaFFzjWMTR85TLXIbjdaf6tbOd72MvhMkh8biJ4pWvFFZlYEsVu7xh72hNcqAiqpxEwUUjttiQQvzAglFrAS8Lt6YBEsYjrYaCqcGs8Zzz90INbEbmOGrKozWw7B4uNdHoEllkZutg49LbcP+cRIPQIcQyQEfvvsoLz+X4qPdKncq4yK3AZEQKmx0ayVB50ktvMf9Ct7KZ2S7Iuo+XYFnrBnqcMgrzr1DC+iJeRdabmDM+bevX/KhBnmgIlUk6sqsInpf4AfAVRGuI9Zc0wIVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(38100700002)(316002)(508600001)(6486002)(66946007)(66556008)(66476007)(83380400001)(6512007)(6666004)(36756003)(5660300002)(110136005)(6506007)(8676002)(8936002)(2616005)(186003)(26005)(4326008)(2906002)(86362001)(956004)(52116002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z3iphHjhFH7H9l6b5w9lvGwUitLf+gjBBOu2UTuA9ihh8/FEzWiqG73dZNjB?=
 =?us-ascii?Q?f1lKa6kP+Cc8bsodKH+CT5Huyz5JLapCX2AFBJOWvYCllmT3NNNsxgojvzei?=
 =?us-ascii?Q?mdyXEgDKNLhltN/ivSzAxCd0js8OuEKcVzZDLaHrGYyRgyliQcEujUzi08Ch?=
 =?us-ascii?Q?lHK5hVp3fz0eDyFyDdtei63shYNyWm3hCCnvFDeblO1rWgbe7uaa2+gOZ0L/?=
 =?us-ascii?Q?9I5scDLagbagITByI41I2ry4M0/1wv0R9/P/YiAi+LRPrm8EtoE0OgicUn8K?=
 =?us-ascii?Q?E6Ao2FfXy6ESJsbU3G8tbDADYeFFxU5uqUgWvIKOKFF0lO8YYjZ5rhkmlVVQ?=
 =?us-ascii?Q?EHLNeQmw5Z08nTMEWvUmvy0/mlzPykMblDFojQ+dd5Dvt8qQC76IYZpJ5fZ1?=
 =?us-ascii?Q?/YlPP86JxT6DEhC/PIfngFS4xjXt/5eh/2IeINtd6WMCdyYMDMvvpKCVnR/J?=
 =?us-ascii?Q?PuyimjtfT1XgPiOrP86C2Df9g6W/40uMVGHXK5gx3Uy8HVb8sNmvu7E744eL?=
 =?us-ascii?Q?ZuZ0iCP9SVFfd3QTYFV39xG8ghYKUuVzR2uuTD3ueuzhj+h2gHBBpMKpJpui?=
 =?us-ascii?Q?Mu0IWwScW5udXpt5vVLX3AeDMmPXMjRmI/jqgz1K9muCy4zUbcOdRiW5Sm0Q?=
 =?us-ascii?Q?ABmxY8ZewJcC/wy+eM0FgyB/0GC7vca6pmBiMeHlSwDeHqthYipZqcMTK/ny?=
 =?us-ascii?Q?MsjolbjZge9d6zZoHt53o1OqPjXzjQ/vVurx+Ubr3vMds3oBqdsScFclIa4b?=
 =?us-ascii?Q?VLNT7loNUV4xcIPlHYnIlIYTEw3JW9Fob5KPXxuM3g87alEafWr7BfRB28PL?=
 =?us-ascii?Q?PXsx/uqVIozGgJ9+qobPA73/VNLJ/o2paqIRF4IFyPXvinPdSXwpvxq3OIlD?=
 =?us-ascii?Q?dfEVVuoT7zSWM+fPyhaA80+VcFe4wbkDU/lAF2qqYxhPuYxUdrv5c6qH7Lho?=
 =?us-ascii?Q?iGv9X18XYxn1qX+76GavN0hzOUM9zdZb5ydyZUeulrOjq+Ql32ppNWAbVRAs?=
 =?us-ascii?Q?dLERAll/KlnI7AgbKXCZFNsJs464JETSs8Oyyf4ZZM/9+lOa3Aw44B0EIZjB?=
 =?us-ascii?Q?6FhwUDY+VGIYal//ckmqURjxFVLsZ0Y22cOEsJ2gaeuK0K1pe6UM6CFSMQZV?=
 =?us-ascii?Q?c7uxkCfdJu4lXhjTvTmE8FiGm28YuFJyBROAPJdo9MB4w0+cCTkn/HFdmkN0?=
 =?us-ascii?Q?Jq7hFpcHPZvlgDB8c6gNoEVaPCZSqiSW8zVhVvwIoQiPYJ4SYOtaFoDAsJp7?=
 =?us-ascii?Q?A9WmbYXMp8wS2xUavPzCrEv10TSeRwsLqSbeu7w8CCl0DohIED7JrxD0lCtg?=
 =?us-ascii?Q?AhjYyoW57Clb/g4IY4bYib/S?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3c4e7b-b66a-4488-7ed6-08d98d627c3d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:27:18.1347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zjEH7VFcKmWXGF5TY+IRA6V0FIIrSI47Mt95tOXTAzYy4leKAD38KsiPZSGPjbArLJtgm+OWQ5xvwit/uVKYlxzykmIM8KiQ9ogT601ik8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8070
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tmp42x is a multichannel temperature sensor with several external
channels. Since those channels can be used to connect diodes placed
anywhere in the system, their meaning will vary depending on the
project. For this case, the hwmon framework has an idea of labels which
allows us to assign the meaning to each channel.

The similar concept is already implemented in ina3221 - the label for
each channel can be defined via device tree. See commit a9e9dd9c6de5
("hwmon: (ina3221) Read channel input source info from DT")

This patch adds support for similar feature to tmp421.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 707310d616a4..ab64d9825ca4 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
 MODULE_DEVICE_TABLE(of, tmp421_of_match);
 
 struct tmp421_channel {
+	const char *label;
 	s16 temp;
 };
 
@@ -187,6 +188,16 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 
 }
 
+static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, const char **str)
+{
+	struct tmp421_data *data = dev_get_drvdata(dev);
+
+	*str = data->channel[channel].label;
+
+	return 0;
+}
+
 static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
@@ -194,6 +205,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 	case hwmon_temp_fault:
 	case hwmon_temp_input:
 		return 0444;
+	case hwmon_temp_label:
+		return 0444;
 	default:
 		return 0;
 	}
@@ -286,9 +299,53 @@ static int tmp421_detect(struct i2c_client *client,
 	return 0;
 }
 
+static int tmp421_probe_child_from_dt(struct i2c_client *client,
+				      struct device_node *child,
+				      struct tmp421_data *data)
+
+{
+	struct device *dev = &client->dev;
+	u32 i;
+	int err;
+
+	err = of_property_read_u32(child, "reg", &i);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return err;
+	}
+
+	if (i >= MAX_CHANNELS) {
+		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
+		return -EINVAL;
+	}
+
+	of_property_read_string(child, "label", &data->channel[i].label);
+	if (data->channel[i].label)
+		data->temp_config[i] |= HWMON_T_LABEL;
+
+	return 0;
+}
+
+static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
+{
+	struct device *dev = &client->dev;
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int err;
+
+	for_each_child_of_node(np, child) {
+		err = tmp421_probe_child_from_dt(client, child, data);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static const struct hwmon_ops tmp421_ops = {
 	.is_visible = tmp421_is_visible,
 	.read = tmp421_read,
+	.read_string = tmp421_read_string,
 };
 
 static int tmp421_probe(struct i2c_client *client)
@@ -317,6 +374,10 @@ static int tmp421_probe(struct i2c_client *client)
 	for (i = 0; i < data->channels; i++)
 		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
 
+	err = tmp421_probe_from_dt(client, data);
+	if (err)
+		return err;
+
 	data->chip.ops = &tmp421_ops;
 	data->chip.info = data->info;
 
-- 
2.31.1

