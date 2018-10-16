Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:47033 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbeJQHbK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Oct 2018 03:31:10 -0400
Date: Tue, 16 Oct 2018 16:38:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (sht3x) add devicetree support
Message-ID: <20181016233821.GA1662@roeck-us.net>
References: <1538717915-22294-1-git-send-email-wojciech.slenska@gmail.com>
 <20181012202829.GA24897@bogus>
 <CAMYPSMqVHYYLpTmk5ACktKCms3yGFXXs9_m4xOGyVpq3VVSigg@mail.gmail.com>
 <20181015195440.GA21968@roeck-us.net>
 <CAL_JsqKzwhnQUbF3vOTU3pDCLPQQL33TbgWqrFf1bzRt8VmMgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKzwhnQUbF3vOTU3pDCLPQQL33TbgWqrFf1bzRt8VmMgw@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 16, 2018 at 01:02:08PM -0500, Rob Herring wrote:
> On Mon, Oct 15, 2018 at 2:54 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Mon, Oct 15, 2018 at 07:55:58AM +0200, Wojciech Sleńska wrote:
> > > pt., 12 paź 2018 o 22:28 Rob Herring <robh@kernel.org> napisał(a):
> > > >
> > > > On Fri, Oct 05, 2018 at 07:38:35AM +0200, Wojciech Slenska wrote:
> > > >
> > > > Commit msg?
> > > >
> > > > > Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/hwmon/sht3x.txt | 16 +++++++++++++
> > > >
> > > > Please split bindings to separate patch.
> > >
> > > I will do this.
> > >
> > > >
> > > > >  drivers/hwmon/sht3x.c                             | 28 ++++++++++++++++++++---
> > > > >  2 files changed, 41 insertions(+), 3 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/hwmon/sht3x.txt
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/hwmon/sht3x.txt b/Documentation/devicetree/bindings/hwmon/sht3x.txt
> > > > > new file mode 100644
> > > > > index 0000000..80b117e
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/hwmon/sht3x.txt
> > > > > @@ -0,0 +1,16 @@
> > > > > +Sensirion SHT3x Humidity and Temperature Sensor
> > > > > +
> > > > > +Required node properties:
> > > > > +- compatible: "sensirion,sht3x" or "sensirion,sts3x"
> > > > > +- reg: I2C bus address of the device
> > > > > +
> > > > > +Optional properties:
> > > > > +- sensirion,blocking-io: enable blocking mode on i2c
> > > >
> > > > This is not a h/w parameter and shouldn't be in DT.
> > > >
> > > > > +- sensirion,no-high-precision: disable high accuracy
> > > >
> > > > Maybe this one is okay, but couldn't the user want to set this? If so,
> > > > then it should be a sysfs attr.
> > >
> > > Those two parameters have been just moved from
> > > linux/include/linux/platform_data/sht3x.h
> > > Currently, those two parameters can be set in board file, so for me
> > > was natural to move it to dts.
> > > Of course, I can remove it from dts completely.
> > >
> >
> > I wonder if there is an authoritative document explaining the current policy
> > in respect to devicetree properties.
> 
> No. In the end it is often a judgement call.
> 
> > Sometimes I hear that platform
> > configuration parameters are now permitted, sometimes I hear that we are
> > back to hardware description only.
> 
> Yes, configuration is permitted, but there are some constraints. The
> questions I ask are is it OS specific or specific to current
> implementation of an OS, who or what decides what the setting is? The
> last question results in lots of things dropped in favor of a sysfs
> control.
> 
In this driver, both parameters were considered system / platform parameters.
One controls if the chip uses i2c clock stretching or if the system has to poll
for results. This is determined by the system's i2c controller and may also be
influenced by considerations such as if there is another chip on the same bus.
The other parameter controls accuracy which directly translates into power
consumption. While there could be applications where both parameters are
controlled by user space, that would be the exception. In the expected use
case, ie for hardware monitoring, user space control would neither be feasible
nor desirable. As such, sysfs controls for the parameters don't even exist.

I don't mind if you reject adding those dt properties for now, but I would
resist adding sysfs attributes unless someone provides me with an actual
and specific use case.

Thanks,
Guenter
