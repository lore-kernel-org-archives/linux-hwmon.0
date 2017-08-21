Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Document the IBM CCF power
 supply version 1
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, jdelvare@suse.com, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, corbet@lwn.net
References: <1503344773-7236-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1503344773-7236-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 21 Aug 2017 14:56:26 -0500
MIME-Version: 1.0
In-Reply-To: <1503344773-7236-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-Id: <78252338-abc2-0119-7492-319624bbba7f@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>



On 08/21/2017 02:46 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Forgot to add Rob Herring for the bindings.

Eddie

> ---
>   .../devicetree/bindings/hwmon/ibm,cffps1.txt        | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt b/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> new file mode 100644
> index 0000000..f68a0a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> @@ -0,0 +1,21 @@
> +Device-tree bindings for IBM Common Form Factor Power Supply Version 1
> +----------------------------------------------------------------------
> +
> +Required properties:
> + - compatible = "ibm,cffps1";
> + - reg = < I2C bus address >;		: Address of the power supply on the
> +					  I2C bus.
> +
> +Example:
> +
> +    i2c-bus@100 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #interrupt-cells = <1>;
> +        < more properties >
> +
> +        power-supply@68 {
> +            compatible = "ibm,cffps1";
> +            reg = <0x68>;
> +        };
> +    };
