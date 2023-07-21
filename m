Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D208DEB64DC
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jul 2023 16:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjGUQke (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jul 2023 12:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjGUQkV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jul 2023 12:40:21 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2095.outbound.protection.outlook.com [40.107.20.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200C63C04
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 09:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3IBVse0y9tlt0u1Djyg+kxnDqJOO+djuzwO0qXbg/lnKS0EDFxBeQUAA7eJzOVnGkLlXaYcYXCZmx3LioIUtUYfLvDLdULRWbdoL1L3ZbCpQ7tSAzG1Z6fAS2/sWlBQsN5KQ/S/40t5mU+b3yG970y4NCUj7C10940LF0YREhoDHu6di/jarEPmbKQLRcC1DLK93vT/2CT39H3hPe5xh+Ln9WAO6YsjTP2i0iheNDenO7jqxVuhsIvhZV2dxJz+dpMvDNiVZuLsspoLIkbUzgKFWiblFFBuJZM54Xyg1UoYgOs6vln1YDIlW8jhtwmsWSw/gb/DMSlQLQpNT1jJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+9m6im/Szv0W9cttuL+/8R1Hg97x99Fj4Xg0SD2V+g=;
 b=IsxYa3jETe8df89f6bC2ZjlxJgrLXPvpNGE/uXwmcqNt9KPFvF0Cu3YUqEBCMtJSttOPc49cL5VDPYag+Mx18KGyR/Q1ZxLUzy7noBXyVdYVRh32GiOz5YlM/YoUQlynpxbEiqlGM+Bp/hT8ERikrXbMbHdkSUo/m7v3bk9gUCkKsUcP+gMsVW8J/S5tjqIcLvXkYlQgcxPgNhRvlbdiv/auLEKgwkL7/XAGzqbPf0zrLooIb/EnNgouTwmzS261lvQ4OdQ5/aEBQo6C6vrvHLHrfUThp21Ef9SQ28sRqQ07x2pzaSJb/II8xmBJ2IsQRTi7kIsD5DnKOtv730A94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+9m6im/Szv0W9cttuL+/8R1Hg97x99Fj4Xg0SD2V+g=;
 b=CMjoyrJmhByi19OaFnQa30/Efmk7QdhP8jdWaxmXHbvHHZXlLWJf98wwKJJaDZngErOJwh0zfa2RU4/N1+oyNKVKb1rmFS3DdLicyO2U+Mz3ZRXU1OLTSgJNXDoGGxbaVpigRUh1MPd7IaHzZ3yW5j/UPvVrK73RK8xW7NXE1VU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by DB9PR10MB5644.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 16:38:17 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4478:3f61:306b:21e5]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4478:3f61:306b:21e5%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 16:38:17 +0000
To:     linux@roeck-us.net
From:   Gilles BULOZ <gilles.buloz@kontron.com>
Subject: [PATCH 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed even if
 PECI1 disabled
Organization: Kontron Modular Computers SA
Cc:     linux-hwmon@vger.kernel.org
Message-ID: <dc61a61e-5c34-1216-b841-347f65221de3@kontron.com>
Date:   Fri, 21 Jul 2023 18:38:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR1P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::11) To DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3ef::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6252:EE_|DB9PR10MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfc7822-d7c9-44ff-f574-08db8a08e2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSalJcGRpPwY2+8LQM0weAQjI2C2fNkExKAZ5q6Cqv5LIjShs0kkKBq2RZpYnPgkNswb36pPmPDhF7zGaVVuA4OQQGuHD441ZG3Vx7xH5vFZPDn1cixeQfnwhmX+jzB9rD6zjAClPWum3K8EGrS6Xpeq863WWupxVK5uHdz8nsG3Kq64Bt0FrbmH4d4W5q+Ctyc0XWYUQFIWh0F4+qIBnl6ZDOqgroqq8yKdpfZH65RRTELiAYW94RqDI1F50v1FqJ1Ssk5jXYQ31W6Wx/vnvojdy/B3F+rRP3HMJ3Z7LUKgXQoVXZ3ZVF/4yOCkqPTQG9M9GbtPQ2KtQTYdjTrV1JYYShmrwmymgFdWK+N97OrTIIi8yGSJPy1eJBbR26PeE604kGanRy7cI7f/R9M/xHY46uVbwdc9a1uhamtMSxMQfATTXgEmqW4S3HxPRolmJcU6FMx9OSAMgFwfmnM/J8cDtqIuveLvkfp7eKuY6u5efnj3DEem5j4vwuKdIYU5CRJBRKgCFncjqs/UWAInwgsMdN3yu9BcChbSEPvoQ4HpZPyvO0yX5w9pPzR6JQyITCmdVXZ2JJOJF1Xr74q1zUT2qOazx++krq64ewtESpqcyCcu7cIi4pvE3vby+mPOzPCag6p1LGAAvvc6+FF/fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(66946007)(6512007)(66556008)(36916002)(66476007)(6486002)(2906002)(4326008)(6916009)(316002)(8676002)(8936002)(36756003)(5660300002)(6506007)(2616005)(186003)(38100700002)(41300700001)(26005)(86362001)(478600001)(83380400001)(31686004)(31696002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ankvTEVPbC9ua0VPcm1KZjBvODZiVUFEMk5mTVZNbWJYeGdJbVFRZllYb0RL?=
 =?utf-8?B?bVBweSs1b2xqd1FYeGp6WHY3T0V1M2wvSjdpYllZM3VwUkNRZ1JqWWk5TnJq?=
 =?utf-8?B?K0IyRlBrd0xNSjZGekFENzRoaG9MMUxsMzljMmlEeW1pUGQwU0lBZnovdjl2?=
 =?utf-8?B?NUhONzhzZ2xDRVRXaUIxZW96KzJiUHhMYTBQd09pVXp1ci9ZMmd0bFNxNHNm?=
 =?utf-8?B?S2lscnE0UjVlWnVRcjQzazk3U1VrSk4rckhxeUNSTFBqQ2k0YTRnTFgxU1p3?=
 =?utf-8?B?ckk5aksvK05ydmJEbER6WmtMNGZOOGlrWGtQeEZ3R1VzTWtyYkNrVk55MnZq?=
 =?utf-8?B?bGx6ZHU5Ulk4MUJYcE5IQkpqUXI5a0trM1l5UVlhajNGQTRPZHErZi9mckpX?=
 =?utf-8?B?VCtSWDllbWhxekdwS1Z4MUdDSGJWTjZCTXN0c2NvK2dhV1NVeDhERVJBdnpt?=
 =?utf-8?B?b1R2ZGZ4TUVWcmhLMkxKc3dyWnFUWC80QmFES0V2QzczYkdacFBiY0dneHBu?=
 =?utf-8?B?UFFHdUZvazdJZVdVVlBXKzVnUE1ScUtFbXlhbE5mTlNDM1ExeHhrRjhyZ1l2?=
 =?utf-8?B?bjBGOHNnUjNDSFQyL0RzWkJFVk56eDNNbjdVTE1qZUwwU2hjbGw0K3RRTU9L?=
 =?utf-8?B?S0VUdEo1REtvUWxYSXp4Z0c0bUFUQ0hHdnZGd2U5NnArUkhiV0NDSGxOOHI5?=
 =?utf-8?B?eE1SQmRmYk1FSkcvT1U3dnIvL0FBdktzVEdScWNmUEZ5WGJCRmlsaVZNRU8z?=
 =?utf-8?B?VUpneDRGcUZoakRkeFdXc0hyVDQxUXV6b00zRWNNU3R6emgxaFNTa2ZVUXcw?=
 =?utf-8?B?c0pITzErdzEwd1RlTW1CQ3FqM1FkeEpXeE1hR1NaMUVsdmJ1TXlLbHhKd0hJ?=
 =?utf-8?B?UC85NTg0MjhjK2lvRHRXUldmSWRNY2w2dVNxWG1EMzZQVytHdExlbXF1L25F?=
 =?utf-8?B?QXNSNGQ4OE9tQklPRWFmSGJ2TGJ0M29LbzZBeTFVeFhGN2F0OC9LTEhlS0NB?=
 =?utf-8?B?MW1XNGlqczVPMDBHL1lScExCNG5ZQ29NdEJ3MDg4TGV3TGRjeU12M1NvcVFp?=
 =?utf-8?B?YzkwVGE2S2hibjNqSHVQZS9DTEkwQnJuMDBlWDBUWHBqRjg5KzBNc1FlRUUz?=
 =?utf-8?B?c2hha2U4WWtBVmVkQVRXSGNDR21qby9lOEU1STZESGs5b2hZQ2FMallPbnIz?=
 =?utf-8?B?ZDBWSXNzOXU1aDVUejFsck80UlExWEExem93K2ViME1yclhYUEZpUDM4Ni8r?=
 =?utf-8?B?bkJPNXVtRUUrMUJsenpodmc2OWNWZXo4SHM5eUZvblVCayt1eGlnTy93VWVW?=
 =?utf-8?B?WXJHVVFRYi9lUFRYOWEzQzE3REdSU0poNzJtbUI2Mkg5NlpSQVQzZ1pEWENj?=
 =?utf-8?B?UDFpN0VORFFvb2hEaEsrMXJlY29MZFNBaU5MaXIrN3BaVGNFMHBydDk0OTZH?=
 =?utf-8?B?WVoxSzVOWmVPa2pLNW1IRTl5cUw0YitMeUNscDk0RDJ3VExYSEZZZ3lNT1Zj?=
 =?utf-8?B?UFdtanNLeWVCeU5rdTVlbmRySk5ZWUdiTm5UaDFtMFltanFxL09PVXBzaFZD?=
 =?utf-8?B?RnhNNEJlaVQ5ZDRWWGtGMlRyUlYvVVV4L1NuSHhDUDhwV1NVdThVN3hIZ2to?=
 =?utf-8?B?OXBWbXdiWWRIWlBjWm5wUGtjcmxwQzdNQ0dSRllwL0MrcmIwbCtvQzNjd3N3?=
 =?utf-8?B?b1BTVDVSakM0amd6ZzhoZStvSlhxOWNjWlcvaU0rSlEwSHdnVnl6bi9Qc1cr?=
 =?utf-8?B?MGxwYTZ2MkM1TDQ2NmRZR25IN3RBZHp5ZFZhMk9PdnNXNmRXRE9QaytPM2JJ?=
 =?utf-8?B?Y005aTc4OEN5Rm1HeFdoejQwWXhVS2VCRDdWMk81LzNsMXozOXlNWUhYUXNa?=
 =?utf-8?B?aXB6L2Q4NmRhdnErZmJDZFUvRTBnWVI1MllpU1I5eGRaR1huNkRoa1NvWGlV?=
 =?utf-8?B?OWJWcE9Kd0xmVDNsTW9OWlFEZ2hKZ1hJa1BDSUl1VXJlT2hVV0JyYjVhZ1Fx?=
 =?utf-8?B?V1N2V29zdzUraVUzb0p5UkpmSzRlN0JCYzhMa2FHemJwZDJpZjYyaTBSbGM4?=
 =?utf-8?B?Ly8wSEk3ck8rM1RnTjlOWEdZb0M2cGk0UDJDYnBpVkxISEw1WXIxY3dsMnJ4?=
 =?utf-8?B?dnFZbkIxRzBIaWlaclZWY1pNaUtIYm5TTVRJL3lLa0wzRmg3dzJBK05PYUJm?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfc7822-d7c9-44ff-f574-08db8a08e2ef
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:38:17.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Fxr2VJ75xeMM5BM046HQeY/muLIPP5LBd9uVPhZfl/QhXH2qjQ+gUms2DW2dt+5e955DOBg4tzdxq81AzdXheknYSn1vFkidQIcp62mnJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5644
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix for temp6 (PECI1) processed even if PECI1 disabled

Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>
---
  drivers/hwmon/nct7802.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 9339bfc..024cff1 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -725,7 +725,7 @@ static umode_t nct7802_temp_is_visible(struct kobject *kobj,
      if (index >= 38 && index < 46 && !(reg & 0x01))        /* PECI 0 */
          return 0;

-    if (index >= 0x46 && (!(reg & 0x02)))  /* PECI 1 */
+    if (index >= 46 && !(reg & 0x02))            /* PECI 1 */
          return 0;

      return attr->mode;
-- 
2.23.0


