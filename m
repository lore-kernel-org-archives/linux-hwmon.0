Return-Path: <tom.levens@cern.ch>
Return-path: <tom.levens@cern.ch>
Date: Wed, 28 Jun 2017 19:02:29 +0200
From: Tom Levens <tom.levens@cern.ch>
To: Guenter Roeck <linux@roeck-us.net>
CC: Tom Levens <tom.levens@cern.ch>, Mike Looijmans <mike.looijmans@topic.nl>,
	<jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
In-Reply-To: <20170628160048.GA8915@roeck-us.net>
Message-ID: <alpine.LRH.2.20.1706281819540.21032@lxplus028.cern.ch>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch> <1479384616-12479-3-git-send-email-tom.levens@cern.ch> <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net> <97eb089f-e0e2-1146-6e17-8f9f790433d8@topic.nl> <20170628150130.GC30968@roeck-us.net>
 <alpine.LRH.2.20.1706281723170.31209@lxplus022.cern.ch> <20170628160048.GA8915@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"; format=flowed
List-ID: <linux-hwmon@vger.kernel.org>


On Wed, 28 Jun 2017, Guenter Roeck wrote:

> On Wed, Jun 28, 2017 at 05:29:38PM +0200, Tom Levens wrote:
>>
> [ ... ]
>
>>>
>>>> Whatever happened to this patch though? It didn't make it to mainline,
>>>> otherwise I'd have found it sooner...
>>>>
>>> I'll have to look it up, but I guess I didn't get an updated version.
>>
>> As far as I remember I had a working V3 of this patch, but it is entirely
>> possible that it was never submitted as I have been busy with other projects
>> recently. I'll dig it out and check that it is complete.
>>
> FWIW, I don't see it at
> https://patchwork.kernel.org/project/linux-hwmon/list/?submitter=171225&state=*
>
> Maybe you were waiting for a reply from Rob. Either case, it might make
> sense to only provide valid modes, ie to abstract the mode bits from the
> hardware, such as
>
> 0 - internal temp only
> 1 - Tr1
> 2 - V1
> 3 - V1-V2
> 4 - Tr2
> 5 - V3
> 6 - V3-V4
> 7 to 14 - per bit 0..2
>
> Guenter
>

You are right, there was still an open question about how best to handle 
the mode selection in DT.

In the latest version of my patch I have it implemented as an array for 
setting the two values, for example:

 	lltc,meas-mode = <7 3>;

This sets bits [2..0] = 7 and [4..3] = 3. Of course these could be split 
into two DT properties, but I was unsure what to name them as both fields 
are called "mode" in the datasheet and "mode-43"/"mode-20" (or similar) is 
ugly.

With regards to your proposal, it is not clear to me whether the modes 
which have the same result are exactly equivalent. Does disabling a 
measurement with the mode[4..3] bits really leaves the part in a safe 
state for all possible HW connections? With this doubt in my head, I would 
prefer to keep the option available to the user to select any specific 
mode. But I am open to suggestions.

Mike, if you would like to test it, the latest version of my code is here:

https://github.com/levens/ltc2990/blob/dev/drivers/hwmon/ltc2990.c

Cheers,
