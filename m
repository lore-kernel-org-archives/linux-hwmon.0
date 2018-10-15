Return-Path: <mos.slenska@gmail.com>
Return-path: <mos.slenska@gmail.com>
MIME-Version: 1.0
References: <1538717915-22294-1-git-send-email-wojciech.slenska@gmail.com> <20181012202829.GA24897@bogus>
In-Reply-To: <20181012202829.GA24897@bogus>
From: =?UTF-8?Q?Wojciech_Sle=C5=84ska?= <wojciech.slenska@gmail.com>
Date: Mon, 15 Oct 2018 07:55:58 +0200
Message-ID: <CAMYPSMqVHYYLpTmk5ACktKCms3yGFXXs9_m4xOGyVpq3VVSigg@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (sht3x) add devicetree support
To: robh@kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

pt., 12 pa=C5=BA 2018 o 22:28 Rob Herring <robh@kernel.org> napisa=C5=82(a)=
:
>
> On Fri, Oct 05, 2018 at 07:38:35AM +0200, Wojciech Slenska wrote:
>
> Commit msg?
>
> > Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/sht3x.txt | 16 +++++++++++++
>
> Please split bindings to separate patch.

I will do this.

>
> >  drivers/hwmon/sht3x.c                             | 28 +++++++++++++++=
+++++---
> >  2 files changed, 41 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/sht3x.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/sht3x.txt b/Docume=
ntation/devicetree/bindings/hwmon/sht3x.txt
> > new file mode 100644
> > index 0000000..80b117e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/sht3x.txt
> > @@ -0,0 +1,16 @@
> > +Sensirion SHT3x Humidity and Temperature Sensor
> > +
> > +Required node properties:
> > +- compatible: "sensirion,sht3x" or "sensirion,sts3x"
> > +- reg: I2C bus address of the device
> > +
> > +Optional properties:
> > +- sensirion,blocking-io: enable blocking mode on i2c
>
> This is not a h/w parameter and shouldn't be in DT.
>
> > +- sensirion,no-high-precision: disable high accuracy
>
> Maybe this one is okay, but couldn't the user want to set this? If so,
> then it should be a sysfs attr.

Those two parameters have been just moved from
linux/include/linux/platform_data/sht3x.h
Currently, those two parameters can be set in board file, so for me
was natural to move it to dts.
Of course, I can remove it from dts completely.

>
> > +
> > +Example sht3x node:
> > +
> > +sensor {
>
> sensor@4a
>

I will fix this.

> > +     compatible =3D "sensirion,sht3x";
> > +     reg =3D <0x4a>;
> > +}
>

BR
Wojciech Slenska
