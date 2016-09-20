Return-path: <tpearson@raptorengineering.com>
Message-ID: <57E19104.6050907@raptorengineeringinc.com>
Date: Tue, 20 Sep 2016 14:41:56 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <20160919014104.GA30840@roeck-us.net> <57E03124.4030202@raptorengineeringinc.com> <20160919200413.GA29242@roeck-us.net> <57E04B25.4000001@raptorengineeringinc.com> <20160920005443.GB4064@roeck-us.net> <57E093DB.7030000@raptorengineeringinc.com>
In-Reply-To: <57E093DB.7030000@raptorengineeringinc.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/19/2016 07:54 PM, Guenter Roeck wrote:
>> On 09/19/2016 03:04 PM, Guenter Roeck wrote:
>> And then you are using all pmbus commands ? Seems odd.
> 
> I guess I'l buy an evaluation board if one is available and check if your claim
> is correct. I am not inclined to accept a non-pmbus driver for a pmbus
> device without good reason.
> 
> Guenter

Regarding the PMBus driver, I looked over the documentation available
here: https://www.kernel.org/doc/Documentation/hwmon/pmbus

- From what I can tell PMBus drivers do not support configuring the fan
control parameters, only monitoring the fan status and speed.  Is this
correct, and if not where would I find the correct documentation?

Thank you,

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4ZECAAoJEK+E3vEXDOFb4XsIALCbk+/dO2LdTvfjDCVMrs9J
2IHDW3heUZn53v5evpMEvJCXEw8J0ARg2cYWxuzx8Ufu5hGzXNS40NW5mUHtkbXG
FNWAqoSdeT1f9aOS8XIi/9+u27ZwJTuI5dZdb7nebfvsjlKc1CKw2FwtqUUBkyZA
Ywa/kjSlEMTO2wGCea4xQXE8aO3UK3JHc0sUwzR3htEOp5nGIn7d8ScDaJvpzW+a
xk0q97U4ezJEm2r3WmXpZGbUQqM2aaOdTSl9iiV7GZBAR6K50LGsacAcRBdanJaj
FOuW9XZt0NjnrZOsMc2N9WIz9wXKYOuo/Y8d/0hVPp6SQ3po5d8coeNrSPDw1qw=
=Q8So
-----END PGP SIGNATURE-----
