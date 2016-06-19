Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:36610 "EHLO
	mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751154AbcFSABU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 18 Jun 2016 20:01:20 -0400
MIME-Version: 1.0
In-Reply-To: <1466204089-17030-5-git-send-email-pali.rohar@gmail.com>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com> <1466204089-17030-5-git-send-email-pali.rohar@gmail.com>
From: Tolga Cakir <cevelnet@gmail.com>
Date: Sun, 19 Jun 2016 02:01:18 +0200
Message-ID: <CABcamCBP1O16it1Fm6fN9DtZfUeLk9Ob_fpuJEKjXkTz-TWPFw@mail.gmail.com>
Subject: Re: [PATCH 4/6] hwmon: (dell-smm) Cache fan_type() calls and change
 fan detection
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

Tested on a Dell Precision M3800. After applying this patch, the
machine doesn't freeze for a couple of seconds on module load and on
each sensors (lm_sensors) call anymore. It now just freezes once, when
running sensors for the first time, and that's it. It was not possible
to read correct RPM values using sensors before, because the fans were
running at maximum speed, when the freeze occured. I can now read RPM
values correctly and the machine doesn't annoy me with freezing up on
boot anymore.

Tested-by: Tolga Cakir <cevelnet@gmail.com>


2016-06-18 0:54 GMT+02:00 Pali Rohár <pali.rohar@gmail.com>:
> On more Dell machines (e.g. Dell Precision M3800) fan_type() call is too
> expensive (CPU is too long in SMM mode) and cause kernel to hang. This is
> bug in Dell SMM or BIOS.
>
> This patch caches type for each fan (as it should not change) and changes
> the way how fan presense is detected. First it try function fan_status()
> as was before commit f989e55452c7 ("i8k: Add support for fan labels"). And
> if that fails fallback to fan_type(). *_status() functions can fail in case
> fan is not currently accessible (e.g. present on GPU which is currently
> turned off).
>
> Reported-by: Tolga Cakir <cevelnet@gmail.com>
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=112021
> Cc: stable@vger.kernel.org # v4.0+, will need backport
> ---
>  drivers/hwmon/dell-smm-hwmon.c |   25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 4bbc587..2ac87d5 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -238,7 +238,7 @@ static int i8k_get_fan_speed(int fan)
>  /*
>   * Read the fan type.
>   */
> -static int i8k_get_fan_type(int fan)
> +static int _i8k_get_fan_type(int fan)
>  {
>         struct smm_regs regs = { .eax = I8K_SMM_GET_FAN_TYPE, };
>
> @@ -249,6 +249,17 @@ static int i8k_get_fan_type(int fan)
>         return i8k_smm(&regs) ? : regs.eax & 0xff;
>  }
>
> +static int i8k_get_fan_type(int fan)
> +{
> +       /* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values */
> +       static int types[2] = { INT_MIN, INT_MIN };
> +
> +       if (types[fan] == INT_MIN)
> +               types[fan] = _i8k_get_fan_type(fan);
> +
> +       return types[fan];
> +}
> +
>  /*
>   * Read the fan nominal rpm for specific fan speed.
>   */
> @@ -782,13 +793,17 @@ static int __init i8k_init_hwmon(void)
>         if (err >= 0)
>                 i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP4;
>
> -       /* First fan attributes, if fan type is OK */
> -       err = i8k_get_fan_type(0);
> +       /* First fan attributes, if fan status or type is OK */
> +       err = i8k_get_fan_status(0);
> +       if (err < 0)
> +               err = i8k_get_fan_type(0);
>         if (err >= 0)
>                 i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN1;
>
> -       /* Second fan attributes, if fan type is OK */
> -       err = i8k_get_fan_type(1);
> +       /* Second fan attributes, if fan status or type is OK */
> +       err = i8k_get_fan_status(1);
> +       if (err < 0)
> +               err = i8k_get_fan_type(1);
>         if (err >= 0)
>                 i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
>
> --
> 1.7.9.5
>
