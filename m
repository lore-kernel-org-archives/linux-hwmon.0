Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from gloria.sntech.de ([185.11.138.130]:47582 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727295AbeKHHFi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Nov 2018 02:05:38 -0500
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: tmp108: add optional interrupts and #thermal-sensor-cells
Date: Wed, 07 Nov 2018 22:33:12 +0100
Message-ID: <5910167.PXNgySJWA7@diego>
In-Reply-To: <20181107183958.GB5468@roeck-us.net>
References: <20181107154708.422-1-heiko@sntech.de> <20181107183958.GB5468@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

Am Mittwoch, 7. November 2018, 19:39:58 CET schrieb Guenter Roeck:
> On Wed, Nov 07, 2018 at 04:47:08PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@bq.com>
> > 
> > The tmp108 does have an alert output that can be used as interrupt source
> > and can of course also be used as part of a thermal sensor setup for
> > things
> > like thermal-based cpu frequencies, so document the necessary properties.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>
> 
> Do you also plan to actually implement interrupt support in the driver ?

Not right now but I'm hoping down the road.

The main argument for including this standard property is that
the dt-binding is of course a description of the hardware and not the
state of the linux driver and the tmp108 obviously has that alert output
pin, hence I'd really like to already have it in the new board-dts I'm
currently working on so it simply magically works once the driver can
use it :-) .


Heiko

> > ---
> > 
> >  Documentation/devicetree/bindings/hwmon/tmp108.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/tmp108.txt
> > b/Documentation/devicetree/bindings/hwmon/tmp108.txt index
> > 8c4b10df86d9..54d4beed4ee5 100644
> > --- a/Documentation/devicetree/bindings/hwmon/tmp108.txt
> > +++ b/Documentation/devicetree/bindings/hwmon/tmp108.txt
> > 
> > @@ -7,6 +7,10 @@ Requires node properties:
> >  - compatible : "ti,tmp108"
> >  - reg : the I2C address of the device. This is 0x48, 0x49, 0x4a, or 0x4b.
> > 
> > +Optional properties:
> > +- interrupts: Reference to the TMP108 alert interrupt.
> > +- #thermal-sensor-cells: should be set to 0.
> > +
> > 
> >  Example:
> >  	tmp108@48 {
> >  	
> >  		compatible = "ti,tmp108";
