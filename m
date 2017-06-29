Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr30051.outbound.protection.outlook.com ([40.107.3.51]:49216
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752384AbdF2Lqc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jun 2017 07:46:32 -0400
Date: Thu, 29 Jun 2017 13:46:09 +0200
From: Tom Levens <tom.levens@cern.ch>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: Tom Levens <tom.levens@cern.ch>,
        Guenter Roeck <linux@roeck-us.net>, <jdelvare@suse.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
In-Reply-To: <9a6ba152-3d17-3f9c-782c-1f10aa74691b@topic.nl>
Message-ID: <alpine.LRH.2.20.1706291343280.20615@lxplus092.cern.ch>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch> <1479384616-12479-3-git-send-email-tom.levens@cern.ch> <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net> <97eb089f-e0e2-1146-6e17-8f9f790433d8@topic.nl> <20170628150130.GC30968@roeck-us.net>
 <alpine.LRH.2.20.1706281723170.31209@lxplus022.cern.ch> <20170628160048.GA8915@roeck-us.net> <alpine.LRH.2.20.1706281819540.21032@lxplus028.cern.ch> <9a6ba152-3d17-3f9c-782c-1f10aa74691b@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On Thu, 29 Jun 2017, Mike Looijmans wrote:

> On 28-06-17 19:02, Tom Levens wrote:
>>
>>  On Wed, 28 Jun 2017, Guenter Roeck wrote:
>> 
>> >  On Wed, Jun 28, 2017 at 05:29:38PM +0200, Tom Levens wrote:
>> > > 
>> >  [ ... ]
>> > 
>> > > > 
>> > > > >  Whatever happened to this patch though? It didn't make it to 
>> > > > >  mainline,
>> > > > >  otherwise I'd have found it sooner...
>> > > > > 
>> > > >  I'll have to look it up, but I guess I didn't get an updated 
>> > > >  version.
>> > > 
>> > >  As far as I remember I had a working V3 of this patch, but it is 
>> > >  entirely
>> > >  possible that it was never submitted as I have been busy with other 
>> > >  projects
>> > >  recently. I'll dig it out and check that it is complete.
>> > > 
>> >  FWIW, I don't see it at
>> >  https://patchwork.kernel.org/project/linux-hwmon/list/?submitter=171225&state=*
>> > 
>> >  Maybe you were waiting for a reply from Rob. Either case, it might make
>> >  sense to only provide valid modes, ie to abstract the mode bits from the
>> >  hardware, such as
>> > 
>> >  0 - internal temp only
>> >  1 - Tr1
>> >  2 - V1
>> >  3 - V1-V2
>> >  4 - Tr2
>> >  5 - V3
>> >  6 - V3-V4
>> >  7 to 14 - per bit 0..2
>> > 
>> >  Guenter
>> >
>>
>>  You are right, there was still an open question about how best to handle
>>  the mode selection in DT.
>>
>>  In the latest version of my patch I have it implemented as an array for
>>  setting the two values, for example:
>>
>>       lltc,meas-mode = <7 3>;
>>
>>  This sets bits [2..0] = 7 and [4..3] = 3. Of course these could be split
>>  into two DT properties, but I was unsure what to name them as both fields
>>  are called "mode" in the datasheet and "mode-43"/"mode-20" (or similar) is
>>  ugly.
>>
>>  With regards to your proposal, it is not clear to me whether the modes
>>  which have the same result are exactly equivalent. Does disabling a
>>  measurement with the mode[4..3] bits really leaves the part in a safe
>>  state for all possible HW connections? With this doubt in my head, I would
>>  prefer to keep the option available to the user to select any specific
>>  mode. But I am open to suggestions.
>>
>>  Mike, if you would like to test it, the latest version of my code is here:
>>
>>  https://github.com/levens/ltc2990/blob/dev/drivers/hwmon/ltc2990.c
>> 
>
> I pulled your patches, added two lines to the devicetree and it works fine, 
> I'm seeing plausible results:
> root@topic-miami:/sys/class/hwmon# grep . */*
> hwmon0/name:battery-gauge
> hwmon0/temp1_input:291700
> hwmon1/in0_input:3258
> hwmon1/in1_input:1824
> hwmon1/in2_input:1916
> hwmon1/in3_input:1512
> hwmon1/in4_input:2066
> hwmon1/name:ltc2990
> hwmon1/temp1_input:28062
> hwmon1/uevent:OF_NAME=ltc2990
> hwmon1/uevent:OF_FULLNAME=/gpios-i2c@50/ltc2990@4c
> hwmon1/uevent:OF_COMPATIBLE_0=lltc,ltc2990
> hwmon1/uevent:OF_COMPATIBLE_N=1
> hwmon2/curr1_input:1825
> hwmon2/curr2_input:349
> hwmon2/in0_input:3244
> hwmon2/name:ltc2990
> hwmon2/temp1_input:31500
> hwmon2/uevent:OF_NAME=ltc2990
> hwmon2/uevent:OF_FULLNAME=/gpios-i2c@52/ltc2990@4C
> hwmon2/uevent:OF_COMPATIBLE_0=ltc2990
> hwmon2/uevent:OF_COMPATIBLE_N=1
>
>
> As you can see, two ltc2990 on two busses, one measuring current and one 
> measuring 4 independent voltages.
>
> I also like your implementation of the mode setting better, it's much simpler 
> than mine. And you've solved a bug in the temperature reading as well.

Excellent, I am glad it also works for you! In this case, I would propose 
that I submit the V3 of the patch for further discussion.

Thanks,

>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
