Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Tue, 25 Sep 2018 23:14:19 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
	corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20180926061418.GA900@Asurada>
References: <20180925225930.31886-1-nicoleotsuka@gmail.com>
 <20180925225930.31886-2-nicoleotsuka@gmail.com>
 <4f16baf7-b1bc-c7d2-3dd9-ed10b78d59b6@roeck-us.net>
 <20180926030857.GA458@Asurada-Nvidia.nvidia.com>
 <7896d6d6-c7c0-b462-3150-5ceff906bae0@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7896d6d6-c7c0-b462-3150-5ceff906bae0@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Sep 25, 2018 at 08:40:59PM -0700, Guenter Roeck wrote:
> >>>+2) child nodes
> >>>+  Required properties:
> >>>+  - reg: Must be 0, 1 or 2, corresponding to IN1, IN2 or IN3 port of INA3221

> >>>+  input@0 {
> >>>+          reg = <0x0>;
> >>>+          status = "disabled";

> >>saying at the same time that I would like to see this work for other chips
> >>as well.

> >>Other chips have different kinds of sensors. Voltage, current, power, temperature,
> >>and others. Whatever we come up with should support that.
> >>
> >>I see two possibilities right now. We can stick with reg and add a "type" property,
> >>or we can make the index something like
> >>	{voltage,current,power,temperature,humidity}-{id,index}
> >
> >One small concern is a case of being multi-type. For example, I saw
> >ina2xx driver having voltage, current and power at the same time...
> >
> Yes, with that we would have something like
> 
> 	voltage@0 {
> 		type = "voltage";
> 		reg = <0>;
> 	};
> 	current@0 {
> 		type = "current";
> 		reg = <0>;
> or
> 	voltage@0 {
> 		voltage-id = <0>;
> 	};
> 	current@0 {
> 		current-id = <0>;

I see the point now. So this could be a good binding for different
types of sensor input sources. Then the hwmon device driver side'd
also get a hint from DT, or potentially have further common helper
functions or structures being defined in the core driver.

Yet I feel that we could still have something more obvious to tell
which exact port that the input source links to. From my point of
view, neither "type-id" nor "type + reg" nor "reg" only perfectly
tells the port connection information. It somehow feels like that
we are assigning an ID or even an address to an input source; Yes,
we describe them in the doc, but by reading the device node itself
without knowing the famous "reg", it's a bit hard to tell. And not
to justify for my way, but both the "input-id" in the v2 and the
"pwm-port" in the aspeed patch sound relatively straightforward.

If we could make something similar to regulator bindings, probably
it would make more sense. I know the standalone voltage node might
be odd though, just trying to express my concern.
	source0: voltage0 {
		type = "voltage";
		lable = "VDD_5V";
		shunt-resistor-micro-ohm = <5000>;
		/* status = "disabled"; */
	};
	ina3221@40 {
		port1 = <&source0>;
		/* port2 = <&source1>; */
	};

> With "type", we would still need two properties.
> 
> 	reg = <0>;
> 	type = "voltage";
> 
> and type could be optional or not required for a chip only supporting
> a single sensor type (like the ina3221).
> 
> This would be equivalent to, say,
> 	voltage-index = <0>;
> when using a single property.
> 
> With the "reg" approach, we would be ok for now - however, I would like
> to get feedback from Rob if introducing a "type" property will be
> acceptable when the time comes to do so.

OK. Let's see how Rob replies. If he strongly feels "reg" is still
essential, at least this patch can be Acked first -- reduces turn
around time :)

> >By the way, I have two ina3221 hwmon patches that rebase upon this
> >binding series. And I'd like to send them out to go through review
> >first, but I am not sure if you'd be okay for it -- I don't really
> >like to change their rebase order as it might mess up something.
> >
> Are those bug fixes or further enhancements ? For enhancements,
> it is your call when to send them; I am fine either way. If they are
> bug fixes, they should come first so we can apply them to -stable.

Understood. They are adding new sysfs nodes, like in[123]_enable
as you suggested during the previous review. I'll send them soon.

Thanks
Nicolin
