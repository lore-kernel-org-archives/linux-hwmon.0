Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:56748 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759376AbdENVXN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 May 2017 17:23:13 -0400
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] hwmon: (adt7475) temperature smoothing
Date: Sun, 14 May 2017 21:23:08 +0000
Message-ID: <17bdded5bf794ba08348ce304bc05f82@svr-chch-ex1.atlnz.lc>
References: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
 <20170511034524.22698-4-chris.packham@alliedtelesis.co.nz>
 <7b544105-655d-ec92-2690-1ff094339e7c@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 15/05/17 03:40, Guenter Roeck wrote:=0A=
> On 05/10/2017 08:45 PM, Chris Packham wrote:=0A=
>> When enabled temperature smoothing allows ramping the fan speed over a=
=0A=
>> configurable period of time instead of jumping to the new speed=0A=
>> instantaneously.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>=0A=
>> Changes in v2:=0A=
>> - use a single tempN_smoothing attribute=0A=
>=0A=
> This is a bit confusing. tempN suggests that the attribute would be assoc=
iated=0A=
> with a given temperature, not with fan control. Not that I have a better =
idea=0A=
> for an attribute name, though, so unless you find a better name I am ok w=
ith it.=0A=
>=0A=
=0A=
The datasheet is a bit confusing in this respect.=0A=
=0A=
 From the description of register 0x62:=0A=
=0A=
"Assuming that PWMx is associated with the Remote 1 temperature channel, =
=0A=
these bits define the maximum rate of change of the PWMx output for =0A=
Remote 1 temperature related changes. Instead of the fan speed jumping =0A=
instantaneously to its newly determined speed, it ramps=0A=
gracefully at the rate determined by these bits. This feature ultimately =
=0A=
enhances the acoustics of the fan."=0A=
=0A=
Based on my reading it's a property of the temperature input not of the =0A=
PWM. If you changed pwmN_auto_channels_temp this setting would stay with =
=0A=
the temperature sensor not the PWM.=0A=
=0A=
>> Changes in v3:=0A=
>> - change enh_acou to enh_acoustics=0A=
>> - simplify show_temp_st()=0A=
>>=0A=
>>  Documentation/hwmon/adt7475 |  4 ++=0A=
>>  drivers/hwmon/adt7475.c     | 93 ++++++++++++++++++++++++++++++++++++++=
+++++++=0A=
>>  2 files changed, 97 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475=
=0A=
>> index 3990bae60e78..e82b24ec4b07 100644=0A=
>> --- a/Documentation/hwmon/adt7475=0A=
>> +++ b/Documentation/hwmon/adt7475=0A=
>> @@ -114,6 +114,10 @@ minimum (i.e. auto_point1_pwm). This behaviour can =
be configured using the=0A=
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
>> index 4d6c625fec70..f7322330789c 100644=0A=
>> --- a/drivers/hwmon/adt7475.c=0A=
>> +++ b/drivers/hwmon/adt7475.c=0A=
>> @@ -526,6 +526,90 @@ static ssize_t set_temp(struct device *dev, struct =
device_attribute *attr,=0A=
>>  	return count;=0A=
>>  }=0A=
>>=0A=
>> +/* Assuming CONFIG6[SLOW] is 0 */=0A=
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
>> +	long val;=0A=
>> +=0A=
>> +	switch (sattr->index) {=0A=
>> +	case 0:=0A=
>> +		val =3D data->enh_acoustics[0] & 0xf;=0A=
>> +		break;=0A=
>> +	case 1:=0A=
>> +		val =3D (data->enh_acoustics[1] >> 4) & 0xf;=0A=
>> +		break;=0A=
>> +	case 2:=0A=
>> +		val =3D data->enh_acoustics[1] & 0xf;=0A=
>> +		break;=0A=
>> +	default:=0A=
>> +		return -EINVAL;=0A=
>=0A=
> This will never happen and, if it does, would indicate a bug, not invalid=
 input.=0A=
> I kind of dislike dead code; it just bloats the kernel. Please either use=
=0A=
> default: for or together with case 2:, or make it if/else.=0A=
>=0A=
=0A=
Will combine default and case 2.=0A=
=0A=
>> +	}=0A=
>> +=0A=
>> +	if (val & 0x8)=0A=
>> +		return sprintf(buf, "%d\n", ad7475_st_map[val & 0x7]);=0A=
>> +	else=0A=
>> +		return sprintf(buf, "0\n");=0A=
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
>=0A=
> Is this correct ? It associates=0A=
> 	temp1_smoothing -> remote 1=0A=
> 	temp2_smoothing -> remote 2=0A=
> 	temp3_smoothing -> local=0A=
=0A=
Yes=0A=
=0A=
> which, unless I am missing something, doesn't match temp1/2/3.=0A=
>=0A=
=0A=
So it should be=0A=
=0A=
temp1 -> Remote 1=0A=
temp2 -> Local=0A=
temp3 -> Remote 2=0A=
=0A=
I'll rework accordingly.=0A=
=0A=
>> +	default:=0A=
>> +		return -EINVAL;=0A=
>=0A=
> Same as above.=0A=
>=0A=
=0A=
Done.=0A=
=0A=
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
>> +	data->enh_acoustics[idx] &=3D ~(0xf << shift);=0A=
>> +	data->enh_acoustics[idx] |=3D (val << shift);=0A=
>> +=0A=
>> +	i2c_smbus_write_byte_data(client, reg, data->enh_acoustics[idx]);=0A=
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
>> @@ -1008,6 +1092,8 @@ static SENSOR_DEVICE_ATTR_2(temp1_crit, S_IRUGO | =
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
>> @@ -1024,6 +1110,8 @@ static SENSOR_DEVICE_ATTR_2(temp2_crit, S_IRUGO | =
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
>> @@ -1041,6 +1129,8 @@ static SENSOR_DEVICE_ATTR_2(temp3_crit, S_IRUGO | =
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
>> @@ -1125,6 +1215,7 @@ static struct attribute *adt7475_attrs[] =3D {=0A=
>>  	&sensor_dev_attr_temp1_auto_point2_temp.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp1_crit.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,=0A=
>> +	&sensor_dev_attr_temp1_smoothing.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_input.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_alarm.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_max.dev_attr.attr,=0A=
>> @@ -1134,6 +1225,7 @@ static struct attribute *adt7475_attrs[] =3D {=0A=
>>  	&sensor_dev_attr_temp2_auto_point2_temp.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_crit.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp2_crit_hyst.dev_attr.attr,=0A=
>> +	&sensor_dev_attr_temp2_smoothing.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_input.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_fault.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_alarm.dev_attr.attr,=0A=
>> @@ -1144,6 +1236,7 @@ static struct attribute *adt7475_attrs[] =3D {=0A=
>>  	&sensor_dev_attr_temp3_auto_point2_temp.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_crit.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_temp3_crit_hyst.dev_attr.attr,=0A=
>> +	&sensor_dev_attr_temp3_smoothing.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_fan1_input.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_fan1_min.dev_attr.attr,=0A=
>>  	&sensor_dev_attr_fan1_alarm.dev_attr.attr,=0A=
>>=0A=
>=0A=
>=0A=
=0A=
