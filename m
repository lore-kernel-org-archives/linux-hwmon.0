Return-path: <john@jmuir.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: [PATCH 1/3] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
From: John Muir <john@jmuir.com>
In-Reply-To: <20161128195825.GA10709@roeck-us.net>
Date: Mon, 28 Nov 2016 13:25:37 -0800
Cc: Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux List <linux-kernel@vger.kernel.org>,
 linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA794672-F2A5-4C18-96B2-7BEA53ECECCD@jmuir.com>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <c0f07695-e823-5974-829c-6fd64bd97a5b@roeck-us.net>
 <EDC5A938-C5F5-45A4-85BD-C19996BA6460@jmuir.com>
 <20161128195825.GA10709@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>


> On Nov 28, 2016, at 11:58 AM, Guenter Roeck <linux@roeck-us.net> =
wrote:
>=20
> On Mon, Nov 28, 2016 at 11:40:42AM -0800, John Muir wrote:
>>>> +static void tmp108_update_ready_time(struct tmp108 *tmp108)
>>>> +{
>>>> +	tmp108->ready_time =3D jiffies;
>>>> +	if ((tmp108->config & TMP108_CONF_MODE_MASK)
>>>> +	    =3D=3D TMP108_MODE_CONTINUOUS) {
>>>=20
>>> Don't you want a "!" here ? Presumably the delay is only needed
>>> if the original configuration was not for continuous mode.
>>>=20
>>>> +		tmp108->ready_time +=3D
>>>> +			msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
>>>> +	}
>>>> +}
>> The delay is required for both really. When the device is set into =
continuous mode it starts converting and the first temperature is ready =
(just under) 30ms later.
>>=20
>=20
> The datasheet states, though, that the chip will start converting as =
soon
> as the device powers up. The kernel would have to start really fast =
after that
> to have to wait another 30 ms.
>=20
> The current code ends up waiting if it doesn't have to (because it =
waits
> if the chip was originally configured for continuous mode), and not =
waiting
> if it has to (because the chip was not configured for continuous =
mode),
> which doesn't seem to be such a good idea.

You are referring to the statement under =E2=80=9CConversion Rate=E2=80=9D=
 in the data sheet?

"After power-up or a general-call reset, the TMP108 immediately starts a =
conversion, as shown in Figure 9. The first result is available after 27 =
ms (typical).=E2=80=9D

The datasheet also states that in =E2=80=99shutdown=E2=80=99 mode, the =
device is only powering the serial interface (see "Mode Bits=E2=80=9D). =
So, I assumed that the conversions weren=E2=80=99t happening during in =
that state, and that there would be the delay after moving from the =
=E2=80=98shutdown' state (as is described by the one-shot mode as well =
where the device state returns to =E2=80=99shutdown=E2=80=99 when the =
conversion has taken place).

My intention was that the delay is enforced after PM resume, and for =
convenience I re-used the same function during probe to initialize the =
ready_time. I was assuming that the device could be in the shutdown =
state - for example if the module had previously been unloaded. I agree =
that this is not required at system startup time. Perhaps I should check =
to see if the previous configuration had the device in the =
=E2=80=98shutdown=E2=80=99 state, and in that instance apply the delay? =
In my opinion it doesn=E2=80=99t really matter either way.

FYI, this same logic exists in the TMP102 device driver. The TMP102 =
device is very similar.

>=20
>> For the (unsupported at this time) one-shot mode, there would =
likewise be a delay, but I was envisioning having the requesting task =
sleep while waiting for the data to be ready, rather than get an -EAGAIN =
until the data is ready.=20
>>=20
>=20
> We had that discussion before; the thermal subsystem doesn't like to =
be kept
> waiting. You would end up adding a lot of complexity for very little =
gain.
> It might make more sense to consider implementing runtime idle support
> instead of one-shot mode if power consumption is a concern.

OK thanks. I=E2=80=99ll leave this as unsupported for now.

>=20
>>>> +	hwmon_dev =3D hwmon_device_register_with_groups(dev, =
client->name,
>>>> +						      tmp108, =
tmp108_groups);
>>>=20
>>> Please consider using the devm_ function here.
>>>=20
>>>> +	if (IS_ERR(hwmon_dev)) {
>>>> +		dev_dbg(dev, "unable to register hwmon device\n");
>>>> +		return PTR_ERR(hwmon_dev);
>>>> +	}
>>>> +
>>>> +	tmp108->hwmon_dev =3D hwmon_dev;
>>>> +	tmp108->tz =3D thermal_zone_of_sensor_register(hwmon_dev, 0, =
hwmon_dev,
>>>> +						     =
&tmp108_of_thermal_ops);
>>>> +	if (IS_ERR(tmp108->tz))
>>>> +		return PTR_ERR(tmp108->tz);
>>>=20
>>> hwmon device not unregistered here. That would be fixed by using the =
devm
>>> function above.
>>>=20
>> For the above two registrations and .remove function, I was worried =
that there would be an order problem between the i2c->remove and the =
device-managed cleanup. I=E2=80=99ll get deeper into that code to =
determine if that is a problem.
>>=20
>=20
> The thermal sensor registration will be removed first (in the remove =
function).
> devm_ functions are all unregistered / removed after the remove =
function was
> called (in the order of the devm_ call). Otherwise you would have =
trouble
> with devm_kzalloc() as well.

Great.

> Note that my followup-patch had a problem with the minimum hysteresis
> temperature; it needs to be higher than the lower limit, not lower.

I=E2=80=99ll keep that in mind.

Cheers,

John.
