Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35100 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285AbcFRPOs (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 18 Jun 2016 11:14:48 -0400
Subject: Re: [PATCH 0/6] dell-smm-hwmon fixes
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
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57656537.3020904@roeck-us.net>
Date: Sat, 18 Jun 2016 08:13:59 -0700
MIME-Version: 1.0
In-Reply-To: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/17/2016 03:54 PM, Pali Rohár wrote:
> I'm sending all my dell-smm-hwmon patches in one series, because due to
> changes in code other patches depends on previous.
>
> First two patches fixes problem with old /proc/i8k file. Second is security
> fix and should be backported to all stable kernels (that problem was there
> always). I tested i8kctl tool (from i8kutils package) that it still works
> with these patches. Without root access for those security operations just
> showes '?' or '-1'.
>
> Third and fourth patches try to fix problem on machines with broken
> SMM/BIOS when calling function fan_type().
>
> Fifth is new feature and last sixth useful for debugging.
>
> Pali Rohár (6):
>    hwmon: (dell-smm) Fail in ioctl I8K_BIOS_VERSION when bios version is
>      not a number
>    hwmon: (dell-smm) Restrict fan control and serial number to
>      CAP_SYS_ADMIN by default
>    hwmon: (dell-smm) Disallow fan_type() calls on broken machines
>    hwmon: (dell-smm) Cache fan_type() calls and change fan detection
>    hwmon: (dell-smm) Detect fan with index=2
>    hwmon: (dell-smm) In debug mode log duration of SMM calls
>
>   drivers/hwmon/dell-smm-hwmon.c |  122 ++++++++++++++++++++++++++++++++--------
>   1 file changed, 99 insertions(+), 23 deletions(-)
>

Pali,

You asked for additional testing, so I am not sure what you expect me to do.

Which of the patches can/should I apply now ?

Guenter

