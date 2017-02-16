Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49493 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750788AbdBPFRb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Feb 2017 00:17:31 -0500
Subject: Re: Fwd: coretemp seems to reset immediately
To: Chris Tillman <toff.tillman@gmail.com>
References: <CAO299FuK1yX2JRE6E5a4G-8dcJ-RbOjZj_TPyCUJ+tZtM2NWgA@mail.gmail.com>
 <CAO299Fu8T-zz27N3Vy4bAtUzz+wfSe_nOBXfWRO58eUP_PEziQ@mail.gmail.com>
 <0f23f434-e7f4-851d-ba45-ff0d6ed988c0@roeck-us.net>
 <CAO299FsydTd2cGy768Gfworz1df3X7gCm-1s1bjKiyf6q_WjpQ@mail.gmail.com>
Cc: linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f01234e9-72ee-2044-dba6-1e4e8b2b2b51@roeck-us.net>
Date: Wed, 15 Feb 2017 21:17:29 -0800
MIME-Version: 1.0
In-Reply-To: <CAO299FsydTd2cGy768Gfworz1df3X7gCm-1s1bjKiyf6q_WjpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/15/2017 09:12 AM, Chris Tillman wrote:
> Thank you very much for your research and input as to the underlying
> cause. I had also found those references, and when I opened it up it
> looked like the fan had dust on it, so I agree that was the real issue
> for my machine. However I also found some references to Linux having
> problems with overheating on the machine when Windows did not.
>

Yes, but that also said that a BIOS update improved or fixed the problem.
On laptops, temperature control is typically handled by the BIOS or
through an embedded controller, and the operating system is not even
involved. Maybe Windows implements supplementary temperature control
mechanisms - who knows. Hard to say without access to sources.

> The only reason I sent the mail to this list was that the log output
> made it seem like coretemp was reporting a problem, and then reporting

Assuming that you refer to the 'coretemp' module - as mentioned before,
this module is not involved. A log message "Core temperature..."
does not mean that the coretemp module is involved.

> no problem, in the same millisecond. If coretemp is saying there is no
> problem, then machine check software will remain inactive. And the
> machine will continue to get hotter.
>

Not really.

> Do you know what kernel module would be involved for the machine check
> which would rely on coretemp? I could forward it to them.
>

None, which you can confirm easily by not loading the coretemp module
at all (or blacklisting it)  and creating the same situation again;
you'll still see the same messages.

The messages are generated in arch/x86/kernel/cpu/mcheck/therm_throt.c,
which is part of the x86 mce infrastructure. The mailing list address
is linux-edac@vger.kernel.org.

FWIW, I looked through that code. The most interesting information
in the log messages below is "total events = 862662". This means there
were a whopping 862662 thermal events. However, only a single set
of messages is displayed every 5 minutes. From that one message one
can not really draw a conclusion about what exactly happened in the
5 minutes in between. It might be interesting to know under which
circumstances the CPU generates that many thermal events, though.

Guenter

> On Wed, Feb 15, 2017 at 11:48 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 02/15/2017 02:00 AM, Chris Tillman wrote:
>>>
>>> Hi,
>>>
>>> I had the awful experience of having my computer fry before my eyes
>>> the other day. It was running quite hot (building llvm), and it
>>> stopped accepting mouse inputs. I tried to regain control, and after
>>> 20 seconds or so it switched me to virtual console 1. But very shortly
>>> after that it died, and now it won't even start to boot.
>>>
>>> Anyway, the reason I'm writing: I retrieved the disk out of it, and on
>>> another machine, looked through the syslog. I saw that coretemp was
>>> reporting over temps every five minutes, and claiming the cpu was
>>> being throttled. But then the very next message in the log says the
>>> temperature is normal. I'm wondering, does this mean the throttling
>>> was also being cancelled immediately? If so it could explain how the
>>> machine got so hot that it died on the spot.
>>>
>>> I've attached the log. Here's the final refrain of what was occurring
>>> every 5 minutes for the fifty minutes previous:
>>>
>>> Feb 12 19:27:25 ctillman kernel: [137082.856603] CPU3: Core
>>> temperature above threshold, cpu clock throttled (total events =
>>> 804180)
>>> Feb 12 19:27:25 ctillman kernel: [137082.856604] CPU2: Core
>>> temperature above threshold, cpu clock throttled (total events =
>>> 804180)
>>> Feb 12 19:27:25 ctillman kernel: [137082.856607] CPU1: Package
>>> temperature above threshold, cpu clock throttled (total events =
>>> 862662)
>>> Feb 12 19:27:25 ctillman kernel: [137082.856608] CPU0: Package
>>> temperature above threshold, cpu clock throttled (total events =
>>> 862662)
>>> Feb 12 19:27:25 ctillman kernel: [137082.856610] CPU2: Package
>>> temperature above threshold, cpu clock throttled (total events =
>>> 862662)
>>> Feb 12 19:27:25 ctillman kernel: [137082.856621] CPU3: Package
>>> temperature above threshold, cpu clock throttled (total events =
>>> 862662)
>>> Feb 12 19:27:25 ctillman kernel: [137082.857603] CPU3: Core
>>> temperature/speed normal
>>> Feb 12 19:27:25 ctillman kernel: [137082.857604] CPU2: Core
>>> temperature/speed normal
>>> Feb 12 19:27:25 ctillman kernel: [137082.857606] CPU0: Package
>>> temperature/speed normal
>>> Feb 12 19:27:25 ctillman kernel: [137082.857608] CPU1: Package
>>> temperature/speed normal
>>> Feb 12 19:27:25 ctillman kernel: [137082.857609] CPU2: Package
>>> temperature/speed normal
>>> Feb 12 19:27:25 ctillman kernel: [137082.857612] CPU3: Package
>>> temperature/speed normal
>>>
>>> Notice how each core gets flagged, and then in the same millisecond
>>> gets cleared. For example
>>>
>>> [137082.856603] CPU3: Core temperature above threshold, cpu clock
>>> throttled (total events = 804180)
>>> [137082.857603] CPU3: Core temperature/speed normal
>>>
>>> The machine is an HP Probook 4530s, which I just bought second hand a
>>> couple weeks ago. I'd really been enjoying its speed! compared to the
>>> older computer I'm writing on now.
>>>
>>> I'd already had a run-in with overheating, and filed a bug against the
>>> gpu because it apparently crashed during the previous event:
>>>
>>> [Bug 99611] GPU hang after over temperature
>>>
>>> That log also showed the same pattern.
>>>
>>
>> That has nothing to do with coretemp, which is purely passive.
>> Thermal throttling is supported as part of the machine check code.
>>
>> No idea where you filed the bug (not on bugzilla.kernel.org), but
>> I don't really think you can blame software. My guess would be that
>> the CPU fan was not operating properly; maybe the thermal paste
>> between CPU and heatsink was getting old, or maybe the fan is just
>> broken, or maybe there is just enough dust in the machine that it
>> no longer cools properly.
>>
>> There is also mention in some forums that a BIOS update helps with
>> overheating issues on this laptop.
>>
>> Guenter
>>
>
>
>

