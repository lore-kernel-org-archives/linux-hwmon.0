Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <20180809222425.17304-1-linus.walleij@linaro.org> <20180811191534.GA24710@roeck-us.net>
In-Reply-To: <20180811191534.GA24710@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Aug 2018 16:29:33 +0200
Message-ID: <CACRpkda103RA1qeNihOKfSxCTOB7r-V+e7+GMoKUcAmVjOV0Xg@mail.gmail.com>
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tejun Heo <tj@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
	smartmontools-support@listi.jpberlin.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, Aug 11, 2018 at 9:15 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Aug 10, 2018 at 12:24:25AM +0200, Linus Walleij wrote:

> > +     /* Names the hwmon device something like "sd_0:0:0:0" */
> > +     sname =3D devm_kasprintf(dev, GFP_KERNEL, "sd_%s", dev_name(dev))=
;
> > +     if (!sname)
> > +             return -ENOMEM;
>
> This is actually not needed and results in an awkward output such as
>
> sd_10:0:0:0-scsi-10-0
>
> as device name reported by the sensors command (after adding scsi bus
> support to it). We don't usually encode device indexes into the name
> string since it results in duplicate output. "sd" as name passed to
> devm_hwmon_device_register_with_info() is sufficient.
>
> I implemented the following translation from host:bus:slot:lun to
> the sensors command output:
>
> a:b:c:d -> scsi-a-bbcd, where a in the output is decimal and bbcd are hex
> nibbles. Let me know if this is ok or if you have a better idea.

Fair enough, do you have a copy of the code or patch so I can
get it exactly as you want it?

> I found that some ssd drives report a temperature of 0 degrees C.
>
> $ sudo hddtemp /dev/sdb
> /dev/sdb: M4-CT256M4SSD2: 0=C2=B0C
>
> # sensors
> sd_10:0:0:0-scsi-10-0
> Adapter: SCSI adapter
> temp1:         +0.0=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D  +0.0=C2=B0C=
)

Tricky case. Should we assume no sane person is using their drive
at the freeze point and simply bail out on 0 degrees?

> At least some drives (eg WDC WD4001FAEX-00MJRA0) don't report low/high
> temperatures.

Yeah smartmontools says this too. It's kind of a vendor extension.

> Maybe we should detect this situation and not instantiate
> the device (or the min/max attributes) if no useful data is returned.
> What do you think ?

I designed it to just return 0/0 but I guess it is better to just
not support the min/max attributes. As there may be many
harddisks I need to set up the sensor attributes in the state
instead so the code gets a bit complex but it's fine I guess.

> Are min/max temperatures configurable ?

AFAICT it's something the vendor just put in sometimes, so it is
a property of the sensor inside the drive.

Yours,
Linus Walleij
