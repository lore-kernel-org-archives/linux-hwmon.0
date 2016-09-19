Return-path: <tpearson@raptorengineering.com>
Message-ID: <57E02B19.6010709@raptorengineeringinc.com>
Date: Mon, 19 Sep 2016 13:14:49 -0500
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
> On Sun, Sep 18, 2016 at 07:50:55PM -0500, Timothy Pearson wrote:
>> Add a basic driver for the MAX31785, focusing on the fan control
>> features but ignoring the temperature and voltage monitoring
>> features of the device.
>>
>> This driver supports all fan control modes and tachometer / PWM
>> readback where applicable.
>>
> Could you try using hwmon_device_register_with_info() as available in
> linux-next ? Hopefully that should reduce driver size (and give the new API
> some test coverage).

Ordinarily I'd be willing to try this, but in this case I wouldn't be
able to test the module on real hardware; it's an embedded system and
uses the 4.7 kernel at the moment.  Would you be OK with merging a fixed
version of this patch and I can throw together an untested variant using
hwmon_device_register_with_info() for future work?

> Please run the patch through checkpatch --strict. I don't expect you to
> fix all the problems is reports, but the following should be addressed.
> 
> CHECK: Prefer kernel type 'u8' over 'uint8_t'
> CHECK: Prefer kernel type 'u16' over 'uint16_t'
> CHECK: Alignment should match open parenthesis
> CHECK: Logical continuations should be on the previous line
> WARNING: quoted string split across lines

My fault, I completely forgot to run checkpatch.  I'll get a V2 together
shortly including addressing the inline comments.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4CsUAAoJEK+E3vEXDOFb++AH/i1FxEmOJmNVlSowpV5EHsgQ
xcquFnmeF/pK6Oh00LbcI3WvTCgVRBkUl32WG7m5ktKXLDn5fU9DFEQYQVVhzRFU
jz83JyD8HvDhOKubk9G9mqE518ZBIEnYiREHFI9fVuOnUTVemrZtYdKdoA7ez3wi
5t7B7HJ4Gdcyi1FkNwLu+0/N7eLGyR9WfQAFqM0F64qRfQGOxWtwoi4lYgmbxHCg
NFs7LAoJsj00K4DEPiK/3jjy5usfBpcIgkECAYK7+A/sUtDTq+TrBr1ADZY0mbV3
zqDo85alN5XQEvLTjACWXmauMhCUsV4OqzurtlBAVMJQDW6ZKeCnhxv+iUaDxh8=
=Rr2j
-----END PGP SIGNATURE-----
