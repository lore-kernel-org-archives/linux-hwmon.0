Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40647 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726625AbeJBXto (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Oct 2018 19:49:44 -0400
Date: Tue, 2 Oct 2018 10:05:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20181002170518.GA27236@roeck-us.net>
References: <20181002010523.2019-1-nicoleotsuka@gmail.com>
 <20181002010523.2019-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181002010523.2019-2-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Nicolin,

On Mon, Oct 01, 2018 at 06:05:22PM -0700, Nicolin Chen wrote:
> Texas Instruments INA3221 is a triple-channel shunt and bus
> voltage monitor. This patch adds a DT binding doc for it.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---

This version of the series looks good to me. I'll add both patches to
hwmon-next, with the understanding that I may pull them if Rob has
bindings related concerns.

Thanks,
Guenter

> Changelog
> v7->v9:
>  * N/A
> v6->v7:
>  * Restored three channel examples and merged them with the parent one
> v5->v6:
>  * Removed status property as no need to explicitly list it.
>  * Combined all examples into a complete one.
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
>  .../devicetree/bindings/hwmon/ina3221.txt     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> new file mode 100644
> index 000000000000..a7b25caa2b8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> @@ -0,0 +1,44 @@
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
> +2) child nodes
> +  Required properties:
> +  - reg: Must be 0, 1 or 2, corresponding to IN1, IN2 or IN3 port of INA3221
> +
> +  Optional properties:
> +  - label: Name of the input source
> +  - shunt-resistor-micro-ohms: Shunt resistor value in micro-Ohm
> +
> +Example:
> +
> +ina3221@40 {
> +	compatible = "ti,ina3221";
> +	reg = <0x40>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	input@0 {
> +		reg = <0x0>;
> +		status = "disabled";
> +	};
> +	input@1 {
> +		reg = <0x1>;
> +		shunt-resistor-micro-ohms = <5000>;
> +	};
> +	input@2 {
> +		reg = <0x2>;
> +		label = "VDD_5V";
> +		shunt-resistor-micro-ohms = <5000>;
> +	};
> +};
> -- 
> 2.17.1
> 
