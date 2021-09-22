Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FA5C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Sep 2021 07:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C986610A0
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Sep 2021 07:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbhIVHYL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Sep 2021 03:24:11 -0400
Received: from mail-eopbgr80113.outbound.protection.outlook.com ([40.107.8.113]:64030
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229697AbhIVHYK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Sep 2021 03:24:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ov8Meh/MCPMDKMQrA1aL+XgNBuSerJXdSHCGY32CCIh4YpohvIurciCDeAig7tNH8nnmb/JHOSK+PLa4XovzZugEUnxlD1/T40I8ll8n8Ph06bbJyHCKiZiz3lRkNO+fUIfJs0xVIGfiqJPhdRRiP6H9sqBCO8fktUI286P5aMXvfWgchVK4NRCSpMN3HDyCV8iUVEvmQeN9EgJEtJ/bFzyC5zD/eMWZxDlBjGdhzUrY0VOfQdb1lNnL/83M0SrMjw1o+LH65TgvqCpt6JnLOnwg8j1W2bjuPOXJwKCvABxesiQoUKyLpMontPQBU3ReTqeqDIhKXUZr0Kjleu8iEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=blqPYyeqzpalz5W4FbqcqybTAU1xo/v4c+a4ofwOvX0=;
 b=lq1pFgyouwRNNpYBT/8/yNnGqjGQCZdaF8EWu4tQXaeAFv5m/YT/Zp2AGsjRC5Yf8qstFMITH4EL2DY6/TLwCFV4Ez+TJjIH2YCMxGAGQUxCI6SKI7nZquBCzeuOuWUEGsLq/MsTv7lON52TYf66KJ97teixLHXYXkO/mM+2/T4zY4Mt2wGVwH52B1JpO8qi7Wd8j8/8gtC89JRSpFW6bAAeIspm3IkAx4OQF5yNgisTBQoUXTTwfFQM4eazo6QJdJbUvWo23MjdPqrHjUmgK5HrC+/4GTbK0Jihk+/o1UxsNdpJcqG3Ihl1Z19lxEU81rKtj6VptMZCGjW8DX86PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blqPYyeqzpalz5W4FbqcqybTAU1xo/v4c+a4ofwOvX0=;
 b=C6q1V2GyoMR1iI3y2VOZ3vlhME5NyEj7736X83OCHkYN9+pIXa4xuErhWplQ7udb8Kg/m8mHMLMJFCpfVr8rnKJL6mjqav3NQY1d5k+shjY0UQ8G3qR8t/0Z0Iz/FPfJhqJug/zyB2zK9ffR5S1IdsdZPhWcm/tO+jHUqCCeJIU=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8149.eurprd07.prod.outlook.com (2603:10a6:10:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.12; Wed, 22 Sep
 2021 07:22:39 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Wed, 22 Sep 2021
 07:22:39 +0000
Date:   Wed, 22 Sep 2021 09:22:33 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Oskar Senft <osk@google.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <YUrRd3kTyLoCkLAt@localhost.localdomain>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
 <20210921125831.GB1864238@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210921125831.GB1864238@roeck-us.net>
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.21) by HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend Transport; Wed, 22 Sep 2021 07:22:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46d502d0-e383-4a45-feda-08d97d99c1aa
X-MS-TrafficTypeDiagnostic: DU2PR07MB8149:
X-Microsoft-Antispam-PRVS: <DU2PR07MB814964A466ACAE3A4C2A0F12EFA29@DU2PR07MB8149.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LpYXHSyHE7NzCLUEFp4TDb4+z7EhNNGg+NKgFgBWDq8J5tDmNsb2WPC1e/tx0FcDa2famsqC4/YGgJH/UHVrO1AovbmQOdlZLBCDTACU/05nLNxMNzhQzojANhLwgupmpA4Pi/KDIr2DYYYVx+b8T+aPpmrSgCAOhF8HtINm48LnqdniK0ZG1bPxi5eEfUNtyJDDZAD0AvNjM0sQvWnBw6TsTt2MO1IGyBmOMN/CjjCiSeVikMpkgmBXysvnMNnGi9pGaFRquoiwrNVLL7/PPHPDjJaMBMoitXUID67MkDkleSPicSIQRtFtZt/abt+k3GMii0HuL1VLYZ0w0pG/KoqlAE0I1OYPR4tiU4zMPGnJ+mdx/m7UX3IAIfXrl7IH3mr+W/m8Bb3g+1iVoRbCwpqidHFNw9zcORbWsaH5B3fy2sCRKv9c2a+jBBpXN1XVuIf/2oROh7DLnilLlsgij3ubrXGQWE/SVYxAOzc1QfJkkIJO9+ntqqb2Z+pQ2cx6nVMJq3+irwJ4jDh3vWvDfDgk7dsf2W/rU/eO/r0fc5dOVKPL4fJ2ZdTBoKuHfTloNaeLpFYstWEqlE0+XQD2JH7j6L1bYgTVN/fdqMQLY+pCjwMJ1cEm7D69U0zOelU5EjwFYZ71bcOvDLqclDu+76dC6eQOiPUA23c8gw2VSWReE3BivGaWlK6iE5nBa8ezXvw7+MDHc+BGtdehC1dXdi0lFbbZAkEZ8lYHWvbNaFY0jeIyM68GSbUoXgMp9vvyG/HaDeUPQx5KNFunzdDY1UggQPs0xeAoviKr/Fwez8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(66476007)(6666004)(7696005)(8936002)(9686003)(83380400001)(2906002)(508600001)(52116002)(44832011)(26005)(55016002)(6506007)(38100700002)(956004)(8676002)(38350700002)(4326008)(66946007)(316002)(54906003)(66556008)(5660300002)(6916009)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eS8zME42TXFVSk8vcGErMThsbGJvS2lGNGZxdjNObWt2aktyNnZKY24zczYx?=
 =?utf-8?B?QUo1NDdzdmZ2U3lLZlBvQXk4Qkp5QVBMRlRRV2YrZkQ5U052MDJYRmNhZVE2?=
 =?utf-8?B?NlAwNnVIeERIMDhCRU5odzdQR0gzSXFKYkVzdENISjgyOUoyejNqeDUwbzVw?=
 =?utf-8?B?K0grTlllUFU5czQveWlxcTRmQzNIK1VxemZMVjRvcHBGeGcyWXk1S0NPS0cy?=
 =?utf-8?B?ZWFZdDZzVXpudHhnWjNQYUkxaTgzaDdZQ3pjVkwxdXJyazBVc0ZFUW9wRWh5?=
 =?utf-8?B?MzgrdVVmV1U4YUhtUmRPeVNoTFY4Uk1zOEhFMmVENmRlenlURHdHU0FLN3p2?=
 =?utf-8?B?bHh6clJZeWQvMVhkSkZBRTAyZmNGNi9mUU9VM3d1eHN6WTRaM0h4ckFyOGhJ?=
 =?utf-8?B?cmllUFlXaDNtWGpPNGR4QVBxRGRQK1RIZ1lNYlpVWTI0bUkwRnhPYTYzRHJQ?=
 =?utf-8?B?ck04QmdpRWNDU25yNkQxaktVUmRTZVp2VEg3dWowZTY1UkJJWGtQTzUvbTJt?=
 =?utf-8?B?d2xma05QbEM1bjFEdHZSdG5BV1FNd1ZaS0c3RHl0aFcyeFA5dWQyVkVvWmhO?=
 =?utf-8?B?RlN3REE2YWVFV2tYWlN5QXJ5d25may9iZzhUZ2VpRTV3dXVuNytDSlZaTE53?=
 =?utf-8?B?VUZSM1hJUnlhSHVKS2pjYjJtMTRvL29BWG0xMXhncFRwbUsrMys4eEdhYTBC?=
 =?utf-8?B?QlBXcURGMkI4Mm9hbTBKOVBnUDd6bXdxcEllRm5oRmxmWTJYa1BnamtyZmZB?=
 =?utf-8?B?d3NpclBJRW93bzRGTFJXQXg2Yk02RHdqcHYyaVZRNURjWlh6UHNNRHJranR2?=
 =?utf-8?B?NTREajl1bzRVZCtkVHQ4b2duU2ttRUhJd2pCYUFDR1h1KzZibHM3b3VFM09X?=
 =?utf-8?B?ZUk2ejkrVjdsak4rQ1UyaEdKcDFTYlRUL3BuTEtxUGRXeEJhQ0NyclZSZGpW?=
 =?utf-8?B?eEh0YWxCeW0rS0YxODIrdVpKQ05vYlRJSjJDRWdMMmtJTEpFUzEzVTRlZ3dT?=
 =?utf-8?B?aWFicmtKWjlXbVZwbmxjTVNPd3cxL1lRU0V4UGtMN1JWV282eklUa0E4MURq?=
 =?utf-8?B?ZkdVUldUd2s0ZVV2VUFkYlhhL1dBbE81SUFTWEZaTHN1NDRVeElGQWkyRjVl?=
 =?utf-8?B?YUQrWDhFbjE2SDZubjRkN2Y5VytoTFBtUkRHNTRRYkl3MjI3aWpoZGlTMFMy?=
 =?utf-8?B?aEhuR2lEaC9LZ0JqNUdCR1BhNjBFSElFeENEMWNuUFlKWjh5MWIxYUtpaVh3?=
 =?utf-8?B?RytjTW1ZWGM3K1FpdkNzaDVSQ2k2eFlKRmNPTHdqUU5BVjd3Wm9mNzdCdlk3?=
 =?utf-8?B?YjFGSU1HMWovVWRCbU5QR3ZpNnFRNjhBYzk3VUpFRlptNGhFVHJTSDE3N3lm?=
 =?utf-8?B?WFduYWUxOENFQjdZcWNzNEtyaytVK3NvNkprZEhjRUhJbHVCNkgzSUw3eHR3?=
 =?utf-8?B?cTA0UjlpYWNrME9obEVrRkJzZzNoMGRrMjJ1V01ieXI3TUU1Q2lSbUowQk0z?=
 =?utf-8?B?NWN5eVB0amlrYkxSSkQxak02VU9HRnBNbzZTblhLN203cnVNZXVxdUd0aE9z?=
 =?utf-8?B?aE0vaWNWVzZ6TExzekJSM1J2Y3ZsaW5vbFRnM1A0dmxYdEZGV2orZmpDTi9s?=
 =?utf-8?B?Y29Tc2dkeFFpS0owQ3FrMCtEekRmRnorT3JvNEgwMkoyUDh0NGlDK0Z6V1V6?=
 =?utf-8?B?UHBQWksxanBIQ0lwdFd6UXl4bHZoS1ZoQ3RuVnpIMlU4S1F6aDZxeDU5L1o5?=
 =?utf-8?Q?Txb320QhPU3blnc2N15DwtkxyZ3HGPZ454fuYFE?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d502d0-e383-4a45-feda-08d97d99c1aa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:22:38.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +G2sByBIR6BgLdcCa2eqPnIPsHXFvYyujZJ7zrSVt+2tRRr0CIFyxcTe9UOGPOyvSK5rsatDcg9pPjucKR7MgAsEE1Y9cXkIuTjrNRp6bYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8149
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Tue, Sep 21, 2021 at 05:58:31AM -0700, Guenter Roeck napisał(a):
>>
>> ti,n-factor
>
>n-factor isn't just supported by TI sensors, though it isn't always called
>n-factor. Maxim (eg MAX6581) uses the term "ideality factor", though they
>also refer to the factor as "N" in the datasheet.
>
>So question is if we make this ti,n-factor and maxim,n-factor, or if we make
>it generic and define some kind of generic units. Thoughts ? My personal
>preference would be a generic definition, but is not a strong preference.

That was exactly my way of thinking here - many sensors have n-factor
parameter and this is the name I see most often.

That being said, maybe it should be "nfactor" instead of "n-factor", as
this is what tmp513 is using?

>In regard to units, the n-factor is, as the name says, a factor. Default
>value is 1.008. The value range for MAX6581 is 0.999 to 1.030. For TMP421
>it is 0.706542 to 1.747977. So the scondary question is if the value
>written should be the register value (as proposed here) or the absolute
>factor (eg in micro-units).

Since expressing the fractional values in DT isn't well supported and
(at least here) hardware guys like to think in terms of register values
so this is what I proposed. Also, I just noticed that, for example,
TMP531 is using register values as well.

>> > +    i2c {
>> > +      #address-cells = <1>;
>> > +      #size-cells = <0>;
>> > +
>> > +      sensor@4c {
>> > +        compatible = "ti,tmp422";
>> > +        reg = <0x4c>;
>> > +        #address-cells = <1>;
>> > +        #size-cells = <0>;
>> > +
>> > +        input@0 {
>> > +          reg = <0x0>;
>> > +          n-factor = <0x1>;
>> > +          label = "local";
>> > +        };
>
>In the context or other sensors, question here is if we can make the
>bindings generic. We have been discussing this for NCT7802Y. The main
>question for me is how to handle different sensor types. TMP421 is
>easy because it only has one type of sensors, but there are other
>devices which also have, for example, voltage and/or current sensors.
>NCT7802 is an example for that. We just had a set of bindings for that
>chip proposed at
>https://patchwork.kernel.org/project/linux-hwmon/patch/20210921004627.2786132-1-osk@google.com/
>
>Would it be possible to determine a generic scheme that works for all
>chips ? 

Just wanted to note that the bindings I propse were not completely made
up by me. I based them on existing ina3221 bindings so I feel like my
proposition is at least in line with that one.

> I can see two problems:
>- How to express sensor types. The NCT7802 submission proposes another level
>  of indirection, ie
>
>  temperature-sensors {
>> > +
>> > +        input@1 {
>> > +          reg = <0x1>;
>> > +          n-factor = <0x0>;
>> > +          label = "somelabel";
>> > +        };
>> > +
>> > +        input@2 {
>> > +          reg = <0x2>;
>> > +          status = "disabled";
>> > +        };
>> > +      };
>> > +    };
>    };
>
>The second question is how to express sensor index. One option is the solution
>suggested here, ie to use reg=<> as sensor index. The second is the solution
>suggested in the 7802 bindings, where the (chip specific) name is used as
>sensor index.
>
>+            temperature-sensors {
>+                ltd {
>+                  status = "disabled";
>+                };
>+
>+                rtd1 {
>+                  status = "okay";
>+                  type = <4> /* thermistor */;
>+                };
>+            };
>
>I personally don't have a strong opinion either way, but I would like to see
>a single solution for all sensor chips.

For me, the problem with using this style is that it is sometimes hard
to come up with good names, especially in simple devices where all you
have are channels.. which BTW may be called differently as well. So we
would end up having some device with channel0, channel1, etc, and others
might have input0, input1, etc.
This argument goes the other way around as well - some devies have no
way to easily enumerate their "subdevices" it would be hard to assing
proper numbers to them.

For this reason I think it would make sense to actually use both schemes
- reg for cases where the enumeration makes sesne (when we have
   channels, inputs, etc)
- names otherwise, when there is no natual way to enumerate the devices
   by an index.
