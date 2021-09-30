Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A690C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E820F615E5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348675AbhI3HTE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:19:04 -0400
Received: from mail-am6eur05on2106.outbound.protection.outlook.com ([40.107.22.106]:32992
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348531AbhI3HTD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:19:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSz+A0F62jfCsfeF8Ejv+Xfqks0/VLsvAkbocBZCJtLVxYoEIu9+t0qeOXlr/AH/9v9bHL0WdrOfIPymPQmUJ6H+RmHWqoj3OVsPd5QZZwKWlii9bQhksQZ+k3AhpHOmoSvjPgy59npSUk5/TcO5kfivTAi+LLkIP929Y6AeW9uWmqvJdLQWaokeh/dKHzjGgmKsEIEY3fIVRUssjPnQ2nheIIdT8Fr3AObQEdLNEfqbfAbZX+uvBb7viAHHskuU8P0IwAkyt5pY1P/gl4bOgIW5xDLO7Kf8ye0aG/MACxXCQASjthjY/gRzr1tZ0Sngc15B03ZkAE0EmvJVMADHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avRR6d0VWmsySOvz3RnVrcJ1LnT/zSsQ7X0Wec0Ag5c=;
 b=W5ZUcaxSzM1qBXj1eviYbcGHqhIU9Pp8c0b6GqozEmc+0cnld6nhuAWYA+Uo+zja9/iSd/a5ylIErWJUS0y4c387AIJ1Ab8MOSjbFMQleODeGqv5pgjUFbrUWwRzY0L2K1EPJeXsocqqNoAZKHpylnfsrzUUnWVIm9fmmhEAsvZfP/g0zUZNB1vHPIQW68YhZHBdwst1eT1XhhZQTlP+myQDEIT/4LCAcjLD+nWInyhTrysijqFA/EQIPsBGKYasCKWBmJarWjrNHbVW2VXVJcGM0oMgZYv8YXJycvUsyaxDS6371slfgk5+YFJJGNsvYtp/+wSdo6kRaV06jq9Cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avRR6d0VWmsySOvz3RnVrcJ1LnT/zSsQ7X0Wec0Ag5c=;
 b=allhMbUgOp+Z7wrPdIWttXT5tEBdiJLaEJO/nud2/cKaG7W3qTBnNxSbrkHL96Iaptg1oUY+OCrCKMCcy6T6VHaML8hFcBWqp1eryre04j4sl0wrLw8UEcoSFUBzu3Iu6fConX7ObJ080cq9+mNWxxptVII00+bcPGK+nxfdp3A=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8348.eurprd07.prod.outlook.com (2603:10a6:10:2e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.10; Thu, 30 Sep
 2021 07:17:19 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 07:17:19 +0000
Date:   Thu, 30 Sep 2021 09:16:21 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 09/11] hwmon: (tmp421) update documentation
Message-ID: <54bae731f71168839aa3dbc449de922a2bf5c95b.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:17:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07c83362-571f-4c1a-1625-08d983e2567a
X-MS-TrafficTypeDiagnostic: DU2PR07MB8348:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8348E16B5CDE106DF18DE287EFAA9@DU2PR07MB8348.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JNjosI32IjIy+0bPZtRuh+GiDYQzQ8dDi1ajVsJ88fQbi+TP7gic4o//6pfpiOnr4BZhOQ1VRpopHk5SicCuYJAnAIzK37gnmrWYfUCEp8YvPyRB+l8RoNQ6oAP5bpdHjEr25jf8X1X4+ByY9grMYT3NiSLIrA2ITqP6yXB2G1y+2Crh4J3vDrjDsCLaip12OhYFbQKZ15kvAO3WJKVc7/Mmpat+xr2NkYIGkljnysOrQR0746vpWsgjfPcneWtCucbkGc1IcYOum9ZZH0ubCRe702HC/1Z3YHPxKXuMNqq7j8ptf8eaUntSfZiOMZDWk8iUYhNJ3zP2NxtO3Luw3Q/umk24cPy8cK3W1o/zE2w8dgsc9iUKdhIiB4nQUwAe6ULmz807xEn1jkkOb5WLMWHlwFUh+m9hWnCDxl+yDDSvYBcK1anM6Ar2sBwX+l9meoJP2RAhDiW0g/trtWiefuEGmT+LhXrgf+1W3W5Hy5Bu0jsQETTmlZJOa9bX6iMm9Io2bD7F6pUbBPVszcf7WR9sEbfV3+9SlrubgQY/GXETEL/TCk8Rjsr+ctR/DPzOgG+D8ntE9M22GkLYfAFe1+E1Je1RyEeKJ34llskLriK6Vighv5ulzkd7dcjVycRUY+dVqevRzXY8/IpHp+fSweI9yRa0xCwZSO8eP1GclrLFbMNXwBKbPHiqqTWbxCP+gks4Kaho7KnD4JjMUGKoGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(110136005)(6512007)(36756003)(83380400001)(5660300002)(38350700002)(316002)(44832011)(38100700002)(186003)(86362001)(6666004)(26005)(6486002)(6506007)(508600001)(2616005)(66946007)(2906002)(66556008)(956004)(66476007)(8676002)(15650500001)(8936002)(4744005)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LoCFZ5XsH6ZEFVDylRlkqcYJYQhg0DCz/oE9wbkH915EBgna4rAEELOuywpX?=
 =?us-ascii?Q?tsfpUQJ48exEfzLca37ORZ0pTM95NIemFLQQ/QNI0irSKRKwZPDJlu1Wk3Ah?=
 =?us-ascii?Q?rkJnFNoJ2XftrFof5ZAaF2AkmoKWMxWaQgLblzSa4AmVPol2j2p6PCA7lEqg?=
 =?us-ascii?Q?XX3f49K9e6JDD0Z7cZKXkn7ABwPXw5H+OiHalLUBgVbYMb1sGy99tW4BArHG?=
 =?us-ascii?Q?1GftoAuu93k4ICAaoZXBwfl33WNpFS9a0q/cU6Abi1BvMLbldR2dJhc8S/eL?=
 =?us-ascii?Q?RMWB/gYGvcNVgCoPEWabr0/JPBODUulrNBkFwoDofUNwHcu7AGMqDaImIpFJ?=
 =?us-ascii?Q?if/KM9PCn19m9C4qJrXsF0PtgRoBG2vEmRFmk2ejvg63aJoitVyNE3nNShFT?=
 =?us-ascii?Q?nBntzqj2E8gq/TIRuQvxZBTkJydfh5ynzBFoHpcYf7TC5UTWHDN65RvxwScQ?=
 =?us-ascii?Q?9NGOdR8YawicCjJ6KSl0Lt/aex/4PJbLuEHg9NlWXne9wAZuCTj/ups+USkt?=
 =?us-ascii?Q?RHMylHqEw+zkN+DCebq1YsAkFD7V5WEWsqwepoMH1wJAUc9JUNsHTPT3QhZ3?=
 =?us-ascii?Q?u7kkI6iUS92Za1BgF11FrLhJIDBkFIH7E5NK8FRzheGwKABSb5yAx4md0ncX?=
 =?us-ascii?Q?a7SpQgrml+mdDol/1cn5waZF4mKmO3L1S9eanzlrVAy3AGIoLKAWqkLVDJRP?=
 =?us-ascii?Q?IuiaWS3yEnxsKXG6VEAhtqZ8zg6/BgEj+OIhVlJj61wig9ZPhj2tVgdqCO/i?=
 =?us-ascii?Q?9mdy5h0EAkAan5+BWDF/Esy7Js4+77JjJcAwCbQCeu6NEt7Ao31IJOcwDIR9?=
 =?us-ascii?Q?zHak7YkTYNT5t8wKrk3UakHlCyoc1ZCLL+ieOWarwrO0CylfTuZA0y8vDtmP?=
 =?us-ascii?Q?V5Ys2UMDKAAm9wQy35CMvPJQ5avss8u/KV2iw9V1cv9jUahUt3rsevVVnUkY?=
 =?us-ascii?Q?hU33Er1GO+GacNpf5cn0FRx0eHiQDqeBit0YkXoL/eED3/jFAXPJ/cOvcnQW?=
 =?us-ascii?Q?oO/u/EYxWT1EsJrUKD5L4qRjN+XBNlnoOG7lcZ/Biy9vkl+ANcFExGfR+XiV?=
 =?us-ascii?Q?R8T+fyRIR+mGDqmev+U846+jqriNdfBX/ZF3xlebW2UPZYSfUlp1ronocVUP?=
 =?us-ascii?Q?mj2eJ/L4tY/0+V9Dr9dDEBq602XlJoZ9JnS17ek0hyrLrTfoMV/g0g/F6uUT?=
 =?us-ascii?Q?23dOP66dq6KGGX/42NtIOXRcjcDJg0Wu5B7rSRbBJbAXzN2JcWRXZNVhBOD2?=
 =?us-ascii?Q?MQkrrrJPtswyD9CNOvp9edXhV1VaC85Y7PlGOOXymlWWtgdT7VCGGFWTwfDQ?=
 =?us-ascii?Q?N2ZkuTcqQFIJj9NmQ/Hq/yt1?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c83362-571f-4c1a-1625-08d983e2567a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:17:19.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nERXwrAAyMraNz09Rwiyk6kW40Sl0PZphzEeSKS/6d3Kub1F34nngkS6EimAJT8Q/rgtXbZELKToH2Tf5VnkQqQp4r/KkFd9Jiq/CAV3cMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8348
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

