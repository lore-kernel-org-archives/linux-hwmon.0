Return-path: <john@jmuir.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: [PATCH 1/2] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
From: John Muir <john@jmuir.com>
In-Reply-To: <e2d01c5f-8d8e-16be-24c8-d19c2a8bc400@roeck-us.net>
Date: Thu, 1 Dec 2016 13:50:22 -0800
Cc: Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 John Muir <muirj@google.com>,
 Anatol Pomazau <anatol@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <126058B2-9FD8-4F95-AEAA-3F1A60CCC1FD@jmuir.com>
References: <1480209983-65915-1-git-send-email-john@jmuir.com>
 <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480538179-75901-2-git-send-email-john@jmuir.com>
 <e2d01c5f-8d8e-16be-24c8-d19c2a8bc400@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Dec 1, 2016, at 7:19 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
>> +/* convert 12-bit TMP108 register value to milliCelsius */
>> +static inline int tmp108_temp_reg_to_mC(s16 val)
>> +{
>> +	return (val & ~0x01) * 1000 / 256;
>=20
> Why ~0x01 and not ~0x0f ? The lower 4 bits are supposed to be 0.

I can probably change it: I will reevaluate this.

>> +	tmp108->orig_config =3D regval;
>> +	config =3D regval;
>> +
>=20
> Nitpick, but a separate 'regval' variable is not really necessary.
> Just make config an u32 and use it directly (this actually makes the =
code
> more efficient on many architectures, since cpu registers tend to be
> at least 32 bit wide and 16 bit accesses result in extra masking).

OK.

>> +	if (device_property_read_bool(dev, =
"ti,thermostat-mode-comparator"))
>> +		config &=3D ~TMP108_CONF_TM;
>> +	else
>> +		config |=3D TMP108_CONF_TM;
>> +
> As suggested separately, I would suggest to drop this and always =
select comparator mode.

Yep.

>> +	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, =
client->name,
>> +							 tmp108,
>> +							 =
&tmp108_chip_info,
>> +							 NULL);
>> +	if (IS_ERR(hwmon_dev)) {
>> +		err =3D PTR_ERR(hwmon_dev);
>> +		dev_err(dev, "unable to register hwmon device: %d", =
err);
>> +		return err;
>> +	}
>=20
> Overall I prefer a simeple
> 	return PTR_ERR_OR_ZERO(hwmon_dev);

Ack.


>> +static int __maybe_unused tmp108_resume(struct device *dev)
>> +{
>> +	struct tmp108 *tmp108 =3D dev_get_drvdata(dev);
>> +	int err;
>> +
>> +	err =3D regmap_write(tmp108->regmap, TMP108_REG_CONF,
>> +			   tmp108->curr_config);
>> +
>> +	tmp108->ready_time =3D jiffies;
>> +	if (tmp108->curr_config & TMP108_MODE_CONTINUOUS)
>=20
> Since only continuous mode is supported, and it is somewhat unlikely
> that we'll ever support one-shot mode, I think it would be better to
> unconditionally set continuous mode and the delay here and drop
> curr_config entirely. curr_config adds quite some complexity to the
> driver with no real gain.

OK. Due to my ignorance I was assuming that the could would need to =
restore the current configuration during resume, and also the previous =
versions (that you did not see) of this code was not using regmap. In =
fact I see that there is also a function called =E2=80=98regmap_sync=E2=80=
=99 which is used (mainly by audio codecs) to do this (i.e.; as part of =
device reset but there are examples in resume()). The configuration =
register is now marked volatile so it would be skipped by regmap_sync =
anyway.

Should we be concerned about restoring the configuration here?

Thanks for your advice,

John.
