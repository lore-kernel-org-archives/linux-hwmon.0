Return-Path: <prvs=0352536eba=mike.looijmans@topicproducts.com>
Return-path: <prvs=0352536eba=mike.looijmans@topicproducts.com>
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
To: Tom Levens <tom.levens@cern.ch>, Guenter Roeck <linux@roeck-us.net>
CC: <jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
 <1479384616-12479-3-git-send-email-tom.levens@cern.ch>
 <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net>
 <97eb089f-e0e2-1146-6e17-8f9f790433d8@topic.nl>
 <20170628150130.GC30968@roeck-us.net>
 <alpine.LRH.2.20.1706281723170.31209@lxplus022.cern.ch>
 <20170628160048.GA8915@roeck-us.net>
 <alpine.LRH.2.20.1706281819540.21032@lxplus028.cern.ch>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <abe96add-88fc-af6c-a5ed-330c7ae422b9@topic.nl>
Date: Wed, 28 Jun 2017 19:33:33 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.20.1706281819540.21032@lxplus028.cern.ch>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

=EF=BB=BFOn 28-06-17 19:02, Tom Levens wrote:
>=20
> On Wed, 28 Jun 2017, Guenter Roeck wrote:
>=20
>> On Wed, Jun 28, 2017 at 05:29:38PM +0200, Tom Levens wrote:
>>>
>> [ ... ]
>>
>>>>
>>>>> Whatever happened to this patch though? It didn't make it to mainline=
,
>>>>> otherwise I'd have found it sooner...
>>>>>
>>>> I'll have to look it up, but I guess I didn't get an updated version.
>>>
>>> As far as I remember I had a working V3 of this patch, but it is=20
>>> entirely
>>> possible that it was never submitted as I have been busy with other=20
>>> projects
>>> recently. I'll dig it out and check that it is complete.
>>>
>> FWIW, I don't see it at
>> https://patchwork.kernel.org/project/linux-hwmon/list/?submitter=3D17122=
5&state=3D*=20
>>
>>
>> Maybe you were waiting for a reply from Rob. Either case, it might make
>> sense to only provide valid modes, ie to abstract the mode bits from the
>> hardware, such as
>>
>> 0 - internal temp only
>> 1 - Tr1
>> 2 - V1
>> 3 - V1-V2
>> 4 - Tr2
>> 5 - V3
>> 6 - V3-V4
>> 7 to 14 - per bit 0..2
>>
>> Guenter
>>
>=20
> You are right, there was still an open question about how best to handle=
=20
> the mode selection in DT.
>=20
> In the latest version of my patch I have it implemented as an array for=20
> setting the two values, for example:
>=20
>      lltc,meas-mode =3D <7 3>;
>=20
> This sets bits [2..0] =3D 7 and [4..3] =3D 3. Of course these could be sp=
lit=20
> into two DT properties, but I was unsure what to name them as both=20
> fields are called "mode" in the datasheet and "mode-43"/"mode-20" (or=20
> similar) is ugly.
>=20
> With regards to your proposal, it is not clear to me whether the modes=20
> which have the same result are exactly equivalent. Does disabling a=20
> measurement with the mode[4..3] bits really leaves the part in a safe=20
> state for all possible HW connections? With this doubt in my head, I=20
> would prefer to keep the option available to the user to select any=20
> specific mode. But I am open to suggestions.

Well, the input restrictions always apply, so disabling V3 measurement=20
doesn't imply that you can apply 20V to that input safely now.

I'd suggest to set unused input to plain voltage measurement. That is=20
"passive" and safe for external components.

So I'd suggest just setting the mode as per device datasheet, I can see=20
no real advantage in abstracting it away and forcing users to read yet=20
another document to get it right, e.g.:

lltc,mode =3D <6>;

As for the input disabling, since I doubt anyone would use it (why=20
purchase a 4-channel device and use only 2), just add two booleans, e.g.=20
"disable-inputs-34" and "disable-inputs-12" which set the command bits=20
appropriately, and change the mode such that the disabled inputs are=20
voltage readout only.

A case could even be made for changing mode at runtime. This allows=20
using it to measure both current and voltage on two inputs, by reading=20
V1, and V3, and then switch mode to obtain (accurate) V1-V2 and V4-V3.

That might be a viable way to handle not setting the mode at all. If the=20
mode can be selected via sysfs, the driver can keep the device in a=20
"safe" mode until the mode has been selected.


> Mike, if you would like to test it, the latest version of my code is here=
:
>=20
> https://github.com/levens/ltc2990/blob/dev/drivers/hwmon/ltc2990.c

Sure, I even have a board with 2 of these devices now :)

--=20
Mike Looijmans


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
