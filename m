Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FFDEB64DC
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jul 2023 17:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbjGURCe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jul 2023 13:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjGURCb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jul 2023 13:02:31 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2110.outbound.protection.outlook.com [40.107.15.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC2726A0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 10:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFUBdMMJDoszSyL02Des6OxSTLGpVp53EoBz+R+bsGakAMeB5bhsWeeKZ0Rd6d6EfD5OamkdE0Nd+fYgrfbgL7tgluZsLDmKvW0Mw9qDDyflV4djwTy+s1FJlsv2gjIR/5QtlDZQ5zEF4c3B4aBIRvlJ2yj9LH4JGk2JClLUyJRUjwyltxgTqbTDyxSCTTjVnCMQvsoFn7ctt2W9txaUyhDC0PSVE6hdWCZj63Sf/e1RRrCmGs8bCqJDYHebtsLOL4qCkOfVtQFaWF5MATZH0SD0ONyCG+dxPTWPC4Hz+13wvWnpLq2j1/JEKvNcroWate2s6SgbrKoATTtL7m3KMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ymCcZsXQe34avvLae63ii0NNoD61x67YQtFuyyPRTs=;
 b=AM0tr1DQ40BiYlfxTm30S0qoQ2p/Oq9fip6W0YS1X7qpIopLoMiAcd4V2NZV/xqCaWz2pnBQqPCwiUV48A8jSD605M8wcgUf8KTEazbZ/d0zPCc4EUgKX/D6eXy5QSK7GRxLry2um9GE4AbsGRkd47G4fKGSxI4l896cdDD1O+igCTKDZYDgwVlZYxgj/TX9w5ChmCggrZ1lQTOCxOBZ5r2ik58A/3ks6C1378dmNMXUTPRl0Gjqu4uUJ0gyFIRGNLp5e/G9LsKZQfmKb+FpZCSfAxJ4Ek3xYA8UTDzxBlGfH127OJVgZ+eJOgMTMPR00Hv6De+pvNQMzPrun+lT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ymCcZsXQe34avvLae63ii0NNoD61x67YQtFuyyPRTs=;
 b=nSyaa0/kXjTcPXRFtAjWOL1BATzqJEljXadyAPVpMpMAxkqAYa7O2tbmwFodEjS438+u5tM1FO3yHoUNPP/04BbjBwPhM3Zo9iR58SDDg+cOm0/2mx66kL+hbOVugq1gLEJzEe2fKNYbH5v/uabFgWJ9USTFfLBuYTjdZTbCDgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::11)
 by DU0PR10MB5995.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 17:01:41 +0000
Received: from DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4478:3f61:306b:21e5]) by DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4478:3f61:306b:21e5%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 17:01:41 +0000
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org
From:   Gilles BULOZ <gilles.buloz@kontron.com>
Subject: [PATCH 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed even if
 PECI1 disabled
Organization: Kontron Modular Computers SA
Message-ID: <4d855a2a-c186-d439-d771-db7181da5f94@kontron.com>
Date:   Fri, 21 Jul 2023 19:01:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PA7P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::8) To DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3ef::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6252:EE_|DU0PR10MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 95220297-b9e9-4de9-b92b-08db8a0c277a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2HRSCi91uqNF98LfbmLsXQ0vJS3tAQrziXD/wvhk4wcspjRkxbtxz6HQmPJjMRpo6966WDAOL4Bw2L7kxXP4RN0DBIzFJlsbkc9LXjAbD5LvJFcvoUVfjfG0ff8o3GAZCcr7SFhFa4XuwsqygZhedeIEmamH74ruSZ3P6OhOxmAgdYsAnA/sTNqHyNe+2elOgDsivaUbhbEMpy9bd2juNZYivM1sfczWMNEnH/fVBfvSwPDBKbnuzjzuNcL0WoLnJuYxLC1rNrZHTS/kYluspVs2cmaJdld4MNLEBzHMh2EA7+p8JByEiOclAmg7q9eV004BxXTIZuEEA1tfmY3Ox6odVGllLbe6wCMW3R5KhB3VlnC/NMHPNAWydrl0IxENEl+HWiLldfnWA+yLhGJzPG4kJVsAgl84hErMx7d5AXmNAJalwdsD8AFrATBom+O1KxWWRn1fIKhbKrmF9l2rsiIYw0oyFdpVBUUHxrsn4FwBmSlNTKB/Hj+8u9ONLlmIhwVWmsQYf4IBWNbgto1NC3Uk+YcTHr5w7h66M+5nn7Zn6HP2HuN6NVHf80v/47YcIFO6mFZ5exE1dje0hvrsrYvUjQ0nzCUI4s+QeUMWVZAOEGx41RcHR7o5bxhNtEKaDAonZj4c/yXlMoZxTzZXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199021)(6512007)(38100700002)(83380400001)(186003)(2616005)(6506007)(26005)(4744005)(2906002)(8676002)(8936002)(5660300002)(36756003)(478600001)(36916002)(6486002)(316002)(4326008)(6916009)(41300700001)(66476007)(31696002)(86362001)(66556008)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmVrNGE4T01hKzg2Nk1WNTFOTHduZFpTUDN6ZEZmM2lVWkJKeHlBdVNTbFpw?=
 =?utf-8?B?MnBocDFlcFArNVJ5b0Jzd3QveHFmUklvSGpTRSs4SVU1MVkxRGJEQ0dCL1Q1?=
 =?utf-8?B?b0sxWG5XMTc5VUovLysrVXBra2lXbEozRUpTQzZQTzU4SW92SjZEVEJocmh3?=
 =?utf-8?B?SVo0RjZjZEpSL2pacFNGK3ZLMGk0eG10RUNEVjJkOTc4cUI0eDhWVGxsdHla?=
 =?utf-8?B?b2pKZEV2bG1zK3kreDhCZHZKWjhyckFQaUxocmNJZElUR01pTThUaG8yWk1x?=
 =?utf-8?B?bzBOWTRtekpUUkFrZ0pYMWhiWUJ6YS9mUWNkUENFMmtuY2VQbXNoN25WenQx?=
 =?utf-8?B?M0xjYU9NQXlYOFNrRlZVb25LYVJ4dDM0cUZIQm12eHcvT3EwY205YzlLTDNZ?=
 =?utf-8?B?TFNxcmt2d1U0cWhHeVJqYWUvOFRyQUYwOThIdkVhL2RobVEvdDAySjE0eG1X?=
 =?utf-8?B?NFpsMjg0cU5MZ1R6ZVdwaGtZUllqazBiVGRYb3ZlaWlXdXRSM1Q3eFY4QkY5?=
 =?utf-8?B?Q3dUQWpEQzRKdGpVcWoyL3grUmNDS0xJYVhGeHVTUmtseUJvVm5TRlFZaVRw?=
 =?utf-8?B?UFIxVnNtTUJiRm53Wk5WQkJQbmdGeVJ5cklBZHZzdjlsQVptUU92MGdiYktB?=
 =?utf-8?B?YlJuMHBSRnc0YytGWWJ1bDduK2tlOWxWb3Ira2tnTEZIa0d4ajB3N0tjSUpr?=
 =?utf-8?B?YVRGRkhxYmVhZ1FyK1ZOazFWQk1EYjlwUVZMR2VZamVQdFpiQUdzSzBEMDZ0?=
 =?utf-8?B?U3BXRmdIc0U3WFVtb2c3V2FSNUVCaENDU0hvL0F0aEpVYkJmRXBMOVBqM1I3?=
 =?utf-8?B?NkNDK21TTEdkZjNzS0dUTC9RRzdsdXpnNkRNaDdPdzRQTWhURFgrM0YyZnJn?=
 =?utf-8?B?anhsb0c0UzlvdjFMYmxpWWFRRVVLcHdmYnQ2QTRqb2ZqSGNzaXJkait2L1pq?=
 =?utf-8?B?bmpaRHNnbDlBakhhM2lmTGJab2JHUEhrNHVvRENaUUgwWHAwMVNJRERsV1hr?=
 =?utf-8?B?cUNDa3BxR2t4eHUyWDNBdHUzWDlualp1MlBjaW9zM2cyOGpDUlROZ205eG80?=
 =?utf-8?B?ZkMwQm4xZDZIdHFBTE9NSHZkSnhPWVA4bTJ5RkRYbU9LK0xXRHRlNVRCQXYz?=
 =?utf-8?B?TW5RUzJFeTl0NENXeGlZeTNHRVlSai9ORFRhU2N2SUNHL2ZpSU1HOXptTWZt?=
 =?utf-8?B?UHlKQlBFM2Q2anR0WTMrQWE1MExSSFNiL2d6S1lpVjBnRHJRM2JoZU05eHBR?=
 =?utf-8?B?N3JaTTNRVDlUc0QvaURzUmJON1dVWVk5YXlMS3N3ckJuSWUraFJtRDBrTkJt?=
 =?utf-8?B?dzcxQTRnTENlMHNPdklGc1pBd1RWT1NFNytGclE1citZOFV6dXR2d21ZNzBY?=
 =?utf-8?B?aUx4NGg5ajcwN1R3S3R2blVCTVpodzBIS2I5K0dnY2xvUXdiWmRBUHM0em9x?=
 =?utf-8?B?VjNkTExRY0NVMjI2MWN2N2Q4VzZCK1Y5TE5COHcrbVZ1MC9EdEF0cE10bEMw?=
 =?utf-8?B?aHdFeWVFQTdBSmxMSXIvSEdOcTZkL3dhcHRtL2hyZmp5QXVzNStwRkliTjdm?=
 =?utf-8?B?b3ZHdzNVdEluUFBjcktZQ3dBN3p6bWtQaXRDcGpPejhNeE0wdW1nTVhSOVhC?=
 =?utf-8?B?dVlSMktEclpyL2NqdE1CdjFZbWMxMEFMQUpndXZ3WFJWc2JiSnRoeUlNYTFt?=
 =?utf-8?B?dVFMaWgzZ3k5bHVidHoyMlNkYmlkY3pXRkpDQUg0UHJLamNHUXl6cTVSVml5?=
 =?utf-8?B?eXRDUEEzRGswRnhZdk95dHBSQytBcUh1REVlWk5FYWVXUXk0Mm9kRWxmV0w1?=
 =?utf-8?B?WkVMb2pVTDdJZVlLbkloV01veHJHUWs1S1VRb2lQN0tiNzJ2c3pwK0owUjRF?=
 =?utf-8?B?RmVyYm5TY2NPSnUySnc5enFzK2hyUTFmeXZVREJ5Q0Exb1BGd3B1eTZuQThT?=
 =?utf-8?B?eFdtMzMvb0wxVER5TVZwbW5LSlJsUmlOQ1ZBTXcxKzdKdUEvVXhXZUtpMGM4?=
 =?utf-8?B?ZTFra0VFSElXUnJsYUFJSmkwTTlSUmMzcDlzUWdoc1hGRnVia1hXWVB3QTRT?=
 =?utf-8?B?Yll0OHgzL0lGbzY3d2l2UnU5SWtpWDJvbnhMbWRoUGVtK2lWY3ErR3pZK05L?=
 =?utf-8?B?WUFJTzhSamQrRGxiSmhVRHF2R2h3WXkxWU9ReUY4SE5kRkJ0dVg5a3pZMU9N?=
 =?utf-8?B?VXc9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95220297-b9e9-4de9-b92b-08db8a0c277a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 17:01:41.1025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wXgGnyFk9Ck231j39lYEg3KiLT1rCxrXd9CW/6YvHugNBwQaQE6rxO/oYdFq46hDrtTT4Y4FA5zVEBgFLhWl+kpf8LNJigVUcRfPIj4rVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5995
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
  	if (index >= 38 && index < 46 && !(reg & 0x01))		/* PECI 0 */
  		return 0;
  
-	if (index >= 0x46 && (!(reg & 0x02)))			/* PECI 1 */
+	if (index >= 46 && !(reg & 0x02))			/* PECI 1 */
  		return 0;
  
  	return attr->mode;
-- 
2.23.0

