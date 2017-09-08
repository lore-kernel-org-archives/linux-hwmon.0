Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:37547 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751780AbdIHCRO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Sep 2017 22:17:14 -0400
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, joel@jms.id.au
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
 <1504797770.5105.7.camel@aj.id.au>
 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
 <1504832527.6124.1.camel@aj.id.au>
 <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
 <1504836369.6124.2.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <75d9f838-aa4a-5cbd-744a-4d8e8bf1a370@roeck-us.net>
Date: Thu, 7 Sep 2017 19:17:11 -0700
MIME-Version: 1.0
In-Reply-To: <1504836369.6124.2.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/07/2017 07:06 PM, Andrew Jeffery wrote:
> On Thu, 2017-09-07 at 18:26 -0700, Guenter Roeck wrote:
>> On 09/07/2017 06:02 PM, Andrew Jeffery wrote:
>>> On Thu, 2017-09-07 at 17:27 -0700, Guenter Roeck wrote:
>>>> On 09/07/2017 08:22 AM, Andrew Jeffery wrote:
>>>>> On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
>>>>>> On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
>>>>>>
>>>>>>>>      
>>>>>>>> Guess I need to dig up my eval board and see if I can reproduce the problem.
>>>>>>>> Seems you are saying that the problem is always seen when issuing a sequence
>>>>>>>> of "clear faults" commands on multiple pages ?
>>>>>>>
>>>>>>> Yeah. We're also seeing bad behaviour under other command sequences as well,
>>>>>>> which lead to this hack of a work-around patch[1].
>>>>>>>
>>>>>>> I'd be very interested in the results of testing against the eval board. I
>>>>>>> don't have access to one and it seems Maxim have discontinued them.
>>>>>>>
>>>>>>
>>>>>> Do you have a somewhat reliable means to reproduce the problem ?
>>>>>
>>>>> It seems we hit a bunch of problems by just continually
>>>>> binding/unbinding the driver, if you don't apply that hacky oneshot
>>>>> retry patch. We can hit problems (in our design?) with something like:
>>>>>
>>>>> # cd /sys/bus/i2c/drivers/max31785; \
>>>>> 	echo $addr > unbind; \
>>>>> 	while echo $addr > bind; \
>>>>> 	do echo $addr > unbind; echo -n .; done;
>>>>>
>>>>> It should hit issues covered by this patch, as the register checks are
>>>>> used in the operations used by probe.
>>>>>
>>>>
>>>> Hmm ... I didn't use your driver but my prototype driver which also supports
>>>> temperature and voltage attributes, so if anything it should create more
>>>> stress on the chip.
>>>
>>> I did add the temp and voltage attributes...
>>>
>>> Any chance you can give mine a try? I don't know what I would have done
>>> to invoke this kind of behaviour, so it would be useful to know whether
>>> or not it happens with one driver but not the other.
>>>
>>
>> Will do.
> 
> Thanks. For reference, here's a devicetree description:
> 
> https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L283
> 

I can't test with devicetree. x86 system.

2,100+ iterations with your driver, no failures.

Either it is because my chip is a MAX31785 (not A), or the configuration makes a difference,
or it is your hardware.

I'll try to connect a couple of fans next (so far I did without) and try again.

Guenter
