Return-path: <jdelvare@suse.de>
Date: Fri, 9 Dec 2016 10:29:18 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 06/17] hwmon: (adm1026) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161209102918.689d5095@endymion>
In-Reply-To: <0c8198ed-492f-faa1-1610-69ef2b98dc5e@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-6-git-send-email-linux@roeck-us.net>
	<20161208153349.2ce80f2f@endymion>
	<0c8198ed-492f-faa1-1610-69ef2b98dc5e@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Thu, 8 Dec 2016 07:34:35 -0800, Guenter Roeck wrote:
> On 12/08/2016 06:33 AM, Jean Delvare wrote:
> > On Sun,  4 Dec 2016 20:55:29 -0800, Guenter Roeck wrote:
> >> @@ -215,11 +216,11 @@ static int adm1026_scaling[] =3D { /* .001 Volts=
 */
> >>  #define DIV_TO_REG(val) ((val) >=3D 8 ? 3 : (val) >=3D 4 ? 2 : (val) =
>=3D 2 ? 1 : 0)
> >>
> >>  /* Temperature is reported in 1 degC increments */
> >> -#define TEMP_TO_REG(val) (clamp_val(((val) + ((val) < 0 ? -500 : 500)=
) \
> >> -					/ 1000, -127, 127))
> >> +#define TEMP_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, -128000, 12=
7000), \
> >> +					   1000)
> >>  #define TEMP_FROM_REG(val) ((val) * 1000)
> >> -#define OFFSET_TO_REG(val) (clamp_val(((val) + ((val) < 0 ? -500 : 50=
0)) \
> >> -					  / 1000, -127, 127))
> >> +#define OFFSET_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, -128000, =
127000), \
> >> +					     1000)
> >
> > Sorry for nitpicking but the original code had -127 =C2=B0C as the nega=
tive
> > limit. You are changing it to -128 =C2=B0C without a justification. If =
it
> > matters, it should be at least documented in the commit message. If
> > not, it should be left as it was.
>
> I had seen -128 as value reported by the chip with one of my register dum=
ps,
> which messes up my module tests because it tries to rewrite the value it =
read
> into the attribute, and that fails. Also, the datasheet lists -128 degree=
s C
> as a valid register value.

OK, I understand.

> This is one of those philosophical questions, for which I don't have a re=
ally
> good answer. Should we clamp to the register limits or to the chip specif=
ication ?
> I tend to clamp to register limits, because I think that it should always=
 be possible
> to write back what was read, but we are highly inconsistent in the variou=
s drivers.
> Any opinion ?

I have noticed that inconsistency too. Given that we do not have
attributes to expose the limits to user-space, I consider it a nice
feature to clamp the requested limits to what the chip is actually
specified for. But I don't have a strong opinion on it either, and am
not going to spend time "fixing" all drivers not doing it. And you have
a point with being able to write back what was read, especially if the
power-on value isn't withing the specified limits.

> >> (...)
> >> @@ -593,7 +595,10 @@ static ssize_t set_in16_min(struct device *dev, s=
truct device_attribute *attr,
> >>  		return err;
> >>
> >>  	mutex_lock(&data->update_lock);
> >> -	data->in_min[16] =3D INS_TO_REG(16, val + NEG12_OFFSET);
> >> +	data->in_min[16] =3D INS_TO_REG(16,
> >> +				      clamp_val(val, INT_MIN,
> >> +						INT_MAX - NEG12_OFFSET) +
> >> +				      NEG12_OFFSET);
> >>  	adm1026_write_value(client, ADM1026_REG_IN_MIN[16], data->in_min[16]=
);
> >>  	mutex_unlock(&data->update_lock);
> >>  	return count;
> >> @@ -618,7 +623,10 @@ static ssize_t set_in16_max(struct device *dev, s=
truct device_attribute *attr,
> >>  		return err;
> >>
> >>  	mutex_lock(&data->update_lock);
> >> -	data->in_max[16] =3D INS_TO_REG(16, val+NEG12_OFFSET);
> >> +	data->in_max[16] =3D INS_TO_REG(16,
> >> +				      clamp_val(val, INT_MIN,
> >> +						INT_MAX - NEG12_OFFSET) +
> >> +				      NEG12_OFFSET);
> >>  	adm1026_write_value(client, ADM1026_REG_IN_MAX[16], data->in_max[16]=
);
> >>  	mutex_unlock(&data->update_lock);
> >>  	return count;
> >
> > On these code paths, you end up calling clamp_val() twice. This could
> > certainly be avoided, but I'm too lazy to do the math ;-)
> >
> I know. Problem here is that there are two overflows, one in the calling =
code
> (since it does arithmetic on the input value), and another one in INS_TO_=
REG().
> When I wrote this, I didn't have a good idea how to avoid the first overf=
low
> without a second clamp.
>=20
> One possibility would be to define INS_TO_REG_NOCLAMP(). Would that be wo=
rth it ?

No, don't bother. God only knows if there's any user left for this
driver ;-)

--=20
Jean Delvare
SUSE L3 Support
