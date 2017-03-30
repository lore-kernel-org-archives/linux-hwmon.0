Return-path: <robherring2@gmail.com>
Date: Thu, 30 Mar 2017 17:46:15 -0500
From: Rob Herring <robh@kernel.org>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH linux v5 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device
 driver
Message-ID: <20170330224615.a3pxgigtk6v6ceyd@rob-hp-laptop>
References: <20170324181723.29379-1-jaghu@google.com>
 <20170324181723.29379-2-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170324181723.29379-2-jaghu@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Mar 24, 2017 at 11:17:22AM -0700, Jaghathiswari Rankappagounder Natarajan wrote:
> This binding provides interface for adding values related to ASPEED
> AST2400/2500 PWM and Fan tach controller support.
> The PWM controller can support upto 8 PWM output ports.
> The Fan tach controller can support upto 16 tachometer inputs.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  v5:
> - Changed the naming scheme to aspeed,ast2400/2500-pwm-tacho
> - Removed gpio pin muxing
> - Added aspeed vendor prefix for fan-tach-ch
> - Changed to fan@0/1
> - Changed reg to 32 bits
> 
>  v4:
> - Used 'reg'
> 
>  v3:
> - Made the structure more common
> 
>  v2:
> - Removed '_' in node and property names
> - Gave some explanation for the properties used
> 
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> new file mode 100644
> index 000000000000..f96d32bfcdfa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -0,0 +1,68 @@
> +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
> +
> +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
> +controller can support upto 16 Fan tachometer inputs.
> +
> +There can be upto 8 fans supported. Each fan can have one PWM output and
> +one/two Fan tach inputs.
> +
> +Required properties for pwm-tacho node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 1.
> +
> +- reg : address and length of the register set for the device.
> +
> +- pinctrl-names : a pinctrl state named "default" must be defined.
> +
> +- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
> +
> +- compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
> +	       "aspeed,ast2500-pwm-tacho" for AST2500.
> +
> +- clocks : a fixed clock providing input clock frequency(PWM
> +	   and Fan Tach clock)
> +
> +fan subnode format:
> +===================
> +Under fan subnode there can upto 8 child nodes, with each child node
> +representing a fan. If there are 8 fans each fan can have one PWM port and
> +one/two Fan tach inputs.
> +
> +Required properties for each child node:
> +- reg : should specify PWM source port.
> +	integer value in the range 0 to 7 with 0 indicating PWM port A and
> +	7 indicating PWM port H.
> +
> +- aspeed-fan-tach-ch : should specify the Fan tach input channel.

aspeed,fan-tach-ch

With that,

Acked-by: Rob Herring <robh@kernel.org>

> +                integer value in the range 0 through 15, with 0 indicating
> +		Fan tach channel 0 and 15 indicating Fan tach channel 15.
> +		Atleast one Fan tach input channel is required.
> +
> +Examples:
> +
> +pwm_tacho_fixed_clk: fixedclk {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <24000000>;
> +}
> +
> +pwm_tacho: pwmtachocontroller@1e786000 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	reg = <0x1E786000 0x1000>;
> +	compatible = "aspeed,ast2500-pwm-tacho";
> +	clocks = <&pwm_tacho_fixed_clk>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed-fan-tach-ch = /bits/ 8 <0x00>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x01>;
> +		aspeed-fan-tach-ch = /bits/ 8 <0x01 0x02>;
> +	};
> +};
> --
> 2.12.1.578.ge9c3154ca4-goog
> 
