Return-path: <bigeasy@linutronix.de>
Date: Sat, 19 Nov 2016 23:53:54 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, rt@linutronix.de,
	Thomas Gleixner <tglx@linutronix.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [05/20] hwmon/via-cputemp: Remove pointless CPU check on each CPU
Message-ID: <20161119225354.gbynqtyzdxpgyqu5@linutronix.de>
References: <20161117183541.8588-6-bigeasy@linutronix.de>
 <20161119172331.GA25098@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20161119172331.GA25098@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On 2016-11-19 09:23:31 [-0800], Guenter Roeck wrote:
> Applied to -next.

Thanks. Since you took that one, could you also please consider to apply
|[PATCH 06/20 v2] hwmon/via-cputemp: Convert to hotplug state machine
? It depends on the 5th patch from the series which applied.

> Thanks,
> Guenter

Sebastian
