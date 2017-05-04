Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"jdelvare@suse.com" <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 3/3] hwmon: (adt7475) temperature smoothing
Date: Thu, 4 May 2017 01:28:17 +0000
Message-ID: <ce2dcbd7c0634240b23e7f5950f3cfc8@svr-chch-ex1.atlnz.lc>
References: <20170503004009.23769-1-chris.packham@alliedtelesis.co.nz>
 <20170503004009.23769-4-chris.packham@alliedtelesis.co.nz>
 <20170503163041.GB9471@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 04/05/17 04:30, Guenter Roeck wrote:=0A=
> On Wed, May 03, 2017 at 12:40:09PM +1200, Chris Packham wrote:=0A=
>> When enabled temperature smoothing allows ramping the fan speed over a=
=0A=
>> configurable period of time instead of jumping to the new speed=0A=
>> instantaneously.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>> Changes in v2:=0A=
>> - use a single tempN_smoothing attribute=0A=
>>=0A=
>>  Documentation/hwmon/adt7475 |  4 ++=0A=
>>  drivers/hwmon/adt7475.c     | 99 ++++++++++++++++++++++++++++++++++++++=
+++++++=0A=
>>  2 files changed, 103 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475=
=0A=
>> index 63507402cd4f..dd6433d819d0 100644=0A=
>> --- a/Documentation/hwmon/adt7475=0A=
>> +++ b/Documentation/hwmon/adt7475=0A=
>> @@ -114,6 +114,10 @@ minimum (i.e. auto_point1_pwm). This behaviour be c=
onfigured using the=0A=
>>  pwm[1-*]_stall_dis sysfs attribute. A value of 0 means the fans will sh=
ut off.=0A=
>>  A value of 1 means the fans will run at auto_point1_pwm.=0A=
>>=0A=
>> +The responsiveness of the ADT747x to temperature changes can be configu=
red.=0A=
>> +This allows smoothing of the fan speed transition. To set the transitio=
n time=0A=
>> +set the value in ms in the temp[1-*]_smoothing sysfs attribute.=0A=
>> +=0A=
>>  Notes=0A=
>>  -----=0A=
>>=0A=
>> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c=0A=
>> index 85957324cd85..41342de6e20c 100644=0A=
>> --- a/drivers/hwmon/adt7475.c=0A=
>> +++ b/drivers/hwmon/adt7475.c=0A=
>> @@ -526,6 +526,96 @@ static ssize_t set_temp(struct device *dev, struct =
device_attribute *attr,=0A=
>>  	return count;=0A=
>>  }=0A=
>>=0A=
>> +/* Assuming CONFIG6[SLOW] is 0 */=0A=
>=0A=
> Can you take that into account and calculate a "best fit" based on the=0A=
> available options ?=0A=
=0A=
Do you mean check CONFIG6[SLOW] and choose between 1 of 2 possible maps? =
=0A=
Or have a unified map and choose both the SLOW and ACOU values?=0A=
=0A=
I briefly considered the latter but things soon started to get =0A=
complicated. It would look something like this (please excuse using a =0A=
MUA as a code editor).=0A=
=0A=
static const int ad7475_st_map[] =3D {=0A=
	52200, 37500, 26100, 18800, 17400, 12500, 10400, 7500,=0A=
	6500, 4700, 4400, 3100, 2200, 1600, 1100, 800,=0A=
};=0A=
=0A=
i =3D find_closest_descending(val, ad7475_st_map,=0A=
			    ARRAY_SIZE(ad7475_st_map));=0A=
acou =3D i / 2;=0A=
slow =3D i % 2;=0A=
=0A=
Going in reverse then gets really fun=0A=
=0A=
slow =3D !!(i2c_smbus_read_byte_data(client, REG_CONFIG6) & BIT(PWMx))=0A=
acou =3D data->enh_acou[idx];=0A=
=0A=
i =3D (acou * 2) + slow;=0A=
=0A=
return sprintf(buf, "%d\n", ad7475_st_map[i]);=0A=
=0A=
I could probably make the above work I just wasn't sure it was worth the =
=0A=
hassle. Only the higher ranges would really be noticeable to anyone.=0A=
=0A=
>=0A=
>> +static const int ad7475_st_map[] =3D {=0A=
>> +	37500, 18800, 12500, 7500, 4700, 3100, 1600, 800,=0A=
>> +};=0A=
>> +=0A=
>> +static ssize_t show_temp_st(struct device *dev, struct device_attribute=
 *attr,=0A=
>> +				  char *buf)=0A=
>> +{=0A=
>> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr)=
;=0A=
>> +	struct i2c_client *client =3D to_i2c_client(dev);=0A=
>> +	struct adt7475_data *data =3D i2c_get_clientdata(client);=0A=
>> +	int shift, idx;=0A=
>> +	long val;=0A=
>> +=0A=
>> +	switch (sattr->index) {=0A=
>> +	case 0:=0A=
>> +		shift =3D 0;=0A=
>> +		idx =3D 0;=0A=
>> +		break;=0A=
>> +	case 1:=0A=
>> +		shift =3D 4;=0A=
>> +		idx =3D 1;=0A=
>> +		break;=0A=
>> +	case 2:=0A=
>> +		shift =3D 0;=0A=
>> +		idx =3D 1;=0A=
>> +		break;=0A=
>> +	default:=0A=
>> +		return -EINVAL;=0A=
>> +	}=0A=
>> +=0A=
>> +	val =3D data->enh_acou[idx] >> shift;=0A=
>> +	if (val & 0x8) {=0A=
>> +		return sprintf(buf, "%d\n", ad7475_st_map[val & 0x7]);=0A=
>> +	} else {=0A=
>> +		return sprintf(buf, "0\n");=0A=
>> +	}=0A=
>> +}=0A=
>> +=0A=
>> +static ssize_t set_temp_st(struct device *dev, struct device_attribute =
*attr,=0A=
>> +				 const char *buf, size_t count)=0A=
>> +{=0A=
>> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr)=
;=0A=
>> +	struct i2c_client *client =3D to_i2c_client(dev);=0A=
>> +	struct adt7475_data *data =3D i2c_get_clientdata(client);=0A=
>> +	unsigned char reg;=0A=
>> +	int shift, idx;=0A=
>> +	ulong val;=0A=
>> +=0A=
>> +	if (kstrtoul(buf, 10, &val))=0A=
>> +		return -EINVAL;=0A=
>> +=0A=
>> +	switch (sattr->index) {=0A=
>> +	case 0:=0A=
>> +		reg =3D REG_ENHANCE_ACOUSTICS1;=0A=
>> +		shift =3D 0;=0A=
>> +		idx =3D 0;=0A=
>> +		break;=0A=
>> +	case 1:=0A=
>> +		reg =3D REG_ENHANCE_ACOUSTICS2;=0A=
>> +		shift =3D 4;=0A=
>> +		idx =3D 1;=0A=
>> +		break;=0A=
>> +	case 2:=0A=
>> +		reg =3D REG_ENHANCE_ACOUSTICS2;=0A=
>> +		shift =3D 0;=0A=
>> +		idx =3D 1;=0A=
>> +		break;=0A=
>> +	default:=0A=
>> +		return -EINVAL;=0A=
>> +	}=0A=
>> +=0A=
>> +	if (val > 0) {=0A=
>> +		val =3D find_closest_descending(val, ad7475_st_map,=0A=
>> +					      ARRAY_SIZE(ad7475_st_map));=0A=
>> +		val |=3D 0x8;=0A=
>> +	}=0A=
>> +=0A=
>> +	mutex_lock(&data->lock);=0A=
>> +=0A=
>> +	data->enh_acou[idx] &=3D ~(0xf << shift);=0A=
>> +	data->enh_acou[idx] |=3D (val << shift);=0A=
>> +=0A=
>> +	i2c_smbus_write_byte_data(client, reg, data->enh_acou[idx]);=0A=
>> +=0A=
>> +	mutex_unlock(&data->lock);=0A=
>> +=0A=
>> +	return count;=0A=
>> +}=0A=
>> +=0A=
>>  /*=0A=
>>   * Table of autorange values - the user will write the value in millide=
grees,=0A=
>>   * and we'll convert it=0A=
>> @@ -1008,6 +1098,8 @@ static SENSOR_DEVICE_ATTR_2(temp1_crit, S_IRUGO | =
S_IWUSR, show_temp, set_temp,=0A=
>>  			    THERM, 0);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp1_crit_hyst, S_IRUGO | S_IWUSR, show_te=
mp,=0A=
>>  			    set_temp, HYSTERSIS, 0);=0A=
>> +static SENSOR_DEVICE_ATTR_2(temp1_smoothing, S_IRUGO | S_IWUSR, show_te=
mp_st,=0A=
>> +			    set_temp_st, 0, 0);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp, NULL, INPU=
T, 1);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp2_alarm, S_IRUGO, show_temp, NULL, ALAR=
M, 1);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp2_max, S_IRUGO | S_IWUSR, show_temp, se=
t_temp,=0A=
>> @@ -1024,6 +1116,8 @@ static SENSOR_DEVICE_ATTR_2(temp2_crit, S_IRUGO | =
S_IWUSR, show_temp, set_temp,=0A=
>>  			    THERM, 1);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp2_crit_hyst, S_IRUGO | S_IWUSR, show_te=
mp,=0A=
>>  			    set_temp, HYSTERSIS, 1);=0A=
>> +static SENSOR_DEVICE_ATTR_2(temp2_smoothing, S_IRUGO | S_IWUSR, show_te=
mp_st,=0A=
>> +			    set_temp_st, 0, 1);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp, NULL, INPU=
T, 2);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp3_alarm, S_IRUGO, show_temp, NULL, ALAR=
M, 2);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp3_fault, S_IRUGO, show_temp, NULL, FAUL=
T, 2);=0A=
>> @@ -1041,6 +1135,8 @@ static SENSOR_DEVICE_ATTR_2(temp3_crit, S_IRUGO | =
S_IWUSR, show_temp, set_temp,=0A=
>>  			    THERM, 2);=0A=
>>  static SENSOR_DEVICE_ATTR_2(temp3_crit_hyst, S_IRUGO | S_IWUSR, show_te=
mp,=0A=
>>  			    set_temp, HYSTERSIS, 2);=0A=
>> +static SENSOR_DEVICE_ATTR_2(temp3_smoothing, S_IRUGO | S_IWUSR, show_te=
mp_st,=0A=
>> +			    set_temp_st, 0, 2);=0A=
>>  static SENSOR_DEVICE_ATTR_2(fan1_input, S_IRUGO, show_tach, NULL, INPUT=
, 0);=0A=
>>  static SENSOR_DEVICE_ATTR_2(fan1_min, S_IRUGO | S_IWUSR, show_tach, set=
_tach,=0A=
>>  			    MIN, 0);=0A=
>> @@ -1125,6 +1221,7 @@ static struct attribute *adt7475_attrs[] =3D {=0A=
>>  	&sensor_dev_attr_temp1_auto_point2_temp.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp1_crit.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,=0A=
>> +	&sensor_dev_attr_temp1_smoothing.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_input.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_alarm.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_max.dev_attr.attr,=0A=
>> @@ -1134,6 +1231,7 @@ static struct attribute *adt7475_attrs[] =3D {=0A=
>>  	&sensor_dev_attr_temp2_auto_point2_temp.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_crit.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_crit_hyst.dev_attr.attr,=0A=
>> +	&sensor_dev_attr_temp2_smoothing.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_input.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_fault.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_alarm.dev_attr.attr,=0A=
>> @@ -1144,6 +1242,7 @@ static struct attribute *adt7475_attrs[] =3D {=0A=
>>  	&sensor_dev_attr_temp3_auto_point2_temp.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_crit.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_crit_hyst.dev_attr.attr,=0A=
>> +	&sensor_dev_attr_temp3_smoothing.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_fan1_input.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_fan1_min.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_fan1_alarm.dev_attr.attr,=0A=
>> --=0A=
>> 2.11.0.24.ge6920cf=0A=
>>=0A=
>=0A=
=0A=
