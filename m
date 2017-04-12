Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vk0-f41.google.com ([209.85.213.41]:36558 "EHLO
        mail-vk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753014AbdDLLAN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2017 07:00:13 -0400
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1704121248150.1874@nanos>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net>
 <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com>
 <alpine.DEB.2.20.1704121124510.1874@nanos> <CA+ydwtqKqzjLDiaCEuvXfYp3Lkbh+z-+s=1JfwkuiVOWp3QfgA@mail.gmail.com>
 <alpine.DEB.2.20.1704121248150.1874@nanos>
From: Tommi Rantala <tt.rantala@gmail.com>
Date: Wed, 12 Apr 2017 14:00:11 +0300
Message-ID: <CA+ydwtrc9E_xuaQSx=P_co3q9EPSyRq3yzSyTgN1kxp0gs35qw@mail.gmail.com>
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

2017-04-12 13:52 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
> On Wed, 12 Apr 2017, Tommi Rantala wrote:
>> 2017-04-12 12:28 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
>> > On Wed, 12 Apr 2017, Tommi Rantala wrote:
>> >> Resume-from-suspend stopped working in HP xw6600 in fedora kernel
>> >> 4.10.8-200.fc25.x86_64, while it worked just fine in
>> >> 4.9.9-200.fc25.x86_64.
>> >>
>> >> When powering on the suspended PC, there is no video output, and to
>> >> recover, I need to reset the machine.
>> >
>> > Is there just no video output or is the machine completely frozen? If it's
>> > not completely dead, then you might be able to ssh into it.
>>
>> It's completely hosed: not possible to ssh, does not respond to ping either.
>>
>> I made a quick test with netconsole. After booting with
>> no_console_suspend=1, and setting the netconsole parameters, I can get
>> kernel messages (to my android phone) when suspending the machine. But
>> no messages after the failed resume.
>
> Let's do something else first.
>
> Can you please try to offline/online CPUs from the console?
>
> # echo 0 >/sys/devices/system/cpu1/online
> # echo 1 >/sys/devices/system/cpu1/online

ok, that works.

> If that works, then try to offline all CPUs (except 0) in the same order as
> suspend (1 ... 7) and then online them again in the same order?

Seems to work without problems:

# for i in $(seq 1 7) ; do echo 0 > /sys/devices/system/cpu/cpu$i/online ; done

[ 1237.317537] intel_powerclamp: No package C-state available
[ 1308.997620] smpboot: CPU 1 is now offline
[ 1309.007167] intel_powerclamp: No package C-state available
[ 1309.032563] smpboot: CPU 2 is now offline
[ 1309.038118] intel_powerclamp: No package C-state available
[ 1309.072495] smpboot: CPU 3 is now offline
[ 1309.077807] intel_powerclamp: No package C-state available
[ 1309.099545] Broke affinity for irq 29
[ 1309.100587] smpboot: CPU 4 is now offline
[ 1309.105346] intel_powerclamp: No package C-state available
[ 1309.135530] Broke affinity for irq 22
[ 1309.135540] Broke affinity for irq 29
[ 1309.136579] smpboot: CPU 5 is now offline
[ 1309.141653] intel_powerclamp: No package C-state available
[ 1309.171517] Broke affinity for irq 22
[ 1309.171526] Broke affinity for irq 29
[ 1309.171535] Broke affinity for irq 31
[ 1309.172586] smpboot: CPU 6 is now offline
[ 1309.176967] intel_powerclamp: No package C-state available
[ 1309.209122] Broke affinity for irq 19
[ 1309.209126] Broke affinity for irq 22
[ 1309.209135] Broke affinity for irq 29
[ 1309.209145] Broke affinity for irq 31
[ 1309.212071] smpboot: CPU 7 is now offline


# for i in $(seq 1 7) ; do echo 1 > /sys/devices/system/cpu/cpu$i/online ; done

[ 1309.217476] intel_powerclamp: No package C-state available
[ 1380.624184] x86: Booting SMP configuration:
[ 1380.624186] smpboot: Booting Node 0 Processor 1 APIC 0x4
[ 1380.659810] intel_powerclamp: No package C-state available
[ 1380.659957] smpboot: Booting Node 0 Processor 2 APIC 0x2
[ 1380.671198] microcode: sig=0x10676, pf=0x40, revision=0x60f
[ 1380.672088] smpboot: Booting Node 0 Processor 3 APIC 0x6
[ 1380.677952] intel_powerclamp: No package C-state available
[ 1380.686260] microcode: sig=0x1067a, pf=0x40, revision=0xa0b
[ 1380.687098] smpboot: Booting Node 0 Processor 4 APIC 0x1
[ 1380.699214] microcode: sig=0x10676, pf=0x40, revision=0x60f
[ 1380.699742] intel_powerclamp: No package C-state available
[ 1380.700267] smpboot: Booting Node 0 Processor 5 APIC 0x5
[ 1380.715207] microcode: sig=0x1067a, pf=0x40, revision=0xa0b
[ 1380.716202] smpboot: Booting Node 0 Processor 6 APIC 0x3
[ 1380.730264] microcode: sig=0x10676, pf=0x40, revision=0x60f
[ 1380.730567] intel_powerclamp: No package C-state available
[ 1380.731267] smpboot: Booting Node 0 Processor 7 APIC 0x7
[ 1380.748276] microcode: sig=0x1067a, pf=0x40, revision=0xa0b
