Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FCCEB64DD
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jul 2023 17:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjGUR3e (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jul 2023 13:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjGUR31 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jul 2023 13:29:27 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2133.outbound.protection.outlook.com [40.107.104.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FB919AD
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 10:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW2taDb0Rc8RUmmAIQkX9vBIIJjkMS4u/4Md9p/quRAmnOFtM7xn8Z8ibXfNShYoDU/zF+yygKClIHHHeZdJBSND1UH+bHpdt2PNI43whOb2A2Pk8+I+P8IF3wTdKgsKds5UdQ8Qw+7q00Udn/g15mUwTyE3ia/tNZj821lYYmvAGQDjp/ULdGxYQyy7cCDhQQhRTBcnPrB/EzT24JBmJ9kSLxRhr2Tynwcw6oML0pdNjXm+Fpwsn3ndlDlscO4uDClrEPElePkySQSPyBpAzAK863Eh3E7vdtzq1JrieJJrTEoPiifKygC48XoSHz94WJfzLbaBejvDvEUDpHGJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+qiFu7BKiAdVR6bk3G4A+CuSHxeI6Bmpri3o9KXLV8=;
 b=N2CX2klGS9uEGJSCHZDVtFHuafsLqiFlOILOtCjHQYq15Sa3VqMM52h81tyCWzigHeC0e5JvLrifhlslbCcXH3cxdkiJ/FkmhlqZVvSztuizc2Ds2YAbp6eBZ0kqIqtOqVftX0KJfXX7XWr7iSyeEu61DUF8xPZR/vDXyQ+2IrdmAf1jNtoZ7rEInRureHURqyZi0v+/JG9ZjgRzJyJ1vnmJHKBqsgFgmlU1U8PnW8z2f2iFCjeZs7LF6/MmxPw3N4XCddIBIoJ1ADdvsHVrNFi+72fbW3IMy2SDmT4v1QUE6judy4IqlFg7bL1aGVsoPKVqCSGcmq1fvHym4+wh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+qiFu7BKiAdVR6bk3G4A+CuSHxeI6Bmpri3o9KXLV8=;
 b=nhFzefL/C0mFxIRhF/X2wQhkI3/UMwvZpw9YA54cz+JyZfz7UjuCZ+DqkPku0pZLXytZlvtZkBYzv64WqCH60HMwyW5rIbqOTyT8OiGK/rs3Mum+71FseK0L3sbq2Z4S40w6lu9TklKTUHCHDNbNx0y1ZdJrhPolA1FKzDDZXCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by GV1PR10MB5889.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:55::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 17:29:21 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4478:3f61:306b:21e5]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4478:3f61:306b:21e5%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 17:29:21 +0000
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org
From:   Gilles BULOZ <gilles.buloz@kontron.com>
Subject: [PATCH 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed even if
 PECI1 disabled
Organization: Kontron Modular Computers SA
Message-ID: <e6e6c227-6789-9c82-3561-530095f46e02@kontron.com>
Date:   Fri, 21 Jul 2023 19:29:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PA7P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::8) To DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3ef::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6252:EE_|GV1PR10MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c28515-4cbb-4754-909e-08db8a1004fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ydjQzkKT1NBIT3Wv20C2ZykzXYT6r129CkNS0DZMk0Xv2cQDI7Kh443xbRRhYF5cgPMFFHxwgNyjqO98QPyHANCW3zVNgC0YQUpozMjt1vfbfGhd47MEDtJ42x8n7/6rfCGh18dXn/mEi5Ky3ds5nyftyw60hpXo5NyGhZNQSH7kR07cxIv4V4M/AsGp/S2gW/7sBw3sqwmAGprYby9+YO2/9cJlTcdj7dVseS+jlPOBymMGqyJKsJwgy+fui75GykWzSbVxIwHoE9uB7Bo5RH7dUAzdxK940/vcHJvR1NT4LzCqqYwx0JMjkMozGYxFS0YCR22qxC/QtKJI28IDQXtuy1/eBx5pywGdCXlgl17BwAbZ4G5muRUcmFH1JIz1oJnU3q/LeSJizAaR9r2vwJYudNtaSviQf3g6gVjtGfdoemHV65o64uu/0d+8Gu4Q9BpAzxl5LEXYF5l359M8dkJMEsd63cIVV9ghc/QdIXAgB40l4R0LPb4SGYMARyN2K4nCAI2WEPpPhi3cG1iEnzctSwV7zo1zehNJ0yeWc4WQB7qdVgbHM5Ur7zRB5POS9WeWShQ68Z9APlfEL1x4IQTEyJNuOw1oIv+mARPisf9UHls7Et9CvKWoDTtTsAqV5BYplDaw8HzIf3GI8yZ5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(6512007)(38100700002)(83380400001)(186003)(2616005)(6506007)(26005)(4744005)(2906002)(8676002)(8936002)(5660300002)(36756003)(478600001)(36916002)(6486002)(316002)(4326008)(6916009)(41300700001)(66476007)(31696002)(86362001)(66946007)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NCt4cGE2NGg2aXNpbzcrbmI3ek1BUFJIT2RpemZYRjZiYUsrTTkzVTNLaXZ1?=
 =?utf-8?B?ZXVmTUpjVVB1N3lwOWZIMmRmSkV6K2pxaWVxODhFY2R3RnJiSllwTGZ3bDhw?=
 =?utf-8?B?bmtZNWg0M0lRdDRralRsem5DUGZBaXpCQVc5YnV0SzV4bnpkNGRtQStwaCs3?=
 =?utf-8?B?YllHVWMyNVU1c040Z05mNlVReldhSDNKTHg1MEh1RmdmaDNabjdvZzZGenZ1?=
 =?utf-8?B?bmNZRFBtZWErbmxQaUVuMUZtZThMWWlYWm5yaUlBU0UrRWRoYnJFZlBBYzJH?=
 =?utf-8?B?bUNXZ3drRDFadk5tR2lHd1VBVmJwZ0V0aXBSV0FmSmRDckl1VXpwclF1NkFq?=
 =?utf-8?B?UktuRXc2WlZJTzNwbkcwYkU1MTRVanlHUWFnSk02M2hSZ1JUa01xeWtlRklG?=
 =?utf-8?B?dENiR1p2d2xxYlFsQnIwR1FsdVF6RUR5a2wzUzhTS3l3NnlVL3ExVjduMkZz?=
 =?utf-8?B?elB2ZlVPWmt2VmZkK2VTVjliaVNyVm1wM3Q4SmxlVC9IcVRsRTZFWGVlZDJa?=
 =?utf-8?B?VllDS2pXRUlVMHBta1NGMTRZQi9YbG95czdicC9ENndCYnNXKzN0RjV6b28z?=
 =?utf-8?B?dkc4RzFUOWZ2WW1tRzBRU1A2MlJ1ajF0YUtBeXVrTldKeGMyZG82WG5uVXpm?=
 =?utf-8?B?ZHJxVlJ4eStnSTM3S1VtOUpVaFJIY1pzU2N5VE9oZGkxOGlTK3o5MVpDL3U1?=
 =?utf-8?B?R1k5eGt2NnhCN1FBZGtMM2hEN05wOThlNExyTktEajFmUGtVS280NnFDNWRn?=
 =?utf-8?B?ZUZjMzZvQS9HOGVxTG5mSmM4aGlvMWRsbXh1MzhRaFZvSUlCeU85MGNwVTFy?=
 =?utf-8?B?eVlSV3NhdytnRnMzUjBROVlRNEtDTXI5WU13WTFZbFFxdTZOU3FzUE9qTGhP?=
 =?utf-8?B?VDRXa2QxR3FucmJmTTNzaU1FbFBDZm9WT0NmcS9mWVE1bk5wZDFySWRtcGV0?=
 =?utf-8?B?OFBZRjlRUVFkYnZzaWdERDFxenVldE1DTzJmaGVlcCtqOXRueVI1amFRMXp5?=
 =?utf-8?B?T0gwbmRLMEJRZWM4eEpJYjRiR04vUy8rSVpxSnJjMllvVEREaHllbFh2b2g0?=
 =?utf-8?B?dGlLakR3OGRPN3JFRmR6M1lzVDZHd3UvQjNLdC9lUGw0ZGJnMlhad09tYlhJ?=
 =?utf-8?B?VElBRDExSmVyaG5NbzAydThqNWt0eUNCdkNLNWd4cWtNbzEzU3ZBY3lXdGJE?=
 =?utf-8?B?VDlPWkZ2WDFhQUtTd0VOYWF5WHdtWnBVeHAvcGl2dE5vVno4Q2pXOGNGSnhy?=
 =?utf-8?B?dFpYZU9tL1BteHpXNlRpYW44a3E0dWJXVENJN0piMFR4d2VGY1RJK285SVF5?=
 =?utf-8?B?cW9rcU82TEt3MWhyWk1lbE1uOGRFR0RxaEdKcnpHTndBQ2J3cmxaL3B4V0pq?=
 =?utf-8?B?QThLS2pXNXNtU0kvSzJpaWl1UThlOXNocFp0S2REZTJvaDFsbjlPM0V4a2pL?=
 =?utf-8?B?OFd2WiswWDhoeUNlQmN0Tzdlc01OdEo2ekt6Si90YjlpYk9TWHVYMUo2Uy9n?=
 =?utf-8?B?dDBpSGlGMVpxMHFnZW9DNzJlSmVYbUxWdjZSMmkvTEtaTDBNejR2Z2V2d2xQ?=
 =?utf-8?B?RDVRMnMrbWQzbVZOY1FCbFp5RzA4bHlZTlFiNmtXN1JNRlYyaHdMWmVaYmZD?=
 =?utf-8?B?L0tLZzU0Yk1neFNGVUtVS2RsK0VPY2p3TkRFQU1rVkZvemlIV0NwMlZadDVz?=
 =?utf-8?B?K2wrUDQxV1pFaFNhWUlQUGh5Q3JaNmptbGlEczlMVXhFUkRhQ2h3SjNGd1V5?=
 =?utf-8?B?aDYzVkNOZzhROW93bXB1MnR3RW1saGlYSmMzaHVmUnkzRUxYU2NmMkUvRENl?=
 =?utf-8?B?Y1lzbGlsbFhLOVpzSzZ2b1BnRFVKUHRqTktyM052VjRhbGJBbk5scEZIN00z?=
 =?utf-8?B?U2IrTC9lZEpiNHNwT2F1NWV0NzhJUWNZUjRZL1NVajQwc0NuZDRMNlY2Szd0?=
 =?utf-8?B?K25KdkpuTjMzZUgwVk1ZZHpUNFVZNmdXTXBuV3AvOUppbHpBUWxzclMyV0or?=
 =?utf-8?B?WGxLOFRqblNlM0Z0SWtLTE1oQnByZTBMcEZJa01HNGp2VmV4Y1RLT0FhNHpu?=
 =?utf-8?B?QmJWUUpoNWN1dUtGRGdzaW0vaTlpTTFYcXMxT3dGUVd2Q0dKWEFTM2pGbmNx?=
 =?utf-8?B?dkR2SWp2SWxqRUpVVEY3V0xlNEZvYUU5Vnc1cWhsTWxaT2JsY2hBbkFQRkRw?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c28515-4cbb-4754-909e-08db8a1004fb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 17:29:21.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8UF8zYPG5iI1CR7/vi0hAXhCoGX5mL1nN/pQULC1LYU+By4axjmQAWtzUcS4vgE+c5XcA541QJdRojF0pFAPGSfvuYar/4JQF6+MhxAVjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5889
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Because of hex value 0x46 used instead of decimal 46, the temp6
(PECI1) temperature is always declared visible and then displayed
even if disabled in the chip

Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>
---
  drivers/hwmon/nct7802.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 9339bfc..024cff1 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -725,7 +725,7 @@ static umode_t nct7802_temp_is_visible(struct kobject *kobj,
  	if (index >= 38 && index < 46 && !(reg & 0x01))		/* PECI 0 */
  		return 0;
  
-	if (index >= 0x46 && (!(reg & 0x02)))			/* PECI 1 */
+	if (index >= 46 && !(reg & 0x02))			/* PECI 1 */
  		return 0;
  
  	return attr->mode;
-- 
2.23.0

