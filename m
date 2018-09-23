Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Sat, 22 Sep 2018 22:31:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
	corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20180923053151.GB9960@Asurada>
References: <20180923041118.8743-1-nicoleotsuka@gmail.com>
 <20180923041118.8743-2-nicoleotsuka@gmail.com>
 <353ccbbd-94c8-72eb-eb98-8a0507431e15@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <353ccbbd-94c8-72eb-eb98-8a0507431e15@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, Sep 22, 2018 at 10:19:42PM -0700, Guenter Roeck wrote:
> >+2) child nodes
> >+  Required properties:
> >+  - input-id: Must be 1, 2 or 3
> >+
> >+  Optional properties:
> >+  - input-label: Name of the input source
> >+  - shunt-resistor: Shunt resistor value in micro-Ohm
> >+  - status: Should be "disabled" if no input source
> >+
> >+  Example:
> >+
> >+  input1 {
> >+          input-id = <0x1>;
> 
> We'll have to find a better name for this. Feel free to look up examples in the
> existing devicetree descriptions. The one that seems to be used most of the time
> to indicate a channel index or id is "reg". It should also start with 0 - there
> is no real reason for it to start with 1; it only makes the code more complex.

The reason is that the port start from 1 in the datasheet.

I don't mind using reg or count it from 0, will look up to
see if I can find something solid; otherwise, I'll wait for
binding doc maintainers' opinions before sending v5.

> >+          status = "disabled";
> >+  };
> >+  input2 {
> >+          input-id = <0x2>;
> >+          shunt-resistor = <5000>;
> 
> I would suggest shunt-resistor-micro-ohms as per
> Documentation/devicetree/bindings/property-units.txt.

Will change it.

Thank you
Nicolin
