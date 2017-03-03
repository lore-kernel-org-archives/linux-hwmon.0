Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35192 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751668AbdCCJMh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Mar 2017 04:12:37 -0500
Date: Fri, 3 Mar 2017 00:21:31 -0600
From: Rob Herring <robh@kernel.org>
To: Rick Altherr <raltherr@google.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, joel@jms.id.au,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed AST2400/AST2500 ADC
Message-ID: <20170303062131.u5gjyv2odbafkkpg@rob-hp-laptop>
References: <20170228201404.32125-1-raltherr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170228201404.32125-1-raltherr@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

 On Tue, Feb 28, 2017 at 12:14:03PM -0800, Rick Altherr wrote:
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  .../devicetree/bindings/hwmon/aspeed_adc.txt       | 48 ++++++++++++++++++++++

ADCs should really be documented in one place regardless of whether 
hwmon or IIO is used. Don't need to move it now, but certainly the 
bindings need to be compatible.

>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed_adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt b/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt
> new file mode 100644
> index 000000000000..9e481668c4d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt
> @@ -0,0 +1,48 @@
> +Aspeed AST2400/2500 ADC
> +
> +This device is a 10-bit converter for 16 voltage channels.  All inputs are
> +single ended.  Each channel can be individually enabled to allow for use of
> +alternate pin functions.
> +
> +1) adc node
> +
> +  Required properties:
> +  - compatible : Should be one of
> +	"aspeed,ast2400-adc"
> +	"aspeed,ast2500-adc"
> +  - reg : memory window mapping address and length
> +  - #address-cells : must be <1> corresponding to the channel child binding
> +  - #size-cells : must be <0> corresponding to the channel child binding
> +  - clocks : Input clock used to derive the sample clock. Expected to be the
> +    SoC's APB clock.
> +  - update-interval-ms : initial time between updates on a channel

This is like sampling rate? I think we have a standard ADC property for 
that.

> +
> +  The node contains child nodes for each channel that the platform uses.
> +
> +  Example adc node:
> +    adc@1e6e9000 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "aspeed,ast2400-adc";
> +	reg = <0x1e6e9000 0xB0>;
> +	clocks = <&clk_apb>;
> +	update-interval-ms = <100>;
> +
> +	[ child node definitions... ]
> +    };
> +
> +2) channel nodes
> +
> +  Optional properties:
> +  - status: indicates the operational status of the device.
> +    Value must be either "disabled" or "okay".

Don't need to document this.

> +  - label : string describing the monitored value

You need a reg property for the channel number.

> +
> +  Example channel node:
> +  channel@1 {
> +	status = "okay";
> +	label = "3V3 rail";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc0_default>;

Need to document these.

> +  };
> -- 
> 2.11.0.483.g087da7b7c-goog
> 
