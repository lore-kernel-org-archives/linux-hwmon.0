Return-path: <john@jmuir.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: [PATCH 1/3] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
From: John Muir <john@jmuir.com>
In-Reply-To: <c0f07695-e823-5974-829c-6fd64bd97a5b@roeck-us.net>
Date: Mon, 28 Nov 2016 11:40:42 -0800
Cc: Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux List <linux-kernel@vger.kernel.org>,
 linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EDC5A938-C5F5-45A4-85BD-C19996BA6460@jmuir.com>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <c0f07695-e823-5974-829c-6fd64bd97a5b@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>


> On Nov 27, 2016, at 4:19 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> On 11/26/2016 09:15 PM, John Muir wrote:
>> Add support for the TI TMP108 temperature sensor with some device
>> configuration parameters.
>> +- ti,alert-active-high : (boolean) make the alert pin active-high =
instead of
>> +      the default active-low.
>=20
> The driver doesn't support interrupts/alerts. Do those properties =
really add value ?
Getting ahead of myself. I will create a patch for this in the future.

>> +static void tmp108_update_ready_time(struct tmp108 *tmp108)
>> +{
>> +	tmp108->ready_time =3D jiffies;
>> +	if ((tmp108->config & TMP108_CONF_MODE_MASK)
>> +	    =3D=3D TMP108_MODE_CONTINUOUS) {
>=20
> Don't you want a "!" here ? Presumably the delay is only needed
> if the original configuration was not for continuous mode.
>=20
>> +		tmp108->ready_time +=3D
>> +			msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
>> +	}
>> +}
The delay is required for both really. When the device is set into =
continuous mode it starts converting and the first temperature is ready =
(just under) 30ms later.

For the (unsupported at this time) one-shot mode, there would likewise =
be a delay, but I was envisioning having the requesting task sleep while =
waiting for the data to be ready, rather than get an -EAGAIN until the =
data is ready.=20

>> +	hwmon_dev =3D hwmon_device_register_with_groups(dev, =
client->name,
>> +						      tmp108, =
tmp108_groups);
>=20
> Please consider using the devm_ function here.
>=20
>> +	if (IS_ERR(hwmon_dev)) {
>> +		dev_dbg(dev, "unable to register hwmon device\n");
>> +		return PTR_ERR(hwmon_dev);
>> +	}
>> +
>> +	tmp108->hwmon_dev =3D hwmon_dev;
>> +	tmp108->tz =3D thermal_zone_of_sensor_register(hwmon_dev, 0, =
hwmon_dev,
>> +						     =
&tmp108_of_thermal_ops);
>> +	if (IS_ERR(tmp108->tz))
>> +		return PTR_ERR(tmp108->tz);
>=20
> hwmon device not unregistered here. That would be fixed by using the =
devm
> function above.
>=20
For the above two registrations and .remove function, I was worried that =
there would be an order problem between the i2c->remove and the =
device-managed cleanup. I=E2=80=99ll get deeper into that code to =
determine if that is a problem.

For your other comments, I will make the necessary changes.

Thanks!

John.
