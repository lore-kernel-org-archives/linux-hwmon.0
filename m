Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40441 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751525AbdBOKsw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Feb 2017 05:48:52 -0500
Subject: Re: Fwd: coretemp seems to reset immediately
To: Chris Tillman <toff.tillman@gmail.com>, linux-hwmon@vger.kernel.org
References: <CAO299FuK1yX2JRE6E5a4G-8dcJ-RbOjZj_TPyCUJ+tZtM2NWgA@mail.gmail.com>
 <CAO299Fu8T-zz27N3Vy4bAtUzz+wfSe_nOBXfWRO58eUP_PEziQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0f23f434-e7f4-851d-ba45-ff0d6ed988c0@roeck-us.net>
Date: Wed, 15 Feb 2017 02:48:49 -0800
MIME-Version: 1.0
In-Reply-To: <CAO299Fu8T-zz27N3Vy4bAtUzz+wfSe_nOBXfWRO58eUP_PEziQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/15/2017 02:00 AM, Chris Tillman wrote:
> Hi,
>
> I had the awful experience of having my computer fry before my eyes
> the other day. It was running quite hot (building llvm), and it
> stopped accepting mouse inputs. I tried to regain control, and after
> 20 seconds or so it switched me to virtual console 1. But very shortly
> after that it died, and now it won't even start to boot.
>
> Anyway, the reason I'm writing: I retrieved the disk out of it, and on
> another machine, looked through the syslog. I saw that coretemp was
> reporting over temps every five minutes, and claiming the cpu was
> being throttled. But then the very next message in the log says the
> temperature is normal. I'm wondering, does this mean the throttling
> was also being cancelled immediately? If so it could explain how the
> machine got so hot that it died on the spot.
>
> I've attached the log. Here's the final refrain of what was occurring
> every 5 minutes for the fifty minutes previous:
>
> Feb 12 19:27:25 ctillman kernel: [137082.856603] CPU3: Core
> temperature above threshold, cpu clock throttled (total events =
> 804180)
> Feb 12 19:27:25 ctillman kernel: [137082.856604] CPU2: Core
> temperature above threshold, cpu clock throttled (total events =
> 804180)
> Feb 12 19:27:25 ctillman kernel: [137082.856607] CPU1: Package
> temperature above threshold, cpu clock throttled (total events =
> 862662)
> Feb 12 19:27:25 ctillman kernel: [137082.856608] CPU0: Package
> temperature above threshold, cpu clock throttled (total events =
> 862662)
> Feb 12 19:27:25 ctillman kernel: [137082.856610] CPU2: Package
> temperature above threshold, cpu clock throttled (total events =
> 862662)
> Feb 12 19:27:25 ctillman kernel: [137082.856621] CPU3: Package
> temperature above threshold, cpu clock throttled (total events =
> 862662)
> Feb 12 19:27:25 ctillman kernel: [137082.857603] CPU3: Core
> temperature/speed normal
> Feb 12 19:27:25 ctillman kernel: [137082.857604] CPU2: Core
> temperature/speed normal
> Feb 12 19:27:25 ctillman kernel: [137082.857606] CPU0: Package
> temperature/speed normal
> Feb 12 19:27:25 ctillman kernel: [137082.857608] CPU1: Package
> temperature/speed normal
> Feb 12 19:27:25 ctillman kernel: [137082.857609] CPU2: Package
> temperature/speed normal
> Feb 12 19:27:25 ctillman kernel: [137082.857612] CPU3: Package
> temperature/speed normal
>
> Notice how each core gets flagged, and then in the same millisecond
> gets cleared. For example
>
> [137082.856603] CPU3: Core temperature above threshold, cpu clock
> throttled (total events = 804180)
> [137082.857603] CPU3: Core temperature/speed normal
>
> The machine is an HP Probook 4530s, which I just bought second hand a
> couple weeks ago. I'd really been enjoying its speed! compared to the
> older computer I'm writing on now.
>
> I'd already had a run-in with overheating, and filed a bug against the
> gpu because it apparently crashed during the previous event:
>
> [Bug 99611] GPU hang after over temperature
>
> That log also showed the same pattern.
>

That has nothing to do with coretemp, which is purely passive.
Thermal throttling is supported as part of the machine check code.

No idea where you filed the bug (not on bugzilla.kernel.org), but
I don't really think you can blame software. My guess would be that
the CPU fan was not operating properly; maybe the thermal paste
between CPU and heatsink was getting old, or maybe the fan is just
broken, or maybe there is just enough dust in the machine that it
no longer cools properly.

There is also mention in some forums that a BIOS update helps with
overheating issues on this laptop.

Guenter

