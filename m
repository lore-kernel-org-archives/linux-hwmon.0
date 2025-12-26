Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075C9242D8B
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766782501; cv=none; b=tUhU+GsB3Dob/+LVe8z7WBNacIiJg0R97wqtQeIqO8bMVSsRgRRdJvGLfByGjt4YYZ1s2BKKo9MM5UlFiaQzf8A8J+nHGJxGmtW6k5hVCUk0SAqVaU8X2+317apuBcW+Fl5IZ2QffS0bUEw/oce1BzYctVC0+a5+bKopPgvBC+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766782501; c=relaxed/simple;
	bh=SS+H/NlSKMKI2oMezNMw7ib+NCfABH0940No+Fclzt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+R0JKz17VNo9Dbwob6AX+u0LMtF393vDuXEVX4LXb+qbdXPnwRVhqeUDQa6utyXrw/72AOw5MPPxI2qeQ6uo/iJv/cu5z/T5p/GAQ6hqYgTWV6No19UQBFi+16HE/Sq/WQjJxjynkG7I4rEs0ccFfOyvgOOjiSK1tM48R98868=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=C+giTcio; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="C+giTcio"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37bbb36c990so73756711fa.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 12:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1766782496; x=1767387296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ragmGVMFLc6qdX/4rreULe3hkJrTRFNYH9SJvQsbSQ8=;
        b=C+giTcio9q3hLzGn3LkK2JXJfKEVwZ8VgvUOsm5pl2DvtwwdhEWdFg+pCeA0R3kYhO
         JOlrvpXvsgfKevz5WLFG63Og25iPNWo+bhYAi0VdqXFeH9rvINNggNkozz25/6Uu9H7v
         74LUpDYtrnDsz7YrX7rBjsm0ZfKAhy1YJBWHRD8L4E4qC4qFXvASINTRX+vcr3cKb3CR
         qV51olP/R8f9ajCfQBASmVEG+lUwX8MWQNXU+sOnCHDtkn3cJzg9uifmD8EmMiPDPNCT
         lnYLF2k4mRnAMrwcyQjHPjYoY7RLA547RCCRzD+2DMBlYCxk9JxCgIQJlVwXXl0rHBll
         C/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766782496; x=1767387296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ragmGVMFLc6qdX/4rreULe3hkJrTRFNYH9SJvQsbSQ8=;
        b=A7ntd5uz3mQKh4ZOGYphOD3CWeDZehs60D3P/25oMFVY67FWZ2erQ/VH87+PL7V3c0
         JeSWmWUIxDg69kUiyfztA/HlM1pQnbMyfI8w8Bn0xCzhO5Es3/D3AkF1XR7n7vuumQrv
         DNxVsUWq+jOPwK1lCS2R572HaojlX25HELU2hYVclKPJVw4VDNWZXpHeGbcDp6cWzmyg
         woV+qxt5XZrZXIU+2fYnQy2nDes+ncrfx0zGrHkQqjHP1JQMlP4krNKwOeqxRY/UqeNQ
         FE+ZIE5Ptlu7BrHtvQYg9c06apSAjO4gAJzBzDot5XzS/HNf69BPYPGt9eCxJ3DlD9eS
         n/2Q==
X-Gm-Message-State: AOJu0YyHQWi4EGJ3O+Z+FKWO7SxfezUScF5mqAV+NzN0roGrwEdxfi+8
	Y/GjZI7IdPmAtbyizG5NpEfuzk2rxKfXNu/RWIc5uvauUYVxDYUYFzDivONijoWiFEQA7s7vFNR
	//irkBFgX617xLWgcikXQMl63DszNgvHBk+rej8fRL5deoh5DdVW6CQ==
X-Gm-Gg: AY/fxX4VLvTLbq8i1XxPX8EvZjdIXHMqf1bsx9KMocoXf6CnoQLE5gIldLyAziXYkVd
	FJdgqvpGzDcVDvcuLlq83WTEBmLA+Ss+C5KasK1pzvrWJOHlnGoJJPzMIm6P19GXAaQbkO3ovtJ
	YKU9WCITVguEAqIOKG4uhG8QhRFYsRCv1maCxSuhri6p69j7TtGOVy6X8I4TcCpVdU/PdI10Fva
	WXL+T0b8elBIotTANs0cqEnksTkndq4Nzt0XHPEP2dDtDdmlwxdaM6f6IDeLv+SaWegG8WITnwy
	xPFluLsS8ohcEXJ3PGs196fzR9ZB
X-Google-Smtp-Source: AGHT+IHMPIdy8NVGb0FS9n4j5ra2BuST4OT1zUylEGHAnvbX7KNSdA0qkHV2BHlNjDUrbmS/s8SlENASMB3iHd/1BCQ=
X-Received: by 2002:a05:651c:50f:b0:37e:6884:6756 with SMTP id
 38308e7fff4ca-3812081e6dbmr77109691fa.14.1766782496050; Fri, 26 Dec 2025
 12:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226203021.27244-1-yahoo@perenite.com>
In-Reply-To: <20251226203021.27244-1-yahoo@perenite.com>
From: Benoit Masson <yahoo@perenite.com>
Date: Fri, 26 Dec 2025 21:54:44 +0100
X-Gm-Features: AQt7F2qtZPDKNuyUCeUODw7L4vgUWWlAiPOA0B-rf_f85bhKQ5hZuIshUcMb2h8
Message-ID: <CAGHj7OJaSvSsr0z43phjs1YvL17xfJWesJFj0iQpdvi8=VXZhA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch is intended to be part of a series to help with support of
newer IT chipp which have new more dynamic options, and make the
review easier.

This patch is about making the number of:
 - temperature limit registers,
 - temperature offset registers, and
 - temperature-to-PWM mapping slots (per PWM bank)
configurable per chip, instead of hard-coded constants.

for all existing chips in the in-tree driver this patch does not
change behavior because you:
 - keep the old defaults (3 temp limits, 3 offsets, =E2=80=9C3+3=E2=80=9D P=
WM temp
mapping banks),
 - and only prepare per-chip fields without actually changing any
it87_devices[] initialisers yet.

Thanks
Benoit

On Fri, Dec 26, 2025 at 9:30=E2=80=AFPM benoit.masson <yahoo@perenite.com> =
wrote:
>
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> ---
>  drivers/hwmon/it87.c | 50 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e233aafa8856..f9eca0bc02bc 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -54,6 +54,7 @@
>  #include <linux/hwmon-vid.h>
>  #include <linux/err.h>
>  #include <linux/mutex.h>
> +#include <linux/minmax.h>
>  #include <linux/sysfs.h>
>  #include <linux/string.h>
>  #include <linux/dmi.h>
> @@ -279,8 +280,9 @@ static const u8 IT87_REG_AUTO_BASE[] =3D { 0x60, 0x68=
, 0x70, 0x78, 0xa0, 0xa8 };
>  #define NUM_VIN                        ARRAY_SIZE(IT87_REG_VIN)
>  #define NUM_VIN_LIMIT          8
>  #define NUM_TEMP               6
> -#define NUM_TEMP_OFFSET                ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
> -#define NUM_TEMP_LIMIT         3
> +#define IT87_TEMP_OFFSET_MAX   ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
> +#define IT87_TEMP_LIMIT_DEFAULT        3
> +#define IT87_TEMP_MAP_DEFAULT  3
>  #define NUM_FAN                        ARRAY_SIZE(IT87_REG_FAN)
>  #define NUM_FAN_DIV            3
>  #define NUM_PWM                        ARRAY_SIZE(IT87_REG_PWM)
> @@ -290,6 +292,9 @@ struct it87_devices {
>         const char *name;
>         const char * const model;
>         u32 features;
> +       u8 num_temp_limit;
> +       u8 num_temp_offset;
> +       u8 num_temp_map;
>         u8 peci_mask;
>         u8 old_peci_mask;
>         u8 smbus_bitmap;        /* SMBus enable bits in extra config regi=
ster */
> @@ -578,6 +583,9 @@ struct it87_data {
>         int sioaddr;
>         enum chips type;
>         u32 features;
> +       u8 num_temp_limit;
> +       u8 num_temp_offset;
> +       u8 num_temp_map;
>         u8 peci_mask;
>         u8 old_peci_mask;
>
> @@ -926,12 +934,13 @@ static struct it87_data *it87_update_device(struct =
device *dev)
>                         data->temp[i][0] =3D
>                                 it87_read_value(data, IT87_REG_TEMP(i));
>
> -                       if (has_temp_offset(data) && i < NUM_TEMP_OFFSET)
> +                       if (has_temp_offset(data) &&
> +                           i < data->num_temp_offset)
>                                 data->temp[i][3] =3D
>                                   it87_read_value(data,
>                                                   IT87_REG_TEMP_OFFSET[i]=
);
>
> -                       if (i >=3D NUM_TEMP_LIMIT)
> +                       if (i >=3D data->num_temp_limit)
>                                 continue;
>
>                         data->temp[i][1] =3D
> @@ -1679,16 +1688,17 @@ static ssize_t show_pwm_temp_map(struct device *d=
ev,
>         struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_att=
r(attr);
>         struct it87_data *data =3D it87_update_device(dev);
>         int nr =3D sensor_attr->index;
> +       u8 num_map =3D data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
>         int map;
>
>         if (IS_ERR(data))
>                 return PTR_ERR(data);
>
>         map =3D data->pwm_temp_map[nr];
> -       if (map >=3D 3)
> +       if (map >=3D num_map)
>                 map =3D 0;        /* Should never happen */
> -       if (nr >=3D 3)            /* pwm channels 3..6 map to temp4..6 */
> -               map +=3D 3;
> +       if (nr >=3D num_map)      /* pwm channels 3..6 map to temp4..6 */
> +               map +=3D num_map;
>
>         return sprintf(buf, "%d\n", (int)BIT(map));
>  }
> @@ -1700,6 +1710,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
>         struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_att=
r(attr);
>         struct it87_data *data =3D dev_get_drvdata(dev);
>         int nr =3D sensor_attr->index;
> +       u8 num_map =3D data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
>         long val;
>         int err;
>         u8 reg;
> @@ -1707,8 +1718,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
>         if (kstrtol(buf, 10, &val) < 0)
>                 return -EINVAL;
>
> -       if (nr >=3D 3)
> -               val -=3D 3;
> +       if (nr >=3D num_map)
> +               val -=3D num_map;
>
>         switch (val) {
>         case BIT(0):
> @@ -3206,7 +3217,7 @@ static void it87_check_limit_regs(struct it87_data =
*data)
>                 if (reg =3D=3D 0xff)
>                         it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
>         }
> -       for (i =3D 0; i < NUM_TEMP_LIMIT; i++) {
> +       for (i =3D 0; i < data->num_temp_limit; i++) {
>                 reg =3D it87_read_value(data, IT87_REG_TEMP_HIGH(i));
>                 if (reg =3D=3D 0xff)
>                         it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127=
);
> @@ -3399,6 +3410,7 @@ static int it87_probe(struct platform_device *pdev)
>         struct resource *res;
>         struct device *dev =3D &pdev->dev;
>         struct it87_sio_data *sio_data =3D dev_get_platdata(dev);
> +       const struct it87_devices *chip;
>         int enable_pwm_interface;
>         struct device *hwmon_dev;
>         int err;
> @@ -3421,9 +3433,21 @@ static int it87_probe(struct platform_device *pdev=
)
>         data->type =3D sio_data->type;
>         data->smbus_bitmap =3D sio_data->smbus_bitmap;
>         data->ec_special_config =3D sio_data->ec_special_config;
> -       data->features =3D it87_devices[sio_data->type].features;
> -       data->peci_mask =3D it87_devices[sio_data->type].peci_mask;
> -       data->old_peci_mask =3D it87_devices[sio_data->type].old_peci_mas=
k;
> +       chip =3D &it87_devices[sio_data->type];
> +       data->features =3D chip->features;
> +       data->peci_mask =3D chip->peci_mask;
> +       data->old_peci_mask =3D chip->old_peci_mask;
> +       data->num_temp_limit =3D chip->num_temp_limit ?
> +                              chip->num_temp_limit : IT87_TEMP_LIMIT_DEF=
AULT;
> +       if (chip->num_temp_offset)
> +               data->num_temp_offset =3D min(chip->num_temp_offset,
> +                                           (u8)IT87_TEMP_OFFSET_MAX);
> +       else if (has_temp_offset(data))
> +               data->num_temp_offset =3D IT87_TEMP_OFFSET_MAX;
> +       else
> +               data->num_temp_offset =3D 0;
> +       data->num_temp_map =3D chip->num_temp_map ?
> +                            chip->num_temp_map : IT87_TEMP_MAP_DEFAULT;
>         /*
>          * IT8705F Datasheet 0.4.1, 3h =3D=3D Version G.
>          * IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h =3D=3D Ver=
sion J.
> --
> 2.50.1 (Apple Git-155)
>
