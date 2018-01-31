Return-Path: <mail@dbrgn.ch>
Return-path: <mail@dbrgn.ch>
Date: Wed, 31 Jan 2018 15:39:23 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 andreas.brauchli@sensirion.com
Subject: Re: [PATCH] hwmon: (sht21) Don't use clock stretching
Message-ID: <20180131153923.3df073df@adalbert.office.threema.ch>
In-Reply-To: <54a9981f-71fe-d332-8364-7bfb88eed2b3@roeck-us.net>
References: <20180126233731.19127-1-mail@dbrgn.ch>
	<54a9981f-71fe-d332-8364-7bfb88eed2b3@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hello Guenter

Thank you for your fast review!

> The driver must now support I2C_FUNC_I2C which is a significant change in functionality
> since it will no longer work on SMBus-only adapters.

You are right of course, I wasn't aware of that.

> You'll have to find a better
> solution, one that retains the old functionality but also works on the Raspberry Pi.

What are my options? A separate driver (sht21nhm) would probably not be accepted, right?

Or should I instead try to submit it to the Raspberry Pi kernel tree directly?

> FWIW, this should really be solved in the infrastructure. Many devices support and
> depend on clock stretching, and we can not mess up the drivers for all those devices
> to deal with a broken adapter.

Could you elaborate what you mean with "in the infrastructure"? Could there be a
way to solve this on the i2c / adapter driver level?

An interesting sidenote is that the driver used to work on the Raspberry Pi with
older kernel versions, but not on current ones. (I'd have to look up the exact
versions, but I think it changed sometime last year.) Maybe something about the
timing was changed that broke clock stretching.

> Has this been discussed on the i2c mailing list ?

I did not submit a discussion so far, and the mailing list search did not
turn up anything related. Should I start a discussion there?

Cheers and thanks for your time,
Danilo Bargen
