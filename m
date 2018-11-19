Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43309 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbeKSLr4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Nov 2018 06:47:56 -0500
Date: Sun, 18 Nov 2018 17:25:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Florian Eckert <fe@dev.tdt.de>, jdelvare@suse.com,
        mark.rutland@arm.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (adcxx) add devictree bindings
 documentation
Message-ID: <20181119012555.GA7856@roeck-us.net>
References: <20181115135013.30723-1-fe@dev.tdt.de>
 <20181115135013.30723-2-fe@dev.tdt.de>
 <20181117144040.GA8016@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181117144040.GA8016@bogus>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Nov 17, 2018 at 08:40:41AM -0600, Rob Herring wrote:
> On Thu, Nov 15, 2018 at 02:50:12PM +0100, Florian Eckert wrote:
> > Document the devicetree bindings for the adcxx.
> > 
> > Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> > ---
> >  Documentation/devicetree/bindings/hwmon/adcxx.txt | 24 +++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/adcxx.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/adcxx.txt b/Documentation/devicetree/bindings/hwmon/adcxx.txt
> > new file mode 100644
> > index 000000000000..a94a5fe21b6d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adcxx.txt
> > @@ -0,0 +1,24 @@
> > +adcxx properties
> 
> Needs a better description of what this h/w is.
> 
> ADCs go in iio/adc/
> 
FWIW, the hwmon driver for this chip series would be a perfect candidate
for a conversion to an iio driver. The driver predates the existence of
iio.

Florian, any interest doing that ? It is quite likely that the chip isn't
used for hardware monitoring.

> > +
> > +Required properties:
> > +- compatible: Must be one of the following:
> > +	- "national,adcxx1s" for adcxx1s
> > +	- "national,adcxx2s" for adcxx2s
> > +	- "national,adcxx4s" for adcxx4s
> > +	- "national,adcxx8s" for adcxx8s
> 
> Don't use wildcards in compatible strings.
> 
Should we list all of them ?

ADC121S021 ADC121S051 ADC121S101
ADC101S021 ADC101S051 ADC101S101
ADC081S021 ADC081S051 ADC081S101

ADC121S625 ADC121S655 ADC121S705

ADC122S021 ADC122S051 ADC122S101
ADC102S021 ADC102S051 ADC102S101
ADC082S021 ADC082S051 ADC082S101

ADC122S625 ADC122S655 ADC122S706

ADC124S021 ADC124S051 ADC124S101
ADC104S021 ADC104S051 ADC104S101
ADC084S021 ADC084S051 ADC084S101

ADC128S022 ADC128S052 ADC128S102

I hope I didn't miss any.

Guenter

> > +- reg: SPI address for chip
> > +
> > +Optional properties:
> > +
> > +- vref-supply
> > +  The external reference in microvolt for this device is set to this value.
> > +  If it does not exists the reference will be set to 3300000uV (3.3V).
> > +
> > +Example:
> > +
> > +adc@6 {
> > +	compatible = "national,adcxx2s";
> > +	reg = <6 0>;
> 
> ? SPI addresses are a single cell.
> 
> > +	spi-max-frequency = <1000000>;
> > +	vref-supply = <&vref>;
> > +};
> > -- 
> > 2.11.0
> > 
