Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41467 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbeIWLPy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Sep 2018 07:15:54 -0400
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add ina3221 documentation
To: Nicolin Chen <nicoleotsuka@gmail.com>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com, corbet@lwn.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180923041118.8743-1-nicoleotsuka@gmail.com>
 <20180923041118.8743-2-nicoleotsuka@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <353ccbbd-94c8-72eb-eb98-8a0507431e15@roeck-us.net>
Date: Sat, 22 Sep 2018 22:19:42 -0700
MIME-Version: 1.0
In-Reply-To: <20180923041118.8743-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/22/2018 09:11 PM, Nicolin Chen wrote:
> Texas Instruments INA3221 is a triple-channel shunt and bus
> voltage monitor. This patch adds a DT binding doc for it.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Changelog
> v3->v4:
>   * Removed the attempt of putting labels in the node names
>   * Added a new optional label property in the child node
>   * Updated examples accordingly
> v2->v3:
>   * Added a simple subject in the line 1
>   * Fixed the shunt resistor value in the example
> v1->v2:
>   * Dropped channel name properties
>   * Added child node definitions.
>   * * Added shunt resistor property in the child node
>   * * Added status property to indicate connection status
>   * * Changed to use child node name as the label of input source
> 
>   .../devicetree/bindings/hwmon/ina3221.txt     | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> new file mode 100644
> index 000000000000..7d90bfe34adb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> @@ -0,0 +1,42 @@
> +Texas Instruments INA3221 Device Tree Bindings
> +
> +1) ina3221 node
> +  Required properties:
> +  - compatible: Must be "ti,ina3221"
> +  - reg: I2C address
> +
> +  = The node contains optional child nodes for three channels =
> +  = Each child node describes the information of input source =
> +
> +  Example:
> +
> +  ina3221@40 {
> +          compatible = "ti,ina3221";
> +          reg = <0x40>;
> +          [ child node definitions... ]
> +  };
> +
> +2) child nodes
> +  Required properties:
> +  - input-id: Must be 1, 2 or 3
> +
> +  Optional properties:
> +  - input-label: Name of the input source
> +  - shunt-resistor: Shunt resistor value in micro-Ohm
> +  - status: Should be "disabled" if no input source
> +
> +  Example:
> +
> +  input1 {
> +          input-id = <0x1>;

We'll have to find a better name for this. Feel free to look up examples in the
existing devicetree descriptions. The one that seems to be used most of the time
to indicate a channel index or id is "reg". It should also start with 0 - there
is no real reason for it to start with 1; it only makes the code more complex.

> +          status = "disabled";
> +  };
> +  input2 {
> +          input-id = <0x2>;
> +          shunt-resistor = <5000>;

I would suggest shunt-resistor-micro-ohms as per
Documentation/devicetree/bindings/property-units.txt.

> +  };
> +  input3 {
> +          input-id = <0x3>;
> +          input-label = "VDD_5V";
> +          shunt-resistor = <5000>;
> +  };
> 
