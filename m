Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43475 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728164AbeIVScH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Sep 2018 14:32:07 -0400
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add ina3221 documentation
To: Nicolin Chen <nicoleotsuka@gmail.com>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com, corbet@lwn.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180921223216.634-1-nicoleotsuka@gmail.com>
 <20180921223216.634-2-nicoleotsuka@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3c117b80-f671-1e57-6eab-3d9801b4b889@roeck-us.net>
Date: Sat, 22 Sep 2018 05:38:37 -0700
MIME-Version: 1.0
In-Reply-To: <20180921223216.634-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

On 09/21/2018 03:32 PM, Nicolin Chen wrote:
> Texas Instruments INA3221 is a triple-channel shunt and bus
> voltage monitor. This patch adds a DT binding doc for it.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Changelog
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
>   .../devicetree/bindings/hwmon/ina3221.txt     | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> new file mode 100644
> index 000000000000..bcfd5b9c697b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> @@ -0,0 +1,38 @@
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
> +  The names of child nodes should indicate input source names
> +
> +  Required properties:
> +  - input-id: Must be 1, 2 or 3
> +
> +  Optional properties:
> +  - shunt-resistor: Shunt resistor value in micro-Ohm
> +  - status: Should be "disabled" if no input source
> +
> +  Example:
> +
> +  input1 {
> +          input-id = <0x1>;
> +          status = "disabled";
> +  };
> +  VDD_GPU {
> +          input-id = <0x2>;
> +          shunt-resistor = <5000>;
> +  };
> 

Using child nodes is a good idea. However, you are converting the node name into
the hwmon 'label' attribute which I can not accept. First, it is undocumented,
second, it effectively creates an undocumented property (if one wants to configure
the shunt resistor value, one has to configure a child node which is converted
into a label), and third, it violates the hwmon ABI ('input1' is not a "hint
about what this voltage channel is being used for").

Guenter
