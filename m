Return-path: <robherring2@gmail.com>
Date: Fri, 18 Nov 2016 08:50:36 -0600
From: Rob Herring <robh@kernel.org>
To: Tom Levens <tom.levens@cern.ch>
Cc: linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: ltc2990: add devicetree binding
Message-ID: <20161118145035.ir46ohk5uqaln6kp@rob-hp-laptop>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
 <1479384616-12479-2-git-send-email-tom.levens@cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479384616-12479-2-git-send-email-tom.levens@cern.ch>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Nov 17, 2016 at 01:10:15PM +0100, Tom Levens wrote:
> Add a devicetree binding for the ltc2990 hwmon driver.
> 
> Signed-off-by: Tom Levens <tom.levens@cern.ch>
> ---
>  .../devicetree/bindings/hwmon/ltc2990.txt          |   28 ++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ltc2990.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ltc2990.txt b/Documentation/devicetree/bindings/hwmon/ltc2990.txt
> new file mode 100644
> index 0000000..e4040e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ltc2990.txt
> @@ -0,0 +1,28 @@
> +ltc2990
> +
> +Required properties:
> +- compatible: Must be "lltc,ltc2990"
> +- reg: I2C slave address
> +
> +Optional properties:
> +- lltc,mode:

What determines the mode? If this is something a user will want to 
control, then it should be a sysfs attr rather than DT prop. If the 
board design dictates then DT is the right place.

'mode' is a bit vague, 'lltc,meas-mode' perhaps.

> +	Sets the chip's measurement mode, defaults to <6> if unset.
> +
> +	The following measurements are available in each mode:
> +
> +	0: V1, V2, TR2
> +	1: V1-V2, TR2
> +	2: V1-V2, V3, V4
> +	3: TR1, V3, V4
> +	4: TR1, V3-V4
> +	5: TR1, TR2
> +	6: V1-V2, V3-V4
> +	7: V1, V2, V3, V4
> +
> +Example:
> +
> +ltc2990@4c {
> +	compatible = "lltc,ltc2990";
> +	reg = <0x4c>;
> +	lltc,mode = <7>;
> +};
> -- 
> 1.7.1
> 
