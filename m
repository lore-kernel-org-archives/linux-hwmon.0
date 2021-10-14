Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DB4C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE2A9610E7
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhJNNNP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:13:15 -0400
Received: from mail-eopbgr70131.outbound.protection.outlook.com ([40.107.7.131]:21271
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230257AbhJNNNP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:13:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUu9rfYOXk3mnC55Jiy0vzF45Y+eCL4od7IYhXVeoVVNqOA1wquWhbjoQpf/snLmHi88qyG8sHBTmD1raE5Hn0TDNr6O5zS+EHGvUkhtmp8FD0hqUUTYo4BvVZHUd9ay1Ixg59WaT6QY9i0CjAaxEQPNWyKBBKHVrWbP4VmE4Ll/gQgmyZZ4AlA+RGpV0nK58KECva5edrl+nBaQcwRcrkTtZNQ9cRXZ2luQ0iKP+25t5VetA9YdJ0G32YchYQulDE66olPnWX9NHu62PYK/8OjYYwjUKCQu27R8tFthI3b3w8UT2Yyz6wvwGJxBi5CGStyy9mXng44D2tIn0/lhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xl+94h1cHon91TeyFU17pCgPBzPStvzPaxgLwGbYLE=;
 b=cn3m+RWlRimTo7OY7M6hOJdqXtaQATMUZe2wKtwoC8ZHZnbUdCYzu2xJrardh0DPZuBvYYLxmCgE2W/I8CLvBQlbCHZSXWA/X5DTNTyroPW4Hjo3DdXTZc4Q0sWxonFwT00ZHIJSuQVK/n5M63yuClM8Rc/bbOlQpiQglV5JQEwTHCfH9jL1vkb6m68kRStCKxuRN0caBxKpIJdsmUSOAJKaaDCEshe5diwzczFu+s2ZN/ViOTnVqUtiXFvo+XhSbLUF2Ndh9zFhfosDypJo5dBPNHho7/paw2fe/wiTmx69YqT1mwA7jcsz4AKr2KcpfePM72YpocOyJUUcc/OSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xl+94h1cHon91TeyFU17pCgPBzPStvzPaxgLwGbYLE=;
 b=KIBrss06ibis0O/c1emeNDyRNpnDApxW9ysWnBaPtNyZ6Gha6HRoSIeeNe0kBKpLI66zuWCQMxV8MwmUSpzyUBZrcKePkwvxEnz15ZPVADbzSieTpL+p+enEKb++Sn3Mc1VdAO3sFWNVAq1aubhuQfSgTdAlF2PqOI81hroHj2g=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8282.eurprd07.prod.outlook.com (2603:10a6:20b:37a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 14 Oct
 2021 13:11:08 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:11:08 +0000
Date:   Thu, 14 Oct 2021 15:11:02 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 8/9] hwmon: (tmp421) ignore non-channel related DT nodes
Message-ID: <8e9e332b18dc2cf545f8e8255157e408d356f916.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1PR08CA0077.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::48) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 13:11:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06d02bd9-045e-4aad-6ac7-08d98f141644
X-MS-TrafficTypeDiagnostic: AS8PR07MB8282:
X-Microsoft-Antispam-PRVS: <AS8PR07MB82829730F67C757DAAFBF653EFB89@AS8PR07MB8282.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfwSCg8FLW80q5Xs6670YdDb3omFV3Z6eqvzCuoBNrIJKBb956LDjoKE/qXMd/wsQMXZv32yNFQbsyg8qr8yBPqBEvfGbLEsrCwBTYBL0XNtgJ74auujg9TBCnaajDrgL1mqGC8UfFrsVTKXNg6Fqj40QTj4Ku+Hs/TfGmsDQP+MPaCQ08n+DGk9HBaFlTtqO1OduEVHmDnuaVUv/cnOP0KKInz/6oexC74z7DRLhhhwcHxvrZtV8KCbCUgkVBLGX1Xj00mivSq/4qNHUdwo1Qlv7aecNDHVAYQk5Nzh3YOl55j2343YgXQqLpJ6RfaSjgyRwJXq9+qlodGHubQDRucExOP5xHKhKFFaNHuf8ADXJ3X0wcyjftnviHXXbm8LqFUc1eA0Hsry+T+0CeNB3tX6xvARbjnN0BTeQFs9q49MbSZqQf06/JRc9naUEg4CWCpgIbAx6dAXYREQEO9sY9hkBiFMH/s19mutLJZAwDrlUi+ibeZevZj4mOdaEMpBOZsIrBjPtt88cYqt+EnO14ZDIslP6nRVe0XtutFeYsvw1RUXkdxH3MVCTopCl+l1c3S9P7SasClo5xRRbYcqkvt9KDy/wRUqn9O6Pz6rP1AhJI5GQw+pdzoXRyuK27vkt8H06XMSsL9CRZupWvUEbZYYNtS0zFUUuCgo2LciTfpt+vNiBvozuOKqFBXNxf1BlaxGRAnE1y9FUL3H1tKm1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(2906002)(4744005)(38100700002)(26005)(66476007)(82960400001)(2616005)(52116002)(6666004)(86362001)(36756003)(38350700002)(5660300002)(66556008)(110136005)(956004)(6512007)(6506007)(316002)(508600001)(44832011)(8676002)(8936002)(66946007)(6486002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G5gvMOArokRfO/WNi3uqiQou4zphOVWA22f9tVrM7ibvEnTnn9D99soT9DoF?=
 =?us-ascii?Q?g4LyziDaO9VbDvPaMrvSnclQyWfXxFL7hlHixJOjDwifXKcbR/AmNlgdNaWQ?=
 =?us-ascii?Q?7xasIk6YgC4GQ8p6UjC2FRduibVBx1fZ3ZdTx3rAuAPTldGtDfXIKDxLbYps?=
 =?us-ascii?Q?WHOBS+t+6JxZbH2KqPU4ZkiAqj/BSVHt36JB4P5qhtMNNomDRMBuCIu6rrp/?=
 =?us-ascii?Q?tCjJWN3eDYS/3yzaxZVNAfgPZZcVq4u+IokuxyNIKJhZqQWRQIc3yqvo+oRU?=
 =?us-ascii?Q?0zHvi/8Unv2hxmT5ucA8XFEmwnoPqQ2UM7EaQkGyihnGpyksvjHpKNhq/zE6?=
 =?us-ascii?Q?4qNknFdlAhv/SLOs+87K5jwSIOGITkH9h6kLhOTzEbnxvvBQzQ7JhU4IIvPq?=
 =?us-ascii?Q?xrGPIFMnKWPsD62FVQh+dXGvgD2xtLKF3iE/aJGEbLA+d3ZgFjjNB1+QbloA?=
 =?us-ascii?Q?+bKN3Zq3YKEMbvURAKR7Gui60d628nyivQjP1cM0piToC/RQojAiLz2VTd4A?=
 =?us-ascii?Q?vkBr0QT42AElGqjg7WzruoRC5kanI67fVdLGjtsdgJcg6i8Q+c12t/KhM3DZ?=
 =?us-ascii?Q?8BzeAXo2IKkZdFI82UHDYiXNqyTEkShJ50+JhhUqgXeYDnP7c6fx3QLWS8jb?=
 =?us-ascii?Q?2Rft3vfxkw5hpidhZkLtSHOaMRYAMCaC05aMV63reyMWpgTw11PJ8Fkb/ows?=
 =?us-ascii?Q?Osp5Qc934lcbN8l+H1fVpj6K7vby3maes01p12hLKXa7sT7HcksbfIe+rTck?=
 =?us-ascii?Q?MYRDx1G1ZztYoyB/VSK3BNJEF5/Ij6hDHcF6YWLcwwvGYTPnC22j1Hnwgf2S?=
 =?us-ascii?Q?AKytTevLoKckh3Fu7Okje9OlUm0EwqeV1Ow4rOPq9hXTsy4fdvTYoxRTzPnz?=
 =?us-ascii?Q?/D7Mkt2wh9kSAfdFT/PNbybx1j5PpPOCClR/aHpvfRpv7AIZGWxQVdroYzcU?=
 =?us-ascii?Q?e4uuJBo/75ufMIUKHJvm3mBUSmFEBLs6wjWf3csX1XVBJkA4VR8RbZf5vXmv?=
 =?us-ascii?Q?34XxhCTnXXjbnT0ILqFQl2lWUqHhcYYpqADSguOdNgqL6sVCF0H8ZRXfXN3a?=
 =?us-ascii?Q?Bi+ZdUSAt8i8Z7XMAOfZuOwVmREBjF3rfAtoSqywFPJly6nd+aD6+bsVV//Y?=
 =?us-ascii?Q?LWVMqRvsLFk43gCxD7u60J3JQp+PcKqzoUcRs2VYqpGcE3OKl5LUNfwYa/4J?=
 =?us-ascii?Q?ITdQwtI7LboWPRKSq8RPV6gl3+eY+SCbZTK9NQsqBER5SdIbmMRFfcrH/qZB?=
 =?us-ascii?Q?L0uvp9jwHzbGzDeV9pk/n4+mGj7EFvjTqsBm2xX6FuoTLYIBoDLw/htD6zsY?=
 =?us-ascii?Q?hmKiUY8XtNGH2gywnXXdIgHz?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d02bd9-045e-4aad-6ac7-08d98f141644
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:11:08.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65a/cPKQVM4qUOmh/iw5APdsy5iktcD2n1M3Bxni0M3VoZErpCHrd7KK01FwVl9HuNPmLUBR0Hvb8V7FRS8cXpTmO+8ef3jJvWX3EbylWsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8282
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
index 2e20c558fcb0..493a24cdfca2 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -414,6 +414,9 @@ static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *d
  	int err;
  
  	for_each_child_of_node(np, child) {
+		if (strcmp(child->name, "channel"))
+			continue;
+
  		err = tmp421_probe_child_from_dt(client, child, data);
  		if (err)
  			return err;
-- 
2.31.1

