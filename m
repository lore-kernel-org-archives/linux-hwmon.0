Return-path: <tpearson@raptorengineering.com>
Message-ID: <57E03124.4030202@raptorengineeringinc.com>
Date: Mon, 19 Sep 2016 13:40:36 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <20160919014104.GA30840@roeck-us.net>
In-Reply-To: <20160919014104.GA30840@roeck-us.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/18/2016 08:41 PM, Guenter Roeck wrote:
>> +Sysfs entries
>> +-------------
>> +
>> +fan[1-6]_input           RO  fan tachometer speed in RPM
>> +fan[1-6]_fault           RO  fan experienced fault
>> +fan[1-6]_target          RW  desired fan speed in RPM
>> +fan[1-6]_control_mode    RW  desired control mode: rpm, pwm, or auto
> 
> Please use pwm[]_enable (see API)
> 
>> +pwm[1-6]_enable          RW  output enabled, 0=disabled, 1=enabled
> 
> Per API: 0 = no fan speed control (full speed), 1 = manual fan speed control
> enabled (using pwm[1-*]), 2+: automatic fan speed control
> 
>> +pwm[1-6]                 RW  fan target duty cycle (0-255)

This particular device has a per-output PWM disable bit.  How should
this be handled?  I don't want to globally enable outputs that are not
connector or may possibly be incorrectly connected depending on hardware
design.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4DEgAAoJEK+E3vEXDOFbAz4IAKFCx0Mu6Q5HlsA5IloV1YcP
qj5je1vBONSTxM1cfaYjLmZzUBVecbJZojQjhkoUXxrAkrtmrM9otHfw7k0qs/0q
ppoVevrfp2jKMzvoBp3VytHTZy3rK1Oyxko1dIuwBHMvfMNNk1S8tm132jhv34bK
C1z2l16kU7e99NQV1i4HvB8FyrwotHfPXuZuM1ukO+CmfhLsUzXGYcOsXPApKtdg
CHijAp9qa+YmcEqmcNksncJn769IEhKc1aKWkjcqHg2chmXtz1aR9STzNRnHZJO8
RHivo6/9IGVNCOZSuup4HKhF1kle65W9tvS8D2eQnh/no+8rWHtMm+EZ+WEWFIs=
=V8us
-----END PGP SIGNATURE-----
