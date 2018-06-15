Return-Path: <r.marek@assembler.cz>
Return-path: <r.marek@assembler.cz>
Subject: Re: Ryzen 2700 Temperature offset?
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, jon.grimm@amd.com
Cc: Guenter Roeck <linux@roeck-us.net>,
 Chris Ouellet <rabbit.of.war@gmail.com>, linux-hwmon@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <C85830A6-BCC7-4137-84E5-38503873F278@canonical.com>
 <20180607154915.GA7061@roeck-us.net>
 <54EAD835-C48D-4751-9BFF-71536241129A@canonical.com>
 <20180610051420.GA22601@roeck-us.net>
From: Rudolf Marek <r.marek@assembler.cz>
Message-ID: <abf1f966-f56f-70f2-7c79-047b31fc066f@assembler.cz>
Date: Fri, 15 Jun 2018 23:56:32 +0200
MIME-Version: 1.0
In-Reply-To: <20180610051420.GA22601@roeck-us.net>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Jon,

Please can you help?

Thanks
Rudolf


Dne 10.6.2018 v 07:14 Guenter Roeck napsal(a):
> On Sun, Jun 10, 2018 at 03:03:47AM +0800, Kai-Heng Feng wrote:
>> at 23:49, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>>> On Thu, Jun 07, 2018 at 11:03:13AM +0800, Kai Heng Feng wrote:
>>>> Hi Guenter,
>>>>
>>>> A user thinks the Ryzen 2700 temperature may not be correct [1].
>>>> Can you take a look when you have time? Thanks.
>>>>
>>>> Also, where can I find all these temperature offsets? I googled but with
>>>> no
>>>> result.
>>> Problem is that the offsets are not documented in public, making it
>>> difficult to find out. For Ryzen 2700, there is currently no offset
>>> configured; I was told that there is none. For Ryzen 2700X, the offset
>>> is 10 degrees C.
>>
>> I am still quite interesting where you get this information...
>>
> Primarily lots of online research. Windows tools usually support the
> offsets, so screendumps help in some cases. 
> 
>>>
>>>> [1] https://bugs.launchpad.net/bugs/1774817
>>>
>>> The key here is the commit mentioned in the log (1b59788979acd). It does
>>> not only adjust the per-CPU offset, but also takes a configurable offset
>>> of 49 degrees C into account. You'll need to apply that patch in your
>>> kernel, or the temperature may be off by 49 degrees C.
>>
>> So unless AMD shares these offsets value, we can never know what correct
>> offsets are?
>>
> Unfortunately that is correct.
> 
> AFAIK the information is available from AMD under NDA. I can not sign such an
> NDA, and even if I could and would, I could not use the information in an open
> source driver. Kind of a loose-loose situation. If you (Canonical) have any
> influence at AMD, it might be useful to let them know that their policy is
> not very helpful.
> 
> Guenter
> 
> 
>> Kai-Heng
>>
>>>
>>> Hope this helps. If not, please let me know. Note that I am travelling;
>>> responses may be delayed.
>>>
>>> Guenter
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
