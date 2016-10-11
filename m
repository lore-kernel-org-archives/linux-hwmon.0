Return-path: <tpearson@raptorengineering.com>
Message-ID: <57FCF9A5.1040703@raptorengineeringinc.com>
Date: Tue, 11 Oct 2016 09:39:33 -0500
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
>> On 09/20/2016 02:59 PM, Guenter Roeck wrote:
>>
>> OK, sounds good.  I looked back in the notes for this project and we had
>> originally considered using a PMBus driver but ran into the kernel
>> documentation, noted the missing control features, and I subsequently
> 
> It is always useful to talk with the maintainer.
> 
>> misinterpreted the datasheet using the kernel docs as a reference.  This
>> is why the hwmon driver was implemented.
>>
> 
> I am still not sure I understand what irked you off in the datasheet.
> Is it the "supports a subset of the commands defined in the PMBus
> Specfication" ? If so, please keep in mind that every single chip
> supporting PMBus will only support a subset of PMBus commands.
> 
>> Please let me know if I can be of any assistance.
>>
> Sure, I'll let you know.
> 
> Thanks,
> Guenter
> 

Just checking back in to see how things are going with this driver.  I
don't really know how involved the surgery to PMBus will be to get this
device working; are we looking at weeks / months or something sooner?

Thanks again!

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX/PmkAAoJEK+E3vEXDOFbYVQIAKhoDT+kU+fR2CML4S3wYRQP
fjI/vJG6D3UPzb8M8IvCpGVSxR4bIl1uLC3pftT5TbF93XHXd6M39MUJYcoWRjnE
iB//9KrYopFXcFxGY6wIKqJ9YwQLDHAMDFAd7GS852z6+gMRxU06L4vOWpCH+Xgv
kNbU8vMuyie0a3SwgC6+gYn/hUyZNzVLUXMtM0AJZm4zpcMoTXXqsHINNc91d82D
RZSHNZs+fHiEqWxAV2GPNGQ+ZnwE+rIYT4yXml6q13AywaUEkJTL45WN86ntt75G
EbCsvzcfgaxz3tlis+UW/yqy6FEaHdVxFICq9FuawAfBjjgeC4rxP54ZD3BHOTM=
=LJ5E
-----END PGP SIGNATURE-----
