Return-path: <jdelvare@suse.de>
Date: Thu, 8 Dec 2016 15:33:49 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 06/17] hwmon: (adm1026) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161208153349.2ce80f2f@endymion>
In-Reply-To: <1480913740-5678-6-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-6-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

On Sun,  4 Dec 2016 20:55:29 -0800, Guenter Roeck wrote:
> Fix overflows seen when writing large values into voltage limit,
> temperature limit, temperature offset, and DAC attributes.
>=20
> Overflows are seen due to unbound multiplications and additions.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/adm1026.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
> index e67b9a50ac7c..b2a5d9e5c590 100644
> --- a/drivers/hwmon/adm1026.c
> +++ b/drivers/hwmon/adm1026.c
> @@ -197,8 +197,9 @@ static int adm1026_scaling[] =3D { /* .001 Volts */
>  	};
>  #define NEG12_OFFSET  16000
>  #define SCALE(val, from, to) (((val)*(to) + ((from)/2))/(from))
> -#define INS_TO_REG(n, val)  (clamp_val(SCALE(val, adm1026_scaling[n], 19=
2),\
> -	0, 255))
> +#define INS_TO_REG(n, val)	\
> +		SCALE(clamp_val(val, 0, 255 * adm1026_scaling[n] / 192), \
> +		      adm1026_scaling[n], 192)
>  #define INS_FROM_REG(n, val) (SCALE(val, 192, adm1026_scaling[n]))
> =20
>  /*
> @@ -215,11 +216,11 @@ static int adm1026_scaling[] =3D { /* .001 Volts */
>  #define DIV_TO_REG(val) ((val) >=3D 8 ? 3 : (val) >=3D 4 ? 2 : (val) >=
=3D 2 ? 1 : 0)
> =20
>  /* Temperature is reported in 1 degC increments */
> -#define TEMP_TO_REG(val) (clamp_val(((val) + ((val) < 0 ? -500 : 500)) \
> -					/ 1000, -127, 127))
> +#define TEMP_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, -128000, 12700=
0), \
> +					   1000)
>  #define TEMP_FROM_REG(val) ((val) * 1000)
> -#define OFFSET_TO_REG(val) (clamp_val(((val) + ((val) < 0 ? -500 : 500))=
 \
> -					  / 1000, -127, 127))
> +#define OFFSET_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127=
000), \
> +					     1000)

Sorry for nitpicking but the original code had -127 =C2=B0C as the negative
limit. You are changing it to -128 =C2=B0C without a justification. If it
matters, it should be at least documented in the commit message. If
not, it should be left as it was.

>  #define OFFSET_FROM_REG(val) ((val) * 1000)
> =20
>  #define PWM_TO_REG(val) (clamp_val(val, 0, 255))
> @@ -233,7 +234,8 @@ static int adm1026_scaling[] =3D { /* .001 Volts */
>   *   indicates that the DAC could be used to drive the fans, but in our
>   *   example board (Arima HDAMA) it isn't connected to the fans at all.
>   */
> -#define DAC_TO_REG(val) (clamp_val(((((val) * 255) + 500) / 2500), 0, 25=
5))
> +#define DAC_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, 0, 2500) * 255,=
 \
> +					  2500)
>  #define DAC_FROM_REG(val) (((val) * 2500) / 255)
> =20
>  /*
> @@ -593,7 +595,10 @@ static ssize_t set_in16_min(struct device *dev, stru=
ct device_attribute *attr,
>  		return err;
> =20
>  	mutex_lock(&data->update_lock);
> -	data->in_min[16] =3D INS_TO_REG(16, val + NEG12_OFFSET);
> +	data->in_min[16] =3D INS_TO_REG(16,
> +				      clamp_val(val, INT_MIN,
> +						INT_MAX - NEG12_OFFSET) +
> +				      NEG12_OFFSET);
>  	adm1026_write_value(client, ADM1026_REG_IN_MIN[16], data->in_min[16]);
>  	mutex_unlock(&data->update_lock);
>  	return count;
> @@ -618,7 +623,10 @@ static ssize_t set_in16_max(struct device *dev, stru=
ct device_attribute *attr,
>  		return err;
> =20
>  	mutex_lock(&data->update_lock);
> -	data->in_max[16] =3D INS_TO_REG(16, val+NEG12_OFFSET);
> +	data->in_max[16] =3D INS_TO_REG(16,
> +				      clamp_val(val, INT_MIN,
> +						INT_MAX - NEG12_OFFSET) +
> +				      NEG12_OFFSET);
>  	adm1026_write_value(client, ADM1026_REG_IN_MAX[16], data->in_max[16]);
>  	mutex_unlock(&data->update_lock);
>  	return count;

On these code paths, you end up calling clamp_val() twice. This could
certainly be avoided, but I'm too lazy to do the math ;-)

--=20
Jean Delvare
SUSE L3 Support
