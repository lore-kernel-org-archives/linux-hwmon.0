Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6B2C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Oct 2021 08:31:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 296D5610FB
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Oct 2021 08:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237420AbhJFIdR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Oct 2021 04:33:17 -0400
Received: from mail-eopbgr30139.outbound.protection.outlook.com ([40.107.3.139]:62294
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231415AbhJFIdP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 6 Oct 2021 04:33:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbip0YBFe8Nog+Em5lClUTPSfXJCmrzQtBOUYee/HENonrkumYlYr4VEJRoudJjkLpmbasKc4D7L7FFN/uDrjrxUHbTLODcJyVLz0yoTNYk8+pFpvX7LTyjBYIoxZy4DEivVaS1SwJ6afh60+QtPiPPTigmaQQX+rGGed6P3oOtrA0lO3nOHv4mX2AjaSIfsYQT8rHSN8+6Iwy0Ba4h9APhwKyvM4devaJ2oYMUAbU2IEznzuY9FAMQGrpDug9I1dwHXYRVBv74JXbJxBkXRBc37RSEG66eaAEQcY2tMSf74vP+6jxPAgGzyZTXFkelvuEl32TVqfAA0JaHM5nb2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BR3zjZHN7qWRNOMgAH/oaiBW0MGxXx2AiedImq9QttI=;
 b=Tkh37QVD8iey6gtUIpS8bH9um/cny8bWcq5KhsxgGpDuzbCH63qQLPJYSFr9pYgsX3GWbMZc2ZTeUE2ywhXSPsKIHYevj8vxhhoysaHzMzImQcqUOqKHXZBOUZuBqQxqdYvVS3wt3fpQWcoS2Euw/IW48fc2Sli62wO5ciTdtCIt1hmjI6fLD0Y4VqISpbxgFCG3fWBWYXAURxiHXXIYm93yJJwVSi/s7uJTQHVpcJDTv9QlWlCK1DdciO7JgzH8udGEbPLtRVXWRWMCg0kjQzrEtIWH+lQtVpXDkZ1LPsTO1JZGlf3M3i1HO0kh+DB3kKmpS4MhSj6To7yIglOsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BR3zjZHN7qWRNOMgAH/oaiBW0MGxXx2AiedImq9QttI=;
 b=MqKUo9L1ZubGavaP2+U3q8UQJa1BOzVcuTs/iJP41xbzb85POr6/fzbaH/OwuXlGzdXUOhuaKRK2l5xioLr2zo/eXgtm3qMkLa3igsM0yoPQy4iodXtyUMWRXMhRzZbFF6BzSIP6KI+0euIeFEdRPZ/Gbo4/iBr2ybI78MPq18E=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8346.eurprd07.prod.outlook.com (2603:10a6:10:2e5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.9; Wed, 6 Oct
 2021 08:31:21 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Wed, 6 Oct 2021
 08:31:21 +0000
Date:   Wed, 6 Oct 2021 10:31:13 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels
 for tmp421
Message-ID: <YV1e0Re9nuwLEkhv@localhost.localdomain>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
 <20211002142219.GC34532@roeck-us.net>
 <YVqu92dUgNKlYMlG@localhost.localdomain>
 <20211005141457.GB2395636@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005141457.GB2395636@roeck-us.net>
X-ClientProxiedBy: HE1PR0701CA0081.eurprd07.prod.outlook.com
 (2603:10a6:3:64::25) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.9) by HE1PR0701CA0081.eurprd07.prod.outlook.com (2603:10a6:3:64::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.8 via Frontend Transport; Wed, 6 Oct 2021 08:31:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea01b69a-667f-482b-bf54-08d988a3ac4e
X-MS-TrafficTypeDiagnostic: DU2PR07MB8346:
X-Microsoft-Antispam-PRVS: <DU2PR07MB834635B02D156879F98E913FEFB09@DU2PR07MB8346.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ec6/nGcPbd0ENLHZbVL5SGV54SG9/BOaUPRh4qn2i9NzKxVfeYVbFVFq128Kd7/9TS8u/Dtdkk+TBqKX7eYimwlMrsW5G+UgnEXviIyXKXfblyDtpFIvrZPWNjexHbz3N4sREJSmumrF4CM74wz2eA/glxhMhvbwL63xUnSlCR6TcrGUh5beLksbdizmVFVBxZpNc+kkRX20/bbxeDa7GkjAgLviCsRuTNadwvcDwCHhgNUAuGMY6iXyNNvvvcvZPwX6LaQUvbOu6SrYZWpWLUMJZ2vI5cyAw5laxUYhhGGSYdD2QOFoMhOQxg3gtiyzyw4HmPbK2TqLeIYthM+/LO1z0EVYywRDqNo4q+abrvg0n5bvBwfUmb3vhYTVDMUPeuNMA8zku6TjQ2sNfL4K3EvcVFq9U8vC/YWNjspyhkIPzXF3QWTTPenv/sYyMmhSyFkFVksqUiH4oCUfpPskzCUptC5SWi2yWH2x+gJFAxGqPW/LzXdjqrCytoqutg1Rvl46eNSEYdNt6GNQUV0Vx4fqe33DOYEw2bM3jQcCH0cUdRcG5LFIPRLG9S7y+RXXLJcL6X1lupY9BDW9ydgz4PJmIaSpm3W0wyIo7i6h+anGNkAcJlQljt1/gg/3a300cz/mgFPmAviZRDoo+IlkGa1P5mdt1O7rB9FUPYReTGO29fxG2oXTBwMw8Qpg1i4OTPT7HjblbQqWaBX8K4qdF0qcCq1i0VPoPjAQ5weyhmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(316002)(956004)(110136005)(4326008)(86362001)(55016002)(9686003)(2906002)(186003)(83380400001)(8936002)(38100700002)(66946007)(38350700002)(6506007)(66556008)(26005)(66476007)(8676002)(52116002)(44832011)(7696005)(6666004)(508600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RElDWWhDOTJNVFl1Y0dsNWZSdkhzYlRWT01wZWlxRldpZHVBRUJSd2pTeHdj?=
 =?utf-8?B?ejVwbUMveXpMWlVueUJRNXNLMGUyTmpyUDBxL2V4dVNhTFA3UWtQUlYzM3Zp?=
 =?utf-8?B?c2R3eTNzUXhVRXZVdDVXdEtlWFl3U2I1M2N2dXF3UnlPYWlpRGJQWFNycUhv?=
 =?utf-8?B?TDNKY2Q2UnRNbjNGRDRpOGR0bjRod09jNVJuaC9UNHRwSXZid2Q3YStoakZG?=
 =?utf-8?B?WldlSmJyVzIxd0tmSmY5VVFwV3k5eHJBeHFRa3p4OFpvZnh0ZythZGI0SXZ2?=
 =?utf-8?B?amlDS2hEaFNUTDZubFJqeWRuNnZyMzUxcmVjdEdieVZUU3NuRVFVRWRYR2xV?=
 =?utf-8?B?SlpmL3ZNVlpoOENFOTNBUGg3RFJMWVFmdlRCNG53U1lMeE5uZHNIRTlKT0hH?=
 =?utf-8?B?T29VMU9IRUNLT2Zjb1BiVUpHMENhdWp2bHZHeTdTOTJ1eU5ZMG0xbXJxQkxi?=
 =?utf-8?B?U2RIVzg1OGRDcDRseEo2MW9ZRmEra3BOR2xVYS9FdUVKK0FoZ1JxeG1tMnBC?=
 =?utf-8?B?aSs3QlZnQXJKUWc3NVlqVlJvbUgwZytIRE9SM3BaU0pqT3RRYVZRdXVtbVNV?=
 =?utf-8?B?bDBlSlJ6d3ZCTjVHdk9JQ2VPa2ErSFpQc0h6aCt3eVFCME1OVDN6WnIzRkVQ?=
 =?utf-8?B?RTZpc2FvclJWaElmK2NOMUFKakt4YittMWJNUkVsKzBGbWRYcnFUR1Bnb2pF?=
 =?utf-8?B?eFNQQkhIcmQwNEpxSU1WT1EyNnVZaG9zaHB4dGN6RWVjUGV6RCthZkVnSkJ0?=
 =?utf-8?B?N0JIS0oralkrdEFiSjZZc3NKcStXejJRRC9ZdWtlcDM3UmtVMS9Bd1FUZlJs?=
 =?utf-8?B?SmJkU2pEeUtycGZxSk5nZDBLaWlLWjF0RzdWZU9mY1BOUHU5Q0ZnYjYxVDVR?=
 =?utf-8?B?cHNiTmc5T2NYNXRmdmhaYmVVa1Z2bE1zdXJRMU5tWkZlQUgxOUpOZk9FUWZS?=
 =?utf-8?B?a29SMGYzU3loRWM3YVlMQ1NmTXFGRU1FWFZGYmd2NVJMbkd2M0treERldzRa?=
 =?utf-8?B?UWFzQnRlWFhMZzlVM2JuNXh6b3NwdS9TdVd4Nk1uWlVRbFg0SDdOaWdxS1Jp?=
 =?utf-8?B?MmZvTlZvTVpKQXpnSGRTbElGdGpraDM4R3ZEbThWUWV6ajQzU3ZJVnhEZ2M1?=
 =?utf-8?B?eGRjVWFpMncwanF5d2xtUStpT2lkeStBUWYva3RWQW9BdWlsNnBibmJ6WW5V?=
 =?utf-8?B?NjJ6c0diV0J3ZFpNZEQzM2owM0JYTW9NblUzZE9OYXNESUpVVThHWFlPQkRR?=
 =?utf-8?B?ZnB2bzh0T1NRMHdZOUdRT3NOUkRxZVg4N3VFNjFvNjhnYlMzcGJaSEI5QzJP?=
 =?utf-8?B?SUNXbkk4YkUwTFdkdFlzNlJKOHljOFU1Q0hzWHZTOXFOQnVNTVRmampsemlv?=
 =?utf-8?B?NVRPdCtnNmNlcnMwZkQ2aHY4cmVmSEh1Q2FPQlg5OFVIRGxRNVpFOGtjNmdX?=
 =?utf-8?B?dWxhNldaTitNNmJ0STlzejVGSEsvTGxvd0hlWmJ6UVpEN2VtNXAyVXllZC83?=
 =?utf-8?B?U1ptQkVBKzdMUVplc1M4NkZDN2pQV1Yrd0kxRnozTThYd08rNjltKzdhaGoy?=
 =?utf-8?B?N3o4TlFKVW1xUFJiL2hMZ3c5emlyaXBiejI1eHlZdTBoT1Q5SzZVem5lKzFj?=
 =?utf-8?B?NXE1SDd4RjR0S2RoUFRhTE91dTI4dGRtT0h5SG5sSmZld0s4WnVBd0xYQjA2?=
 =?utf-8?B?MEUvL3ZsSFIwTHpmWklCUVV2R0RsdHBxYk1mbEdGcGYxdGhCZWhVZUt5cnYv?=
 =?utf-8?Q?owCsLjuawJg06vZknMUiuQBC339uVWlElO4FEQP?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea01b69a-667f-482b-bf54-08d988a3ac4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 08:31:21.4019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aoZgo5r3XNXg45K4CF9UjDk7o4NV2unpV17nIhfwnCW+p51PH85KRx8cfbrMj7nrf3PaPzQuPnR8O8ZjMJK6/qq5uzyBjdEOdaog/IHr94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8346
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Tue, Oct 05, 2021 at 07:14:57AM -0700, Guenter Roeck napisał(a):
>> > > +patternProperties:
>> > > +  "^input@([0-4])$":
>> >
>> > Was there agreement on "input" ? It is a somewhat odd name for a temperature
>> > sensor. If that name can be used to distinguish child sensor types, it might
>> > make sense to have a well defined name to state that this is a temperature
>> > sensor.
>>
>> Nope, no conclusion on that, yet, thus I did not change that and I was
>> still using the same approach I had on v1. For me it can be a "channel@X", a
>> "temperature@X".. whatever you decide.
>>
>
>My question was more on mandating a single string instead of letting
>users decide. I don't care either if it isn't used for anything in
>particular, but you specifically mandate "input" as the only valid
>string. I am not a DT expert, but it seems to me that mandating the
>content of that string and then not using it other than to ensure that
>the user really specified "input" doesn't make much sense to me.
>Having said that, if this is the DT way of things, it is ok with
>me.

I guess the reason I have used "input@X" was, again, because I based my
idea of how DT bindings should look like on the ina3221 as it seemed
like the most similar to my case. This chip, however, current/voltage
monitor so "input" makes more sense there, indeed.

In general, while I do like consistency, we are not defining a binding
for all hwmon sensors now as each of them, anyways, has its own binding
documentation so some variation is allowed, I think (and inevitable as
we won't change existing bindings).

So, I do mandate that the child nodes for *this* device should be named
accordingly but this doesn't mean other hwmon devices can't use others names
that makes more sense to them. While I could make the code that will
iterate over all child nodes and will ignore their names, I do think it
is better to specify the strict naming convention that everybody will
use (again, for *this* device), instead. I see several advantages of
this:
  - consistency in different DTs
  - easier extensibility - if we introduce something that will require
    adding some other non-channel related nodes, we don't have to worry
    that much about the name clashing
  - it makes verifying the DT correctness easier

>> However I'm in favor of some generic name, like "channel" or "input",
>> and using some "type property", if required, instead of calling the
>> nodes "temperatue@X", "voltage@X".
>>
>
>It does open up a nother dimension for multi-type sensor chips, though,
>
>For a chip with voltage and temperature sensors:
>
>	temperature@0 {
>		reg = <0>;
>	};
>
>	voltage@0 {
>		reg = <0>;
>	};
>
>vs:
>
>	temperature-sensors {
>		xxx@0 {
>			reg = <0>;
>		};
>	};
>
>	voltage-sensors {
>		xxx@0 {
>			reg = <0>;
>		};
>	};

Out of those, I strongly prefer the first one. But, again, we don't have
to define one kind of binding for ALL hwmon sensors (but I do think its
better if we can be generic).
So the biggest question to me is whether temperature and voltage should
have separate "address spaces". If we, indeed, want to have
temperature@0 and voltage@0, then using specific names, instead of
generic, like "channel", does make sense. But then, again, I don't see a
problem with one driver having a binding with "channel@X", while other
having "temperature@X" and "voltage@X".

>
>This is way out of my league in terms of what is appropriate,
>except that "xxx" isn't always easy to determine if the string is fixed
>as you suggest. What should it be for a sensor measuring an output voltage ?
>
>	input@0 {
>		reg = <0>;
>		label = "output voltage";
>	};
>

I think that if all the "channels" of the device are of the same type,
it doesn't matter. If we have some inputs and some outputs, we should
have either:

channel@0 {
	reg = <0>;
	type = "input";   // or something like that, maybe a numeric value
	with defines
}
channel@1 {
	reg = <1>;
	type = "output";   // or something like that, maybe a numeric value
	with defines
}

Or:

input@0 {
  reg = <0>;
}

output@1 {
  reg = <1>;
}

But, again, TMP42X doesn't need any of that anyways :)

>Anyway, maybe Rob has an idea how to name this properly.

Rob? :)

>> > Is this the correct value range ? The value range (in integer form) is
>> > -128 .. 127 (or 0 .. 255 as unsigned), not 0..1.
>>
>> True, I must have misunderstood this minimum/maximum and confused it
>> with the number of items or something. Now, since DT does not really
>> handle signed values and considers everything an unsigned, should I use
>> 0..255 or -128..127?
>>
>
>I suspect it should be 0..255. After all, the values reflect register values,
>not their meaning. But I don't really know. Rob ?

The DT blob will only contain 0..255. DTC has a syntactic sugar that
lets you specify the value as negative and will convert it to 2s
complement for you. So those two are exactly the same:

n-factor = <(-10)>;
n-factor = <0xfffffff6>;

 From the code perspective, however, all 3 most significant bytes are
ignored so 0xfffffff6 is the same as 0xf6.

Krzysztof

