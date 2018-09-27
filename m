Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
Date: Thu, 27 Sep 2018 12:44:13 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com,
	corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20180927174413.GB7587@bogus>
References: <20180925225930.31886-1-nicoleotsuka@gmail.com>
 <20180925225930.31886-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180925225930.31886-2-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Sep 25, 2018 at 03:59:29PM -0700, Nicolin Chen wrote:
> Texas Instruments INA3221 is a triple-channel shunt and bus
> voltage monitor. This patch adds a DT binding doc for it.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Changelog
> v4->v5:
>  * Replaced "input-id" with "reg" and added address-cells and size-cells
>  * Replaced "input-label" with "label"
>  * Replaced "shunt-resistor" with "shunt-resistor-micro-ohms"
> v3->v4:
>  * Removed the attempt of putting labels in the node names
>  * Added a new optional label property in the child node
>  * Updated examples accordingly
> v2->v3:
>  * Added a simple subject in the line 1
>  * Fixed the shunt resistor value in the example
> v1->v2:
>  * Dropped channel name properties
>  * Added child node definitions.
>  * * Added shunt resistor property in the child node
>  * * Added status property to indicate connection status
>  * * Changed to use child node name as the label of input source
> 
>  .../devicetree/bindings/hwmon/ina3221.txt     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> new file mode 100644
> index 000000000000..e17a897f4803
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> @@ -0,0 +1,49 @@
> +Texas Instruments INA3221 Device Tree Bindings
> +
> +1) ina3221 node
> +  Required properties:
> +  - compatible: Must be "ti,ina3221"
> +  - reg: I2C address
> +
> +  Optional properties:
> +  = The node contains optional child nodes for three channels =
> +  = Each child node describes the information of input source =
> +
> +  - #address-cells: Required only if a child node is present. Must be 1.
> +  - #size-cells: Required only if a child node is present. Must be 0.
> +
> +  Example:
> +
> +  ina3221@40 {
> +          compatible = "ti,ina3221";
> +          reg = <0x40>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          [ child node definitions... ]
> +  };
> +
> +2) child nodes
> +  Required properties:
> +  - reg: Must be 0, 1 or 2, corresponding to IN1, IN2 or IN3 port of INA3221
> +
> +  Optional properties:
> +  - label: Name of the input source
> +  - shunt-resistor-micro-ohms: Shunt resistor value in micro-Ohm
> +  - status: Should be "disabled" if no input source

Don't need to explicitly list status.

> +
> +  Example:
> +
> +  input@0 {
> +          reg = <0x0>;
> +          status = "disabled";
> +  };
> +  input@1 {
> +          reg = <0x1>;
> +          shunt-resistor-micro-ohms = <5000>;
> +  };
> +  input@2 {
> +          reg = <0x2>;
> +          label = "VDD_5V";
> +          shunt-resistor-micro-ohms = <5000>;
> +  };

Please combine the examples into one complete example.

Rob
