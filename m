Return-path: <pali.rohar@gmail.com>
Date: Mon, 20 Jun 2016 11:12:37 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	David =?utf-8?Q?Santamar=C3=ADa?= Rogado <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Tolga Cakir <cevelnet@gmail.com>,
	"Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
	Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Dakota Whipple <dakotajaywhipple@gmail.com>,
	Leon Yu <leon@leonyu.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] dell-smm-hwmon fixes
Message-ID: <20160620091237.GH29844@pali>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
 <201606181726.01058@pali>
 <57657CE2.6040107@roeck-us.net>
 <201606190039.47640@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201606190039.47640@pali>
List-ID: <linux-hwmon@vger.kernel.org>

On Sunday 19 June 2016 00:39:47 Pali Rohár wrote:
> On Saturday 18 June 2016 18:54:58 Guenter Roeck wrote:
> > On 06/18/2016 08:26 AM, Pali Rohár wrote:
> > > On Saturday 18 June 2016 17:13:59 Guenter Roeck wrote:
> > >> On 06/17/2016 03:54 PM, Pali Rohár wrote:
> > >>> I'm sending all my dell-smm-hwmon patches in one series, because
> > >>> due to changes in code other patches depends on previous.
> > >>> 
> > >>> First two patches fixes problem with old /proc/i8k file. Second
> > >>> is security fix and should be backported to all stable kernels
> > >>> (that problem was there always). I tested i8kctl tool (from
> > >>> i8kutils package) that it still works with these patches.
> > >>> Without root access for those security operations just showes
> > >>> '?' or '-1'.
> > >>> 
> > >>> Third and fourth patches try to fix problem on machines with
> > >>> broken SMM/BIOS when calling function fan_type().
> > >>> 
> > >>> Fifth is new feature and last sixth useful for debugging.
> > >>> 
> > >>> Pali Rohár (6):
> > >>>     hwmon: (dell-smm) Fail in ioctl I8K_BIOS_VERSION when bios
> > >>>     version is
> > >>>     
> > >>>       not a number
> > >>>     
> > >>>     hwmon: (dell-smm) Restrict fan control and serial number to
> > >>>     
> > >>>       CAP_SYS_ADMIN by default
> > >>>     
> > >>>     hwmon: (dell-smm) Disallow fan_type() calls on broken
> > >>>     machines hwmon: (dell-smm) Cache fan_type() calls and change
> > >>>     fan detection hwmon: (dell-smm) Detect fan with index=2
> > >>>     hwmon: (dell-smm) In debug mode log duration of SMM calls
> > >>>    
> > >>>    drivers/hwmon/dell-smm-hwmon.c |  122
> > >>>    ++++++++++++++++++++++++++++++++-------- 1 file changed, 99
> > >>>    insertions(+), 23 deletions(-)
> > >> 
> > >> Pali,
> > >> 
> > >> You asked for additional testing, so I am not sure what you expect
> > >> me to do.
> > >> 
> > >> Which of the patches can/should I apply now ?
> > >> 
> > >> Guenter
> > > 
> > > Test 3/6 and 4/6 patches on affected Dell machines. I CCed all
> > > people who tried to debug those bugs, so need confirmation from
> > > them that after applying 3/6 and 4/6 patches, erratic fan
> > > behaviour is not there...
> > > 
> > > But because those two patches depends on previous, it is needed to
> > > test whole series...
> > 
> > This doesn't tell me which patches to apply now. The first two ?
> 
> Yes, 1/6 and 2/6 are OK.
> 

Guenter, now you can apply whole series + add all tested-by lines from
email threads. Looks like it is OK now.

-- 
Pali Rohár
pali.rohar@gmail.com
