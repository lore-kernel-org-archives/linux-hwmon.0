Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.3]:10060 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728272AbeHNMTD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 08:19:03 -0400
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>,
        Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 1/2] hwmon: (adt7475) Potential error pointer dereferences
Date: Tue, 14 Aug 2018 09:32:36 +0000
Message-ID: <TYAPR01MB2175286700961F9A378095A5DC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20180814091236.zubxfj32bedobr52@kili.mountain>
In-Reply-To: <20180814091236.zubxfj32bedobr52@kili.mountain>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Dan-san,

Thank you so much for the fixes.
But very sorry for the problem caused by my changes.

I have reviewed them and those look good.

Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

Regards,
Ikegami

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, August 14, 2018 6:13 PM
> To: Jean Delvare; IKEGAMI Tokunori
> Cc: Guenter Roeck; linux-hwmon@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH 1/2] hwmon: (adt7475) Potential error pointer
> dereferences
>=20
> The adt7475_update_device() function returns error pointers.  The
> problem is that in show_pwmfreq() we dereference it before the check.
> And then in pwm_use_point2_pwm_at_crit_show() there isn't a check at
> all.  I don't know if it's required, but it silences a static checker
> warning and it's doesn't hurt anything to check.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 90837f7c7d0f..16045149f3db 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -962,13 +962,14 @@ static ssize_t show_pwmfreq(struct device *dev,
> struct device_attribute *attr,
>  {
>  	struct adt7475_data *data =3D adt7475_update_device(dev);
>  	struct sensor_device_attribute_2 *sattr =3D
> to_sensor_dev_attr_2(attr);
> -	int i =3D clamp_val(data->range[sattr->index] & 0xf, 0,
> -			  ARRAY_SIZE(pwmfreq_table) - 1);
> +	int idx;
>=20
>  	if (IS_ERR(data))
>  		return PTR_ERR(data);
> +	idx =3D clamp_val(data->range[sattr->index] & 0xf, 0,
> +			ARRAY_SIZE(pwmfreq_table) - 1);
>=20
> -	return sprintf(buf, "%d\n", pwmfreq_table[i]);
> +	return sprintf(buf, "%d\n", pwmfreq_table[idx]);
>  }
>=20
>  static ssize_t set_pwmfreq(struct device *dev, struct device_attribute
> *attr,
> @@ -1004,6 +1005,10 @@ static ssize_t
> pwm_use_point2_pwm_at_crit_show(struct device *dev,
>  					char *buf)
>  {
>  	struct adt7475_data *data =3D adt7475_update_device(dev);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%d\n", !!(data->config4 &
> CONFIG4_MAXDUTY));
>  }
>=20
