Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Sat, 22 Sep 2018 23:01:21 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
	corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20180923060120.GA8872@Asurada-Nvidia.nvidia.com>
References: <20180923041118.8743-1-nicoleotsuka@gmail.com>
 <20180923041118.8743-2-nicoleotsuka@gmail.com>
 <353ccbbd-94c8-72eb-eb98-8a0507431e15@roeck-us.net>
 <20180923053151.GB9960@Asurada>
 <ce76fdf2-2894-96ad-d2f5-b2c25f197ee4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce76fdf2-2894-96ad-d2f5-b2c25f197ee4@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, Sep 22, 2018 at 10:45:49PM -0700, Guenter Roeck wrote:
> On 09/22/2018 10:31 PM, Nicolin Chen wrote:
> > On Sat, Sep 22, 2018 at 10:19:42PM -0700, Guenter Roeck wrote:
> > > > +2) child nodes
> > > > +  Required properties:
> > > > +  - input-id: Must be 1, 2 or 3
> > > > +
> > > > +  Optional properties:
> > > > +  - input-label: Name of the input source
> > > > +  - shunt-resistor: Shunt resistor value in micro-Ohm
> > > > +  - status: Should be "disabled" if no input source
> > > > +
> > > > +  Example:
> > > > +
> > > > +  input1 {
> > > > +          input-id = <0x1>;
> > > 
> > > We'll have to find a better name for this. Feel free to look up examples in the
> > > existing devicetree descriptions. The one that seems to be used most of the time
> > > to indicate a channel index or id is "reg". It should also start with 0 - there
> > > is no real reason for it to start with 1; it only makes the code more complex.
> > 
> > The reason is that the port start from 1 in the datasheet.
> > 
> 
> Maybe, but for me I'll want to have something that we can reuse for other chips.
> Having the index start with 0 for one chip and with 1 for another would be
> confusing. It is bad enough that we have in[0..n] for voltages and temp[1..n]
> for temperatures. I would not want to see the same in devicetree files,
> and much less so on a per-device basis. It is also pretty common to start
> channel numbers with 0 in devicetree files.

Understood. I search a bit and saw most of "*-id" start from 0,
although I cannot be sure whether their Datasheet/RM/schematics
are counting from 0 or 1.

And I also found a transposing example:
    Documentation/devicetree/bindings/serial/mrvl,pxa-ssp.txt

Probably should be better to wait for doc maintainers' input.

Thanks
Nicolin
