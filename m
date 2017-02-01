Return-path: <robherring2@gmail.com>
Date: Wed, 1 Feb 2017 08:58:37 -0600
From: Rob Herring <robh@kernel.org>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: openbmc@lists.ozlabs.org, linux@roeck-us.net, joel@jms.id.au,
	jdelvare@suse.com, linux-hwmon@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux v2 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device
 driver
Message-ID: <20170201145837.ybfqvz4rdpaiw323@rob-hp-laptop>
References: <20170127093400.28904-1-jaghu@google.com>
 <20170127093400.28904-2-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170127093400.28904-2-jaghu@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Jan 27, 2017 at 01:33:59AM -0800, Jaghathiswari Rankappagounder Natarajan wrote:
> This binding provides interface for adding values related to ASPEED
> AST2400/2500 PWM and Fan tach controller support.
> The PWM controller can support upto 8 PWM output ports.
> The Fan tach controller can support upto 16 tachometer inputs.
> Types M, N and 0 are three types just to have three independent
> PWM/Fan Tach related settings.

This still looks overly complicated to me and very specific to ASpeed. 
You need to define a common structure that works for fans. To start 
with, define a node for the fans themselves. This should use the 
PWM binding and a -gpios property for the tach (when connected to a 
GPIO). 

Something like this:

ctrl: fan-controller@1234 {
	...
	#pwm-cells = <3>;
	fan@0 {
		reg = <0>; /* 'Channel' of the controller */
		pwms = <&ctrl 0 ...>;
		tach-gpios = <&gpio 1>;
		vcc-supply = <&reg_12V>;
	};
};

We already have a pwm-fan binding. This should build on or possibly 
replace that.

> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
> v2:
> - Removed '_' in node or property names
> - Gave some explanation for the properties used.
> 
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 178 +++++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> new file mode 100644
> index 000000000000..290122bfe170
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -0,0 +1,178 @@
> +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
> +
> +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
> +controller can support upto 16 tachometer inputs.

AIUI, each fan has a PWM and a tach input. How would you use more than 8 
tach inputs?

> +
> +There are three different types M, N, O. These three types are just to have
> +different PWM and Fan Tach settings. Each type can have the following settings:
> +	PWM related:
> +		1) PWM period
> +		2) PWM clock division high
> +		3) PWM clock division low
> +	Fan Tach related:
> +		1) Fan Tach type enable
> +		2) Fan Tach clock division
> +		3) Fan Tach mode selection
> +		4) Fan Tach period
> +
> +Each PWM port should be assigned a type which can be type M, N or O.

What is the definition of M, N, and O?

Rob
