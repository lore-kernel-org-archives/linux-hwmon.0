Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F2BC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3449660EDF
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbhJNNM5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:12:57 -0400
Received: from mail-eopbgr40117.outbound.protection.outlook.com ([40.107.4.117]:19878
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231380AbhJNNM4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:12:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYiyWXMoQGCPvZ5vPEJc0hDDvjSRl33I0UKmR16cJ5mUX8D3UqcBJzyMstNjEQb1nTy3Dt1lffE/+rVcMUN02BF4hwnJ2jZdmwlVOaKrmlIBlqsbsZ3+A55jPcVrlcmyZBQ4ucmsJcPZ14A40Cg/XVUPL++fSBOlxyVAvPEPEMK29HF5YCv9BtRkClXbT2b2WyXxbxjQ50j+j4RzCGTJ7LrOlqO1RQt/Y3UvyiePETpKQXGH1PTjWvqEskvdUifu+ls0YhkJ0VH9uL3nwh4IxGHsWTQKQtLkKdEw7ewGF/6mdtswmSyJiBcgAocZKguvtQWM65B47m1cczGMm/D5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avRR6d0VWmsySOvz3RnVrcJ1LnT/zSsQ7X0Wec0Ag5c=;
 b=Kd1riJfEBmp+3Qauurvxk7MlH2LG1q14Oze59l1huev6kePm6lIfjnZ16u6ikEYTNkwOLobWjbNBfHogz2PeMFMkM8YIV5LNzppPhgIbdVOj5QaqZLJpVO+qLvo7OXS4ucKdOfwXFAeqSJ9u0BNSUzKgNGkm/MySWxB422ABVbYKzASI46RxEnc1jux2bE4rcz/CHT/VAFLjl0CHZLIotUbKI91pOrG/N58d+ZBOK9JIOafhN3KUIzmqmT+ZV87ksKCfweZRTUjjM4eaRsYFWw6v7c9u20ZHl8dLueOf7CQU0amvmB7NdoGydeC1n8SS1JK1lZMoKUiTr6tL1cpspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avRR6d0VWmsySOvz3RnVrcJ1LnT/zSsQ7X0Wec0Ag5c=;
 b=oVP9LyKUiaoobD3RYHYvCUJmRQxEAQXpmajANOdX8HTs8ksJt7prkcnRLyMgLROypBfZuUKvKa9Z+IEG18pF17O4QdI5SioiBa5YwIeZPslFypIQeuveF29lEVNqrtPyqpdW85nEWT7CiB8F434gwlgIA8ExKOeDhRdtauj7biI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8268.eurprd07.prod.outlook.com (2603:10a6:20b:37b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.8; Thu, 14 Oct
 2021 13:10:50 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:10:50 +0000
Date:   Thu, 14 Oct 2021 15:10:44 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 7/9] hwmon: (tmp421) update documentation
Message-ID: <6ae22fdf18513ddd09f430ef9c5e46c17e27886b.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:3:76::14) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1PR0301CA0004.eurprd03.prod.outlook.com (2603:10a6:3:76::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Thu, 14 Oct 2021 13:10:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e17b6127-b70d-4892-ea12-08d98f140b66
X-MS-TrafficTypeDiagnostic: AS8PR07MB8268:
X-Microsoft-Antispam-PRVS: <AS8PR07MB826883D8C2D2B232F3008F05EFB89@AS8PR07MB8268.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBJX3RYHdXwOaesobiG1SJvHlL/sMdx94OnwBoWzvQ+3oHSm054g3hEUIOyM28YJx/3BjF/mU3bvyG3/kr8P6+LA/VNadr1tThVre1vq9asWwSdy5eko33hYR5hjPzR6ASyAfTimGndqntauGYzOAoBCtNAxkTeFUJLlOcPlD/nwAPXTF6Z+G5FZOQCCiMtN1hw6+rtOgKxvztibCNA8uhPkkLyDXXUPFk//Ku4dNf6L5+MIDn308m0i2fePXxMbhuOPflBKSjugXa9J0VxNLsSbToVTJhykhlYD3ySQBstR1IrydfF6nz/MLOydfocoTqPoy/BEaBZcqwxZcPX2X9FcUlr64paWf516QV8H86cJ8VPbVSxyrS5dpq1soyWFaG2OEbtLiZp3DMNFNi7FFdu8SCjn4IxWT5rnRwdBkNdEfj3FPFUKUoUv/Koammu/Ok3HrWKUJJYwDhIeuU4Juze3k7Q/KI9rnoWqkg/+vDyF88sdkUg2uB/voT/WxeJVhb3s3eBvUt6E03sOl+DIzvDhzHcSAYu4uMop6E7Eu1Tj0FAkCgP9u3HQTyV6QM69xA/cv0nW9FmG/CJPs4L4SMVc3eH1/EF5gy9gRqhcvqJb6z45/Ah7qSXyK6EIptnM2ehlw2YqnvE/cX7a7dGmAKSIFd08XsSNxngTJb3O9ziEEWl/JMR2msPq56okM4Kxvxlk8FcTlU/Xp0pd9pGg6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(110136005)(186003)(38350700002)(508600001)(6506007)(38100700002)(8936002)(6666004)(8676002)(26005)(36756003)(6512007)(956004)(4326008)(66476007)(66556008)(6486002)(4744005)(66946007)(82960400001)(15650500001)(2616005)(44832011)(52116002)(83380400001)(86362001)(2906002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i6PauwedxFfmlNLHtC7pNTPt+Ud3OnNuCMQ+6nbjkvgPBmwFyh1TCQSgD6lz?=
 =?us-ascii?Q?aKhFCFQlC6KOvmL8RTRWeqcE+RkIvbU5qPE5GDhqg3r8CBIPYDfTtbF1JMey?=
 =?us-ascii?Q?I47i8HGE1cNITDkj/5eCyZO6NiEwpj5OBlJ8pkRVMl/wUQrQrQz29WT5K2mP?=
 =?us-ascii?Q?6KjuCD+9VwinCRhuraW/W4x+HvILHLrHMirv+RBuHWXeVpsReANXiPGGWqW3?=
 =?us-ascii?Q?JtYECwPQ5yMhLlE3y8zmFHwHo7jSSRw4uYZU9UYG3aA1pdLWXhs7yVy9koGk?=
 =?us-ascii?Q?AYeNwgPQXr5JUUZ9tYT4cFUNn2EYYJsUcE5l0JJK3nVIYsZhO9KHBIlTalsW?=
 =?us-ascii?Q?7sKs2cOp144mUu+6YWQVToNKbscBZMnEiU9aY5HglqIbLR32pwd/MrZ1V3ZJ?=
 =?us-ascii?Q?PRu3mOdzrlsj/ZbpzV9bDCBvsjdC+Hhg1jJPYShBRIkq+2ARZoP4dmHWEGZN?=
 =?us-ascii?Q?xSzHTozQ922Ueti23iEfTlOc7KjegxJ9MqZ6IYzuTiyYIs3SYaRzzYiK/a7X?=
 =?us-ascii?Q?1Ot2RE/CtN+mvFow1D7H1zi4xYs9GXtM/zirwKcUR7xjzHDsDLh9Z7p0DxqA?=
 =?us-ascii?Q?CZB4tvF4aQrUHW4dNtcDR8QFok0nCbbTo8GcLm7TBmXekkLvqegTwOnAV68Z?=
 =?us-ascii?Q?0r7I6xVAHYDp1GBvt6XRMlzSqQ3H9qOkDkY/6fk94AE5pfJ3XOq22gD322K1?=
 =?us-ascii?Q?4dOCVPt+jqcA6UcD8NgR/Oskx/PgWyGzW7kZ/R8aARuSJZcR49pSE61Nkq41?=
 =?us-ascii?Q?FmOjbv5gDbUSMoCAmIlfmxUnJzsBxXx+huDK37fD3bx23bfhqTQ/lgxHK9IL?=
 =?us-ascii?Q?T5dzpVgrLQTSUFw49MJBfGCG5EGsvrdso7U2wCWald0t+0C4y/jZ5RyRsIVX?=
 =?us-ascii?Q?UvtcfcpkLRw6BGEK85uBpb6jRkprtf9HqVuc2Bq15mFEuLlLCX4z2IjXcpKp?=
 =?us-ascii?Q?yyzE/I0w60bugduUUTNBD0GDXN8euUkKwTx997tXhlXzyhRXQV0UYawPKb16?=
 =?us-ascii?Q?/16ExnR3Iw0IduB8XqBMHfj8cmDHfe+WoM9+RDAtWb3qHRVtuW8yhp+n2m2T?=
 =?us-ascii?Q?CxC28zO/ew0yMW0KyjbcY66b1+FdSxwTp6sSMTx8Bi+3Zdu3+rxyphDc2vZa?=
 =?us-ascii?Q?siYDfsyxqAjl0Z4NhRbvXaEkNmKpWxs8moHK0po0hqj2qAxyW2NmgkiO0g9S?=
 =?us-ascii?Q?4AOCHnqEx/BpD40Ic5Vl3AQ1Dn67fsHrY9InMCXJJGiLaMm8hW2wiZAVao6O?=
 =?us-ascii?Q?twjWbwXd160aBwvZwJj9KbKEHDeF/JztlPkD/XwWQyNUM6q1OWEIKtvwS34V?=
 =?us-ascii?Q?6XvuJlq2ideOYl8c5iDn2pYvz9o/7+3TC7i1NNYppA86yI6Te3ZgkHwTrZC0?=
 =?us-ascii?Q?d65PpDKLGS9lePSVwIqTzO+ZZah9GlyU3EfzcBYCUtDLWavOrfKVboKzqoJh?=
 =?us-ascii?Q?D40WJNhi1bl9amfLIQG/ZRw1Nvf44qKHW42nLlxqJm+5k8rBaZHEtymYOxTf?=
 =?us-ascii?Q?xTq8JlAVYemlX2A2dN/p07p52I6KFrpAbN4ticOrKy7F9vXufgkTbLsoUsVw?=
 =?us-ascii?Q?ESg+tnrfsC0j4IlUluUWVdjJu7Z+tFjVzmqi8jIh2LWMOk3DCSj2cUl4ZSss?=
 =?us-ascii?Q?OoaPnNVTxz9aqFo0P6xWPnkENTW6gKjemE78I6idugC/t4ARzwLDNYOaQG6Q?=
 =?us-ascii?Q?cnm/qQ=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17b6127-b70d-4892-ea12-08d98f140b66
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:10:50.3844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzWYm4cgvmzqm/ylZ28C25BPQW5zirOiVx7T8BKAHfoRooTDbv1lUGF5NpWjvwZx1olsYZ/G+qL85wro2PJjw6qCmrXwC9+MzeYOTCaPwl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8268
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Sysfs interface of the tmp421 driver was extended in the recent patches
so lets update the documentation to reflect that.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
  Documentation/hwmon/tmp421.rst | 10 ++++++++++
  1 file changed, 10 insertions(+)

diff --git a/Documentation/hwmon/tmp421.rst b/Documentation/hwmon/tmp421.rst
index ddcd5159c75d..a3002117bbd7 100644
--- a/Documentation/hwmon/tmp421.rst
+++ b/Documentation/hwmon/tmp421.rst
@@ -64,3 +64,13 @@ the temperature values via the following sysfs files:
  **temp[1-4]_input**
  
  **temp[2-4]_fault**
+
+Each sensor can be individually disabled via Devicetree or from sysfs
+via:
+
+**temp[1-4]_enable**
+
+If labels were specified in Devicetree, additional sysfs files will
+be present:
+
+**temp[1-4]_label**
-- 
2.31.1

