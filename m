Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36BDEB64DA
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jun 2023 07:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjFZHaK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 03:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjFZHaI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 03:30:08 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03olkn2060.outbound.protection.outlook.com [40.92.58.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8E5E0;
        Mon, 26 Jun 2023 00:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHEjHg2GHrFb8t6VJx5Zt6HSWn6bWYmH5SdgLdVVZulx6e6YLMgxdE/uGFqT0DjBXRBWzHYPZtlJtlIN4J9cVVETbvMCwZG+v6Kir5JVRfxXi/R6FRiLOg2392MFpWpVel6rivFvawrxGAZ2LWXa/3j3ojaDVYvlBtvkWpSns6TQID1biZec7fC3tM/63vuWN0QUzxJT+ywaTCMjqbXe3y9eyVkDgJ63hJakbEuhIS5QPjGi7giAETL/sooZyvRIxZDBtHpZfuVxNlz2AllBdpfJxja/AAljxttlPdlaMSk2nFc9AGVSzEM8VFLPhS0v60KzFpt6S4q25aEzNYASUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TIMv/J22r6cNoRW8Aee8JzK9G9u0MewxudOg21/GlU=;
 b=SIJnNmsNLqPvma03UL8/W1WMNiavZ3nvCyzUfviT4mDoYoE9TyjLrWrXXXhGEdB1AyuElP8AWwHCIIOH6BfF3H8VNOAwLRaU6mD/4aI5dZlthfx52HLVq+Bhp0w4PSFq8VEp+29+6OeVVAeQ6zIfqYGJ6FArQGjuA18Hid9VMWwOXy6Bcoz2vLJKy+vQ6YMgLb4UPor/qjyn++M/SOhroZbX0EdOr1X5zNWATjfzpAF8yzrjRNowq9GrIiwcKld7G6meJ7rQiYLvBo8fjf3u5dap6QzAWUegttGAUXCWU+6zj4apHGUOLTQIwGOAMp5NxGKeQ6iJ52+sb6rbzVYI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TIMv/J22r6cNoRW8Aee8JzK9G9u0MewxudOg21/GlU=;
 b=KQPdd0f5C/K2vhXcaEhRDaZTaJPsLmZfmqFhO99vwNdF60dZRggo32+ELafopsgf5GmbFDGdeud9W3oSLRAMwzEIb+jVeeMaFVFXTK6JhqQq+71k3we4MHxdGqz23YqPrysjImIVZWLKjB5LNn8BSTLZynQVCieKLpFpal6qEjLERRtk4BGoLaxjXLe1sifgs7Fl81FTKt5FbHtfKWQQ9kwCAMzUMzjKJM+OxpGMgFeck8ipW2skl7/r+z9vT+3A3bQbe0ZvOyEOhErdyX1Y0ecN0dmJhvKU1CKvTPN0YfubijT3b75XOYlOG+9JO6/Nhfz6a1vLfixrsLwMYlHXnQ==
Received: from DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:383::21)
 by AS8PR10MB7858.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:631::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 07:30:05 +0000
Received: from DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::628a:d617:46f:2a88]) by DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::628a:d617:46f:2a88%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 07:30:05 +0000
From:   JuenKit_Yip@hotmail.com
To:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, JuenKit Yip <JuenKit_Yip@hotmail.com>
Subject: [PATCH v1 2/3] hwmon: (sht3x) add devicetree support
Date:   Mon, 26 Jun 2023 15:29:22 +0800
Message-ID: <DB4PR10MB62613726F6A32B31A9B31F109226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230626072923.340544-1-JuenKit_Yip@hotmail.com>
References: <20230626072923.340544-1-JuenKit_Yip@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [QQ/NGHhaxWXKSr0HyQDcEAt8euCQwfEi]
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:383::21)
X-Microsoft-Original-Message-ID: <20230626072923.340544-2-JuenKit_Yip@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR10MB6261:EE_|AS8PR10MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 78214b27-2787-421f-ba01-08db76172965
X-MS-Exchange-SLBlob-MailProps: EgT5Wr3QDKzYk8yevgJIT5SRqgxOIeQcAffxd68fClywQnsm7DRsjTDWjnDcTd8tBs+7r7imWCriaNAcrrjOubShov0ce4a3yXAQ0Ls2vaDaDnBjU2tPjikC0CewQYOoggGYcl0zhHSgXBQ6YJNd4tP9jmzOzYtRClSVf1rZfH1dmVvAsET+QOwycII1H3Hvpj3zeH0rsZDo2jxogG6rDsAhjUiqabiF8wPlY9bAj1DiNb7OF6jkaZTNJnKi3VhoD8CiblJSttUF8EnJbper0HbYBdzZCKJoYLPEj+VaptNNsd67WXitUDdX4oX3pFuvN++GoBaYMCHbRyau/ZwuPZblGyIxHHbqa47505T6bLG8nmN/EumsCK8zhbY4CvFSnM/b1obDY+2W4G396npxVzMmukh50/nWvDzZU5lNjuFQcjWSDXh0qlBSa+OyrpNdumUhJvjRYWtx7IpEomOQnY4iL/P02E3O8nv1a5CbpWfuisvUfMQ/U1gjeDMvBkcS2ZiKMyEGfEaefyZIFGXiLoW75kgRKUBqkQk8iPMwX1TwgGAUuB4ul7y+ThlcGJfxje6gdanjt4jcZUR1+kyL+/D9gNfnhD95Wxr4rTFIzH/qEe5vScrkiwSOqpp4aiOMs54oxcYgGcAWtfsMNG8zGcVIYsJJwohJ6CMyvmzFDclF7tWTL+8mGnyUrQ3xjQdcE23VaFH1x9hWmbuRZtnGNPykFqx6G9ZM4IHBakQxz80=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TG6nNgFZD18ctlioIZyPFm0VQbDmuLQwOu53MTmpDtw0BM5qzGjv7IDwb+8k85Wa8BgGzdXo/U066yzY+1Aril5Lrvp0yU9yb0Y5korO70EtHOAenDI3aOFapO0fie2s2LmSyQ4sRu1hwmghIunOgLS6wKSAldMPj5DocE99KD1WUkA5KiHiZcjwInQ7sCbrLdbJT5ewhAUYqvAy0X8tGpctCjvb0n/nQUnO1CVPoYBj1LoLWqPCc+xXDjsRCBsopperuQ9DrM3NZVloS6h4F1oCE+RdhDU4yru2NW+mAm0iASmjhhUBX+RVF+xXrPxdLCkTak0ao58N9632FIDJkFVZ1XjTs5C/6sIp+1jpqDijs3xZ/wM+u52pVu4GA0Jadr68+kHsEU2+Voewo9hDpPFZqEH+tt3Gzm/7o5yPt1Xqat76u/KWLlNL5CD1xXFCQzSO/vx339cySrMhnyCE5tn42odU5z7fS0tN1PrFinWgAAYUBx1Tywd7NZVWsBGq1TfLD9JgbkC4n/Ggp7gfZuYGz2qwZRA4Q5/IkhuK4/tTLZM2Mo5l0gUjjhGz2yGAmCmbz2hVZMulz3sjW1WfQD62QXxA4FmaDR133loz9+k=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/YiCKGsqYrz0MR2ORc9c/S0eL5SeWp+fgVF1jEDhqAubH0ssIW4AuEfIL73K?=
 =?us-ascii?Q?NWk4t4gt/zYWh4l7T8nGJ1ISgw/BaXBDzD53NeMK6EwzqNiDiom7ZTHsas0t?=
 =?us-ascii?Q?s3aa3S4zGy6xrURg0uNbFlDGZonEFu923BVGZGktcntHWnrTt2yvy5ellpf8?=
 =?us-ascii?Q?FycUgC/E752apnWUmB/9mZYlQ+CxTfBYRAVtmilevVlBVnj13bjUgJASUs52?=
 =?us-ascii?Q?Z+dhcQT4Ia+bkRbx7k50HJrlQb2u3EstJ5O0RPmFnlWr2Z6tRaaADuNXzT2K?=
 =?us-ascii?Q?vcCIxnMY9uMZUPTaP5KPKMx8QOskI7M48HGaFJ+pVQJI73tTLWN0r6wFjAty?=
 =?us-ascii?Q?W+l3bA9HMJr1Rt08PqUR2vLSA7Ga1GjIblj9b025bpiVF7JQ3t0lBUSS5VZV?=
 =?us-ascii?Q?JjB1/N3yTJqQ2FjHJ/9LdUs47TR/E8Jc/vp0K4zESNjSxfwIthLq6doqXOe/?=
 =?us-ascii?Q?QsRWWf2fBA5MUrL40m7UuHdCgMmTFt68tIJLVfIOEbR5XLw4Lb7Vh+XKofOt?=
 =?us-ascii?Q?fkYwYq8BRDbxdNWJQ8tht82W6HclBT62v7rkmoPKvufjwtkb2KLXt1H3QUB9?=
 =?us-ascii?Q?XKUUIurrrBHeOLq03h/+mGHqdelCXGz3KPhmAWQcioYUKlegoFDdKdC7mWPi?=
 =?us-ascii?Q?zDjZ93RUCDlPqLWrOZB748g1oBhFTp+53sogTbwNz1cdjo9g5FDV//5N2oLB?=
 =?us-ascii?Q?8oS6Z0pz0wvLFtkm0tBm699SQr9mC6nBSDHV547oembBOCQBx/iXou+8wQHl?=
 =?us-ascii?Q?I8ER4i5ImugVUBcaqKLypH+7SyhZMrnNPCSOwfeEYKKBe7il3kQTTwa9pvGR?=
 =?us-ascii?Q?iIt7O6oUAsB+nG8d4f/8M+UKoSs3VhAPdwoR1wSM3wkYF5KZdT48GMcgkM9o?=
 =?us-ascii?Q?W+7bjvFAEZhEgt5UmjyJAwrWZ+5W2gu+38I/2e9HpwspYxLzk6DzLnKl4HLy?=
 =?us-ascii?Q?lSfEKEQ9wtpPwBJNUrZ6+faRAAfVtb1hfTeH0FZhk+wxW3X0GlOlJI4CzlVf?=
 =?us-ascii?Q?vSK1JooiHJmXmjjZMMahK2/ylyJyhSkrW65rZGt53XMOjvdOBpYodRIKJLTL?=
 =?us-ascii?Q?15PO3fU3X0zb3sZYA57RRmAA8jCYJ4hzOfCyMDpWFiVsKHGjTajLlJZp7s+1?=
 =?us-ascii?Q?m8N5a6b7DSdFGrCJLqNDQPKXB9IosZ5PGou7kemQ6nbeEe6ruO936BJLKNmg?=
 =?us-ascii?Q?8ILtqvTK7NuYSP98p0+CpEiWGNJUcYcHLjm/D4ccOTESd0JOnjGEYKtysPI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 78214b27-2787-421f-ba01-08db76172965
X-MS-Exchange-CrossTenant-AuthSource: DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:30:05.8662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7858
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: JuenKit Yip <JuenKit_Yip@hotmail.com>

add "compatible" property for supporting devicetree

Signed-off-by: JuenKit Yip <JuenKit_Yip@hotmail.com>
---
v1:
  - add MODULE_DEVICE_TABLE(of, sht3x_of_match)
  - drop of_match_ptr

 drivers/hwmon/sht3x.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index bd483af1c5ab..46b0a0231b06 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -911,8 +911,19 @@ static int sht3x_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+/* devicetree ID table */
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht3x" },
+	{ .compatible = "sensirion,sts3x" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sht3x_of_match);
+
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = sht3x_of_match,
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-- 
2.30.2

