Return-path: <tpearson@raptorengineering.com>
Message-ID: <57E04B25.4000001@raptorengineeringinc.com>
Date: Mon, 19 Sep 2016 15:31:33 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <20160919014104.GA30840@roeck-us.net> <57E03124.4030202@raptorengineeringinc.com> <20160919200413.GA29242@roeck-us.net>
In-Reply-To: <20160919200413.GA29242@roeck-us.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/19/2016 03:04 PM, Guenter Roeck wrote:
> On Mon, Sep 19, 2016 at 01:40:36PM -0500, Timothy Pearson wrote:
> Not sure I understand. pwm[1-6]_enable = 0 means no fan speed control.
> Do you mean the (full speed) comment ? 

"no fan speed control (i.e. fan at full speed)".  What I would like to
see is "fan disabled (PWM turned off)".

Is that an acceptable use of the "0" value?

> Having said that, looking into the datasheet, I see that this is actually
> a PMBus device. Why don't you just write a PMBus extension driver for it ?
> AFAICS drivers/hwmon/pmbus/max34440.c would come pretty close and could
> possibly even be extended to support this chip.
> 
> Guenter

The datasheet states that many functions are not available over PMBus.
Rather than fight with potentially incomplete silicon support for PMBus
it was easier to simply write this driver.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4EsiAAoJEK+E3vEXDOFbU7sH/1fcxUbs5inK+XL8tdpMnLDK
y6uhsYMQaGzea4f4B6ek9XDDIyGJyMRwkAZy/4v9f+uqhK03DBrwRuY9zAeLPDd5
ilWPKNSJLNqs7vSOHz1f/ooIR20medAdx2oOAVX3QwoQjv/L40Sm9iLAmh/RQJtt
urvLzcnBbhVnTVshuFwc2fwqlszLtaF9XUlPGzEWVZY0d7z+tPXwiseg/3nd444V
LezNTkLgM9zkXwLz402zK9ckO5wABlbO1jd5mssLMnttyw4ilBwEpXgeeUlcsS71
GguTJnU35Wn0tD7DRUbqB76Jx5NX9Su/wHJ8X0hbe8CGAOHRzTYynTEzTHfGVFc=
=XiuV
-----END PGP SIGNATURE-----
