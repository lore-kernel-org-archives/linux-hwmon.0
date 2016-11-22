Return-path: <tglx@linutronix.de>
Message-Id: <20161122173622.771252945@linutronix.de>
Date: Tue, 22 Nov 2016 17:42:01 -0000
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Sebastian Siewior <bigeasy@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: [patch 0/6] hwmon/coretemp: Hotplug fixes,
 cleanups and state machine conversion
List-ID: <linux-hwmon@vger.kernel.org>

After the first attempt to convert the coretemp driver to the hotplug state
machine failed, we had a deeper look and went a bit farther.

The driver has quite some interesting concepts vs. the package, core and
sysfs file management and a bug in the package temperature sysfs interface
vs. cpu hotplug.

The following series fixes that bug and simplifies the package/core
management and at the end converts it to the hotplug state machine.

Along with the source size the binary size shrinks as well:
   text	   data	    bss	    dec	    hex	
   4068	   360       20    4448    1160	  Before
   3801	   180       36    4017     fb1	  After

Thanks,

	tglx
-----
 coretemp.c |  321 +++++++++++++++++++++----------------------------------------
 1 file changed, 113 insertions(+), 208 deletions(-)
