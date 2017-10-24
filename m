Return-Path: <vadimp@mellanox.com>
Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] hwmon: (max6621) Inverted if condition in max6621_read()
Date: Tue, 24 Oct 2017 10:03:56 +0000
Message-ID: <AM4PR05MB3330A4D411AD889C3E4AA581A2470@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <20171024094742.qpltjxlvzr25muje@mwanda>
In-Reply-To: <20171024094742.qpltjxlvzr25muje@mwanda>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>



> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, October 24, 2017 12:48 PM
> To: Jean Delvare <jdelvare@suse.com>; Vadim Pasternak
> <vadimp@mellanox.com>
> Cc: Guenter Roeck <linux@roeck-us.net>; linux-hwmon@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH] hwmon: (max6621) Inverted if condition in max6621_read()
>=20
> We intended to test for failure here but accidentally tested for success.=
  It
> means that we don't set "*val" to true and it means that if
> i2c_smbus_write_byte() does fail then we return success.
>=20
> Fixes: e7895864b0d7 ("hwmon: (max6621) Add support for Maxim MAX6621
> temperature sensor")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Vadim Pasternak <vadimp@mellanox.com>

>=20
> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c index
> 22079ec29660..35555f0eefb9 100644
> --- a/drivers/hwmon/max6621.c
> +++ b/drivers/hwmon/max6621.c
> @@ -296,7 +296,7 @@ max6621_read(struct device *dev, enum
> hwmon_sensor_types type, u32 attr,
>  			if (regval) {
>  				ret =3D i2c_smbus_write_byte(data->client,
>=20
> 	MAX6621_CLEAR_ALERT_REG);
> -				if (!ret)
> +				if (ret)
>  					return ret;
>  			}
>=20
