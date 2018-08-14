Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net> <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
 <20180813141438.GH3978217@devbig004.ftw2.facebook.com>
In-Reply-To: <20180813141438.GH3978217@devbig004.ftw2.facebook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Aug 2018 23:09:12 +0200
Message-ID: <CACRpkdYyYWZUShfm0qT7AdToexndnSF6=hnHicLK37=-Y1NAzA@mail.gmail.com>
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature sensors
To: Tejun Heo <tj@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
	linux-hwmon@vger.kernel.org, smartmontools-support@listi.jpberlin.de,
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Aug 13, 2018 at 4:14 PM Tejun Heo <tj@kernel.org> wrote:

> So, one thought I have is that this doesn't really add any new
> capabilities.  The information is fully discoverable from userspace
> and interpreting the data requires quite a bit of heuristics.  So, do
> we really need this in the kernel?

I do not intend to add all of SMART or anything just the temperature
sensor(s).

This is because the kernel has a thermal framework, drivers/thermal,
that can be used to define thermal zones and cooling devices for
them. It has surfaced that some NAS devices rely on the sensor in
the harddisk for their cooling policy, as they have no other sensor,
but they have a fan.

To utilize the sensor for the thermal zone, it must be known to the
kernel.

Being able to simply use the existing hwmon ABI to read these
sensors appear to have a value on its own and rely on one userspace
tool (sensors) instead of several which also seem sparingly
maintained (hddtemp). smartmontools make good use of the
data, but it has other main purposes than temperature monitoring
and is a pretty big hammer for that.

Yours,
Linus Walleij
