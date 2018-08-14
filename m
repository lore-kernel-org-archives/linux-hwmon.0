Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41888 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbeHOAKV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 20:10:21 -0400
Date: Tue, 14 Aug 2018 14:21:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature
 sensors
Message-ID: <20180814212114.GB10415@roeck-us.net>
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
 <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
 <20180813141438.GH3978217@devbig004.ftw2.facebook.com>
 <CACRpkdYyYWZUShfm0qT7AdToexndnSF6=hnHicLK37=-Y1NAzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYyYWZUShfm0qT7AdToexndnSF6=hnHicLK37=-Y1NAzA@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 14, 2018 at 11:09:12PM +0200, Linus Walleij wrote:
> On Mon, Aug 13, 2018 at 4:14 PM Tejun Heo <tj@kernel.org> wrote:
> 
> > So, one thought I have is that this doesn't really add any new
> > capabilities.  The information is fully discoverable from userspace
> > and interpreting the data requires quite a bit of heuristics.  So, do
> > we really need this in the kernel?
> 
> I do not intend to add all of SMART or anything just the temperature
> sensor(s).
> 
> This is because the kernel has a thermal framework, drivers/thermal,
> that can be used to define thermal zones and cooling devices for
> them. It has surfaced that some NAS devices rely on the sensor in
> the harddisk for their cooling policy, as they have no other sensor,
> but they have a fan.
> 
> To utilize the sensor for the thermal zone, it must be known to the
> kernel.
> 
Excellent point. Agreed, in this case it makes sense to have kernel
support for the sensors as hwmon device.

Guenter
