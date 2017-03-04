Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:34531 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752103AbdCDV7H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Mar 2017 16:59:07 -0500
Received: by mail-ot0-f193.google.com with SMTP id x37so7701315ota.1
        for <linux-hwmon@vger.kernel.org>; Sat, 04 Mar 2017 13:59:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve4NxQ8=GQGOdwnURRzvgDOGYs1LAwd_NQE=qzWnUVMEg@mail.gmail.com>
References: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com> <CAHp75Ve4NxQ8=GQGOdwnURRzvgDOGYs1LAwd_NQE=qzWnUVMEg@mail.gmail.com>
From: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
Date: Sat, 4 Mar 2017 22:58:26 +0100
Message-ID: <CAHZJmOzdDhnts6-HUKBMoYC6FSj-Hkz=jpcfwV4gFTTEWdB7kg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

ok, but how? I am on Debian,  and I never in my life compiled a kernel...

What would I need to do?

On 4 March 2017 at 18:44, Andy Shevchenko <andy.shevchenko@gmail.com> wrote=
:
> On Sat, Mar 4, 2017 at 12:41 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> w=
rote:
>> It was reported that dell-smm-hwmon is working fine on Dell XPS 15 9560.
>>
>> Link: http://www.spinics.net/lists/platform-driver-x86/msg10751.html
>> Reported-by: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
>> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>> ---
>
> Vasile, can you test this fix?
>
>>  drivers/hwmon/dell-smm-hwmon.c |    7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwm=
on.c
>> index 34704b0..3189246 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -995,6 +995,13 @@ enum i8k_configs {
>>                 },
>>                 .driver_data =3D (void *)&i8k_config_data[DELL_XPS],
>>         },
>> +       {
>> +               .ident =3D "Dell XPS 15 9560",
>> +               .matches =3D {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
>> +               },
>> +       },
>>         { }
>>  };
>>
>> --
>> 1.7.9.5
>>
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
