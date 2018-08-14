Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.211]:2633 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728101AbeHNM6p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 08:58:45 -0400
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>,
        Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word() return
 errors
Date: Tue, 14 Aug 2018 10:12:10 +0000
Message-ID: <TYAPR01MB21755C257B33F6F6ADCDD47DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20180814100747.oovzd66gxmm755nr@kili.mountain>
In-Reply-To: <20180814100747.oovzd66gxmm755nr@kili.mountain>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Dan-san,

Thank you so much.
Looks good.

Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

Regards,
Ikegami

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, August 14, 2018 7:08 PM
> To: Jean Delvare; IKEGAMI Tokunori
> Cc: Guenter Roeck; linux-hwmon@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word() return
> errors
>=20
> The adt7475_read_word() function was meant to return negative error
> codes on failure.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: In my first patch I just removed the error handling in the callers
>=20
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 90837f7c7d0f..ec03359536aa 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -302,14 +302,18 @@ static inline u16 volt2reg(int channel, long volt,
> u8 bypass_attn)
>  	return clamp_val(reg, 0, 1023) & (0xff << 2);
>  }
>=20
> -static u16 adt7475_read_word(struct i2c_client *client, int reg)
> +static int adt7475_read_word(struct i2c_client *client, int reg)
>  {
> -	u16 val;
> +	int val1, val2;
>=20
> -	val =3D i2c_smbus_read_byte_data(client, reg);
> -	val |=3D (i2c_smbus_read_byte_data(client, reg + 1) << 8);
> +	val1 =3D i2c_smbus_read_byte_data(client, reg);
> +	if (val1 < 0)
> +		return val1;
> +	val2 =3D i2c_smbus_read_byte_data(client, reg + 1);
> +	if (val2 < 0)
> +		return val2;
>=20
> -	return val;
> +	return val1 | (val2 << 8);
>  }
>=20
>  static void adt7475_write_word(struct i2c_client *client, int reg, u16
> val)
