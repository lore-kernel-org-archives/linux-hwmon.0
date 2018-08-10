Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35194 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbeHJMW6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Aug 2018 08:22:58 -0400
Received: by mail-io0-f195.google.com with SMTP id w11-v6so7196706iob.2
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Aug 2018 02:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180809222425.17304-1-linus.walleij@linaro.org> <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
In-Reply-To: <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Aug 2018 11:53:35 +0200
Message-ID: <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Aug 10, 2018 at 6:15 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 08/09/2018 03:24 PM, Linus Walleij wrote:

> > This is a first attempt at providing a kernel-internal
> > hwmon sensor for ATA drives. It is possible to do the
> > same for SCSI, NVME etc, but their protocols and
> > peculiarities seem to require a per-subsystem implementation.
> > They would all end up in the same namespace using the
> > SCSI name such as "sd_0:0:0:0".
> >
> If the implementation for other drive types needs to be different,
> how about "ata" as prefix ?

I was thinking that since through libata all devices on ATA
are registered to the SCSI namespace, userspace would just
see sd_N:N:N:N and know "it is some harddrive" and we
do not need to know if it is SCSI or ATA. This seems to be
the way the block developers are thinking about it: ATA drives
are entirely hidden behind SCSI, as are USB mass storage
drives.

> > With this driver, the hard disk temperatur can be read from
>
> temperature
>
> > sysfs:
> >
> >   > cd /sys/class/hwmon/hwmon0/
> >   > cat temp1_input
> >   38
> >
> Did you try the "sensors" command ?

Nah. OpenWRT and minimum userspace you know. But
if sensors is cross-compile friendly I can try to look into
it. Or use some desktop with ATA/SATA I guess.

> > +     cmd_result = scsi_execute(ata->sdev, scsi_cmd, DMA_FROM_DEVICE,
> > +                               argbuf, ATA_SECT_SIZE,
> > +                               NULL, &sshdr, (10*HZ), 5, 0, 0, NULL);
>
> (10*HZ) -> 10 * HZ
>
> Does it have to be that long ?

This comes from the smart command path in libata (libata-scsi.c)
which has this comment:

/* Good values for timeout and retries?  Values below
 * from scsi_ioctl_send_command() for default case... */

Hm copy/paste programming. But it kind of reflects years of experience
from (slow?) hard drives.

I suspect rotational media in some cases need to boot onboard controllers
and spin up drives and this is why it looks like this.

> > +     if (cmd_result) {
> > +             dev_err(ata->dev, "error %d reading SMART values from device\n",
> > +                     cmd_result);
>
> Are those error messages valuable ? To me they just clog the kernel log.

Depromoted to dev_dbg().

> > +             id = argbuf[2 + i * 12];
> > +             if (!id)
> > +                     continue;
> > +
> > +             flags = argbuf[3 + i * 12] | (argbuf[4 + i * 12] << 16);
> > +             /* Highest temperature since boot */
> > +             curr = argbuf[5 + i * 12];
> > +             /* Highest temperature ever */
> > +             worst = argbuf[6 + i * 12];
>
> One of those could be reported as temp1_highest (I would suggest the temperature
> since boot).

I wish. These values are normalized to the range 0..100 without any
standard on what the figures mean, other than that 100 is "good" and
0 is "bad".

Example:
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE
UPDATED  WHEN_FAILED RAW_VALUE
(...)
194 Temperature_Celsius     0x0002   062   059   000    Old_age
Always       -       38 (Min/Max 19/42)

62? 59? It's a mess. I guess it can be hacked on a per-vendor basis if
someone has too much freetime, I will drop a comment on it.

> > +     /* Any other error, return upward */
> > +     if (ret)
> > +             return ret;
> > +     dev_info(dev, "initial temperature %d degrees celsius\n", t);
> > +
>
> noise

Yeah I know you are minimalist when it comes to dmesg ;)

Let's hear what the ATA people think though, it could be kind of useful
if someone posts a log asking what's wrong with their drive
and it says the hard disk is 60 degrees on boot. "Man, I think you
need to look at your fans."

> > +EXPORT_SYMBOL_GPL(ata_hwmon_probe);
>
> Unless I am missing something, that export should not be needed.

I also have this intuition, but libata is tristate, and every
file you compile into a module must have all public functions
exported. You wouid expect that functions just used inside
a module would not need this, but my experience has taught
me otherwise. I think it is something about how the module
linker works. :/

I implemented all other suggestions, waiting for some more
feedback before posting v1.

Yours,
Linus Walleij
