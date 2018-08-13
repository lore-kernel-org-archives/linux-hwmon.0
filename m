Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:41584 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729697AbeHMTJM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Aug 2018 15:09:12 -0400
Date: Mon, 13 Aug 2018 09:26:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tejun Heo <tj@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature
 sensors
Message-ID: <20180813162614.GB12580@roeck-us.net>
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
 <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
 <20180813141438.GH3978217@devbig004.ftw2.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180813141438.GH3978217@devbig004.ftw2.facebook.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 13, 2018 at 07:14:38AM -0700, Tejun Heo wrote:
> (cc'ing Hans)
> 
> On Fri, Aug 10, 2018 at 11:53:35AM +0200, Linus Walleij wrote:
> > On Fri, Aug 10, 2018 at 6:15 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 08/09/2018 03:24 PM, Linus Walleij wrote:
> > 
> > > > This is a first attempt at providing a kernel-internal
> > > > hwmon sensor for ATA drives. It is possible to do the
> > > > same for SCSI, NVME etc, but their protocols and
> > > > peculiarities seem to require a per-subsystem implementation.
> > > > They would all end up in the same namespace using the
> > > > SCSI name such as "sd_0:0:0:0".
> > > >
> > > If the implementation for other drive types needs to be different,
> > > how about "ata" as prefix ?
> > 
> > I was thinking that since through libata all devices on ATA
> > are registered to the SCSI namespace, userspace would just
> > see sd_N:N:N:N and know "it is some harddrive" and we
> > do not need to know if it is SCSI or ATA. This seems to be
> > the way the block developers are thinking about it: ATA drives
> > are entirely hidden behind SCSI, as are USB mass storage
> > drives.
> 
> Yeah, I think that's the right approach given that most of libata's
> interface is scsi based.
> 

As mentioned separately, we don't usually encode information such as host
or slot in the name. libsensors pulls that information out of sysfs.
On top of that, it turns out the first element is the adapter number,
which can change across boots. We really want this name to be static.
With that in mind, a simple "sd" is sufficient.

> > Yeah I know you are minimalist when it comes to dmesg ;)
> > 
> > Let's hear what the ATA people think though, it could be kind of useful
> > if someone posts a log asking what's wrong with their drive
> > and it says the hard disk is 60 degrees on boot. "Man, I think you
> > need to look at your fans."
> 
> I don't really mind either way as long as it's dbg but yeah hwmon core
> likely is a better place to make that call.
> 
> So, one thought I have is that this doesn't really add any new
> capabilities.  The information is fully discoverable from userspace
> and interpreting the data requires quite a bit of heuristics.  So, do
> we really need this in the kernel?
> 

Interesting question. It came up in a different context recently -
reading temperatures from a power supply which has its own USB based
protocol.

The goal is to be able to access all environmental values with a single
command or set of commands, such as the "sensors" command. This command
depends on libsensors, which currently gets its data exclusively from
hwmon drivers.

A possible alternative might be to implement some kind of plugin interface
in libsensors, to let it pull environmental data from other entities besides
kernel drivers. This would enable uses cases like this (presumably with
a daemon which would connect to libsensors). Technically this should not
be too difficult; the biggest challenge might be to find someone with
enough time to design and implement it.

Guenter
