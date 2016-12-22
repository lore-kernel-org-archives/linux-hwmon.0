Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from argos.tuxed.org ([176.9.87.227]:50277 "EHLO argos.tuxed.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754614AbcLVNIw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 08:08:52 -0500
Subject: Re: [PATCH 1/2] hwmon: adc128d818: Implement chip mode selection
To: Guenter Roeck <linux@roeck-us.net>
References: <1459278219-5573-1-git-send-email-mail@alexanderkoch.net>
 <1459278219-5573-2-git-send-email-mail@alexanderkoch.net>
 <20160329195335.GA27318@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, lm-sensors@lm-sensors.org,
        linux-kernel@vger.kernel.org,
        Michael Hornung <mhornung.linux@gmail.com>,
        linux-hwmon@vger.kernel.org
From: Alexander Koch <mail@alexanderkoch.net>
Message-ID: <c459b499-4a5c-6a62-0b89-f65db7292673@alexanderkoch.net>
Date: Thu, 22 Dec 2016 14:02:54 +0100
MIME-Version: 1.0
In-Reply-To: <20160329195335.GA27318@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Mar 29, 2016 at 21:53, Guenter Roeck wrote:
> On Tue, Mar 29, 2016 at 09:03:38PM +0200, Alexander Koch wrote:
>> The ADC128D818 offers four operation modes (see datasheet sec. 8.4.1)
>> which vary in the number of available input signals and their types
>> (differential vs. absolute).
>>
>> The current version of this driver only implements mode 0, this patch
>> prepares implementation of the others.
>>
>>  * Introduce device tree property 'mode' for selection of chip operati=
on
>>    mode, default to mode 0
>>
>>  * Extend device data structure to cover all eight input channels
>>
>> Example of 'mode' usage:
>>
>>         adc1: adc128d818@1d {
>>                 compatible =3D "ti,adc128d818";
>>                 reg =3D <0x1d>;
>>                 mode =3D /bits/ 8 <0>;
> This will require devicetree maintainer review (and bindings document).=

> The property will probably require a ti, prefix. The bindings document =
also
> needs to list the valid modes (all of them, not only the ones supported=

> by the driver).

Okay so I will create a bindings document
'devicetree/bindings/hwmon/adc128d818.txt' describing the current
properties along with the new 'mode' property.

Concerning the prefix I have been a bit indecisive as there are
currently examples with (e.g. 'w1/omap-hdq.txt') and without (e.g.
'input/ti,drv260x.txt') that.


>>  	mutex_lock(&data->update_lock);
>> =20
>>  	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
>> -		for (i =3D 0; i < 7; i++) {
>> +		for (i =3D 0; i < no_in; i++) {
>>  			rv =3D i2c_smbus_read_word_swapped(client,
>>  							 ADC128_REG_IN(i));
>>  			if (rv < 0)
>> @@ -107,20 +111,25 @@ static struct adc128_data *adc128_update_device(=
struct device *dev)
>>  			data->in[2][i] =3D rv << 4;
>>  		}
>> =20
>> -		rv =3D i2c_smbus_read_word_swapped(client, ADC128_REG_TEMP);
>> -		if (rv < 0)
>> -			goto abort;
>> -		data->temp[0] =3D rv >> 7;
>> +		if (data->mode !=3D 1) {
>> +			rv =3D i2c_smbus_read_word_swapped(client,
>> +							 ADC128_REG_TEMP);
>> +			if (rv < 0)
>> +				goto abort;
>> +			data->temp[0] =3D rv >> 7;
>> =20
>> -		rv =3D i2c_smbus_read_byte_data(client, ADC128_REG_TEMP_MAX);
>> -		if (rv < 0)
>> -			goto abort;
>> -		data->temp[1] =3D rv << 1;
>> +			rv =3D i2c_smbus_read_byte_data(client,
>> +						      ADC128_REG_TEMP_MAX);
>> +			if (rv < 0)
>> +				goto abort;
>> +			data->temp[1] =3D rv << 1;
>> =20
>> -		rv =3D i2c_smbus_read_byte_data(client, ADC128_REG_TEMP_HYST);
>> -		if (rv < 0)
>> -			goto abort;
>> -		data->temp[2] =3D rv << 1;
>> +			rv =3D i2c_smbus_read_byte_data(client,
>> +						      ADC128_REG_TEMP_HYST);
>> +			if (rv < 0)
>> +				goto abort;
>> +			data->temp[2] =3D rv << 1;
>> +		}
>> =20
>>  		rv =3D i2c_smbus_read_byte_data(client, ADC128_REG_ALARM);
>>  		if (rv < 0)
>> @@ -304,7 +313,7 @@ static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, adc1=
28_show_alarm, NULL, 5);
>>  static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, adc128_show_alarm, NULL=
, 6);
>>  static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, adc128_show_alarm=
, NULL, 7);
>> =20
>> -static struct attribute *adc128_attrs[] =3D {
>> +static struct attribute *adc128m0_attrs[] =3D {
>>  	&sensor_dev_attr_in0_min.dev_attr.attr,
>>  	&sensor_dev_attr_in1_min.dev_attr.attr,
>>  	&sensor_dev_attr_in2_min.dev_attr.attr,
>> @@ -339,7 +348,7 @@ static struct attribute *adc128_attrs[] =3D {
>>  	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
>>  	NULL
>>  };
>> -ATTRIBUTE_GROUPS(adc128);
>> +ATTRIBUTE_GROUPS(adc128m0);
>> =20
>>  static int adc128_detect(struct i2c_client *client, struct i2c_board_=
info *info)
>>  {
>> @@ -387,6 +396,15 @@ static int adc128_init_client(struct adc128_data =
*data)
>>  	if (err)
>>  		return err;
>> =20
>> +	/* Set operation mode, if non-default */
>> +	if (data->mode !=3D 0) {
>> +		err =3D i2c_smbus_write_byte_data(client,
>> +						ADC128_REG_CONFIG_ADV,
>> +						data->mode << 1);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>>  	/* Start monitoring */
>>  	err =3D i2c_smbus_write_byte_data(client, ADC128_REG_CONFIG, 0x01);
>>  	if (err)
>> @@ -410,6 +428,7 @@ static int adc128_probe(struct i2c_client *client,=

>>  	struct regulator *regulator;
>>  	struct device *hwmon_dev;
>>  	struct adc128_data *data;
>> +	const struct attribute_group **groups;
>>  	int err, vref;
>> =20
>>  	data =3D devm_kzalloc(dev, sizeof(struct adc128_data), GFP_KERNEL);
>> @@ -433,6 +452,18 @@ static int adc128_probe(struct i2c_client *client=
,
>>  		data->vref =3D 2560;	/* 2.56V, in mV */
>>  	}
>> =20
>> +	/* Operation mode is optional and defaults to mode 0 */
>> +	data->mode =3D 0;
>> +	groups =3D adc128m0_groups;
>> +	if (of_property_read_u8(dev->of_node, "mode", &data->mode) =3D=3D 0)=
 {
>> +		if (data->mode !=3D 0) {
>> +			dev_err(dev, "unsupported operation mode %d",
>> +				data->mode);
>> +			err =3D -EINVAL;
>> +			goto error;
>> +		}
> I am sure you are goint to introduce mode support with the next patch, =
but you also
> added some mode support in this patch. Patches should be logically cons=
istent,
> which is not the case here. Most of your changes are not even testable =
because
> mode !=3D0 is rejected here, and some of the changes in this patch don'=
t make
> sense without the next patch.

I'm not sure I got your point there. Taking a step back from my
(admittedly crappy) implementation I had the intention of preserving two
logical units: one being refactoring to introduce the 'mode' property
(but keeping the functional level of the driver, i.e. mode-0-only) and
two being the addition of new functionality (mode 1 support).

I understand that step 1 does not make much sense without step 2, but
what would be the alternative then? Combining both steps in a single
patch? I'd consider this a bit too much for a single patch, and
separating refactoring from the addition of new functionality is, to my
understanding, generally advised (e.g. [1]).

Concerning testability, could you please explain why the rejection of
mode !=3D0 renders my changes untestable? This check is performed only if=

the 'mode' attribute is present in the device tree, so testing the
default (no definition at all) is still possible. Would I have to
implement all possible values of 'mode' in order to make my changes
testable?


> It might make more sense to introduce the bindings document in the firs=
t patch,
> and the code changes in the second patch.

In my daily work I am used to committing new functional implementations
along with their documentation in a single commit. The reason for this
being that the alternative would be two separate patches, and that if
someone accidentally checks out the first patch the resulting code base
would either have documentation for something that isn't implemented or
an undocumented function.

Heeding to your advice I assume in Kernel development it is preferred to
have changes to documentation and code in separate commits.


So what would you think of the following patch set structure?

 1) Add device tree binding document (including 'mode')
 2) Refactor the code to reflect the 'mode' property (but still support
mode 0 only)
 3) Implement mode 1 support


Another point would be updating 'Documentation/hwmon/adc128d818', which
is missing the other operation modes as well. Would you see this as 4)
or between 1) and 2)?


Kind regards and thank you very much for your detailed feedback

Alex


[1] https://kernelnewbies.org/PatchPhilosophy


