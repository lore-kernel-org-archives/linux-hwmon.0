Return-path: <tt.rantala@gmail.com>
MIME-Version: 1.0
In-Reply-To: <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net>
From: Tommi Rantala <tt.rantala@gmail.com>
Date: Wed, 12 Apr 2017 11:31:56 +0300
Message-ID: <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com>
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	Sebastian Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

2016-11-23 17:28 GMT+02:00 Guenter Roeck <linux@roeck-us.net>:
>
> On 11/22/2016 09:42 AM, Thomas Gleixner wrote:
>>
>> After the first attempt to convert the coretemp driver to the hotplug state
>> machine failed, we had a deeper look and went a bit farther.
>>
>> The driver has quite some interesting concepts vs. the package, core and
>> sysfs file management and a bug in the package temperature sysfs interface
>> vs. cpu hotplug.
>>
>> The following series fixes that bug and simplifies the package/core
>> management and at the end converts it to the hotplug state machine.
>>
>> Along with the source size the binary size shrinks as well:
>>    text    data     bss     dec     hex
>>    4068    360       20 4448 1160     Before
>>    3801    180       36    4017     fb1   After
>>
>> Thanks,
>>
>>         tglx
>> -----
>>  coretemp.c |  321 +++++++++++++++++++++----------------------------------------
>>  1 file changed, 113 insertions(+), 208 deletions(-)

Hi,

Resume-from-suspend stopped working in HP xw6600 in fedora kernel
4.10.8-200.fc25.x86_64, while it worked just fine in
4.9.9-200.fc25.x86_64.

When powering on the suspended PC, there is no video output, and to
recover, I need to reset the machine.
Nothing is recorded in the journal logs for the resume, last lines are
from the suspend:

  Apr 08 15:41:49 xw6600 systemd[1]: Reached target Sleep.
  Apr 08 15:41:49 xw6600 systemd[1]: Starting Suspend...
  Apr 08 15:41:49 xw6600 systemd-sleep[6675]: Suspending system...

Also tested 4.11-rc5, but it fails the same way.

Bisection leads to commit:

commit e00ca5df37adc68052ea699cbd010ee4e19e39e4
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Tue Nov 22 17:42:04 2016 +0000

    hwmon: (coretemp) Convert to hotplug state machine

    Install the callbacks via the state machine. Setup and teardown are handled
    by the hotplug core.

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Cc: linux-hwmon@vger.kernel.org
    Cc: Fenghua Yu <fenghua.yu@intel.com>
    Cc: Jean Delvare <jdelvare@suse.com>
    Cc: rt@linuxtronix.de
    Cc: Guenter Roeck <linux@roeck-us.net>
    Link: http://lkml.kernel.org/r/20161117183541.8588-5-bigeasy@linutronix.de
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>

If I do "modprobe -r coretemp", then the resume works OK with
4.10.8-200.fc25.x86_64.

Any ideas?

4.9.9-200.fc25.x86_64 dmesg:
http://termbin.com/3kcl

4.10.8-200.fc25.x86_64 dmesg:
http://termbin.com/62d9

-Tommi
