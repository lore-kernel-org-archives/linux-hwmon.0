Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA931C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 07:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 850A160EE3
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 07:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240208AbhJGHxd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Oct 2021 03:53:33 -0400
Received: from mail-eopbgr130139.outbound.protection.outlook.com ([40.107.13.139]:55943
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232482AbhJGHxc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 7 Oct 2021 03:53:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVrKMASwtp5qp5qXplfZ0jkGNKjljKvYwfo1yGkTXMNH2OUk2ROYXowzqHxOgSUVe9XS9v70GDsrfQYQX0gEQh3fmbIXv93mwRj9X2glc2wtLPzhNM6YiRv8vyVtxQjdYhGlwosWZkK07ZLov7BwbREjszykADFvEZwQib4oDM6/9T+4kazG3IynO2GWCdjYS+K0djStdJiJ4PFaTAc65pVKtax3bfcynkMON+rYHmm34bfyISDQFALChorEYlM0s3Gj7JqMHiW6Mefpwjcc38+wl3PzGNDAr0byO+IbHwWSxBLC+IrWwbJ4uO+H/uc4ceH29yJ+xgM9gzlgRYalBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4P+15+JjY5W7rz3xcYErSqvP6nu9tdrqh4CjKEtHEI=;
 b=ScNG+hXEi16Vro9f6KeJlrvpmtCIiYWmagVlWWkALJvSBSXSZ++NHnvp6GAs5uDEzlBuWBmimFstT55AZLUR99eRwhb5v9wrKJvry6Xp9Z98U/nbIhDnC2dnyIVxYX/Pg6oP+JOHSpcl+dLpw584fc3OmT7iABCmJ4Rt2Hg1Fw/X4kQLIaMRG5rv6EDYWPdiiWgjxlKOlwCfCnGIDkbBq0+hh6hGR1VLuANRkAnLM6Qo1/aq5CSp9y5L921lR01qeQ1OFb2T/PNFzdagbmyqegkyIdPLTlIzPmZRcVDRTdNVfcTdtMMBPclbvki103HPJdk+P+++9DuEttwcAFICVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4P+15+JjY5W7rz3xcYErSqvP6nu9tdrqh4CjKEtHEI=;
 b=OfQ8LHf1znd5uczFSiABwaS8WvdzpBjD5u3d/1txGaBnRdueBVVZ3LJcD1kd7cZCBR5gA/ssWQCQC2vGAfxFj9EjS8gD8orVEtPrknuBgI8S/s4ely2jPVleMzjQCQMdNduWs2OMBoatLyCaFl4yylfMzNLfr9rkiczMaYBx808=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8268.eurprd07.prod.outlook.com (2603:10a6:20b:37b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 7 Oct
 2021 07:51:35 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 7 Oct 2021
 07:51:35 +0000
Date:   Thu, 7 Oct 2021 09:51:12 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels
 for tmp421
Message-ID: <YV6m8MRa4+lKOWTp@localhost.localdomain>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
 <20211002142219.GC34532@roeck-us.net>
 <YVqu92dUgNKlYMlG@localhost.localdomain>
 <20211005141457.GB2395636@roeck-us.net>
 <YV4NUqf7ey5Yr55P@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YV4NUqf7ey5Yr55P@robh.at.kernel.org>
X-ClientProxiedBy: MA1PR01CA0084.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::24)
 To AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.30) by MA1PR01CA0084.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 7 Oct 2021 07:51:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eab24f2f-6aa6-43cb-3dad-08d989674940
X-MS-TrafficTypeDiagnostic: AS8PR07MB8268:
X-Microsoft-Antispam-PRVS: <AS8PR07MB82684DC18CBDF07963F91172EFB19@AS8PR07MB8268.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaSL4xUHEQ6ge8wZWQfkR90LExJm1nHjk2vdFtNUwaNcQe5SW2QTj5QjrbcXa96oRZ5Okdd8+pRkrOMbYYdAyLbYQZcNjileUyPL5cISavtDEcaosu7jgxLIw/7k8cqU486sb5ptR8IBJzDfzEp1OKs2GphsWUJHzU5N1KkqUJu7DhMg4yhtOr06aUx+MJfnG8+te8YjZyVFiyyMVrjFNIS7fpNMN0g5e3esk1xRvm1qfi0Gq8Lx487NAtIVEYTKzZfMcNKvWYaZFR6SQwfR85jlk3CiuPxZvB28tVhuoZcpe6cn8kErWjwH/M3jkGko7sf/3ZHL1MkisJsC3TjBe1cc5k/PIgyOSN6NooIYiSoHxXFK4QV9kXXtdm5Ci671MWwD7L427K0J5XdB8//DKq0ZUEm8Mt6jv9w1QVN1qW2OScmzGWehloxy947Bpl8uzcayNSoMEStW6WVDF27pyWiNwfFTmUiUr+dlTkwwgmleO0opK6u5ql2VPN6DWooqmKfb9Hy2L9uMpzaLEcCSB4MMW0sZDUKxN5u36Ndr4Myao/CPRZoNWgZkQmh32oT1mdBLZMTM4hXw/gWNZkv89c4mBRktzbJOIB5z62PuZWkxOBillVq/EM7T7pDFkEAEbYGFBR1ro1GdVXXp2VK1ey0yf/v+DUjBCS2ZsdqcdPtUSPfELFUEo5ACEHz5Qdqsjteh1rK18IfYub2H8ev92QFcsMAM90MIQCCFMLcbI3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(956004)(8676002)(5660300002)(83380400001)(6506007)(508600001)(316002)(66946007)(55016002)(66556008)(66476007)(38100700002)(38350700002)(2906002)(7696005)(110136005)(6666004)(8936002)(26005)(4326008)(9686003)(52116002)(86362001)(186003)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z05nbFdISVZweDV1RTFVZlNTQXJYRnN2eGJDM2JYOS83azYydnNYUnpESWpF?=
 =?utf-8?B?TE50a2JmbFE2L3IydTF0UGg5bnhuTDBxS2VTZUJnbmltaTArelhOTVJSS2hC?=
 =?utf-8?B?TmhHakNxSzFJdTczMXRuOVRtYUtyRUJlN3JpVXVUVjRaMFMwY0J0ODBXWkpm?=
 =?utf-8?B?ZlZCZ0VScnkzYVRSeG1QdUZtK0F0eUtoOGh3Q1dkRVFXa1dFSFZaZlhVRDQw?=
 =?utf-8?B?bFVtZW9ocjlyM0E1NktXcGIzQkl0U1QwWWJGYkFVamprZ1VZYzM4L2FyMkZ2?=
 =?utf-8?B?K2VLR1VJbWoyZ1VmNzVVekNpNG4vaTVpNFRKZGM2cEttMFBmQzlxWnovV294?=
 =?utf-8?B?aGduQ3Y1NHkzSXFzOGJSUytGL0N3dE5uS2V4bVVQRzVlbk94K2pVeGljb0ww?=
 =?utf-8?B?Um8reklyMCtnT3RMZkVQVDdPTHM3MjlwSW5vaWRTR0hxTUxmcGxuYkdUaENv?=
 =?utf-8?B?RHlSRmw1RENVbzlWMVVYTVNGTGg4ZkZtTEtpMzBLNncrWE05TngwUnpycVMz?=
 =?utf-8?B?V2kxVk83RS9Ybmk4Y1RNZ1hGcG5uM3YzRHZnVzhkaFRWa1NZampWZmFISnJJ?=
 =?utf-8?B?TDRDaHRiZ3hFRVNRc1lYS2d2c245YVQwbXExUjk3ZWJOOGEzd1JseCtyYUo0?=
 =?utf-8?B?ZHJuUy9USlY4V2FxeGZPYkhkOWNxWFhCUmNJU3A1R2owSGVXYURSOTJMcy9Y?=
 =?utf-8?B?UW9va2luR3dtQUZ1TzFlMUpLeXJvenhwSnRLMzgxeTA5MHMyL1pRWWFUbGFU?=
 =?utf-8?B?Q0NySGx6QzhRdDBHWU5SR2JRZDFhcEF3cEhFVDhRUUFhbVFPMTB4My9JZWRN?=
 =?utf-8?B?d2pKTlhFTW1pd2dKeGFnZ0RDNEF2cVhIN0hZcFR2V1pxaVp2cFZiWTRsbzBO?=
 =?utf-8?B?QzdESTJ6WmFqbHZpSGlZaGx5aHkzZ3g4ZzYwWEhVV3RLMXFSNUNlek8ydVhW?=
 =?utf-8?B?eEEzWWJYSmhpMTlxN08zb0EwQjdyZW8yNFlSTkFldmVZaUlMb0VmaFM3MUVR?=
 =?utf-8?B?WTh1MGhFcVM0MkRJU2J6Vytwb2NwZVdDTWpxY0s5Y293MGI0QS96VStPUWwx?=
 =?utf-8?B?OGlHWmZ0TGNoRjh4RFpwQnNtUUswNVFXWkVsWWszcitrU3Z4V2RiaFgzM05H?=
 =?utf-8?B?NHd2enBpUDNpZTd5UnpEZnJkaGd4eUFRVTRYemZJVzF1akZyTk5NL0Z3c0lj?=
 =?utf-8?B?TnJ1dXU1TS9abjRtK3VjUU1SbWxxd0VBNXhSSGRreFlhaEhEYVVFN0lneVZC?=
 =?utf-8?B?REwzUm9uSTBJTkVwMThzSmxjZ1dRaFJSak5xUk13cFBsQ1ZCZDNxTTEyaTdP?=
 =?utf-8?B?Z3dJRkk2VWxXMjFKNFFldkMrK0tjaSthcXRHMGQzUkorL1g2THBacm1yZnRB?=
 =?utf-8?B?ZUtGQ3RPYnZSUEJ0Z0VkaHVUeDVwQnpZQUc4Tjc0V1ZqV0x2Mk1GWVBHWEZP?=
 =?utf-8?B?dEVYb1A3b3MzbTZyczVjZzREQ0RENXEvVWo4MDdaeTRxVVVpT2pwWXIzV2hT?=
 =?utf-8?B?MjFMcWtvS3AzcFhFZEM4VHlBaHp3UlhML2UxRC9iZ3Z3bXFVRk05OTZLMFI0?=
 =?utf-8?B?N1RvelVBODNheUR2Q1Y1elJxN01JTlJyZk9zVExzMXhicVlZdkRHUEJyazBq?=
 =?utf-8?B?OU5UOTZwWUFOYTFlbTVVWEtCeVR2OW4rc2xxY2xkVjErclpYcXpWbWNkcFZ6?=
 =?utf-8?B?UDVSNG0zdExVOTJ5d3ZrSTF4a0JDOGxmTFo5ZzNTdmwzWjdnOHhudDZMUVhW?=
 =?utf-8?Q?wUrhERQjDbvnKX2on5RzJ/zUBV9CEFfuL6QH7Dy?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab24f2f-6aa6-43cb-3dad-08d989674940
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 07:51:35.5738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOfOoJFiiKt+LYlEnW9/qw7gsjtLcBrk+stKQc1e59Qk/XcsO7OSEY0I9BVE3ZMYt0wdQ+VyV+/B48unZIeoTs2KnsrkUKu2kpYIFMg/D+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8268
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Wed, Oct 06, 2021 at 03:55:46PM -0500, Rob Herring napisał(a):
>>
>> 	input@0 {
>> 		reg = <0>;
>> 		label = "output voltage";
>> 	};
>>
>> Anyway, maybe Rob has an idea how to name this properly.
>
>No, I don't have a sense of the range of h/w...

I feel like we are stuck. Rob does not have a sense of the range of the
h/w and Guenter does not have a sense of the DeviceTree idioms. How can
we solve that?

Could we, maybe, just focus on this typical, simplified, case I have for
now - a sensor with several channels of known, same type (temperature)?
We clearly are unable handle all possible cases here, for now.

Does this look sane for that usecase or what would you, Rob, change?

sensor@4c {
   compatible = "ti,tmp422";
   reg = <0x4c>;
   #address-cells = <1>;
   #size-cells = <0>;

   input@0 {
     reg = <0x0>;
     ti,n-factor = <0x1>;
     label = "local";
   };

   input@1 {
     reg = <0x1>;
     ti,n-factor = <0x0>;
     label = "somelabel";
   };

   input@2 {
     reg = <0x2>;
     status = "disabled";
   };
};

There were some doubts whether "input" makes sense here.  I still think
it doas as even in HWMON subsystem, we have "hwmon_temp_input" and
HWMON_T_INPUT, so a temperature channel _is_ an input.  Of course I can
change it to "temperature" or "channel", just tell me which one is
accepted.

Krzysztof
