Return-path: <bigeasy@linutronix.de>
Date: Sun, 20 Nov 2016 21:34:14 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, rt@linutronix.de,
	Thomas Gleixner <tglx@linutronix.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [05/20] hwmon/via-cputemp: Remove pointless CPU check on each CPU
Message-ID: <20161120203413.weafz4uxotjtuzab@linutronix.de>
References: <20161117183541.8588-6-bigeasy@linutronix.de>
 <20161119172331.GA25098@roeck-us.net>
 <20161119225354.gbynqtyzdxpgyqu5@linutronix.de>
 <53da100c-f7ee-1acd-8004-dc49a0cded87@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53da100c-f7ee-1acd-8004-dc49a0cded87@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On 2016-11-19 19:53:21 [-0800], Guenter Roeck wrote:
> Problem is that I have no idea if any of the patches in this series really work.
> I wasn't copied on all patches, meaning I don't have the infrastructure, meaning
> I'll have to dig them up from patchwork for testing, and/or figure out if the
> required infrastructure is already in the kernel, and that all takes time.
> Just Acking or applying the the patches w/o testing doesn't seem appropriate,
> given their level of intrusiveness. I did spend most of today working through
> my backlog of hwmon patches, but that series simply was too much. I hope I'll
> get to it tomorrow, but no promises.

You don't have to dig all the patches from the series. Patch four and five are
via-cputemp related and independent of the others and you were on Cc: on
both of them. The other 18 patches were converting other drivers for
instance:
  [PATCH 01/20] x86/mce/therm_throt: Convert to hotplug state machine                      
  [PATCH 02/20] x86/cpuid: Convert to hotplug state machine                                
  [PATCH 03/20] x86/msr: Convert to hotplug state machine     

Infrastructure. The DYN allocation is available since 5b7aa87e0482
("cpu/hotplug: Implement setup/removal interface") which is part of part
of v4.6-rc1. So testing them on v4.8 should be enough :)

> Guenter

Sebastian
