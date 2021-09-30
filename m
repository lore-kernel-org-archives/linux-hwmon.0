Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AD8C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:18:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB76161353
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348519AbhI3HUV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:20:21 -0400
Received: from mail-eopbgr30126.outbound.protection.outlook.com ([40.107.3.126]:8621
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348542AbhI3HUU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:20:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxkpaDnSoUWTAbaGcuLrQ2wHZfJ1o5bdJLXBZdj1dLJrH5aQ2L4pqg60rokuGfJUlAxVUqV/1rc9kuy0dSo8m4bfKVDvJRCxebOU/ILyXrpouBjClBn0xfTU4i38qNaG4FX3QP6m+KuQM9fiVsjjRgZeO+4+S1Ison+SA6f+rhHHc5ujc3x7dRU9NgOGnRlCu8DJUBXdEtWN96INrpG/d87YMG1R34sz+3Woq+RJpkTpDLYm8MRaeyJi6+qzdfjITqVmPIHiWnIMgA/dQhp+JnGvOMf+EUEYWHXUwwHo69M7JNA5uk0BmsfDQXSBzENaq8lqY0pHPUVSQcbmCsBOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FygbMvIf7XEKubw7S8L+9idFUFwOVkoKLP9TAhDgiQ=;
 b=YPtN2Ox8QCV9xI06J+Qj/9xGk4V9AyT7CLNqxbtIzfEDIm7DQg2ozMYk40YVBLzyzX6WGWcIL2DfSP8Q/+FbQatOa5rxGqkN3SIEpJ28Q0YtOUB2Kfo0D5wPVerzVYa/qWvYirvqML3WLlEGJbJl5cQEMHh8MaXxzpGZgQ9Htas9L4dEAT//nrwiESw/lc4iRRHbbIg23Mn6XAw9a5yKx/KNZ7IxnUp+zgF2PyzrEoTFFOV3GpjnWeXsN0QTH9gAFsvkJy9UrsapeTuA3HmxTncd9GFuCmpcixkOikbOnOR0NfZblxFAtffBsKpUDn7rXgCXxYxwHRAlbZB9SAOgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FygbMvIf7XEKubw7S8L+9idFUFwOVkoKLP9TAhDgiQ=;
 b=TTlYI12rpV75K8LBqwX+rRa3T3h1IQCOvix7J4X9/7vvENw7rluS4DS25lGA4+ZCwOauzXfFG+sEmuIrIP563HxaKITTtGANCKaRMNUcfQ75pIBepXngSdx8jn8RLa52c8MXJIMMFnIelOPUUoad83EIxb4uWkFR711pjQmzMDA=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8144.eurprd07.prod.outlook.com (2603:10a6:10:272::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.12; Thu, 30 Sep
 2021 07:18:32 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 07:18:31 +0000
Date:   Thu, 30 Sep 2021 09:17:58 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 10/11] hwmon: (tmp421) ignore non input related DT nodes
Message-ID: <bf194f22aa630e39763ebea3797e02893b559917.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend Transport; Thu, 30 Sep 2021 07:18:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b091d494-a105-4ba1-08d6-08d983e281f2
X-MS-TrafficTypeDiagnostic: DU2PR07MB8144:
X-Microsoft-Antispam-PRVS: <DU2PR07MB81448E34BD17EE5BA330EF92EFAA9@DU2PR07MB8144.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wS5iuoaqtgv5es44/U5KHbkm/kc+rk637aapzEbTFwGMQgMF4CVxha38GgMfUvfE2iHaB6kMs2FxLy9DgZqmKh1dJl4XOWXPyeQZWbITLVA9KUfqEgTFmJOhADmGN/I1FwighpSwvCPTuv8ZXjBcZOVtjdkYf2PdGWnXEHNCQhoF/Hukt2vCRiWaK6p+tRWfUDccmg8F4Zh3OIV79yWTEBJCLc+YJ8+oTRHqyre5NUpRwyclJXjfCOWXolzBEOq0oZwxcNhAtXnKFrGlLz65Tmm6uXUKr2vXJnixYJXdDtER4+YcrbDp5q0cMiwZYn1GcqH/Sn+p0CMOra4TdaqZmZAAOF8BE8vDo6LD7dvl7H3bSwoCnzGN+PhroH7JfJGWcVT4aIpSANDGykLs5lCErZOm0ud4Mg4AKjbEWhKG4HrhKNY/jW6e+mkeQlk1f/jqln2ueXANDnXpgDq52CEJ9MIY+wU9OR//Qowx7fmANRIyMF4lo/a55txDxHpkRxhZ9dPNoOQ/ZkBS7MO6Vn8el0atxNZopha3KBbcoZNh7sMy2A/V+kCoKng0mt33qkHOtoXPl/Xex3YE+i0FLo60yEXoknGIMGv03H1P2yhfyzlaKSu9pS07+8C77Ibr9wb47XM0xQhJoexG6F1LXklRoEjmtHnmvUPg6iXx0g1Y9GhTTxLfqylUudLr+zLw3dH4E3325g8VlSW9FQ0pJKF2BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6666004)(956004)(66476007)(66556008)(66946007)(44832011)(8936002)(38100700002)(38350700002)(2616005)(6512007)(2906002)(52116002)(36756003)(4744005)(186003)(86362001)(6486002)(5660300002)(316002)(6506007)(8676002)(4326008)(26005)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mn4IUPC3/N+MD+/ClQZ1IuXfJPnnSJXssh61lMHXCodgZ3VuQDPkJ2qhZhj/?=
 =?us-ascii?Q?cGY2lm++JhQbMQwcwrm89nIiKAuH2SeGQzJnHEScqNqBw3UBLFSakprMNfwX?=
 =?us-ascii?Q?DiUrJYY7HiT6mtnDvBBmUgr1a1qHxGGumBPx5o8SNR6qVujpOaRnAlW7NTOl?=
 =?us-ascii?Q?jfr4MX6iT74Skq7Mu8gu7EcoOhlP9da54nQdK37hoGnn6sssKPZbaBnPJ0tj?=
 =?us-ascii?Q?qdgzvoMqawV+trm3uibX2Smm9gw2cXoD4TsC6A3ZdfCFMeluVVRjQy0OIDix?=
 =?us-ascii?Q?UySOYJam5dSNAcOUWwawNQDPIYoe4WIidQ1JkbxbzmzGI2jGHiY2n2C78mWO?=
 =?us-ascii?Q?XJ8wkTmMJj3YrUoJYwHetRgLAUjs8hoOBPskFJo8KGRUS39mrpvfnQW8bidL?=
 =?us-ascii?Q?npbzFmibYKmhoZgormP9LnbmrcXpCnRvDOdOE1JLsXUGwM7SJHoCqJUb7ZQc?=
 =?us-ascii?Q?qsH7I73qPefTAo1M3HNhg/kduovNdcK9Ao/MqCqIEAwq7b5mkLTdFEVkxwVj?=
 =?us-ascii?Q?5pY4S1RDHaTavGOvWQ1CuzRIng8c20T8o5DjOuuMBeo1zqbsymLqe+njay4y?=
 =?us-ascii?Q?UtiQXF9IlgLwwc7sTuiTRRc5EUVSPYZy+d6GpPDoANoQEWOLTCbOjY/fb6AH?=
 =?us-ascii?Q?X0bGrnyrGTOLXU/+YVHKd5LsSDUJ/D057gU0dXUrV7+7yDh8E0aI1nsWA6Hl?=
 =?us-ascii?Q?mDawn39Sa1aLFzzlDCPtSN94GhupWG4ViXU5AUtEZXVTUAVQK4ekr6fu2apG?=
 =?us-ascii?Q?OCA0Joy00loxl6YTyAyOCiZgOY1OjwZadybN4OUWzB0UJnOvQMX/aHj8zGRY?=
 =?us-ascii?Q?1X72LE98suat88GbTPTiBg3jbBJBqcQi1OjNtGGfocegNikW4b/13FiNiWPD?=
 =?us-ascii?Q?MbGCRdkGSjWYaHUsLaQXJFb1W0ih70DTPleaP/uUEQruP6WsXFrfH80eME8K?=
 =?us-ascii?Q?6LnaDwn/sxNTRY7Cy4vUsk/T5tT2oa0w6bjVM5fHs2bLdWcC+Mm9gEq8xhoK?=
 =?us-ascii?Q?Y8y76Aln3uLoO4yDtPte0lfD8wcS2cwBfYXDtpz8OrY+hf7J3HbmEDB6+0Dc?=
 =?us-ascii?Q?dXhVyT2wF3HXLwoWqHVYOnwnZHE88Hpx1kDFa5ERfrOorGyZCLSu8cmaGePH?=
 =?us-ascii?Q?lim3sY4cXwzKrp2RQ5DnX5NrG1q3qQYAYb1PdQ8Uu8wB6lCPPCGkCO6yGIpZ?=
 =?us-ascii?Q?covS+D6C1LkMHJ36uVq06BflGjjXWvLNMr8R2SiwJDuennKzaRicbv7ZVsHf?=
 =?us-ascii?Q?ZTMhcsI/UasAymvX1K+wZgl9pOCjqHq+R9uPcAVWldITmKzY37UPcdBdqHJs?=
 =?us-ascii?Q?uSNW/9HJdSXA2rZIlyff5wme?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b091d494-a105-4ba1-08d6-08d983e281f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:18:31.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1R/VoRZkKu3d3Ty+pL3u0v7PXUawLvOdThYawgTfKYlwo7GTrVYzP2Y2VEoGt93HS383roVi3GHmCQJJreuSBS3S5m9OkLPFDzBMgcu0n3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8144
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In case the DT contains some nodes not describing the input channels,
ignore them instead of exiting with error.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 66ef9c5d9a52..1b26b022ca69 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -411,6 +411,9 @@ static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *d
 	int err;
 
 	for_each_child_of_node(np, child) {
+		if (strcmp(child->name, "input"))
+			continue;
+
 		err = tmp421_probe_child_from_dt(client, child, data);
 		if (err)
 			return err;
-- 
2.31.1

