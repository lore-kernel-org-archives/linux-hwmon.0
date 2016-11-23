Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42719 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938871AbcKWP3g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2016 10:29:36 -0500
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
To: Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
References: <20161122173622.771252945@linutronix.de>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net>
Date: Wed, 23 Nov 2016 07:28:00 -0800
MIME-Version: 1.0
In-Reply-To: <20161122173622.771252945@linutronix.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/22/2016 09:42 AM, Thomas Gleixner wrote:
> After the first attempt to convert the coretemp driver to the hotplug state
> machine failed, we had a deeper look and went a bit farther.
>
> The driver has quite some interesting concepts vs. the package, core and
> sysfs file management and a bug in the package temperature sysfs interface
> vs. cpu hotplug.
>
> The following series fixes that bug and simplifies the package/core
> management and at the end converts it to the hotplug state machine.
>
> Along with the source size the binary size shrinks as well:
>    text	   data	    bss	    dec	    hex	
>    4068	   360       20    4448    1160	  Before
>    3801	   180       36    4017     fb1	  After
>
> Thanks,
>
> 	tglx
> -----
>  coretemp.c |  321 +++++++++++++++++++++----------------------------------------
>  1 file changed, 113 insertions(+), 208 deletions(-)
>
>
>
>
Looks good. Series applied to -next.

Guenter

