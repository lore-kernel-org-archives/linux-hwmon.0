Return-Path: <robh@kernel.org>
Return-path: <robh@kernel.org>
MIME-Version: 1.0
References: <1538717915-22294-1-git-send-email-wojciech.slenska@gmail.com>
 <20181012202829.GA24897@bogus> <CAMYPSMqVHYYLpTmk5ACktKCms3yGFXXs9_m4xOGyVpq3VVSigg@mail.gmail.com>
 <20181015195440.GA21968@roeck-us.net> <CAL_JsqKzwhnQUbF3vOTU3pDCLPQQL33TbgWqrFf1bzRt8VmMgw@mail.gmail.com>
 <20181016233821.GA1662@roeck-us.net> <CAL_JsqK42DkjRjG81Yi=qmhPZx=RUT0oe-z4zJOxB__MqGgihw@mail.gmail.com>
 <20181018144141.GA3963@roeck-us.net>
In-Reply-To: <20181018144141.GA3963@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Thu, 18 Oct 2018 11:06:52 -0500
Message-ID: <CAL_JsqK62Yi9+w=06LrsiDCgLp9W0WmfYTL9QCv98Qfij7Zbbw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (sht3x) add devicetree support
To: Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@the-dreams.de>
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	Mark Rutland <mark.rutland@arm.com>, Linux HWMON List <linux-hwmon@vger.kernel.org>,
	devicetree@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

Adding Wolfram and i2c list...

On Thu, Oct 18, 2018 at 9:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Oct 18, 2018 at 08:47:43AM -0500, Rob Herring wrote:
> > On Tue, Oct 16, 2018 at 6:38 PM Guenter Roeck <linux@roeck-us.net> wrot=
e:
> > >
> > > On Tue, Oct 16, 2018 at 01:02:08PM -0500, Rob Herring wrote:
> > > > On Mon, Oct 15, 2018 at 2:54 PM Guenter Roeck <linux@roeck-us.net> =
wrote:
> > > > >
> > > > > On Mon, Oct 15, 2018 at 07:55:58AM +0200, Wojciech Sle=C5=84ska w=
rote:
> > > > > > pt., 12 pa=C5=BA 2018 o 22:28 Rob Herring <robh@kernel.org> nap=
isa=C5=82(a):
> > > > > > >
> > > > > > > On Fri, Oct 05, 2018 at 07:38:35AM +0200, Wojciech Slenska wr=
ote:
> > > > > > >
> > > > > > > Commit msg?
> > > > > > >
> > > > > > > > Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com=
>
> > > > > > > > ---
> > > > > > > >  Documentation/devicetree/bindings/hwmon/sht3x.txt | 16 +++=
++++++++++
> > > > > > >
> > > > > > > Please split bindings to separate patch.
> > > > > >
> > > > > > I will do this.
> > > > > >
> > > > > > >
> > > > > > > >  drivers/hwmon/sht3x.c                             | 28 +++=
+++++++++++++++++---
> > > > > > > >  2 files changed, 41 insertions(+), 3 deletions(-)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/hwmon=
/sht3x.txt
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/hwmon/sht3x.=
txt b/Documentation/devicetree/bindings/hwmon/sht3x.txt
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000..80b117e
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/hwmon/sht3x.txt
> > > > > > > > @@ -0,0 +1,16 @@
> > > > > > > > +Sensirion SHT3x Humidity and Temperature Sensor
> > > > > > > > +
> > > > > > > > +Required node properties:
> > > > > > > > +- compatible: "sensirion,sht3x" or "sensirion,sts3x"
> > > > > > > > +- reg: I2C bus address of the device
> > > > > > > > +
> > > > > > > > +Optional properties:
> > > > > > > > +- sensirion,blocking-io: enable blocking mode on i2c
> > > > > > >
> > > > > > > This is not a h/w parameter and shouldn't be in DT.
> > > > > > >
> > > > > > > > +- sensirion,no-high-precision: disable high accuracy
> > > > > > >
> > > > > > > Maybe this one is okay, but couldn't the user want to set thi=
s? If so,
> > > > > > > then it should be a sysfs attr.
> > > > > >
> > > > > > Those two parameters have been just moved from
> > > > > > linux/include/linux/platform_data/sht3x.h
> > > > > > Currently, those two parameters can be set in board file, so fo=
r me
> > > > > > was natural to move it to dts.
> > > > > > Of course, I can remove it from dts completely.
> > > > > >
> > > > >
> > > > > I wonder if there is an authoritative document explaining the cur=
rent policy
> > > > > in respect to devicetree properties.
> > > >
> > > > No. In the end it is often a judgement call.
> > > >
> > > > > Sometimes I hear that platform
> > > > > configuration parameters are now permitted, sometimes I hear that=
 we are
> > > > > back to hardware description only.
> > > >
> > > > Yes, configuration is permitted, but there are some constraints. Th=
e
> > > > questions I ask are is it OS specific or specific to current
> > > > implementation of an OS, who or what decides what the setting is? T=
he
> > > > last question results in lots of things dropped in favor of a sysfs
> > > > control.
> > > >
> > > In this driver, both parameters were considered system / platform par=
ameters.
> > > One controls if the chip uses i2c clock stretching or if the system h=
as to poll
> > > for results. This is determined by the system's i2c controller and ma=
y also be
> > > influenced by considerations such as if there is another chip on the =
same bus.
> >
> > Okay, makes sense. As it is named, it sounded like picking a s/w API
> > to use (sync vs. async). So please improve the description based on
> > Guenter's explanation.
> >
> > > The other parameter controls accuracy which directly translates into =
power
> > > consumption. While there could be applications where both parameters =
are
> > > controlled by user space, that would be the exception. In the expecte=
d use
> > > case, ie for hardware monitoring, user space control would neither be=
 feasible
> > > nor desirable. As such, sysfs controls for the parameters don't even =
exist.
> >
> > I could imagine you may want to switch modes based on battery powered
> > vs. plugged in. But that's not to say you couldn't want it one way or
> > the other for a system.
> >
> > > I don't mind if you reject adding those dt properties for now, but I =
would
> > > resist adding sysfs attributes unless someone provides me with an act=
ual
> > > and specific use case.
> >
> > I'm not rejecting them. My next question though is should these be
> > common properties?
>
> No, they are chip specific.

Really?

Trading off accuracy vs. sampling frequency is very much common for
ADCs. Not exactly the same thing here, but surely there's other cases
out there.

And here's another device with programmable clock stretching[1]. Lots
of discussions in searching about masters not supporting clock
stretching more than I found of slaves which are configurable. At
least in that case, we should be able to derive it from master
compatible strings. But for the cases where both ends can support
stretching or not, seems like we need an i2c property.

Rob

[1] https://www.infineon.com/dgdl/Infineon-Infineon-TLE493D-A2B6-UM-v01_00-=
UM-v01_00-EN.pdf?fileId=3D5546d46262b31d2e01633b4bba5f3c5a

>
> Guenter
