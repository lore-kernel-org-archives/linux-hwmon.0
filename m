Return-Path: <joe@perches.com>
Return-path: <joe@perches.com>
Message-ID: <db7126d92a47be3de74cc27fc50c2edd0e871a58.camel@perches.com>
Subject: Re: [PATCH 00/13] hwmon: Introduce SENSOR_DEVICE_ATTR_{RO, RW, WO}
 and variants
From: Joe Perches <joe@perches.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Date: Thu, 06 Dec 2018 11:48:19 -0800
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, 2018-12-06 at 11:22 -0800, Guenter Roeck wrote:
> Introduce SENSOR_DEVICE_ATTR_{RO,RW,WO} and SENSOR_DEVICE_ATTR_2_{RO,RW,WO}
> as simplified variants of SENSOR_DEVICE_ATTR and SENSOR_DEVICE_ATTR_2 to
> simplify the source code, improve readbility, and reduce the chance of
> inconsistencies.
> 
> This series introduces the new macros and converts some of the drivers.

Thanks,  eliminating the S_<PERMS> uses would be nice and
more consistent with the other DEVICE_ATTR_{RO,RW,WO} uses.
