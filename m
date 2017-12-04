Return-Path: <oleksandr@natalenko.name>
Return-path: <oleksandr@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 04 Dec 2017 13:08:18 +0100
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.de>, Jonathan Buzzard
 <jonathan@buzzard.org.uk>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
 <mario.limonciello@dell.com>
Subject: Re: i8k_smm_func() takes enormous of time to execute
In-Reply-To: <20171204103507.gymmjw46lzggzndo@pali>
References: <12093169.Rm9IG5ILEB@natalenko.name>
 <2197616.V8s6m9LJcd@natalenko.name> <20171124112543.3css4fwwmbiu36bm@pali>
 <2978620.NBCOB6I8fo@natalenko.name> <20171204103507.gymmjw46lzggzndo@pali>
Message-ID: <0cfe104c062adcd7cc35e0b94c5bfba1@natalenko.name>
List-ID: <linux-hwmon@vger.kernel.org>

Hi.

04.12.2017 11:35, Pali Rohár wrote:
> On Friday 24 November 2017 13:28:59 Oleksandr Natalenko wrote:
>> On pátek 24. listopadu 2017 12:25:43 CET Pali Rohár wrote:
>> > On Friday 24 November 2017 12:17:30 Oleksandr Natalenko wrote:
>> > > > There are two patches waiting to be tested in
>> > > > https://bugzilla.kernel.org/show_bug.cgi?id=195751
>> > >
>> > > Tested and attached a couple of patches on top of those to the BZ. If
>> > > disabling fan control is the only approach here, I can confirm that this
>> > > works.
>> >
>> > Hi! Please figure out which SMM call (they are identified by eax and ebx
>> > registers) cause this freeze. So we would now what needs to be
>> > blacklisted.
>> 
>> Here it goes:
>> 
>> [ 7.191081] dell_smm_hwmon: smm(0x10a3 0x0000) = 0x002e (took     1837 
>> usecs)
>> [ 7.194007] dell_smm_hwmon: smm(0x00a3 0x0001) = 0xffff (took      151 
>> usecs)
>> [ 7.198239] dell_smm_hwmon: smm(0x00a3 0x0000) = 0x0002 (took     1411 
>> usecs)
>> [ 7.199095] dell_smm_hwmon: smm(0x02a3 0x0001) = 0xffff (took       71 
>> usecs)
>> [ 7.700493] dell_smm_hwmon: smm(0x02a3 0x0000) = 0x157c (took   488912 
>> usecs)
>> [ 7.701277] dell_smm_hwmon: smm(0x0025 0X0000) = 0xffff (took       71 
>> usecs)
>> 
>> 0x02a3 is I8K_SMM_GET_SPEED.
> 
> Ok, so it is really a good idea to disable fan control completely on
> your machine.

This still doesn't explain why things work in non-Linux environment… But 
as a workaround, okay, let it be.

> Your last patch in bugzilla looks ok, you add my Reviewed-by: Pali
> Rohár <pali.rohar@gmail.com>

Could you please advice on how to proceed further? I can submit all 3 
patches (incl. yours two), to a ML.

Thanks.

Oleksandr
