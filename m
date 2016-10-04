Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Michael Wang
	<Michael.Wang@alliedtelesis.co.nz>
Subject: Re: [PATCHv1] hwmon: adm9240: handle temperature readings below 0
Date: Tue, 4 Oct 2016 21:09:10 +0000
Message-ID: <3c7c751bd9d24856ace5866ffb94060a@svr-chch-ex1.atlnz.lc>
References: <20161004040800.9689-1-chris.packham@alliedtelesis.co.nz>
 <20161004205359.GA29531@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 10/05/2016 09:54 AM, Guenter Roeck wrote:=0A=
> On Tue, Oct 04, 2016 at 05:08:00PM +1300, Chris Packham wrote:=0A=
>> Unlike the temperature thresholds the temperature data is a 9-bit signed=
=0A=
>> value. This allows and additional 0.5 degrees of precision on the=0A=
>> reading but means we can't rely on sign-extension to handle negative=0A=
>> values.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>  drivers/hwmon/adm9240.c | 19 +++++++++++++++++--=0A=
>>  1 file changed, 17 insertions(+), 2 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c=0A=
>> index 98114ce..6929b25 100644=0A=
>> --- a/drivers/hwmon/adm9240.c=0A=
>> +++ b/drivers/hwmon/adm9240.c=0A=
>> @@ -107,6 +107,21 @@ static inline s8 TEMP_TO_REG(long val)=0A=
>>  	return clamp_val(SCALE(val, 1, 1000), -40, 127);=0A=
>>  }=0A=
>>=0A=
>> +/* 8-bit signed temperature (from Thigh, Tlow etc) */=0A=
>> +static inline int TEMP_FROM_REG(s8 val)=0A=
>> +{=0A=
>> +	return val * 1000;=0A=
>> +}=0A=
>=0A=
> This does not any value; please drop.=0A=
>=0A=
=0A=
My intention was to make the code handling the 8-bit temperature =0A=
thresholds look the same as that handling the 9-bit temperature reading. =
=0A=
A moot point if we're moving in a new direction.=0A=
=0A=
>> +=0A=
>> +/* 9-bit signed temperature (from temperature data) */=0A=
>> +static inline int TEMP_FROM_DATA_REG(s16 val)=0A=
>=0A=
> Please don't use uppercase for functions.=0A=
>=0A=
=0A=
Noted. I was following suit with the existing TEMP_TO_REG above.=0A=
=0A=
>> +{=0A=
>> +	if (val > 255)=0A=
>> +		val -=3D 512;=0A=
>> +=0A=
>> +	return val * 500;=0A=
>=0A=
> At the surface, this is identical to=0A=
> 	return sign_extend(val, 9) * 500;=0A=
=0A=
I didn't know sign_extend() existed, thanks for pointing it out.=0A=
=0A=
> However, the real problem is around line 200, where the sign extension is=
=0A=
> attempted but fails. It would be better to drop the '/ 128'=0A=
> there and simplify the above code to=0A=
>=0A=
> 	return val / 128 * 500;=0A=
>=0A=
> With that, it might be better to just drop the new function and move the=
=0A=
> expression into the calling code.=0A=
=0A=
I'll give that a go and send a v2.=0A=
=0A=
>=0A=
> Of course, all that doesn't solve the real problem in this driver, which =
is=0A=
> that it ignores error codes from the smbus functions, but that is a diffe=
rent=0A=
> problem.=0A=
=0A=
Yeah I'd noted that too. This patch is actually a port of changes we've =0A=
made to a custom LM81 driver based on the original adm9240 driver which =0A=
included some error handling. I'll look at bringing more of that code in =
=0A=
for a future patch.=0A=
=0A=
>=0A=
> Thanks,=0A=
> Guenter=0A=
>=0A=
>> +}=0A=
>> +=0A=
>>  /* two fans, each with low fan speed limit */=0A=
>>  static inline unsigned int FAN_FROM_REG(u8 reg, u8 div)=0A=
>>  {=0A=
>> @@ -263,7 +278,7 @@ static ssize_t show_temp(struct device *dev, struct =
device_attribute *dummy,=0A=
>>  		char *buf)=0A=
>>  {=0A=
>>  	struct adm9240_data *data =3D adm9240_update_device(dev);=0A=
>> -	return sprintf(buf, "%d\n", data->temp * 500); /* 9-bit value */=0A=
>> +	return sprintf(buf, "%d\n", TEMP_FROM_DATA_REG(data->temp));=0A=
>>  }=0A=
>>=0A=
>>  static ssize_t show_max(struct device *dev, struct device_attribute *de=
vattr,=0A=
>> @@ -271,7 +286,7 @@ static ssize_t show_max(struct device *dev, struct d=
evice_attribute *devattr,=0A=
>>  {=0A=
>>  	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);=
=0A=
>>  	struct adm9240_data *data =3D adm9240_update_device(dev);=0A=
>> -	return sprintf(buf, "%d\n", data->temp_max[attr->index] * 1000);=0A=
>> +	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[attr->index])=
);=0A=
>>  }=0A=
>>=0A=
>>  static ssize_t set_max(struct device *dev, struct device_attribute *dev=
attr,=0A=
>> --=0A=
>> 2.10.0=0A=
>>=0A=
>> --=0A=
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" i=
n=0A=
>> the body of a message to majordomo@vger.kernel.org=0A=
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html=0A=
>=0A=
=0A=
