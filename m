Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35213 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752159AbdCDRoF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Mar 2017 12:44:05 -0500
MIME-Version: 1.0
In-Reply-To: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com>
References: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 4 Mar 2017 19:44:03 +0200
Message-ID: <CAHp75Ve4NxQ8=GQGOdwnURRzvgDOGYs1LAwd_NQE=qzWnUVMEg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Mar 4, 2017 at 12:41 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> It was reported that dell-smm-hwmon is working fine on Dell XPS 15 9560.
>
> Link: http://www.spinics.net/lists/platform-driver-x86/msg10751.html
> Reported-by: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> ---

Vasile, can you test this fix?

>  drivers/hwmon/dell-smm-hwmon.c |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmo=
n.c
> index 34704b0..3189246 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -995,6 +995,13 @@ enum i8k_configs {
>                 },
>                 .driver_data =3D (void *)&i8k_config_data[DELL_XPS],
>         },
> +       {
> +               .ident =3D "Dell XPS 15 9560",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
> +               },
> +       },
>         { }
>  };
>
> --
> 1.7.9.5
>



--=20
With Best Regards,
Andy Shevchenko
