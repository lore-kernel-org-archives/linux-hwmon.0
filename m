Return-path: <pali.rohar@gmail.com>
Date: Sat, 18 Jun 2016 14:21:34 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	David =?utf-8?Q?Santamar=C3=ADa?= Rogado <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Tolga Cakir <cevelnet@gmail.com>,
	"Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
	Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Dakota Whipple <dakotajaywhipple@gmail.com>,
	Leon Yu <leon@leonyu.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] dell-smm-hwmon fixes
Message-ID: <20160618122134.GF29844@pali>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Saturday 18 June 2016 00:54:43 Pali Rohár wrote:
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
>   hwmon: (dell-smm) Fail in ioctl I8K_BIOS_VERSION when bios version is
>     not a number
>   hwmon: (dell-smm) Restrict fan control and serial number to
>     CAP_SYS_ADMIN by default
>   hwmon: (dell-smm) Disallow fan_type() calls on broken machines
>   hwmon: (dell-smm) Cache fan_type() calls and change fan detection
>   hwmon: (dell-smm) Detect fan with index=2
>   hwmon: (dell-smm) In debug mode log duration of SMM calls
> 
>  drivers/hwmon/dell-smm-hwmon.c |  122 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 99 insertions(+), 23 deletions(-)
> 

Hi, can you test this patch series on affected Dell Studio XPS and
Inspiron 580 machines? Also on affected Precision machines?

I believe it finally fix those freeze and cpu fan speed problems, but
needs testing...

-- 
Pali Rohár
pali.rohar@gmail.com
