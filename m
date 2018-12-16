Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33477 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729758AbeLPI6F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Dec 2018 03:58:05 -0500
Received: by mail-qk1-f196.google.com with SMTP id o89so5757926qko.0
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Dec 2018 00:58:04 -0800 (PST)
MIME-Version: 1.0
References: <CAJ2oMhJgfNZbfsnnyUdRQLUdt9xiE4++_C7R8a_sFsyy7PxWPg@mail.gmail.com>
 <20181211211318.GA3004@roeck-us.net> <CAJ2oMhKE1fQStNKiEUgH3UNhJDVr88A2kDgAUY8QhaSuU=B6Ow@mail.gmail.com>
 <20181212113352.6ea13059@endymion>
In-Reply-To: <20181212113352.6ea13059@endymion>
From: Ranran <ranshalit@gmail.com>
Date: Sun, 16 Dec 2018 10:57:53 +0200
Message-ID: <CAJ2oMh+pc4tGm0vSJ5ka42+-rSD3-pFizkbmVOsN8zdA=TvCwg@mail.gmail.com>
Subject: Re: How to detect which device is mapped to hwmonX ?
To: Jean Delvare <jdelvare@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Dec 12, 2018 at 12:33 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> On Wed, 12 Dec 2018 10:54:19 +0200, Ranran wrote:
> > On Tue, Dec 11, 2018 at 11:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On Tue, Dec 11, 2018 at 10:30:58PM +0200, Ranran wrote:
> > > > Hello,
> > > >
> > > > I have several nodes /sys/class/hwmon/hwmonX ,
> > > > but checking the fields I could not find yet a way how to identify a
> > > > device (for example i2c address) to the given mapping of hwmonX.
> > > >
> > > > Is there a way to find out which device is mapped to which hwmonX ?
> > > >
> > >
> > > Maybe libsensors would work for you ?
> > >
> > Thanks , I will check that.
> > But I was looking for something to check in /sys or /proc to get the matching.
> > Probably if libsensor somehow knows the mapping it also looks there, No ?
>
> libsensors looks in /sys indeed but it's not trivial and libsensors
> does not offer an API for it. I remember writing a libsensors-based
> name look-up tool years ago. I'm a bit in a hurry but I have copied
> what I have at:
>
> http://jdelvare.nerim.net/devel/lm-sensors/patches/
>
> Maybe we can revive the idea if there is a need.
>

Thank you,
I am still not sure how to do it using sysfs entries.
Eventually I used dmesg to see the order of enumeration:
[    0.640000] tmp102 1-004a: initialized
[    0.640000] tmp102 1-0049: error reading config register
[    0.640000] tmp102: probe of 1-0049 failed with error -121
[    0.640000] tmp102 1-0048: initialized

But I think it's quite bad method.

Thanks,
ran
> --
> Jean Delvare
> SUSE L3 Support
