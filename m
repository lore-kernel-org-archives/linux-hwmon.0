Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:34182 "EHLO
	mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbcFSACf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 18 Jun 2016 20:02:35 -0400
MIME-Version: 1.0
In-Reply-To: <1466204089-17030-6-git-send-email-pali.rohar@gmail.com>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com> <1466204089-17030-6-git-send-email-pali.rohar@gmail.com>
From: Tolga Cakir <cevelnet@gmail.com>
Date: Sun, 19 Jun 2016 02:02:33 +0200
Message-ID: <CABcamCAGE1p3VC1zpRBETqnMFcGLWOv4EAY6vA9MXCxihTDY1g@mail.gmail.com>
Subject: Re: [PATCH 5/6] hwmon: (dell-smm) Detect fan with index=2
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	=?UTF-8?Q?David_Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	"Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
	Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Dakota Whipple <dakotajaywhipple@gmail.com>,
	Leon Yu <leon@leonyu.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Tested on Dell Precision M3800. It now correctly detects 2 fans for my
machine, one cpu fan and one gpu fan. The reported fan type and fan
speeds look correct. I'm getting unique fan speeds for each fan. I've
also noticed the freeze, which happends on my machine upon
I8K_SMM_GET_FAN_TYPE call, is now doubled to around 4 - 5 seconds due
to detecting 2 fans.

Tested-by: Tolga Cakir <cevelnet@gmail.com>

2016-06-18 0:54 GMT+02:00 Pali Rohár <pali.rohar@gmail.com>:
> Some Dell machines (e.g. Dell Precision M3800) have two fans, first with
> index=0 and second with index=2. So export also attributes for third fan
> device with index=2.
>
> Reported-by: Tolga Cakir <cevelnet@gmail.com>
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> ---
>  drivers/hwmon/dell-smm-hwmon.c |   24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 2ac87d5..571d498 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -81,6 +81,7 @@ static bool disallow_fan_type_call;
>  #define I8K_HWMON_HAVE_TEMP4   (1 << 3)
>  #define I8K_HWMON_HAVE_FAN1    (1 << 4)
>  #define I8K_HWMON_HAVE_FAN2    (1 << 5)
> +#define I8K_HWMON_HAVE_FAN3    (1 << 6)
>
>  MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>  MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
> @@ -252,7 +253,7 @@ static int _i8k_get_fan_type(int fan)
>  static int i8k_get_fan_type(int fan)
>  {
>         /* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values */
> -       static int types[2] = { INT_MIN, INT_MIN };
> +       static int types[3] = { INT_MIN, INT_MIN, INT_MIN };
>
>         if (types[fan] == INT_MIN)
>                 types[fan] = _i8k_get_fan_type(fan);
> @@ -719,6 +720,12 @@ static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
>                           1);
>  static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
>                           i8k_hwmon_set_pwm, 1);
> +static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
> +                         2);
> +static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
> +                         2);
> +static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
> +                         i8k_hwmon_set_pwm, 2);
>
>  static struct attribute *i8k_attrs[] = {
>         &sensor_dev_attr_temp1_input.dev_attr.attr,     /* 0 */
> @@ -735,6 +742,9 @@ static struct attribute *i8k_attrs[] = {
>         &sensor_dev_attr_fan2_input.dev_attr.attr,      /* 11 */
>         &sensor_dev_attr_fan2_label.dev_attr.attr,      /* 12 */
>         &sensor_dev_attr_pwm2.dev_attr.attr,            /* 13 */
> +       &sensor_dev_attr_fan3_input.dev_attr.attr,      /* 14 */
> +       &sensor_dev_attr_fan3_label.dev_attr.attr,      /* 15 */
> +       &sensor_dev_attr_pwm3.dev_attr.attr,            /* 16 */
>         NULL
>  };
>
> @@ -742,7 +752,7 @@ static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
>                               int index)
>  {
>         if (disallow_fan_type_call &&
> -           (index == 9 || index == 12))
> +           (index == 9 || index == 12 || index == 15))
>                 return 0;
>         if (index >= 0 && index <= 1 &&
>             !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
> @@ -762,6 +772,9 @@ static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
>         if (index >= 11 && index <= 13 &&
>             !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
>                 return 0;
> +       if (index >= 14 && index <= 16 &&
> +           !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
> +               return 0;
>
>         return attr->mode;
>  }
> @@ -807,6 +820,13 @@ static int __init i8k_init_hwmon(void)
>         if (err >= 0)
>                 i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
>
> +       /* Third fan attributes, if fan status or type is OK */
> +       err = i8k_get_fan_status(2);
> +       if (err < 0)
> +               err = i8k_get_fan_type(2);
> +       if (err >= 0)
> +               i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN3;
> +
>         i8k_hwmon_dev = hwmon_device_register_with_groups(NULL, "dell_smm",
>                                                           NULL, i8k_groups);
>         if (IS_ERR(i8k_hwmon_dev)) {
> --
> 1.7.9.5
>
