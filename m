Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:40691 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbdLZRY1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Dec 2017 12:24:27 -0500
Date: Tue, 26 Dec 2017 09:24:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Joel <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v3,1/2] dt-bindings: hwmon: aspeed-pwm-tacho: Add reset node
Message-ID: <20171226172424.GA22797@roeck-us.net>
References: <20171223130528.5346-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171223130528.5346-2-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Dec 23, 2017 at 11:35:27PM +1030, Joel wrote:
> The device tree bindings are updated to document the resets phandle, and
> the example is updated to match what is expected for both the reset and
> clock phandle.
> 
> Note that the bindings should have always had the reset controller, as
> the hardware is unusable without it.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt         | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> index 367c8203213b..3ac02988a1a5 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -22,8 +22,9 @@ Required properties for pwm-tacho node:
>  - compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
>  	       "aspeed,ast2500-pwm-tacho" for AST2500.
>  
> -- clocks : a fixed clock providing input clock frequency(PWM
> -	   and Fan Tach clock)
> +- clocks : phandle to clock provider with the clock number in the second cell
> +
> +- resets : phandle to reset controller with the reset number in the second cell
>  
>  fan subnode format:
>  ===================
> @@ -48,19 +49,14 @@ Required properties for each child node:
>  
>  Examples:
>  
> -pwm_tacho_fixed_clk: fixedclk {
> -	compatible = "fixed-clock";
> -	#clock-cells = <0>;
> -	clock-frequency = <24000000>;
> -};
> -
>  pwm_tacho: pwmtachocontroller@1e786000 {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  	#cooling-cells = <2>;
>  	reg = <0x1E786000 0x1000>;
>  	compatible = "aspeed,ast2500-pwm-tacho";
> -	clocks = <&pwm_tacho_fixed_clk>;
> +	clocks = <&syscon ASPEED_CLK_APB>;
> +	resets = <&syscon ASPEED_RESET_PWM>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
>  
