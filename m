Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 27 Sep 2018 11:39:56 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com,
	corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20180927183955.GB15719@Asurada-Nvidia.nvidia.com>
References: <20180925225930.31886-1-nicoleotsuka@gmail.com>
 <20180925225930.31886-2-nicoleotsuka@gmail.com>
 <20180927174413.GB7587@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180927174413.GB7587@bogus>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 27, 2018 at 12:44:13PM -0500, Rob Herring wrote:
> > +2) child nodes
> > +  Required properties:
> > +  - reg: Must be 0, 1 or 2, corresponding to IN1, IN2 or IN3 port of INA3221
> > +
> > +  Optional properties:
> > +  - label: Name of the input source
> > +  - shunt-resistor-micro-ohms: Shunt resistor value in micro-Ohm
> > +  - status: Should be "disabled" if no input source
> 
> Don't need to explicitly list status.

Will remove in v6.

> > +
> > +  Example:
> > +
> > +  input@0 {
> > +          reg = <0x0>;
> > +          status = "disabled";
> > +  };
> > +  input@1 {
> > +          reg = <0x1>;
> > +          shunt-resistor-micro-ohms = <5000>;
> > +  };
> > +  input@2 {
> > +          reg = <0x2>;
> > +          label = "VDD_5V";
> > +          shunt-resistor-micro-ohms = <5000>;
> > +  };
> 
> Please combine the examples into one complete example.

Will merge them in v6.

Thank you
Nicolin
