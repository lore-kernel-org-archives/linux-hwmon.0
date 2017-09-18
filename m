Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:37635 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbdIRVMj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2017 17:12:39 -0400
Date: Mon, 18 Sep 2017 16:12:37 -0500
From: Rob Herring <robh@kernel.org>
To: Alan Tull <atull@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Oleksij Rempel <bug-track@fisher-privat.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add compatible for max1619
Message-ID: <20170918211237.kirrnxlhqdgm2rdl@rob-hp-laptop>
References: <20170911191649.3344-1-atull@kernel.org>
 <CANk1AXRDaGAcU944+_NO6tAUzUgaxgV85CqjK9tMZgNbDwNG+g@mail.gmail.com>
 <CANk1AXTnk5HDHHTOrT9xM9oUPf7rVpKir8QQKSVMaWOZwNASHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANk1AXTnk5HDHHTOrT9xM9oUPf7rVpKir8QQKSVMaWOZwNASHQ@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 11, 2017 at 04:18:22PM -0500, Alan Tull wrote:
> On Mon, Sep 11, 2017 at 2:33 PM, Alan Tull <atull@kernel.org> wrote:
> 
> Forget this - Guenter has pointed out that this patch is not needed,
> as the i2c layer handles this without needing the compatible added.

The binding is needed regardless.

This could be in trivial-devices.txt instead. Either way,

Acked-by: Rob Herring <robh@kernel.org>

Rob

> 
> Alan
> 
> > On Mon, Sep 11, 2017 at 2:16 PM, Alan Tull <atull@kernel.org> wrote:
> >
> > Add Oleksij Rempel
> >
> >> Add new device tree bindings document for max1619 device
> >> including a new compatible string.
> >>
> >> Signed-off-by: Alan Tull <atull@kernel.org>
> >> Cc: Jean Delvare <jdelvare@suse.com>
> >> Cc: Guenter Roeck <linux@roeck-us.net>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> ---
> >>  Documentation/devicetree/bindings/hwmon/max1619.txt | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/hwmon/max1619.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/hwmon/max1619.txt b/Documentation/devicetree/bindings/hwmon/max1619.txt
> >> new file mode 100644
> >> index 0000000..c70dbbe
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/hwmon/max1619.txt
> >> @@ -0,0 +1,12 @@
> >> +Bindings for MAX1619 Temperature Sensor
> >> +
> >> +Required properties:
> >> +- compatible : "maxim,max1619"
> >> +- reg        : I2C address, one of 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, or
> >> +               0x4d, 0x4e
> >> +
> >> +Example:
> >> +       temp@4c {
> >> +               compatible = "maxim,max1619";
> >> +               reg = <0x4c>;
> >> +       };
> >> --
> >> 2.7.4
> >>
