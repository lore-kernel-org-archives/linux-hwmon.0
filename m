Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54667 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751144AbcFRUBU (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 18 Jun 2016 16:01:20 -0400
Subject: Re: [PATCH 2/6] hwmon: (dell-smm) Restrict fan control and serial
 number to CAP_SYS_ADMIN by default
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	=?UTF-8?Q?David_Santamar=c3=ada_Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Tolga Cakir <cevelnet@gmail.com>,
	"Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
	Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?UTF-8?B?TWljaGHFgiBLxJlwaWU=?= =?UTF-8?B?xYQ=?=
	<kernel@kempniu.pl>, Dakota Whipple <dakotajaywhipple@gmail.com>,
	Leon Yu <leon@leonyu.net>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
 <1466204089-17030-3-git-send-email-pali.rohar@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5765A869.3050008@roeck-us.net>
Date: Sat, 18 Jun 2016 13:00:41 -0700
MIME-Version: 1.0
In-Reply-To: <1466204089-17030-3-git-send-email-pali.rohar@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/17/2016 03:54 PM, Pali Rohár wrote:
> For security reasons ordinary user must not be able to control fan speed
> via /proc/i8k by default. Some malicious software running under "nobody"
> user could be able to turn fan off and cause HW problems. So this patch
> changes default value of "restricted" parameter to 1.
>
> Also restrict reading of DMI_PRODUCT_SERIAL from /proc/i8k via "restricted"
> parameter. It is because non root user cannot read DMI_PRODUCT_SERIAL from
> sysfs file /sys/class/dmi/id/product_serial.
>
> Old non secure behaviour of file /proc/i8k can be achieved by loading this
> module with "restricted" parameter set to 0.
>
> Note that this patch has effects only for kernels compiled with CONFIG_I8K
> and only for file /proc/i8k. Hwmon interface provided by this driver was
> not changed and root access for setting fan speed was needed also before.
>
> Reported-by: Mario Limonciello <Mario_Limonciello@dell.com>
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> Cc: stable@vger.kernel.org # will need backport

Applied.

Guenter

> ---
>   drivers/hwmon/dell-smm-hwmon.c |   19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 480b2fa..c8bd3fdd 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -67,6 +67,7 @@
>
>   static DEFINE_MUTEX(i8k_mutex);
>   static char bios_version[4];
> +static char bios_machineid[16];
>   static struct device *i8k_hwmon_dev;
>   static u32 i8k_hwmon_flags;
>   static uint i8k_fan_mult = I8K_FAN_MULT;
> @@ -95,13 +96,13 @@ module_param(ignore_dmi, bool, 0);
>   MODULE_PARM_DESC(ignore_dmi, "Continue probing hardware even if DMI data does not match");
>
>   #if IS_ENABLED(CONFIG_I8K)
> -static bool restricted;
> +static bool restricted = true;
>   module_param(restricted, bool, 0);
> -MODULE_PARM_DESC(restricted, "Allow fan control if SYS_ADMIN capability set");
> +MODULE_PARM_DESC(restricted, "Restrict fan control and serial number to CAP_SYS_ADMIN (default: 1)");
>
>   static bool power_status;
>   module_param(power_status, bool, 0600);
> -MODULE_PARM_DESC(power_status, "Report power status in /proc/i8k");
> +MODULE_PARM_DESC(power_status, "Report power status in /proc/i8k (default: 0)");
>   #endif
>
>   static uint fan_mult;
> @@ -397,9 +398,11 @@ i8k_ioctl_unlocked(struct file *fp, unsigned int cmd, unsigned long arg)
>   		break;
>
>   	case I8K_MACHINE_ID:
> -		memset(buff, 0, 16);
> -		strlcpy(buff, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
> -			sizeof(buff));
> +		if (restricted && !capable(CAP_SYS_ADMIN))
> +			return -EPERM;
> +
> +		memset(buff, 0, sizeof(buff));
> +		strlcpy(buff, bios_machineid, sizeof(buff));
>   		break;
>
>   	case I8K_FN_STATUS:
> @@ -516,7 +519,7 @@ static int i8k_proc_show(struct seq_file *seq, void *offset)
>   	seq_printf(seq, "%s %s %s %d %d %d %d %d %d %d\n",
>   		   I8K_PROC_FMT,
>   		   bios_version,
> -		   i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
> +		   (restricted && !capable(CAP_SYS_ADMIN)) ? "-1" : bios_machineid,
>   		   cpu_temp,
>   		   left_fan, right_fan, left_speed, right_speed,
>   		   ac_power, fn_key);
> @@ -985,6 +988,8 @@ static int __init i8k_probe(void)
>
>   	strlcpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
>   		sizeof(bios_version));
> +	strlcpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
> +		sizeof(bios_machineid));
>
>   	/*
>   	 * Get SMM Dell signature
>

