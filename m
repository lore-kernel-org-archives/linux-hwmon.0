Return-Path: <pali.rohar@gmail.com>
Return-path: <pali.rohar@gmail.com>
Date: Mon, 4 Dec 2017 13:18:29 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Jean Delvare <jdelvare@suse.de>,
	Jonathan Buzzard <jonathan@buzzard.org.uk>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: i8k_smm_func() takes enormous of time to execute
Message-ID: <20171204121829.m6zk3imp47ru2od2@pali>
References: <12093169.Rm9IG5ILEB@natalenko.name>
 <2197616.V8s6m9LJcd@natalenko.name>
 <20171124112543.3css4fwwmbiu36bm@pali>
 <2978620.NBCOB6I8fo@natalenko.name>
 <20171204103507.gymmjw46lzggzndo@pali>
 <0cfe104c062adcd7cc35e0b94c5bfba1@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cfe104c062adcd7cc35e0b94c5bfba1@natalenko.name>
List-ID: <linux-hwmon@vger.kernel.org>

On Monday 04 December 2017 13:08:18 Oleksandr Natalenko wrote:
> Hi.
> 
> 04.12.2017 11:35, Pali Rohár wrote:
> > On Friday 24 November 2017 13:28:59 Oleksandr Natalenko wrote:
> > > On pátek 24. listopadu 2017 12:25:43 CET Pali Rohár wrote:
> > > > On Friday 24 November 2017 12:17:30 Oleksandr Natalenko wrote:
> > > > > > There are two patches waiting to be tested in
> > > > > > https://bugzilla.kernel.org/show_bug.cgi?id=195751
> > > > >
> > > > > Tested and attached a couple of patches on top of those to the BZ. If
> > > > > disabling fan control is the only approach here, I can confirm that this
> > > > > works.
> > > >
> > > > Hi! Please figure out which SMM call (they are identified by eax and ebx
> > > > registers) cause this freeze. So we would now what needs to be
> > > > blacklisted.
> > > 
> > > Here it goes:
> > > 
> > > [ 7.191081] dell_smm_hwmon: smm(0x10a3 0x0000) = 0x002e (took
> > > 1837 usecs)
> > > [ 7.194007] dell_smm_hwmon: smm(0x00a3 0x0001) = 0xffff (took
> > > 151 usecs)
> > > [ 7.198239] dell_smm_hwmon: smm(0x00a3 0x0000) = 0x0002 (took
> > > 1411 usecs)
> > > [ 7.199095] dell_smm_hwmon: smm(0x02a3 0x0001) = 0xffff (took
> > > 71 usecs)
> > > [ 7.700493] dell_smm_hwmon: smm(0x02a3 0x0000) = 0x157c (took
> > > 488912 usecs)
> > > [ 7.701277] dell_smm_hwmon: smm(0x0025 0X0000) = 0xffff (took
> > > 71 usecs)
> > > 
> > > 0x02a3 is I8K_SMM_GET_SPEED.
> > 
> > Ok, so it is really a good idea to disable fan control completely on
> > your machine.
> 
> This still doesn't explain why things work in non-Linux environment…

No, they does not work in non-Linux environment too. You can call same
smm request also on Windows and it freeze computer in same way. Just
windows do not have such smm driver out of box. To reproduce this
problem you need to write either own kernel driver in assembler (like
driver for linux) or write that smm code in assembler for classic
(userspace) application and find out how to call that smm code via
WinAPI (probably you would need Administrator rights and study lot of
WinAPI documentation).

> But as a workaround, okay, let it be.

Basically once you issue this 0x02a3 call your computer freeze (more
precisely stay in SMM mode -- it is x86 processor mode) and such
operation is fully independent of what is running on your x86 cpu
(Linux, Windows, DOS, some RTOS system, ...)

> > Your last patch in bugzilla looks ok, you add my Reviewed-by: Pali
> > Rohár <pali.rohar@gmail.com>
> 
> Could you please advice on how to proceed further? I can submit all 3
> patches (incl. yours two), to a ML.

Now it is up to hwmon maintainers (Jean Delvare & Guenter Roeck) to pick
up these patches. I think nothing more is needed from your side. (And if
yes, Jean would write.)

-- 
Pali Rohár
pali.rohar@gmail.com
