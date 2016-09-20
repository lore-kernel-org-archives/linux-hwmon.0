Return-path: <tpearson@raptorengineering.com>
Message-ID: <57E093DB.7030000@raptorengineeringinc.com>
Date: Mon, 19 Sep 2016 20:41:47 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <20160919014104.GA30840@roeck-us.net> <57E03124.4030202@raptorengineeringinc.com> <20160919200413.GA29242@roeck-us.net> <57E04B25.4000001@raptorengineeringinc.com> <20160920005443.GB4064@roeck-us.net>
In-Reply-To: <20160920005443.GB4064@roeck-us.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/19/2016 07:54 PM, Guenter Roeck wrote:
> On Mon, Sep 19, 2016 at 03:31:33PM -0500, Timothy Pearson wrote:
>> On 09/19/2016 03:04 PM, Guenter Roeck wrote:
> And then you are using all pmbus commands ? Seems odd.
> 
> I guess I'l buy an evaluation board if one is available and check if your claim
> is correct. I am not inclined to accept a non-pmbus driver for a pmbus
> device without good reason.
> 
> Guenter

Well, I went back over the datasheet and I may have misinterpreted some
of the introductory text.  In any case I'm not likely to go back and
re-do this as a pmbus driver as the original was done in my free time
and works well enough for our needs at the moment.  When the patch no
longer applies perhaps someone else can pick up the porting effort.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4JPYAAoJEK+E3vEXDOFb8koIAK1DQkicpt/CKU5vhGAxw8m9
MYGg+e+fe4s+PD3NmP0WZMAvDLtXOxYCBPRjqZWb4RJdfHNoAjjyJIFlDtG3UkBT
/WIDO3gRADJLopabWSu591IKHfgHr/4v6+mfg8R2ZHrtbNNVnDlj1qnPanfPrskm
h4Nq2Z1PPCBjmGA/HPr9NAkAASQmdcDRKkpO5k1zhUx5L4YL7QNQFphZxRkeiCKp
mpA3hQIYayItCuRCt+PQWqb3dMB1hOkyEQP+xDzaLCkrajTt4wrh+lgjIfPEQZwC
F71wiRuq5FVhZDqg/ko4/lkuwgmiXWR9lOpo7WSHHoFaYg54teFrYX3Z6Ci0Ug4=
=ueAd
-----END PGP SIGNATURE-----
