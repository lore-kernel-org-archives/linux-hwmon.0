Return-path: <tglx@linutronix.de>
Date: Fri, 9 Dec 2016 19:27:10 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
    linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
    Jean Delvare <jdelvare@suse.com>, rt@linuxtronix.de,
    Sebastian Andrzej Siewior <bigeasy@breakpoint.cc>, rt@linutronix.de
Subject: Re: [PATCH 06/20] hwmon/via-cputemp: Convert to hotplug state
 machine
In-Reply-To: <20161209181737.GB24142@roeck-us.net>
Message-ID: <alpine.DEB.2.20.1612091926190.3423@nanos>
References: <20161117183541.8588-1-bigeasy@linutronix.de> <20161117183541.8588-7-bigeasy@linutronix.de> <alpine.DEB.2.20.1612091238360.3794@nanos> <20161209181737.GB24142@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, 9 Dec 2016, Guenter Roeck wrote:
> I queued up the second patch as well. Hope it does not blow up on us.
> Sorry, I got a bit nervous after the coretemp experience.

Sorry for that, but we are watching out for blow ups and are ready to fix
any fallout.

Thanks

	tglx
