Return-path: <tpearson@raptorengineering.com>
Message-ID: <57E195A3.5050703@raptorengineeringinc.com>
Date: Tue, 20 Sep 2016 15:01:39 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
References: <20160919014104.GA30840@roeck-us.net> <57E03124.4030202@raptorengineeringinc.com> <20160919200413.GA29242@roeck-us.net> <57E04B25.4000001@raptorengineeringinc.com> <20160920005443.GB4064@roeck-us.net> <57E093DB.7030000@raptorengineeringinc.com> <57E19104.6050907@raptorengineeringinc.com> <20160920195902.GB1934@roeck-us.net>
In-Reply-To: <20160920195902.GB1934@roeck-us.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/20/2016 02:59 PM, Guenter Roeck wrote:
> On Tue, Sep 20, 2016 at 02:41:56PM -0500, Timothy Pearson wrote:
>> On 09/19/2016 07:54 PM, Guenter Roeck wrote:
>>>> On 09/19/2016 03:04 PM, Guenter Roeck wrote:
>>>> And then you are using all pmbus commands ? Seems odd.
>>>
>>> I guess I'l buy an evaluation board if one is available and check if your claim
>>> is correct. I am not inclined to accept a non-pmbus driver for a pmbus
>>> device without good reason.
>>>
>>> Guenter
>>
>> Regarding the PMBus driver, I looked over the documentation available
>> here: https://www.kernel.org/doc/Documentation/hwmon/pmbus
>>
>> From what I can tell PMBus drivers do not support configuring the fan
>> control parameters, only monitoring the fan status and speed.  Is this
>> correct, and if not where would I find the correct documentation?
>>
> So far that wasn't needed. That doesn't mean it can not be added.
> 
> I orderd an evaluation board and will likely spend some time on it myself
> after I get it.
> 
> Guenter

OK, sounds good.  I looked back in the notes for this project and we had
originally considered using a PMBus driver but ran into the kernel
documentation, noted the missing control features, and I subsequently
misinterpreted the datasheet using the kernel docs as a reference.  This
is why the hwmon driver was implemented.

Please let me know if I can be of any assistance.

Thanks!

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4ZWeAAoJEK+E3vEXDOFbSNkH/3IqLAbvz2aVyPUBhKBFHC72
0uaP/IhBIoDoKAdZ50jJljYQIub0hn6HrQH52SYXvNhkO43+UJwqOxIRliipueDg
X9H2esdeaptjI+O3dXCv5bLyMgy+ohGv1aPkxon+BTo506NWlHOyYlbCscIgmuMu
nsMmHVGQvEyMtbJHlwmT0tjE81IEYxFxc1eLPbPhcrdz1f6yIAY7tHFo5ZjE+wt8
mzU35ZI+zIkKbD88Qfs8Ca/aTfRzt5xDKHDI3//YouyiqlnDK7etoZrAtx2RxtcJ
Qv8k2udTpQuuYwwGobwC0SSWaxeRMlRaumX+ZkIYJz7xSp1krnArx5na2r2cTr8=
=Guwk
-----END PGP SIGNATURE-----
