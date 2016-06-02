Return-path: <pali.rohar@gmail.com>
Date: Thu, 2 Jun 2016 15:06:08 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Peter Saunderson <peteasa@gmail.com>
Cc: Thorsten Leemhuis <fedora@leemhuis.info>,
	Jan C Peters <jcpeters89@gmail.com>,
	David =?utf-8?Q?Santamar=C3=ADa?= Rogado <howl.nsp@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
Message-ID: <20160602130608.GP29844@pali>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
 <201605271245.47383@pali>
 <01084692-618a-31db-76f8-60176d1cd2cc@leemhuis.info>
 <201605271521.10294@pali>
 <574B4293.9010404@gmail.com>
 <20160530093613.GS29844@pali>
 <574C6976.6030302@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <574C6976.6030302@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Monday 30 May 2016 17:25:26 Peter Saunderson wrote:
> On 30/05/16 10:36, Pali Rohár wrote:
> >Hi Peter! Thank you for information! Are you able to try to call that
> >function on some old kernel (e.g. 3.12 or 3.14) to verify that it is
> >caused only and only by that function?
> >
> I have tried to use my old 3.19.0 kernel that did not have the problem but
> now it will not boot.  The boot screen is left with
> 
> Loading Linux linux...
> Loading initial ramdisk...
> 
> No logs etc.. I am guessing that some grub or ram disk change is giving me
> the problem.  I have just upgraded to Ubuntu 16.04 and do not want to
> downgrade so I am a bit stuck at the moment and doubt that I can do this
> test.
> 
> Peter.

You can try to regenerate initramfs with ubuntu command:

$ sudo update-initramfs -u -k all

In case you modified or updated some initram files or kernel modules you
need to regenerate it to take effect at boot... -k all tells to
regenerate *all* initramfs images, not only for currently booted kernel.

-- 
Pali Rohár
pali.rohar@gmail.com
