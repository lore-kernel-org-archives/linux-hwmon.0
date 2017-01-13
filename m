Return-path: <robherring2@gmail.com>
Date: Fri, 13 Jan 2017 10:21:06 -0600
From: Rob Herring <robh@kernel.org>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, jdelvare@suse.com,
	linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH linux v1 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 pwm and fan tach controller device
 driver
Message-ID: <20170113162106.k63lmnaizhrnrety@rob-hp-laptop>
References: <20170109215935.30067-1-jaghu@google.com>
 <20170109215935.30067-2-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170109215935.30067-2-jaghu@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Jan 09, 2017 at 01:59:34PM -0800, Jaghathiswari Rankappagounder Natarajan wrote:
> This binding provides interface for adding values related to ASPEED
> AST2400/2500 PWM and Fan tach controller support.
> The PWM controller can support upto 8 PWM output ports.
> The Fan tach controller can support upto 16 tachometer inputs.
> PWM clock types M, N and 0 are three types just to have three independent
> PWM sources.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 153 +++++++++++++++++++++

Perhaps bindings/pwm/... even though this is more than just PWM.

>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> new file mode 100644
> index 000000000000..8f346409ee8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -0,0 +1,153 @@
> +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
> +
> +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
> +controller can support upto 16 tachometer inputs. The PWM controller supports
> +3 types of frequency mode PWM for fan speed control. PWM clock types M, N and 0
> +are 3 types of frequency mode PWM just to have 3 independent PWM sources.
> +
> +Required properties for pwm_tacho node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 1.
> +
> +- reg : address and length of the register set for the device.
> +
> +- pinctrl-names : a pinctrl state named "default" must be defined.
> +
> +- pinctrl-0 : phandle referencing pin configuration of the AST2400/AST2500 PWM
> +	      ports.
> +
> +- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400 or
> +	       "aspeed,aspeed2500-pwm-tacho" for AST2500.
> +
> +- clocks : a fixed clock providing input clock frequency(PWM
> +	   and Fan Tach clock)
> +
> +type_values subnode format:

Don't use '_' in node or property names.

> +===========================
> +Under type_values subnode there can be upto 3 child nodes indicating type M/N/O
> +values. Atleast one child node is required.
> +
> +Required properties for the child node(type M/N/O):
> +- pwm_period : indicates type M/N/O PWM period, as per the AST2400/AST2500
> +	       datasheet. integer value in the range 0 to 255.


> +
> +- pwm_clock_division_l : indicates type M/N/O PWM clock division L value,
> +			 as per the AST2400/AST2500 datasheet.
> +			 integer value in the range 0 to 15.
> +			 0 here indicates divide 1, 1 indicates divide 2,
> +			 2 indicates divide 4, 3 indicates divide 6, and so on
> +			 till 15 indicates divide 30.
> +
> +- pwm_clock_division_h : indicates type M/N/O PWM clock division H value,
> +			 as per the AST2400/AST2500 datasheet.
> +			 integer value in the range 0 to 15.
> +			 0 here indicates divide 1, 1 indicates divide 2,
> +			 2 indicates divide 4, 3 indicates divide 8, and so on
> +			 till 15 indicates divide 32768.

Can't you have a single divider value and driver convert to register 
values? Really, you should specify the PWM period in ns/us and calculate 
the divider based on the input clock freq. (i.e. use the clock binding). 
There's already PWM binding to specify the period.

I think you should have a node for the fan using the PWM binding and 
perhaps moving some of these properties to the fan node.

> +
> +- fan_tach_enable : indicates fan tach enable of type M/N/O as per the
> +		    AST2400/AST2500 datasheet. boolean value.
> +
> +- fan_tach_clock_division : indicates fan tach clock division as per the
> +			    AST2400/AST2500 datasheet.
> +			    integer value in the range 0 to 7.
> +			    0 indicates divide 4, 1 indicates divide 16,
> +			    2 indicates divide 64, 3 indicates divide 256
> +			    and so on till 7 indicates divide 65536.
> +
> +- fan_tach_mode_selection : indicates fan tach mode mode selection as per the
> +			    AST2400/AST2500 datasheet. integer value in the
> +			    range 0 to 2. 0 indicates falling edge, 1 indicates
> +			    rising edge and 2 indicates both edges.
> +
> +- fan_tach_period : indicates fan tach period as per the AST2400/AST2500
> +		    datasheet. integer value (can be upto 16 bits long).
> +
> +pwm_port subnode format:
> +========================
> +Under pwm_port subnode there can upto 8 child nodes each indicating values
> +for one of the 8 PWM output ports.
> +
> +Required properties for each child node(starting from PWM A through PWM H):
> +- enable : enable PWM #X port, X ranges from A through H. boolean value.

A connection in the PWM binding would imply this.

> +
> +- type : indicates type selection value of PWM #X port, X ranges from A
> +	 through H. integer value in the range 0 to 2;
> +	 0 indicates type M, 1 indicates type N, 2 indicates type O.

This is meaningless to me.

> +- fan_ctrl : set the PWM fan control initial value. integer value between
> +	     0(off) and 255(full speed).
> +
> +fan_tach_channel subnode format:
> +================================
> +Under fan_tach_channel subnode there can be upto 16 child nodes each indicating
> +values for one of the 16 fan tach channels.
> +
> +Required properties for each child node(starting from fan tach #0 through
> +fan tach #16):
> +- fan-ctrl-gpios : should specify the tachometer input pin on the hardware.

I don't understand the connection here. You have a tach block with 16 
inputs on the SoC, so why the GPIOs? If the GPIOs go to the fan, then a 
fan node should have the GPIO properties.

> +
> +- enable : enable fan tach #X, X ranges from 0 through 16. boolean value.

'status' property is the standard way to enable a node or not. Not sure 
if that makes sense here though.

> +
> +- pwm_source : indicates PWM source of fan tach #X, X ranges from 0 through 16.
> +	       integer value in the range 0 to 7. 0 indicates PWM port A,
> +	       1 indicates PWM port B and so on till 7 indicates PWM port H.
