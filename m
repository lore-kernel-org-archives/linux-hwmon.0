Return-path: <bigeasy@linutronix.de>
Date: Mon, 21 Nov 2016 23:35:06 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, rt@linuxtronix.de,
	Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [04/20] hwmon/coretemp: Convert to hotplug state machine
Message-ID: <20161121223506.3lew5tk3rbrbiex2@linutronix.de>
References: <20161117183541.8588-5-bigeasy@linutronix.de>
 <20161120223044.GA6350@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20161120223044.GA6350@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On 2016-11-20 14:30:55 [-0800], Guenter Roeck wrote:
> Install, modprobe, modprobe -r, modprobe,
> 
> [24078.179118] ------------[ cut here ]------------
> [24078.179124] WARNING: CPU: 0 PID: 14 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x6e/0x80
> [24078.179125] sysfs: cannot create duplicate filename
> '/devices/platform/coretemp.0'
> 
> and many more of those.
> 
> I can not test the other hwmon drivers in this series, but I would assume
> that they have the same problem.

I managed to trigger this. I will take a look.

> Guenter

Sebastian
