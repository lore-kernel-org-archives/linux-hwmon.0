Return-path: <peterhuewe@gmx.de>
Date: Thu, 23 Mar 2017 19:55:58 +0100
In-Reply-To: <20170323184339.GA7282@roeck-us.net>
References: <20170323130308.29166-1-peterhuewe@gmx.de> <20170323184339.GA7282@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] w83627ehf: Use hwmon_device_register_with_info and sensor groups
To: Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>,linux-hwmon@vger.kernel.org,linux-kernel@vger.kernel.org
From: Peter Huewe <peterhuewe@gmx.de>
Message-ID: <F9686831-756C-4F63-98FA-EF0AC71EB71F@gmx.de>
List-ID: <linux-hwmon@vger.kernel.org>






Am 23=2E M=C3=A4rz 2017 19:43:39 MEZ schrieb Guenter Roeck <linux@roeck-us=
=2Enet>:
>On Thu, Mar 23, 2017 at 02:03:04PM +0100, Peter Huewe wrote:
>> This patch replaces the old, deprecated call to hwmon_device_register
>> with the new hwmon_device_register_with_info and converts the whole
>> driver to the new hwmon interface using the hwmon_chip_info methods
>> and the attribute_group method=2E
>>=20
>> All standard attributes were converted to the corresponding
>> hwmon_chip_info methods=2E
>> For some functions a hwmon channel to device channel conversion had
>to
>> be performed, e=2Eg=2E hwmon_in_alarm has the info for alert_5 in chann=
el
>8=2E
>>=20
>> All non-standard attributes are converted to the attribute_group
>method,
>> by
>> - adding them statically to the attribute_group if they are available
>> for all variants of devices supported by this driver
>> - adding them at probe time to the attribute_group if the
>availability
>> is depending on the actual chip type=2E
>> The appropriate count of entries was reserved=2E
>>=20
>> As a pre-condition a reference to the sio_data structure was moved
>into
>> w83627ehf_data for easier retrieval of the information, since this is
>> much easier than trying to access the platform_data=2E
>>=20
>> The driver is now much more "checkpatch clean" than it used to be,
>but
>> still not completely=2E
>> The conversion saves about 20k in the resulting =2Eko
>>=20
>> Tested with a NCT6776F chip=2E
>>=20
>> v2:
>> - converted to proper is_visible methods
>> - applied minor feedback of v1
>>=20
>Nicely done=2E
>
>Couple of nitpicks:
>- Please no double empty lines (removed some, added some ;-)
Okay, interestingly checkpatch did not complain=2E

>- still a couple of c99 comments
I thought I had them removed, or atleast not introduced new ones

>- (later or intro patch): dem_request_region() in probe could help
> with cleanup, you could use the devm_ function for hwmon registration,
>  and drop the remove function entirely=2E
Yea makes sense, already thought about it, but then decided against it for=
 the first comversion=2E

>- if () return; else return; causes static analyzer hiccup=2E
Okay, which analyzer has trouble with that?
I ran Wolfram's ninja-check against it (sparse, smatch, coccinelle etc=2E=
=2E=2E) and didn't see any issues=2E
>  Please use if () return; return; (no else)
>  You do that already most of the time but not always=2E

Shall I respin one more time?
Or fixup in seperate patches?


>
>Thanks,
>Guenter
>
>> Signed-off-by: Peter Huewe <peterhuewe@gmx=2Ede>
>> ---
>>  drivers/hwmon/w83627ehf=2Ec | 1536
>+++++++++++++++++++++++----------------------
>>  1 file changed, 778 insertions(+), 758 deletions(-)
>>=20
>> diff --git a/drivers/hwmon/w83627ehf=2Ec b/drivers/hwmon/w83627ehf=2Ec
>> index ad68b6d9ff17=2E=2Ef2f33dd35fd4 100644
>> --- a/drivers/hwmon/w83627ehf=2Ec
>> +++ b/drivers/hwmon/w83627ehf=2Ec
>> @@ -1,6 +1,7 @@
>>  /*
>>   *  w83627ehf - Driver for the hardware monitoring functionality of
>>   *		the Winbond W83627EHF Super-I/O chip
>> + *  Copyright (C) 2017  Peter Huewe <peterhuewe@gmx=2Ede>
>>   *  Copyright (C) 2005-2012  Jean Delvare <jdelvare@suse=2Ede>
>>   *  Copyright (C) 2006  Yuan Mu (Winbond),
>>   *			Rudolf Marek <r=2Emarek@assembler=2Ecz>
>> @@ -426,6 +427,11 @@ static inline u8 in_to_reg(u32 val, u8 nr, const
>u16 *scale_in)
>>  /*
>>   * Data structures and manipulation thereof
>>   */
>> +struct w83627ehf_sio_data {
>> +	int sioreg;
>> +	enum kinds kind;
>> +};
>> +
>> =20
>>  struct w83627ehf_data {
>>  	int addr;	/* IO base of hw monitor block */
>> @@ -514,11 +520,7 @@ struct w83627ehf_data {
>>  	u8 fandiv1;
>>  	u8 fandiv2;
>>  #endif
>> -};
>> -
>> -struct w83627ehf_sio_data {
>> -	int sioreg;
>> -	enum kinds kind;
>> +	struct w83627ehf_sio_data *sio_data;
>>  };
>> =20
>>  /*
>> @@ -679,7 +681,7 @@ static void w83627ehf_write_fan_div(struct
>w83627ehf_data *data, int nr)
>>  static void w83627ehf_write_fan_div_common(struct device *dev,
>>  					   struct w83627ehf_data *data, int nr)
>>  {
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>> +	struct w83627ehf_sio_data *sio_data =3D data->sio_data;
>> =20
>>  	if (sio_data->kind =3D=3D nct6776)
>>  		; /* no dividers, do nothing */
>> @@ -730,11 +732,9 @@ static void w83627ehf_update_fan_div(struct
>w83627ehf_data *data)
>>  static void w83627ehf_update_fan_div_common(struct device *dev,
>>  					    struct w83627ehf_data *data)
>>  {
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>
>	struct w83627ehf_sio_data *sio_data =3D data->sio_data;
>
>Though I agree it doesn't really matter, since this code is going to be
>removed anyway, so feel free to ignore that one=2E Just had to make the
>point :-)
>
>> -
>> -	if (sio_data->kind =3D=3D nct6776)
>> +	if (data->sio_data->kind =3D=3D nct6776)
>>  		; /* no dividers, do nothing */
>> -	else if (sio_data->kind =3D=3D nct6775)
>> +	else if (data->sio_data->kind =3D=3D nct6775)
>>  		nct6775_update_fan_div(data);
>>  	else
>>  		w83627ehf_update_fan_div(data);
>> @@ -787,7 +787,7 @@ static void w83627ehf_update_pwm(struct
>w83627ehf_data *data)
>>  static void w83627ehf_update_pwm_common(struct device *dev,
>>  					struct w83627ehf_data *data)
>>  {
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>> +	struct w83627ehf_sio_data *sio_data =3D data->sio_data;
>> =20
>>  	if (sio_data->kind =3D=3D nct6775 || sio_data->kind =3D=3D nct6776)
>>  		nct6775_update_pwm(data);
>> @@ -798,8 +798,7 @@ static void w83627ehf_update_pwm_common(struct
>device *dev,
>>  static struct w83627ehf_data *w83627ehf_update_device(struct device
>*dev)
>>  {
>>  	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>> -
>> +	struct w83627ehf_sio_data *sio_data =3D data->sio_data;
>>  	int i;
>> =20
>>  	mutex_lock(&data->update_lock);
>> @@ -936,157 +935,15 @@ static struct w83627ehf_data
>*w83627ehf_update_device(struct device *dev)
>>  	return data;
>>  }
>> =20
>> -/*
>> - * Sysfs callback functions
>> - */
>> -#define show_in_reg(reg) \
>> -static ssize_t \
>> -show_##reg(struct device *dev, struct device_attribute *attr, \
>> -	   char *buf) \
>> -{ \
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev); \
>> -	struct sensor_device_attribute *sensor_attr =3D \
>> -		to_sensor_dev_attr(attr); \
>> -	int nr =3D sensor_attr->index; \
>> -	return sprintf(buf, "%ld\n", in_from_reg(data->reg[nr], nr, \
>> -		       data->scale_in)); \
>> -}
>> -show_in_reg(in)
>> -show_in_reg(in_min)
>> -show_in_reg(in_max)
>> -
>> -#define store_in_reg(REG, reg) \
>> -static ssize_t \
>> -store_in_##reg(struct device *dev, struct device_attribute *attr, \
>> -	       const char *buf, size_t count) \
>> -{ \
>> -	struct w83627ehf_data *data =3D dev_get_drvdata(dev); \
>> -	struct sensor_device_attribute *sensor_attr =3D \
>> -		to_sensor_dev_attr(attr); \
>> -	int nr =3D sensor_attr->index; \
>> -	unsigned long val; \
>> -	int err; \
>> -	err =3D kstrtoul(buf, 10, &val); \
>> -	if (err < 0) \
>> -		return err; \
>> -	mutex_lock(&data->update_lock); \
>> -	data->in_##reg[nr] =3D in_to_reg(val, nr, data->scale_in); \
>> -	w83627ehf_write_value(data, W83627EHF_REG_IN_##REG(nr), \
>> -			      data->in_##reg[nr]); \
>> -	mutex_unlock(&data->update_lock); \
>> -	return count; \
>> -}
>> -
>> -store_in_reg(MIN, min)
>> -store_in_reg(MAX, max)
>> -
>> -static ssize_t show_alarm(struct device *dev, struct
>device_attribute *attr,
>> -			  char *buf)
>> -{
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	return sprintf(buf, "%u\n", (data->alarms >> nr) & 0x01);
>> -}
>> -
>> -static struct sensor_device_attribute sda_in_input[] =3D {
>> -	SENSOR_ATTR(in0_input, S_IRUGO, show_in, NULL, 0),
>> -	SENSOR_ATTR(in1_input, S_IRUGO, show_in, NULL, 1),
>> -	SENSOR_ATTR(in2_input, S_IRUGO, show_in, NULL, 2),
>> -	SENSOR_ATTR(in3_input, S_IRUGO, show_in, NULL, 3),
>> -	SENSOR_ATTR(in4_input, S_IRUGO, show_in, NULL, 4),
>> -	SENSOR_ATTR(in5_input, S_IRUGO, show_in, NULL, 5),
>> -	SENSOR_ATTR(in6_input, S_IRUGO, show_in, NULL, 6),
>> -	SENSOR_ATTR(in7_input, S_IRUGO, show_in, NULL, 7),
>> -	SENSOR_ATTR(in8_input, S_IRUGO, show_in, NULL, 8),
>> -	SENSOR_ATTR(in9_input, S_IRUGO, show_in, NULL, 9),
>> -};
>> -
>> -static struct sensor_device_attribute sda_in_alarm[] =3D {
>> -	SENSOR_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0),
>> -	SENSOR_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1),
>> -	SENSOR_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2),
>> -	SENSOR_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3),
>> -	SENSOR_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8),
>> -	SENSOR_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 21),
>> -	SENSOR_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 20),
>> -	SENSOR_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL, 16),
>> -	SENSOR_ATTR(in8_alarm, S_IRUGO, show_alarm, NULL, 17),
>> -	SENSOR_ATTR(in9_alarm, S_IRUGO, show_alarm, NULL, 19),
>> -};
>> -
>> -static struct sensor_device_attribute sda_in_min[] =3D {
>> -	SENSOR_ATTR(in0_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>0),
>> -	SENSOR_ATTR(in1_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>1),
>> -	SENSOR_ATTR(in2_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>2),
>> -	SENSOR_ATTR(in3_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>3),
>> -	SENSOR_ATTR(in4_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>4),
>> -	SENSOR_ATTR(in5_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>5),
>> -	SENSOR_ATTR(in6_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>6),
>> -	SENSOR_ATTR(in7_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>7),
>> -	SENSOR_ATTR(in8_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>8),
>> -	SENSOR_ATTR(in9_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min,
>9),
>> -};
>> -
>> -static struct sensor_device_attribute sda_in_max[] =3D {
>> -	SENSOR_ATTR(in0_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>0),
>> -	SENSOR_ATTR(in1_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>1),
>> -	SENSOR_ATTR(in2_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>2),
>> -	SENSOR_ATTR(in3_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>3),
>> -	SENSOR_ATTR(in4_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>4),
>> -	SENSOR_ATTR(in5_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>5),
>> -	SENSOR_ATTR(in6_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>6),
>> -	SENSOR_ATTR(in7_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>7),
>> -	SENSOR_ATTR(in8_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>8),
>> -	SENSOR_ATTR(in9_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max,
>9),
>> -};
>> -
>> -static ssize_t
>> -show_fan(struct device *dev, struct device_attribute *attr, char
>*buf)
>> -{
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	return sprintf(buf, "%d\n", data->rpm[nr]);
>> -}
>> -
>> -static ssize_t
>> -show_fan_min(struct device *dev, struct device_attribute *attr, char
>*buf)
>> -{
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	return sprintf(buf, "%d\n",
>> -		       data->fan_from_reg_min(data->fan_min[nr],
>> -					      data->fan_div[nr]));
>> -}
>> -
>> -static ssize_t
>> -show_fan_div(struct device *dev, struct device_attribute *attr,
>> -	     char *buf)
>> -{
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	return sprintf(buf, "%u\n", div_from_reg(data->fan_div[nr]));
>> -}
>> =20
>> -static ssize_t
>> -store_fan_min(struct device *dev, struct device_attribute *attr,
>> -	      const char *buf, size_t count)
>> +static void
>> +store_fan_min(struct device *dev, u32 channel, unsigned long val)
>>  {
>>  	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	unsigned long val;
>> -	int err;
>> +	int nr =3D channel;
>>  	unsigned int reg;
>>  	u8 new_div;
>> =20
>> -	err =3D kstrtoul(buf, 10, &val);
>> -	if (err < 0)
>> -		return err;
>> -
>>  	mutex_lock(&data->update_lock);
>>  	if (!data->has_fan_div) {
>>  		/*
>> @@ -1161,336 +1018,8 @@ store_fan_min(struct device *dev, struct
>device_attribute *attr,
>>  			      data->fan_min[nr]);
>>  	mutex_unlock(&data->update_lock);
>> =20
>> -	return count;
>> -}
>> -
>> -static struct sensor_device_attribute sda_fan_input[] =3D {
>> -	SENSOR_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0),
>> -	SENSOR_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1),
>> -	SENSOR_ATTR(fan3_input, S_IRUGO, show_fan, NULL, 2),
>> -	SENSOR_ATTR(fan4_input, S_IRUGO, show_fan, NULL, 3),
>> -	SENSOR_ATTR(fan5_input, S_IRUGO, show_fan, NULL, 4),
>> -};
>> -
>> -static struct sensor_device_attribute sda_fan_alarm[] =3D {
>> -	SENSOR_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6),
>> -	SENSOR_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7),
>> -	SENSOR_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL, 11),
>> -	SENSOR_ATTR(fan4_alarm, S_IRUGO, show_alarm, NULL, 10),
>> -	SENSOR_ATTR(fan5_alarm, S_IRUGO, show_alarm, NULL, 23),
>> -};
>> -
>> -static struct sensor_device_attribute sda_fan_min[] =3D {
>> -	SENSOR_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan_min,
>> -		    store_fan_min, 0),
>> -	SENSOR_ATTR(fan2_min, S_IWUSR | S_IRUGO, show_fan_min,
>> -		    store_fan_min, 1),
>> -	SENSOR_ATTR(fan3_min, S_IWUSR | S_IRUGO, show_fan_min,
>> -		    store_fan_min, 2),
>> -	SENSOR_ATTR(fan4_min, S_IWUSR | S_IRUGO, show_fan_min,
>> -		    store_fan_min, 3),
>> -	SENSOR_ATTR(fan5_min, S_IWUSR | S_IRUGO, show_fan_min,
>> -		    store_fan_min, 4),
>> -};
>> -
>> -static struct sensor_device_attribute sda_fan_div[] =3D {
>> -	SENSOR_ATTR(fan1_div, S_IRUGO, show_fan_div, NULL, 0),
>> -	SENSOR_ATTR(fan2_div, S_IRUGO, show_fan_div, NULL, 1),
>> -	SENSOR_ATTR(fan3_div, S_IRUGO, show_fan_div, NULL, 2),
>> -	SENSOR_ATTR(fan4_div, S_IRUGO, show_fan_div, NULL, 3),
>> -	SENSOR_ATTR(fan5_div, S_IRUGO, show_fan_div, NULL, 4),
>> -};
>> -
>> -static ssize_t
>> -show_temp_label(struct device *dev, struct device_attribute *attr,
>char *buf)
>> -{
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
>> -}
>> -
>> -#define show_temp_reg(addr, reg) \
>> -static ssize_t \
>> -show_##reg(struct device *dev, struct device_attribute *attr, \
>> -	   char *buf) \
>> -{ \
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev); \
>> -	struct sensor_device_attribute *sensor_attr =3D \
>> -		to_sensor_dev_attr(attr); \
>> -	int nr =3D sensor_attr->index; \
>> -	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->reg[nr])); \
>> -}
>> -show_temp_reg(reg_temp, temp);
>> -show_temp_reg(reg_temp_over, temp_max);
>> -show_temp_reg(reg_temp_hyst, temp_max_hyst);
>> -
>> -#define store_temp_reg(addr, reg) \
>> -static ssize_t \
>> -store_##reg(struct device *dev, struct device_attribute *attr, \
>> -	    const char *buf, size_t count) \
>> -{ \
>> -	struct w83627ehf_data *data =3D dev_get_drvdata(dev); \
>> -	struct sensor_device_attribute *sensor_attr =3D \
>> -		to_sensor_dev_attr(attr); \
>> -	int nr =3D sensor_attr->index; \
>> -	int err; \
>> -	long val; \
>> -	err =3D kstrtol(buf, 10, &val); \
>> -	if (err < 0) \
>> -		return err; \
>> -	mutex_lock(&data->update_lock); \
>> -	data->reg[nr] =3D LM75_TEMP_TO_REG(val); \
>> -	w83627ehf_write_temp(data, data->addr[nr], data->reg[nr]); \
>> -	mutex_unlock(&data->update_lock); \
>> -	return count; \
>> -}
>> -store_temp_reg(reg_temp_over, temp_max);
>> -store_temp_reg(reg_temp_hyst, temp_max_hyst);
>> -
>> -static ssize_t
>> -show_temp_offset(struct device *dev, struct device_attribute *attr,
>char *buf)
>> -{
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -
>> -	return sprintf(buf, "%d\n",
>> -		       data->temp_offset[sensor_attr->index] * 1000);
>> -}
>> -
>> -static ssize_t
>> -store_temp_offset(struct device *dev, struct device_attribute *attr,
>> -		  const char *buf, size_t count)
>> -{
>> -	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	long val;
>> -	int err;
>> -
>> -	err =3D kstrtol(buf, 10, &val);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	val =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
>> -
>> -	mutex_lock(&data->update_lock);
>> -	data->temp_offset[nr] =3D val;
>> -	w83627ehf_write_value(data, W83627EHF_REG_TEMP_OFFSET[nr], val);
>> -	mutex_unlock(&data->update_lock);
>> -	return count;
>> -}
>> -
>> -static ssize_t
>> -show_temp_type(struct device *dev, struct device_attribute *attr,
>char *buf)
>> -{
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	return sprintf(buf, "%d\n", (int)data->temp_type[nr]);
>> -}
>> -
>> -static struct sensor_device_attribute sda_temp_input[] =3D {
>> -	SENSOR_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0),
>> -	SENSOR_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1),
>> -	SENSOR_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2),
>> -	SENSOR_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3),
>> -	SENSOR_ATTR(temp5_input, S_IRUGO, show_temp, NULL, 4),
>> -	SENSOR_ATTR(temp6_input, S_IRUGO, show_temp, NULL, 5),
>> -	SENSOR_ATTR(temp7_input, S_IRUGO, show_temp, NULL, 6),
>> -	SENSOR_ATTR(temp8_input, S_IRUGO, show_temp, NULL, 7),
>> -	SENSOR_ATTR(temp9_input, S_IRUGO, show_temp, NULL, 8),
>> -};
>> -
>> -static struct sensor_device_attribute sda_temp_label[] =3D {
>> -	SENSOR_ATTR(temp1_label, S_IRUGO, show_temp_label, NULL, 0),
>> -	SENSOR_ATTR(temp2_label, S_IRUGO, show_temp_label, NULL, 1),
>> -	SENSOR_ATTR(temp3_label, S_IRUGO, show_temp_label, NULL, 2),
>> -	SENSOR_ATTR(temp4_label, S_IRUGO, show_temp_label, NULL, 3),
>> -	SENSOR_ATTR(temp5_label, S_IRUGO, show_temp_label, NULL, 4),
>> -	SENSOR_ATTR(temp6_label, S_IRUGO, show_temp_label, NULL, 5),
>> -	SENSOR_ATTR(temp7_label, S_IRUGO, show_temp_label, NULL, 6),
>> -	SENSOR_ATTR(temp8_label, S_IRUGO, show_temp_label, NULL, 7),
>> -	SENSOR_ATTR(temp9_label, S_IRUGO, show_temp_label, NULL, 8),
>> -};
>> -
>> -static struct sensor_device_attribute sda_temp_max[] =3D {
>> -	SENSOR_ATTR(temp1_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 0),
>> -	SENSOR_ATTR(temp2_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 1),
>> -	SENSOR_ATTR(temp3_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 2),
>> -	SENSOR_ATTR(temp4_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 3),
>> -	SENSOR_ATTR(temp5_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 4),
>> -	SENSOR_ATTR(temp6_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 5),
>> -	SENSOR_ATTR(temp7_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 6),
>> -	SENSOR_ATTR(temp8_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 7),
>> -	SENSOR_ATTR(temp9_max, S_IRUGO | S_IWUSR, show_temp_max,
>> -		    store_temp_max, 8),
>> -};
>> -
>> -static struct sensor_device_attribute sda_temp_max_hyst[] =3D {
>> -	SENSOR_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 0),
>> -	SENSOR_ATTR(temp2_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 1),
>> -	SENSOR_ATTR(temp3_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 2),
>> -	SENSOR_ATTR(temp4_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 3),
>> -	SENSOR_ATTR(temp5_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 4),
>> -	SENSOR_ATTR(temp6_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 5),
>> -	SENSOR_ATTR(temp7_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 6),
>> -	SENSOR_ATTR(temp8_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 7),
>> -	SENSOR_ATTR(temp9_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
>> -		    store_temp_max_hyst, 8),
>> -};
>> -
>> -static struct sensor_device_attribute sda_temp_alarm[] =3D {
>> -	SENSOR_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4),
>> -	SENSOR_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 5),
>> -	SENSOR_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 13),
>> -};
>> -
>> -static struct sensor_device_attribute sda_temp_type[] =3D {
>> -	SENSOR_ATTR(temp1_type, S_IRUGO, show_temp_type, NULL, 0),
>> -	SENSOR_ATTR(temp2_type, S_IRUGO, show_temp_type, NULL, 1),
>> -	SENSOR_ATTR(temp3_type, S_IRUGO, show_temp_type, NULL, 2),
>> -};
>> -
>> -static struct sensor_device_attribute sda_temp_offset[] =3D {
>> -	SENSOR_ATTR(temp1_offset, S_IRUGO | S_IWUSR, show_temp_offset,
>> -		    store_temp_offset, 0),
>> -	SENSOR_ATTR(temp2_offset, S_IRUGO | S_IWUSR, show_temp_offset,
>> -		    store_temp_offset, 1),
>> -	SENSOR_ATTR(temp3_offset, S_IRUGO | S_IWUSR, show_temp_offset,
>> -		    store_temp_offset, 2),
>> -};
>> -
>> -#define show_pwm_reg(reg) \
>> -static ssize_t show_##reg(struct device *dev, struct
>device_attribute *attr, \
>> -			  char *buf) \
>> -{ \
>> -	struct w83627ehf_data *data =3D w83627ehf_update_device(dev); \
>> -	struct sensor_device_attribute *sensor_attr =3D \
>> -		to_sensor_dev_attr(attr); \
>> -	int nr =3D sensor_attr->index; \
>> -	return sprintf(buf, "%d\n", data->reg[nr]); \
>> -}
>> -
>> -show_pwm_reg(pwm_mode)
>> -show_pwm_reg(pwm_enable)
>> -show_pwm_reg(pwm)
>> -
>> -static ssize_t
>> -store_pwm_mode(struct device *dev, struct device_attribute *attr,
>> -			const char *buf, size_t count)
>> -{
>> -	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>> -	int nr =3D sensor_attr->index;
>> -	unsigned long val;
>> -	int err;
>> -	u16 reg;
>> -
>> -	err =3D kstrtoul(buf, 10, &val);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	if (val > 1)
>> -		return -EINVAL;
>> -
>> -	/* On NCT67766F, DC mode is only supported for pwm1 */
>> -	if (sio_data->kind =3D=3D nct6776 && nr && val !=3D 1)
>> -		return -EINVAL;
>> -
>> -	mutex_lock(&data->update_lock);
>> -	reg =3D w83627ehf_read_value(data, W83627EHF_REG_PWM_ENABLE[nr]);
>> -	data->pwm_mode[nr] =3D val;
>> -	reg &=3D ~(1 << W83627EHF_PWM_MODE_SHIFT[nr]);
>> -	if (!val)
>> -		reg |=3D 1 << W83627EHF_PWM_MODE_SHIFT[nr];
>> -	w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[nr], reg);
>> -	mutex_unlock(&data->update_lock);
>> -	return count;
>> -}
>> -
>> -static ssize_t
>> -store_pwm(struct device *dev, struct device_attribute *attr,
>> -			const char *buf, size_t count)
>> -{
>> -	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	unsigned long val;
>> -	int err;
>> -
>> -	err =3D kstrtoul(buf, 10, &val);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	val =3D clamp_val(val, 0, 255);
>> -
>> -	mutex_lock(&data->update_lock);
>> -	data->pwm[nr] =3D val;
>> -	w83627ehf_write_value(data, data->REG_PWM[nr], val);
>> -	mutex_unlock(&data->update_lock);
>> -	return count;
>> -}
>> -
>> -static ssize_t
>> -store_pwm_enable(struct device *dev, struct device_attribute *attr,
>> -			const char *buf, size_t count)
>> -{
>> -	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>> -	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>> -	int nr =3D sensor_attr->index;
>> -	unsigned long val;
>> -	int err;
>> -	u16 reg;
>> -
>> -	err =3D kstrtoul(buf, 10, &val);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	if (!val || (val > 4 && val !=3D data->pwm_enable_orig[nr]))
>> -		return -EINVAL;
>> -	/* SmartFan III mode is not supported on NCT6776F */
>> -	if (sio_data->kind =3D=3D nct6776 && val =3D=3D 4)
>> -		return -EINVAL;
>> -
>> -	mutex_lock(&data->update_lock);
>> -	data->pwm_enable[nr] =3D val;
>> -	if (sio_data->kind =3D=3D nct6775 || sio_data->kind =3D=3D nct6776) {
>> -		reg =3D w83627ehf_read_value(data,
>> -					   NCT6775_REG_FAN_MODE[nr]);
>> -		reg &=3D 0x0f;
>> -		reg |=3D (val - 1) << 4;
>> -		w83627ehf_write_value(data,
>> -				      NCT6775_REG_FAN_MODE[nr], reg);
>> -	} else {
>> -		reg =3D w83627ehf_read_value(data, W83627EHF_REG_PWM_ENABLE[nr]);
>> -		reg &=3D ~(0x03 << W83627EHF_PWM_ENABLE_SHIFT[nr]);
>> -		reg |=3D (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[nr];
>> -		w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[nr], reg);
>> -	}
>> -	mutex_unlock(&data->update_lock);
>> -	return count;
>>  }
>> =20
>> -
>>  #define show_tol_temp(reg) \
>>  static ssize_t show_##reg(struct device *dev, struct
>device_attribute *attr, \
>>  				char *buf) \
>> @@ -1533,7 +1062,7 @@ store_tolerance(struct device *dev, struct
>device_attribute *attr,
>>  			const char *buf, size_t count)
>>  {
>>  	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>> +	struct w83627ehf_sio_data *sio_data =3D data->sio_data;
>>  	struct sensor_device_attribute *sensor_attr =3D
>to_sensor_dev_attr(attr);
>>  	int nr =3D sensor_attr->index;
>>  	u16 reg;
>> @@ -1568,35 +1097,6 @@ store_tolerance(struct device *dev, struct
>device_attribute *attr,
>>  	return count;
>>  }
>> =20
>> -static struct sensor_device_attribute sda_pwm[] =3D {
>> -	SENSOR_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0),
>> -	SENSOR_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 1),
>> -	SENSOR_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 2),
>> -	SENSOR_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 3),
>> -};
>> -
>> -static struct sensor_device_attribute sda_pwm_mode[] =3D {
>> -	SENSOR_ATTR(pwm1_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
>> -		    store_pwm_mode, 0),
>> -	SENSOR_ATTR(pwm2_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
>> -		    store_pwm_mode, 1),
>> -	SENSOR_ATTR(pwm3_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
>> -		    store_pwm_mode, 2),
>> -	SENSOR_ATTR(pwm4_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
>> -		    store_pwm_mode, 3),
>> -};
>> -
>> -static struct sensor_device_attribute sda_pwm_enable[] =3D {
>> -	SENSOR_ATTR(pwm1_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
>> -		    store_pwm_enable, 0),
>> -	SENSOR_ATTR(pwm2_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
>> -		    store_pwm_enable, 1),
>> -	SENSOR_ATTR(pwm3_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
>> -		    store_pwm_enable, 2),
>> -	SENSOR_ATTR(pwm4_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
>> -		    store_pwm_enable, 3),
>> -};
>> -
>>  static struct sensor_device_attribute sda_target_temp[] =3D {
>>  	SENSOR_ATTR(pwm1_target, S_IWUSR | S_IRUGO, show_target_temp,
>>  		    store_target_temp, 0),
>> @@ -1693,15 +1193,6 @@ store_##reg(struct device *dev, struct
>device_attribute *attr, \
>> =20
>>  fan_time_functions(fan_stop_time, FAN_STOP_TIME)
>> =20
>> -static ssize_t name_show(struct device *dev, struct device_attribute
>*attr,
>> -			 char *buf)
>> -{
>> -	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -
>> -	return sprintf(buf, "%s\n", data->name);
>> -}
>> -static DEVICE_ATTR_RO(name);
>> -
>>  static struct sensor_device_attribute sda_sf3_arrays_fan4[] =3D {
>>  	SENSOR_ATTR(pwm4_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
>>  		    store_fan_stop_time, 3),
>> @@ -1724,21 +1215,18 @@ static struct sensor_device_attribute
>sda_sf3_arrays_fan3[] =3D {
>>  		    store_fan_stop_output, 2),
>>  };
>> =20
>> -static struct sensor_device_attribute sda_sf3_arrays[] =3D {
>> -	SENSOR_ATTR(pwm1_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
>> -		    store_fan_stop_time, 0),
>> -	SENSOR_ATTR(pwm2_stop_time, S_IWUSR | S_IRUGO, show_fan_stop_time,
>> -		    store_fan_stop_time, 1),
>> -	SENSOR_ATTR(pwm1_start_output, S_IWUSR | S_IRUGO,
>show_fan_start_output,
>> -		    store_fan_start_output, 0),
>> -	SENSOR_ATTR(pwm2_start_output, S_IWUSR | S_IRUGO,
>show_fan_start_output,
>> -		    store_fan_start_output, 1),
>> -	SENSOR_ATTR(pwm1_stop_output, S_IWUSR | S_IRUGO,
>show_fan_stop_output,
>> -		    store_fan_stop_output, 0),
>> -	SENSOR_ATTR(pwm2_stop_output, S_IWUSR | S_IRUGO,
>show_fan_stop_output,
>> -		    store_fan_stop_output, 1),
>> -};
>> -
>> +static SENSOR_DEVICE_ATTR(pwm1_stop_time, 0644, show_fan_stop_time,
>> +			  store_fan_stop_time, 0);
>> +static SENSOR_DEVICE_ATTR(pwm2_stop_time, 0644, show_fan_stop_time,
>> +			  store_fan_stop_time, 1);
>> +static SENSOR_DEVICE_ATTR(pwm1_start_output, 0644,
>show_fan_start_output,
>> +			  store_fan_start_output, 0);
>> +static SENSOR_DEVICE_ATTR(pwm2_start_output, 0644,
>show_fan_start_output,
>> +			  store_fan_start_output, 1);
>> +static SENSOR_DEVICE_ATTR(pwm1_stop_output, 0644,
>show_fan_stop_output,
>> +			  store_fan_stop_output, 0);
>> +static SENSOR_DEVICE_ATTR(pwm2_stop_output, 0644,
>show_fan_stop_output,
>> +			  store_fan_stop_output, 1);
>> =20
>>  /*
>>   * pwm1 and pwm3 don't support max and step settings on all chips=2E
>> @@ -1767,7 +1255,6 @@ cpu0_vid_show(struct device *dev, struct
>device_attribute *attr, char *buf)
>>  }
>>  static DEVICE_ATTR_RO(cpu0_vid);
>> =20
>> -
>>  /* Case open detection */
>> =20
>>  static ssize_t
>> @@ -1802,83 +1289,201 @@ clear_caseopen(struct device *dev, struct
>device_attribute *attr,
>>  	return count;
>>  }
>> =20
>> -static struct sensor_device_attribute_2 sda_caseopen[] =3D {
>> -	SENSOR_ATTR_2(intrusion0_alarm, S_IWUSR | S_IRUGO, show_caseopen,
>> -			clear_caseopen, 0x80, 0x10),
>> -	SENSOR_ATTR_2(intrusion1_alarm, S_IWUSR | S_IRUGO, show_caseopen,
>> -			clear_caseopen, 0x40, 0x40),
>> +static SENSOR_DEVICE_ATTR_2(intrusion0_alarm, 0644, show_caseopen,
>> +			    clear_caseopen, 0x80, 0x10);
>> +static SENSOR_DEVICE_ATTR_2(intrusion1_alarm, 0644, show_caseopen,
>> +			    clear_caseopen, 0x40, 0x40);
>> +
>> +static struct attribute *static_sensor_attrs[] =3D {
>> +	&sensor_dev_attr_pwm1_stop_time=2Edev_attr=2Eattr,
>> +	&sensor_dev_attr_pwm2_stop_time=2Edev_attr=2Eattr,
>> +	&sensor_dev_attr_pwm1_start_output=2Edev_attr=2Eattr,
>> +	&sensor_dev_attr_pwm2_start_output=2Edev_attr=2Eattr,
>> +	&sensor_dev_attr_pwm1_stop_output=2Edev_attr=2Eattr,
>> +	&sensor_dev_attr_pwm2_stop_output=2Edev_attr=2Eattr,
>> +	&sensor_dev_attr_intrusion0_alarm=2Edev_attr=2Eattr,
>> +	NULL,
>>  };
>> =20
>> -/*
>> - * Driver and device management
>> - */
>> +static struct attribute *other_sensor_attrs[] =3D {
>> +	&dev_attr_cpu0_vid=2Eattr,
>> +	&sensor_dev_attr_intrusion1_alarm=2Edev_attr=2Eattr,
>> +	NULL,
>> +};
>> +
>> +static struct attribute *sda_sf3_max_step_arrays_attrs[] =3D {
>> +	&sda_sf3_max_step_arrays[0]=2Edev_attr=2Eattr,
>> +	&sda_sf3_max_step_arrays[1]=2Edev_attr=2Eattr,
>> +	&sda_sf3_max_step_arrays[2]=2Edev_attr=2Eattr,
>> +	&sda_sf3_max_step_arrays[3]=2Edev_attr=2Eattr,
>> +	&sda_sf3_max_step_arrays[4]=2Edev_attr=2Eattr,
>> +	&sda_sf3_max_step_arrays[5]=2Edev_attr=2Eattr,
>> +	NULL,
>> +};
>> +
>> +static struct attribute *sda_sf3_arrays_fan3_attrs[] =3D {
>> +	&sda_sf3_arrays_fan3[0]=2Edev_attr=2Eattr,
>> +	&sda_sf3_arrays_fan3[1]=2Edev_attr=2Eattr,
>> +	&sda_sf3_arrays_fan3[2]=2Edev_attr=2Eattr,
>> +	NULL,
>> +};
>> +
>> +static struct attribute *sda_sf3_arrays_fan4_attrs[] =3D {
>> +	&sda_sf3_arrays_fan4[0]=2Edev_attr=2Eattr,
>> +	&sda_sf3_arrays_fan4[1]=2Edev_attr=2Eattr,
>> +	&sda_sf3_arrays_fan4[2]=2Edev_attr=2Eattr,
>> +	&sda_sf3_arrays_fan4[3]=2Edev_attr=2Eattr,
>> +	&sda_sf3_arrays_fan4[4]=2Edev_attr=2Eattr,
>> +	NULL,
>> +};
>> +
>> +static struct attribute *sda_target_temp_attrs[] =3D {
>> +	&sda_target_temp[0]=2Edev_attr=2Eattr,
>> +	&sda_target_temp[1]=2Edev_attr=2Eattr,
>> +	&sda_target_temp[2]=2Edev_attr=2Eattr,
>> +	&sda_target_temp[3]=2Edev_attr=2Eattr,
>> +	NULL,
>> +};
>> =20
>> -static void w83627ehf_device_remove_files(struct device *dev)
>> +static struct attribute *sda_tolerance_attrs[] =3D {
>> +	&sda_tolerance[0]=2Edev_attr=2Eattr,
>> +	&sda_tolerance[1]=2Edev_attr=2Eattr,
>> +	&sda_tolerance[2]=2Edev_attr=2Eattr,
>> +	&sda_tolerance[3]=2Edev_attr=2Eattr,
>> +	NULL,
>> +};
>> +
>> +static umode_t other_sensor_is_visible(struct kobject *kobj,
>> +				       struct attribute *attr, int idx)
>>  {
>> -	/*
>> -	 * some entries in the following arrays may not have been used in
>> -	 * device_create_file(), but device_remove_file() will ignore them
>> -	 */
>> -	int i;
>> +	struct device *dev =3D kobj_to_dev(kobj);
>>  	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> =20
>> -	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays); i++)
>> -		device_remove_file(dev, &sda_sf3_arrays[i]=2Edev_attr);
>> -	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_max_step_arrays); i++) {
>> -		struct sensor_device_attribute *attr =3D
>> -		  &sda_sf3_max_step_arrays[i];
>> -		if (data->REG_FAN_STEP_OUTPUT &&
>> -		    data->REG_FAN_STEP_OUTPUT[attr->index] !=3D 0xff)
>> -			device_remove_file(dev, &attr->dev_attr);
>> -	}
>> -	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays_fan3); i++)
>> -		device_remove_file(dev, &sda_sf3_arrays_fan3[i]=2Edev_attr);
>> -	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays_fan4); i++)
>> -		device_remove_file(dev, &sda_sf3_arrays_fan4[i]=2Edev_attr);
>> -	for (i =3D 0; i < data->in_num; i++) {
>> -		if ((i =3D=3D 6) && data->in6_skip)
>> -			continue;
>> -		device_remove_file(dev, &sda_in_input[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_in_alarm[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_in_min[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_in_max[i]=2Edev_attr);
>> -	}
>> -	for (i =3D 0; i < 5; i++) {
>> -		device_remove_file(dev, &sda_fan_input[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_fan_alarm[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_fan_div[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_fan_min[i]=2Edev_attr);
>> -	}
>> -	for (i =3D 0; i < data->pwm_num; i++) {
>> -		device_remove_file(dev, &sda_pwm[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_pwm_mode[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_pwm_enable[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_target_temp[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_tolerance[i]=2Edev_attr);
>> +	if (idx =3D=3D 0) { /*dev_attr_cpu0_vid*/
>> +		if (data->sio_data->kind =3D=3D w83627uhg)
>> +			return 0;
>> +		else
>> +			return 0444;
>>  	}
>> -	for (i =3D 0; i < NUM_REG_TEMP; i++) {
>> -		if (!(data->have_temp & (1 << i)))
>> -			continue;
>> -		device_remove_file(dev, &sda_temp_input[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_temp_label[i]=2Edev_attr);
>> -		if (i =3D=3D 2 && data->temp3_val_only)
>> -			continue;
>> -		device_remove_file(dev, &sda_temp_max[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_temp_max_hyst[i]=2Edev_attr);
>> -		if (i > 2)
>> -			continue;
>> -		device_remove_file(dev, &sda_temp_alarm[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_temp_type[i]=2Edev_attr);
>> -		device_remove_file(dev, &sda_temp_offset[i]=2Edev_attr);
>> +	if (idx =3D=3D 1) { /*intrusion1*/
>> +		if (data->sio_data->kind =3D=3D nct6776)
>> +			return 0644;
>>  	}
>> =20
>> -	device_remove_file(dev, &sda_caseopen[0]=2Edev_attr);
>> -	device_remove_file(dev, &sda_caseopen[1]=2Edev_attr);
>> +	return 0;
>> +}
>> +
>> +static umode_t sda_sf3_max_step_arrays_is_visible(struct kobject
>*kobj,
>> +						  struct attribute *attr,
>> +						  int idx)
>> +{
>> +	struct device *dev =3D kobj_to_dev(kobj);
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +	struct sensor_device_attribute *sattr =3D
>&sda_sf3_max_step_arrays[idx];
>> +
>> +	if (data->REG_FAN_STEP_OUTPUT &&
>> +	    data->REG_FAN_STEP_OUTPUT[sattr->index] !=3D 0xff)
>> +		return 0644;
>> +	else
>> +		return 0;
>> +}
>> +
>> +static umode_t sda_sf3_arrays_fan3_attrs_is_visible(struct kobject
>*kobj,
>> +						    struct attribute *attr,
>> +						    int idx)
>> +{
>> +	struct device *dev =3D kobj_to_dev(kobj);
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	if ((data->has_fan & (1 << 2)) && data->pwm_num >=3D 3)
>> +		return 0644;
>> +
>> +	return 0;
>> +}
>> +
>> +static umode_t sda_sf3_arrays_fan4_is_visible(struct kobject *kobj,
>> +					      struct attribute *attr, int idx)
>> +{
>> +	struct device *dev =3D kobj_to_dev(kobj);
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> =20
>> -	device_remove_file(dev, &dev_attr_name);
>> -	device_remove_file(dev, &dev_attr_cpu0_vid);
>> +	if ((data->has_fan & (1 << 3)) && data->pwm_num >=3D 4)
>> +		return 0644;
>> +
>> +	return 0;
>> +}
>> +
>> +static umode_t sda_tolerance_is_visible(struct kobject *kobj,
>> +					struct attribute *attr, int idx)
>> +{
>> +	struct device *dev =3D kobj_to_dev(kobj);
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	if ((data->has_fan & (1 << idx)) && (idx < data->pwm_num))
>> +		return 0644;
>> +	return 0;
>> +}
>> +
>> +static umode_t sda_target_temp_is_visible(struct kobject *kobj,
>> +					  struct attribute *attr, int idx)
>> +{
>> +	struct device *dev =3D kobj_to_dev(kobj);
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	if ((data->has_fan & (1 << idx)) && (idx < data->pwm_num))
>> +		return 0644;
>> +	return 0;
>>  }
>> =20
>> +static const struct attribute_group static_sensor_group =3D {
>> +	=2Eattrs =3D static_sensor_attrs,
>> +};
>> +
>> +static const struct attribute_group other_sensor_group =3D {
>> +	=2Eattrs =3D other_sensor_attrs,
>> +	=2Eis_visible =3D other_sensor_is_visible,
>> +};
>> +
>> +static const struct attribute_group sda_sf3_max_step_arrays_group =3D
>{
>> +	=2Eattrs =3D sda_sf3_max_step_arrays_attrs,
>> +	=2Eis_visible =3D sda_sf3_max_step_arrays_is_visible,
>> +};
>> +
>> +static const struct attribute_group sda_sf3_arrays_fan3_group =3D {
>> +	=2Eattrs =3D sda_sf3_arrays_fan3_attrs,
>> +	=2Eis_visible =3D sda_sf3_arrays_fan3_attrs_is_visible,
>> +};
>> +
>> +static const struct attribute_group sda_sf3_arrays_fan4_group =3D {
>> +	=2Eattrs =3D sda_sf3_arrays_fan4_attrs,
>> +	=2Eis_visible =3D sda_sf3_arrays_fan4_is_visible,
>> +};
>> +
>> +static const struct attribute_group sda_tolerance_group =3D {
>> +	=2Eattrs =3D sda_tolerance_attrs,
>> +	=2Eis_visible =3D sda_tolerance_is_visible,
>> +};
>> +
>> +static const struct attribute_group sda_target_temp_group =3D {
>> +	=2Eattrs =3D sda_target_temp_attrs,
>> +	=2Eis_visible =3D sda_target_temp_is_visible,
>> +};
>> +
>> +static const struct attribute_group *sensor_groups[] =3D {
>> +	&static_sensor_group,
>> +	&other_sensor_group,
>> +	&sda_sf3_max_step_arrays_group,
>> +	&sda_sf3_arrays_fan3_group,
>> +	&sda_sf3_arrays_fan4_group,
>> +	&sda_tolerance_group,
>> +	&sda_target_temp_group,
>> +	NULL,
>> +};
>> +
>> +/*
>> + * Driver and device management
>> + */
>> +
>>  /* Get the monitoring functions started */
>>  static inline void w83627ehf_init_device(struct w83627ehf_data
>*data,
>>  						   enum kinds kind)
>> @@ -2048,6 +1653,565 @@ w83627ehf_check_fan_inputs(const struct
>w83627ehf_sio_data *sio_data,
>>  	}
>>  }
>> =20
>> +static int w3627ehf_read_temp(struct device *dev, u32 attr, int
>channel,
>> +			      long *val)
>> +{
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	switch (attr) {
>> +	case hwmon_temp_input:
>> +		*val =3D LM75_TEMP_FROM_REG(data->temp[channel]);
>> +		return 0;
>> +	case hwmon_temp_max:
>> +		*val =3D LM75_TEMP_FROM_REG(data->temp_max[channel]);
>> +		return 0;
>> +	case hwmon_temp_max_hyst:
>> +		*val =3D LM75_TEMP_FROM_REG(data->temp_max_hyst[channel]);
>> +		return 0;
>> +	case hwmon_temp_type:
>> +		*val =3D data->temp_type[channel];
>> +		return 0;
>> +	case hwmon_temp_offset:
>> +		*val =3D data->temp_offset[channel] * 1000;
>> +		return 0;
>> +	case hwmon_temp_alarm:
>> +		switch (channel) {
>> +		case 0:
>> +			channel =3D 4;
>> +			break;
>> +		case 1:
>> +			channel =3D 5;
>> +			break;
>> +		case 2:
>> +			channel =3D 13;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		*val =3D ((data->alarms >> channel) & 0x01);
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int w3627ehf_write_temp(struct device *dev, u32 attr, int
>channel,
>> +			       long val)
>> +{
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	switch (attr) {
>> +	case hwmon_temp_offset:
>> +		val =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
>> +		mutex_lock(&data->update_lock);
>> +		data->temp_offset[channel] =3D val;
>> +		w83627ehf_write_value(data, W83627EHF_REG_TEMP_OFFSET[channel],
>> +				      val);
>> +		mutex_unlock(&data->update_lock);
>> +		break;
>> +	case hwmon_temp_max:
>> +		mutex_lock(&data->update_lock);
>> +		data->temp_max[channel] =3D LM75_TEMP_TO_REG(val);
>> +		w83627ehf_write_temp(data, data->reg_temp_over[channel],
>> +				     data->temp_max[channel]);
>> +		mutex_unlock(&data->update_lock);
>> +		break;
>> +	case hwmon_temp_max_hyst:
>> +		mutex_lock(&data->update_lock);
>> +		data->temp_max_hyst[channel] =3D LM75_TEMP_TO_REG(val);
>> +		w83627ehf_write_temp(data, data->reg_temp_hyst[channel],
>> +				     data->temp_max_hyst[channel]);
>> +		mutex_unlock(&data->update_lock);
>> +		break;
>> +
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static umode_t w3627ehf_temp_is_visible(const void *_data, u32 attr,
>> +					int channel)
>> +{
>> +	const struct w83627ehf_data *data =3D _data;
>> +
>> +	if (!(data->have_temp & (1 << channel)))
>> +		return 0;
>> +
>> +	switch (attr) {
>> +	case hwmon_temp_label:
>> +		if (data->temp_label)
>> +			return 0444;
>> +		return 0;
>> +	case hwmon_temp_input:
>> +		return 0444;
>> +	case hwmon_temp_max:
>> +		if (channel =3D=3D 2 && data->temp3_val_only)
>> +			return 0;
>> +		else if (data->reg_temp_over[channel])
>> +			return 0644;
>> +		else
>> +			return 0;
>> +	case hwmon_temp_max_hyst:
>> +		if (channel =3D=3D 2 && data->temp3_val_only)
>> +			return 0;
>> +		else if (data->reg_temp_hyst[channel])
>> +			return 0644;
>> +		else
>> +			return 0;
>> +	case hwmon_temp_alarm:
>> +	case hwmon_temp_type:
>> +		return 0444;
>> +	case hwmon_temp_offset:
>> +		if (data->have_temp_offset & (1 << channel))
>> +			return 0644;
>> +		return 0;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int w3627ehf_write_fan(struct device *dev, u32 attr, int
>channel,
>> +			      long val)
>> +{
>> +	switch (attr) {
>> +	case hwmon_fan_min:
>> +		store_fan_min(dev, channel, val);
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int w3627ehf_read_fan(struct device *dev, u32 attr, int
>channel,
>> +			     long *val)
>> +{
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	switch (attr) {
>> +	case hwmon_fan_alarm:
>> +		//the fan sensors have different offsets
>> +		switch (channel) {
>> +		case 0:
>> +			channel =3D 6;
>> +			break;
>> +		case 1:
>> +			channel =3D 7;
>> +			break;
>> +		case 2:
>> +			channel =3D 11;
>> +			break;
>> +		case 3:
>> +			channel =3D 10;
>> +			break;
>> +		case 4:
>> +			channel =3D 23;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		*val =3D ((data->alarms >> channel) & 0x01);
>> +		return 0;
>> +	case hwmon_fan_input:
>> +		*val =3D data->rpm[channel];
>> +		return 0;
>> +	case hwmon_fan_min:
>> +		*val =3D data->fan_from_reg_min(data->fan_min[channel],
>> +					      data->fan_div[channel]);
>> +		return 0;
>> +	case hwmon_fan_div:
>> +		*val =3D div_from_reg(data->fan_div[channel]);
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static umode_t w3627ehf_fan_is_visible(const void *_data, u32 attr,
>int channel)
>> +{
>> +	const struct w83627ehf_data *data =3D _data;
>> +
>> +	if (!(data->has_fan & (1 << channel)))
>> +		return 0;
>> +
>> +	switch (attr) {
>> +	case hwmon_fan_alarm:
>> +	case hwmon_fan_input:
>> +		return 0444;
>> +	case hwmon_fan_div:
>> +		if (data->sio_data->kind !=3D nct6776)
>> +			return 0444;
>> +		else
>> +			return 0;
>> +	case hwmon_fan_min:
>> +		return 0644;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int w3627ehf_write_pwm(struct device *dev, u32 attr, int
>channel,
>> +			      long val)
>> +{
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +	struct w83627ehf_sio_data *sio_data =3D data->sio_data;
>> +	u16 reg;
>> +
>> +	switch (attr) {
>> +	case hwmon_pwm_input:
>> +		val =3D clamp_val(val, 0, 255);
>> +		mutex_lock(&data->update_lock);
>> +		data->pwm[channel] =3D val;
>> +		w83627ehf_write_value(data, data->REG_PWM[channel], val);
>> +		mutex_unlock(&data->update_lock);
>> +		return 0;
>> +	case hwmon_pwm_mode:
>> +		if (val > 1)
>> +			return -EINVAL;
>> +
>> +		/* On NCT67766F, DC mode is only supported for pwm1 */
>> +		if (sio_data->kind =3D=3D nct6776 && channel && val !=3D 1)
>> +			return -EINVAL;
>> +
>> +		mutex_lock(&data->update_lock);
>> +		reg =3D w83627ehf_read_value(data,
>> +					   W83627EHF_REG_PWM_ENABLE[channel]);
>> +		data->pwm_mode[channel] =3D val;
>> +		reg &=3D ~(1 << W83627EHF_PWM_MODE_SHIFT[channel]);
>> +		if (!val)
>> +			reg |=3D 1 << W83627EHF_PWM_MODE_SHIFT[channel];
>> +		w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[channel],
>> +				      reg);
>> +		mutex_unlock(&data->update_lock);
>> +		return 0;
>> +	case hwmon_pwm_enable:
>> +		if (!val || (val > 4 && val !=3D data->pwm_enable_orig[channel]))
>> +			return -EINVAL;
>> +		/* SmartFan III mode is not supported on NCT6776F */
>> +		if (sio_data->kind =3D=3D nct6776 && val =3D=3D 4)
>> +			return -EINVAL;
>> +
>> +		mutex_lock(&data->update_lock);
>> +		data->pwm_enable[channel] =3D val;
>> +		if (sio_data->kind =3D=3D nct6775 || sio_data->kind =3D=3D nct6776) =
{
>> +			reg =3D w83627ehf_read_value(data,
>> +						   NCT6775_REG_FAN_MODE[channel]);
>> +			reg &=3D 0x0f;
>> +			reg |=3D (val - 1) << 4;
>> +			w83627ehf_write_value(data,
>> +					      NCT6775_REG_FAN_MODE[channel],
>> +					      reg);
>> +		} else {
>> +			reg =3D w83627ehf_read_value(data,
>> +						   W83627EHF_REG_PWM_ENABLE[channel]);
>> +			reg &=3D ~(0x03 << W83627EHF_PWM_ENABLE_SHIFT[channel]);
>> +			reg |=3D (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[channel];
>> +			w83627ehf_write_value(data,
>> +					      W83627EHF_REG_PWM_ENABLE[channel],
>> +					      reg);
>> +		}
>> +		mutex_unlock(&data->update_lock);
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int w3627ehf_write_input(struct device *dev, u32 attr, int
>channel,
>> +				long val)
>> +{
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	switch (attr) {
>> +	case hwmon_in_min:
>> +		mutex_lock(&data->update_lock);
>> +		data->in_min[channel] =3D in_to_reg(val, channel, data->scale_in);
>> +		w83627ehf_write_value(data, W83627EHF_REG_IN_MIN(channel),
>> +				      data->in_min[channel]);
>> +		mutex_unlock(&data->update_lock);
>> +		return 0;
>> +	case hwmon_in_max:
>> +		mutex_lock(&data->update_lock);
>> +		data->in_max[channel] =3D in_to_reg(val, channel, data->scale_in);
>> +		w83627ehf_write_value(data, W83627EHF_REG_IN_MAX(channel),
>> +				      data->in_max[channel]);
>> +		mutex_unlock(&data->update_lock);
>> +		return 0;
>> +	}
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int w3627ehf_read_pwm(struct device *dev, u32 attr, int
>channel,
>> +			     long *val)
>> +{
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	switch (attr) {
>> +	case hwmon_pwm_input:
>> +		*val =3D data->pwm[channel];
>> +		return 0;
>> +	case hwmon_pwm_mode:
>> +		*val =3D data->pwm_mode[channel];
>> +		return 0;
>> +	case hwmon_pwm_enable:
>> +		*val =3D data->pwm_enable[channel];
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static umode_t w3627ehf_pwm_is_visible(const void *_data, u32 attr,
>int channel)
>> +{
>> +	const struct w83627ehf_data *data =3D _data;
>> +
>> +	switch (attr) {
>> +	case hwmon_pwm_input:
>> +	case hwmon_pwm_mode:
>> +	case hwmon_pwm_enable:
>> +		if (data->has_fan & (1 << channel)) {
>> +			if (channel < data->pwm_num)
>> +				return 0644;
>> +		}
>> +		return 0;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int w3627ehf_read_input(struct device *dev, u32 attr, int
>channel,
>> +			       long *val)
>> +{
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	switch (attr) {
>> +	case hwmon_in_input:
>> +		*val =3D in_from_reg(data->in[channel], channel, data->scale_in);
>> +		return 0;
>> +	case hwmon_in_min:
>> +		*val =3D in_from_reg(data->in_min[channel], channel,
>> +				   data->scale_in);
>> +		return 0;
>> +	case hwmon_in_max:
>> +		*val =3D in_from_reg(data->in_max[channel], channel,
>> +				   data->scale_in);
>> +		return 0;
>> +	case hwmon_in_alarm:
>> +		switch (channel) {
>> +		case 0:
>> +			channel =3D 0;
>> +			break;
>> +		case 1:
>> +			channel =3D 1;
>> +			break;
>> +		case 2:
>> +			channel =3D 2;
>> +			break;
>> +		case 3:
>> +			channel =3D 3;
>> +			break;
>> +		case 4:
>> +			channel =3D 8;
>> +			break;
>> +		case 5:
>> +			channel =3D 21;
>> +			break;
>> +		case 6:
>> +			channel =3D 20;
>> +			break;
>> +		case 7:
>> +			channel =3D 16;
>> +			break;
>> +		case 8:
>> +			channel =3D 17;
>> +			break;
>> +		case 9:
>> +			channel =3D 19;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		*val =3D ((data->alarms >> channel) & 0x01);
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static umode_t w3627ehf_input_is_visible(const void *_data, u32
>attr,
>> +					 int channel)
>> +{
>> +	const struct w83627ehf_data *data =3D _data;
>> +
>> +	//skip channel 6 if requested
>> +	if ((channel =3D=3D 6) && data->in6_skip)
>> +		return 0;
>> +
>> +	switch (attr) {
>> +	case hwmon_in_input:
>> +	case hwmon_in_alarm:
>> +		return 0444;
>> +	case hwmon_in_min:
>> +	case hwmon_in_max:
>> +		return 0644;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static int w3627ehf_read_string(struct device *dev,
>> +				enum hwmon_sensor_types type, u32 attr,
>> +				int channel, const char **buf)
>> +{
>> +	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> +
>> +	w83627ehf_update_device(dev);
>> +	if ((type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_label) ||
>> +	    (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_label)) {
>> +		*buf =3D data->temp_label[data->temp_src[channel]];
>> +		return 0;
>> +	}
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int w3627ehf_read(struct device *dev, enum hwmon_sensor_types
>type,
>> +			 u32 attr, int channel, long *val)
>> +{
>> +	w83627ehf_update_device(dev);
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		return w3627ehf_read_fan(dev, attr, channel, val);
>> +	case hwmon_temp:
>> +		return w3627ehf_read_temp(dev, attr, channel, val);
>> +	case hwmon_in:
>> +		return w3627ehf_read_input(dev, attr, channel, val);
>> +	case hwmon_pwm:
>> +		return w3627ehf_read_pwm(dev, attr, channel, val);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int w3627ehf_write(struct device *dev, enum
>hwmon_sensor_types type,
>> +			  u32 attr, int channel, long val)
>> +{
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		return w3627ehf_write_fan(dev, attr, channel, val);
>> +	case hwmon_in:
>> +		return w3627ehf_write_input(dev, attr, channel, val);
>> +	case hwmon_pwm:
>> +		return w3627ehf_write_pwm(dev, attr, channel, val);
>> +	case hwmon_temp:
>> +		return w3627ehf_write_temp(dev, attr, channel, val);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static umode_t w3627ehf_is_visible(const void *data,
>> +				   enum hwmon_sensor_types type, u32 attr,
>> +				   int channel)
>> +{
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		return w3627ehf_fan_is_visible(data, attr, channel);
>> +	case hwmon_pwm:
>> +		return w3627ehf_pwm_is_visible(data, attr, channel);
>> +	case hwmon_in:
>> +		return w3627ehf_input_is_visible(data, attr, channel);
>> +	case hwmon_temp:
>> +		return w3627ehf_temp_is_visible(data, attr, channel);
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static const u32 w3627ehf_temp_config[] =3D {
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST |
>> +	    HWMON_T_ALARM | HWMON_T_TYPE | HWMON_T_OFFSET,
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST |
>> +	    HWMON_T_ALARM | HWMON_T_TYPE | HWMON_T_OFFSET,
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST |
>> +	    HWMON_T_ALARM | HWMON_T_TYPE | HWMON_T_OFFSET,
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
>> +	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
>> +	0
>> +};
>> +
>> +static const u32 w3627ehf_fan_config[] =3D {
>> +	HWMON_F_INPUT | HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_MIN,
>> +	HWMON_F_INPUT | HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_MIN,
>> +	HWMON_F_INPUT | HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_MIN,
>> +	HWMON_F_INPUT | HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_MIN,
>> +	HWMON_F_INPUT | HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_MIN,
>> +	0
>> +};
>> +
>> +static const u32 w3627ehf_pwm_config[] =3D {
>> +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE | HWMON_PWM_MODE,
>> +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE | HWMON_PWM_MODE,
>> +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE | HWMON_PWM_MODE,
>> +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE | HWMON_PWM_MODE,
>> +	0
>> +};
>> +
>> +static const u32 w3627ehf_input_config[] =3D {
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
>> +	0
>> +};
>> +
>> +static const struct hwmon_channel_info w3627ehf_temp =3D {
>> +	=2Etype =3D hwmon_temp,
>> +	=2Econfig =3D w3627ehf_temp_config,
>> +};
>> +
>> +static const struct hwmon_channel_info w3627ehf_fan =3D {
>> +	=2Etype =3D hwmon_fan,
>> +	=2Econfig =3D w3627ehf_fan_config,
>> +};
>> +
>> +static const struct hwmon_channel_info w3627ehf_pwm =3D {
>> +	=2Etype =3D hwmon_pwm,
>> +	=2Econfig =3D w3627ehf_pwm_config,
>> +};
>> +
>> +static const struct hwmon_channel_info w3627ehf_input =3D {
>> +	=2Etype =3D hwmon_in,
>> +	=2Econfig =3D w3627ehf_input_config,
>> +};
>> +
>> +static const struct hwmon_ops w3627ehf_hwmon_ops =3D {
>> +	=2Eis_visible =3D w3627ehf_is_visible,
>> +	=2Eread =3D w3627ehf_read,
>> +	=2Eread_string =3D w3627ehf_read_string,
>> +	=2Ewrite =3D w3627ehf_write,
>> +};
>> +
>> +static const struct hwmon_channel_info *w3627ehf_info[] =3D {
>> +	&w3627ehf_temp,
>> +	&w3627ehf_fan,
>> +	&w3627ehf_pwm,
>> +	&w3627ehf_input,
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_chip_info w83627ehf_chip_info =3D {
>> +	=2Eops =3D &w3627ehf_hwmon_ops,
>> +	=2Einfo =3D w3627ehf_info,
>> +};
>> +
>>  static int w83627ehf_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev =3D &pdev->dev;
>> @@ -2073,6 +2237,7 @@ static int w83627ehf_probe(struct
>platform_device *pdev)
>>  		goto exit_release;
>>  	}
>> =20
>> +	data->sio_data =3D sio_data;
>>  	data->addr =3D res->start;
>>  	mutex_init(&data->lock);
>>  	mutex_init(&data->update_lock);
>> @@ -2369,11 +2534,6 @@ static int w83627ehf_probe(struct
>platform_device *pdev)
>>  		 */
>>  		superio_select(sio_data->sioreg, W83667HG_LD_VID);
>>  		data->vid =3D superio_inb(sio_data->sioreg, 0xe3);
>> -		err =3D device_create_file(dev, &dev_attr_cpu0_vid);
>> -		if (err) {
>> -			superio_exit(sio_data->sioreg);
>> -			goto exit_release;
>> -		}
>>  	} else if (sio_data->kind !=3D w83627uhg) {
>>  		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
>>  		if (superio_inb(sio_data->sioreg, SIO_REG_VID_CTRL) & 0x80) {
>> @@ -2408,11 +2568,6 @@ static int w83627ehf_probe(struct
>platform_device *pdev)
>>  			if (sio_data->kind =3D=3D w83627ehf) /* 6 VID pins only */
>>  				data->vid &=3D 0x3f;
>> =20
>> -			err =3D device_create_file(dev, &dev_attr_cpu0_vid);
>> -			if (err) {
>> -				superio_exit(sio_data->sioreg);
>> -				goto exit_release;
>> -			}
>>  		} else {
>>  			dev_info(dev,
>>  				 "VID pins in output mode, CPU VID not available\n");
>> @@ -2446,151 +2601,17 @@ static int w83627ehf_probe(struct
>platform_device *pdev)
>>  	for (i =3D 0; i < data->pwm_num; i++)
>>  		data->pwm_enable_orig[i] =3D data->pwm_enable[i];
>> =20
>> -	/* Register sysfs hooks */
>> -	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays); i++) {
>> -		err =3D device_create_file(dev, &sda_sf3_arrays[i]=2Edev_attr);
>> -		if (err)
>> -			goto exit_remove;
>> -	}
>> -
>> -	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_max_step_arrays); i++) {
>> -		struct sensor_device_attribute *attr =3D
>> -		  &sda_sf3_max_step_arrays[i];
>> -		if (data->REG_FAN_STEP_OUTPUT &&
>> -		    data->REG_FAN_STEP_OUTPUT[attr->index] !=3D 0xff) {
>> -			err =3D device_create_file(dev, &attr->dev_attr);
>> -			if (err)
>> -				goto exit_remove;
>> -		}
>> -	}
>> -	/* if fan3 and fan4 are enabled create the sf3 files for them */
>> -	if ((data->has_fan & (1 << 2)) && data->pwm_num >=3D 3)
>> -		for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays_fan3); i++) {
>> -			err =3D device_create_file(dev,
>> -					&sda_sf3_arrays_fan3[i]=2Edev_attr);
>> -			if (err)
>> -				goto exit_remove;
>> -		}
>> -	if ((data->has_fan & (1 << 3)) && data->pwm_num >=3D 4)
>> -		for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays_fan4); i++) {
>> -			err =3D device_create_file(dev,
>> -					&sda_sf3_arrays_fan4[i]=2Edev_attr);
>> -			if (err)
>> -				goto exit_remove;
>> -		}
>> -
>> -	for (i =3D 0; i < data->in_num; i++) {
>> -		if ((i =3D=3D 6) && data->in6_skip)
>> -			continue;
>> -		if ((err =3D device_create_file(dev, &sda_in_input[i]=2Edev_attr))
>> -			|| (err =3D device_create_file(dev,
>> -				&sda_in_alarm[i]=2Edev_attr))
>> -			|| (err =3D device_create_file(dev,
>> -				&sda_in_min[i]=2Edev_attr))
>> -			|| (err =3D device_create_file(dev,
>> -				&sda_in_max[i]=2Edev_attr)))
>> -			goto exit_remove;
>> -	}
>> -
>> -	for (i =3D 0; i < 5; i++) {
>> -		if (data->has_fan & (1 << i)) {
>> -			if ((err =3D device_create_file(dev,
>> -					&sda_fan_input[i]=2Edev_attr))
>> -				|| (err =3D device_create_file(dev,
>> -					&sda_fan_alarm[i]=2Edev_attr)))
>> -				goto exit_remove;
>> -			if (sio_data->kind !=3D nct6776) {
>> -				err =3D device_create_file(dev,
>> -						&sda_fan_div[i]=2Edev_attr);
>> -				if (err)
>> -					goto exit_remove;
>> -			}
>> -			if (data->has_fan_min & (1 << i)) {
>> -				err =3D device_create_file(dev,
>> -						&sda_fan_min[i]=2Edev_attr);
>> -				if (err)
>> -					goto exit_remove;
>> -			}
>> -			if (i < data->pwm_num &&
>> -				((err =3D device_create_file(dev,
>> -					&sda_pwm[i]=2Edev_attr))
>> -				|| (err =3D device_create_file(dev,
>> -					&sda_pwm_mode[i]=2Edev_attr))
>> -				|| (err =3D device_create_file(dev,
>> -					&sda_pwm_enable[i]=2Edev_attr))
>> -				|| (err =3D device_create_file(dev,
>> -					&sda_target_temp[i]=2Edev_attr))
>> -				|| (err =3D device_create_file(dev,
>> -					&sda_tolerance[i]=2Edev_attr))))
>> -				goto exit_remove;
>> -		}
>> -	}
>> -
>> -	for (i =3D 0; i < NUM_REG_TEMP; i++) {
>> -		if (!(data->have_temp & (1 << i)))
>> -			continue;
>> -		err =3D device_create_file(dev, &sda_temp_input[i]=2Edev_attr);
>> -		if (err)
>> -			goto exit_remove;
>> -		if (data->temp_label) {
>> -			err =3D device_create_file(dev,
>> -						 &sda_temp_label[i]=2Edev_attr);
>> -			if (err)
>> -				goto exit_remove;
>> -		}
>> -		if (i =3D=3D 2 && data->temp3_val_only)
>> -			continue;
>> -		if (data->reg_temp_over[i]) {
>> -			err =3D device_create_file(dev,
>> -				&sda_temp_max[i]=2Edev_attr);
>> -			if (err)
>> -				goto exit_remove;
>> -		}
>> -		if (data->reg_temp_hyst[i]) {
>> -			err =3D device_create_file(dev,
>> -				&sda_temp_max_hyst[i]=2Edev_attr);
>> -			if (err)
>> -				goto exit_remove;
>> -		}
>> -		if (i > 2)
>> -			continue;
>> -		if ((err =3D device_create_file(dev,
>> -				&sda_temp_alarm[i]=2Edev_attr))
>> -			|| (err =3D device_create_file(dev,
>> -				&sda_temp_type[i]=2Edev_attr)))
>> -			goto exit_remove;
>> -		if (data->have_temp_offset & (1 << i)) {
>> -			err =3D device_create_file(dev,
>> -						 &sda_temp_offset[i]=2Edev_attr);
>> -			if (err)
>> -				goto exit_remove;
>> -		}
>> -	}
>> -
>> -	err =3D device_create_file(dev, &sda_caseopen[0]=2Edev_attr);
>> -	if (err)
>> -		goto exit_remove;
>> -
>> -	if (sio_data->kind =3D=3D nct6776) {
>> -		err =3D device_create_file(dev, &sda_caseopen[1]=2Edev_attr);
>> -		if (err)
>> -			goto exit_remove;
>> -	}
>> -
>> -	err =3D device_create_file(dev, &dev_attr_name);
>> -	if (err)
>> -		goto exit_remove;
>> -
>> -	data->hwmon_dev =3D hwmon_device_register(dev);
>> +	data->hwmon_dev =3D hwmon_device_register_with_info(dev, data->name,
>> +							  data,
>> +							  &w83627ehf_chip_info,
>> +							  sensor_groups);
>>  	if (IS_ERR(data->hwmon_dev)) {
>>  		err =3D PTR_ERR(data->hwmon_dev);
>> -		goto exit_remove;
>> +		goto exit_release;
>>  	}
>> =20
>>  	return 0;
>> =20
>> -exit_remove:
>> -	w83627ehf_device_remove_files(dev);
>>  exit_release:
>>  	release_region(res->start, IOREGION_LENGTH);
>>  exit:
>> @@ -2602,7 +2623,6 @@ static int w83627ehf_remove(struct
>platform_device *pdev)
>>  	struct w83627ehf_data *data =3D platform_get_drvdata(pdev);
>> =20
>>  	hwmon_device_unregister(data->hwmon_dev);
>> -	w83627ehf_device_remove_files(&pdev->dev);
>>  	release_region(data->addr, IOREGION_LENGTH);
>> =20
>>  	return 0;
>> @@ -2612,7 +2632,7 @@ static int w83627ehf_remove(struct
>platform_device *pdev)
>>  static int w83627ehf_suspend(struct device *dev)
>>  {
>>  	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>> +	struct w83627ehf_sio_data *sio_data =3D data->sio_data;
>> =20
>>  	mutex_lock(&data->update_lock);
>>  	data->vbat =3D w83627ehf_read_value(data, W83627EHF_REG_VBAT);
>> @@ -2628,7 +2648,7 @@ static int w83627ehf_suspend(struct device
>*dev)
>>  static int w83627ehf_resume(struct device *dev)
>>  {
>>  	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
>> -	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
>> +	struct w83627ehf_sio_data *sio_data =3D data->sio_data;
>>  	int i;
>> =20
>>  	mutex_lock(&data->update_lock);
>> --=20
>> 2=2E10=2E2
>>=20

--=20
Sent from my mobile
