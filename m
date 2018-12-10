Return-Path: <pali.rohar@gmail.com>
Return-path: <pali.rohar@gmail.com>
Date: Mon, 10 Dec 2018 11:58:23 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Michele Sorcinelli <michelesr@autistici.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] dell-smm-hwmon.c: Additional temperature sensors
Message-ID: <20181210105823.xq3mnrlfgdx63etl@pali>
References: <20181207202927.14168-1-michelesr@autistici.org>
 <20181208005603.11721-1-michelesr@autistici.org>
 <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Friday 07 December 2018 20:24:49 Guenter Roeck wrote:
> Anyway, I would like to get some feedback if this can cause regressions
> on systems which don't support that many sensors and maybe report something
> completely different if one tries to read the high-numbered sensors.
> I seem to recall that there was a reason for checking the type and not just
> trying to read sensor values.

There can be also different problem for sensors which are turned off.
E.g. on notebooks with switchable graphic cards which have included
temperature sensors. When graphic card is turned off, then SMM returns
error when asking for temperature value (for obvious reason). But
temperature type still returns correct value "this is GPU sensors".

So we cannot replace temp_type check by temp_value check. It introduce
race condition between "starting GPU" and initializing dell-smm hwmon.
Now linux kernel has support for dynamic turning ON/OFF switchable GPU,
so we need to care about these race conditions too.

-- 
Pali Rohár
pali.rohar@gmail.com
