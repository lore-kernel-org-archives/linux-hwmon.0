Return-path: <tpearson@raptorengineering.com>
Message-ID: <57E1F9CC.6000909@raptorengineeringinc.com>
Date: Tue, 20 Sep 2016 22:09:00 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <20160919014104.GA30840@roeck-us.net> <57E03124.4030202@raptorengineeringinc.com> <20160919200413.GA29242@roeck-us.net> <57E04B25.4000001@raptorengineeringinc.com> <20160920005443.GB4064@roeck-us.net> <57E093DB.7030000@raptorengineeringinc.com> <57E19104.6050907@raptorengineeringinc.com> <20160920195902.GB1934@roeck-us.net> <57E195A3.5050703@raptorengineeringinc.com> <42772060-c1e0-0a2c-ea2d-0c4fbcc5c061@roeck-us.net>
In-Reply-To: <42772060-c1e0-0a2c-ea2d-0c4fbcc5c061@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/20/2016 10:04 PM, Guenter Roeck wrote:
> On 09/20/2016 01:01 PM, Timothy Pearson wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 09/20/2016 02:59 PM, Guenter Roeck wrote:
>> OK, sounds good.  I looked back in the notes for this project and we had
>> originally considered using a PMBus driver but ran into the kernel
>> documentation, noted the missing control features, and I subsequently
> 
> It is always useful to talk with the maintainer.

I'll keep that in mind next time.  This particular area of the kernel
seems much more responsive than some of the others that we've had the
misfortune of trying to work with; multiple weeks of delay for a
response to a simple two line patch tends to turn one off of the mailing
lists...

>> misinterpreted the datasheet using the kernel docs as a reference.  This
>> is why the hwmon driver was implemented.
>>
> 
> I am still not sure I understand what irked you off in the datasheet.
> Is it the "supports a subset of the commands defined in the PMBus
> Specfication" ? If so, please keep in mind that every single chip
> supporting PMBus will only support a subset of PMBus commands.

Yes, I definitely understand that now.  This was the line that, when
taken out of context and compared against the kernel documentation,
caused an incorrect assumption on my part.

>> Please let me know if I can be of any assistance.
>>
> Sure, I'll let you know.
> 
> Thanks,
> Guenter
> 


- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4fnKAAoJEK+E3vEXDOFbyJEH/AqkLDgx6BgxcHRfl63G9YlE
ln97m5X8NrWkGDQajzPHtv4g7imrli4ztTfJgjLnEPKu257clh1pEd32/gWKZYp5
tnewbANOjOg4E/75bM7I1hFSN4LXylwiPGPtNdtPqmHDsKk3RDLSweFn2wuKIvuP
rMJVmZHElbZdM5BenWWBEaqJxkUe8SkWfwb4CcIPNigETMZckvpzP+Db9qm2t5pq
Go3lYbamLK2KcrMngRTtnH3EmJY7KXa0+GsgmQthkxYA7ZvDG9DRBLFpPECEWZfr
HZrld5hwnzGwh2GkTTvO1JUQvv5wrtu1tXAxR5EPCWWDjqHW3dUzG1WgmsSJ+mI=
=xXkP
-----END PGP SIGNATURE-----
