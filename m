Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54165 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975AbcFRUAx (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 18 Jun 2016 16:00:53 -0400
Subject: Re: [PATCH 1/6] hwmon: (dell-smm) Fail in ioctl I8K_BIOS_VERSION when
 bios version is not a number
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
 <1466204089-17030-2-git-send-email-pali.rohar@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5765A858.30102@roeck-us.net>
Date: Sat, 18 Jun 2016 13:00:24 -0700
MIME-Version: 1.0
In-Reply-To: <1466204089-17030-2-git-send-email-pali.rohar@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/17/2016 03:54 PM, Pali Rohár wrote:
> ABI of I8K_BIOS_VERSION ioctl can return only number. But new BIOS versions
> contain also other characters, which does not fit into that ABI. So in case
> of non digit values return -EINVAL.
>
> Reported-by: Mario Limonciello <Mario_Limonciello@dell.com>
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>

Applied.

Guenter

> ---
>   drivers/hwmon/dell-smm-hwmon.c |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index c43318d..480b2fa 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -35,6 +35,7 @@
>   #include <linux/uaccess.h>
>   #include <linux/io.h>
>   #include <linux/sched.h>
> +#include <linux/ctype.h>
>
>   #include <linux/i8k.h>
>
> @@ -387,6 +388,10 @@ i8k_ioctl_unlocked(struct file *fp, unsigned int cmd, unsigned long arg)
>
>   	switch (cmd) {
>   	case I8K_BIOS_VERSION:
> +		if (!isdigit(bios_version[0]) || !isdigit(bios_version[1]) ||
> +		    !isdigit(bios_version[2]))
> +			return -EINVAL;
> +
>   		val = (bios_version[0] << 16) |
>   				(bios_version[1] << 8) | bios_version[2];
>   		break;
>

