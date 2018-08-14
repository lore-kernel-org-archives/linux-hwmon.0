Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.208]:44622 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728272AbeHNMU5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 08:20:57 -0400
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>,
        Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 2/2] hwmon: (adt7475) Remove some unnecessary checks
Date: Tue, 14 Aug 2018 09:34:30 +0000
Message-ID: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20180814091236.zubxfj32bedobr52@kili.mountain>
 <20180814091432.xhdmxd7aqbz2si4k@kili.mountain>
In-Reply-To: <20180814091432.xhdmxd7aqbz2si4k@kili.mountain>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Dan-san,

Thank you so much for this fix also.

Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

By the way I will do try to change the adt7475_read_word() to return the er=
ror correctly in near future.

Regards,
Ikegami

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, August 14, 2018 6:15 PM
> To: Jean Delvare; IKEGAMI Tokunori
> Cc: Guenter Roeck; linux-hwmon@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH 2/2] hwmon: (adt7475) Remove some unnecessary checks
>=20
> The adt7475_read_word() returns u16 values, so it's impossible for
> "ret" to be negative.  The check is harmless, but static checkers
> complain about it.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 16045149f3db..9d3da8ea38ba 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -1492,10 +1492,7 @@ static int adt7475_update_limits(struct
> i2c_client *client)
>  	for (i =3D 0; i < ADT7475_TACH_COUNT; i++) {
>  		if (i =3D=3D 3 && !data->has_fan4)
>  			continue;
> -		ret =3D adt7475_read_word(client, TACH_MIN_REG(i));
> -		if (ret < 0)
> -			return ret;
> -		data->tach[MIN][i] =3D ret;
> +		data->tach[MIN][i] =3D adt7475_read_word(client,
> TACH_MIN_REG(i));
>  	}
>=20
>  	for (i =3D 0; i < ADT7475_PWM_COUNT; i++) {
> @@ -1881,10 +1878,7 @@ static int adt7475_update_measure(struct device
> *dev)
>  	for (i =3D 0; i < ADT7475_TACH_COUNT; i++) {
>  		if (i =3D=3D 3 && !data->has_fan4)
>  			continue;
> -		ret =3D adt7475_read_word(client, TACH_REG(i));
> -		if (ret < 0)
> -			return ret;
> -		data->tach[INPUT][i] =3D ret;
> +		data->tach[INPUT][i] =3D adt7475_read_word(client,
> TACH_REG(i));
>  	}
>=20
>  	/* Updated by hw when in auto mode */
