Return-Path: <htejun@gmail.com>
Return-path: <htejun@gmail.com>
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 13 Aug 2018 07:14:38 -0700
From: Tejun Heo <tj@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	smartmontools-support@listi.jpberlin.de,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature
 sensors
Message-ID: <20180813141438.GH3978217@devbig004.ftw2.facebook.com>
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
 <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

(cc'ing Hans)

On Fri, Aug 10, 2018 at 11:53:35AM +0200, Linus Walleij wrote:
> On Fri, Aug 10, 2018 at 6:15 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 08/09/2018 03:24 PM, Linus Walleij wrote:
> 
> > > This is a first attempt at providing a kernel-internal
> > > hwmon sensor for ATA drives. It is possible to do the
> > > same for SCSI, NVME etc, but their protocols and
> > > peculiarities seem to require a per-subsystem implementation.
> > > They would all end up in the same namespace using the
> > > SCSI name such as "sd_0:0:0:0".
> > >
> > If the implementation for other drive types needs to be different,
> > how about "ata" as prefix ?
> 
> I was thinking that since through libata all devices on ATA
> are registered to the SCSI namespace, userspace would just
> see sd_N:N:N:N and know "it is some harddrive" and we
> do not need to know if it is SCSI or ATA. This seems to be
> the way the block developers are thinking about it: ATA drives
> are entirely hidden behind SCSI, as are USB mass storage
> drives.

Yeah, I think that's the right approach given that most of libata's
interface is scsi based.

> Yeah I know you are minimalist when it comes to dmesg ;)
> 
> Let's hear what the ATA people think though, it could be kind of useful
> if someone posts a log asking what's wrong with their drive
> and it says the hard disk is 60 degrees on boot. "Man, I think you
> need to look at your fans."

I don't really mind either way as long as it's dbg but yeah hwmon core
likely is a better place to make that call.

So, one thought I have is that this doesn't really add any new
capabilities.  The information is fully discoverable from userspace
and interpreting the data requires quite a bit of heuristics.  So, do
we really need this in the kernel?

Thanks.

-- 
tejun
