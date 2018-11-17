Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
Date: Sat, 17 Nov 2018 09:29:49 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add binding documentation for
 adt7475
Message-ID: <20181117152949.GA31247@bogus>
References: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
 <20181108225607.7521-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181108225607.7521-2-chris.packham@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Nov 09, 2018 at 11:56:06AM +1300, Chris Packham wrote:
> With the addition of the invert-pwm property the adt7475 needs its own
> binding documentation rather being captured under trivial-devices.txt.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - use pwm-polarity attiribute to indicate normal or inverted polarity.
> 
>  .../devicetree/bindings/hwmon/adt7475.txt     | 24 +++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.txt   |  4 ----
>  2 files changed, 24 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> new file mode 100644
> index 000000000000..d9212b5e9036
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> @@ -0,0 +1,24 @@
> +*ADT7475 hwmon sensor.
> +
> +Required properties:
> +- compatible: One of
> +	"adi,adt7473"
> +	"adi,adt7475"
> +	"adi,adt7476"
> +	"adi,adt7490"
> +
> +- reg: I2C address
> +
> +optional properties:
> +
> +- pwm-polarity: This configures the polarity of the PWM. 0
> +		(PWM_POLARITY_NORMAL) uses logic high for 100% duty cycle. 1
> +                (PWM_POLARITY_INVERSED) uses logic low for 100% duty cycle.

So we're using part of the PWM binding, but none of the rest of it? What 
is the PWM connection here?

It sounds like this is common for sensors, so this should be documented 
somewhere common.

Rob
