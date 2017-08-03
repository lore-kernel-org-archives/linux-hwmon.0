Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
Date: Thu, 3 Aug 2017 15:24:29 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux@roeck-us.net, jdelvare@suse.com, corbet@lwn.net,
	mark.rutland@arm.com, cbostic@linux.vnet.ibm.com, jk@ozlabs.org,
	joel@jms.id.au, andrew@aj.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH v2 10/10] dt-bindings: i2c: Add P8 OCC hwmon driver
 documentation
Message-ID: <20170803202429.nicolqv6xdls26wp@rob-hp-laptop>
References: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501165829-12395-11-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501165829-12395-11-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Jul 27, 2017 at 09:30:29AM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Document the bindings for I2C-based OCC hwmon driver.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> new file mode 100644
> index 0000000..8c765d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> @@ -0,0 +1,25 @@
> +Device-tree bindings for I2C-based On-Chip Controller hwmon driver
> +------------------------------------------------------------------

Bindings describe hardware, not Linux subsystems or drivers. 

> +
> +Required properties:
> + - compatible = "ibm,p8-occ-hwmon";
> + - reg = <I2C address>;			: I2C bus address
> +
> +Examples:
> +
> +    i2c-bus@100 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clock-frequency = <100000>;
> +        < more properties >
> +
> +        occ-hwmon@1 {
> +            compatible = "ibm,p8-occ-hwmon";
> +            reg = <0x50>;
> +        };
> +
> +        occ-hwmon@2 {
> +            compatible = "ibm,p8-occ-hwmon";
> +            reg = <0x51>;
> +        };
> +    };
> -- 
> 1.8.3.1
> 
