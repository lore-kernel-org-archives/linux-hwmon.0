Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56912 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751089AbdHPNmq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Aug 2017 09:42:46 -0400
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c: Document the IBM CCF power
 supply version 1
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, corbet@lwn.net,
        "Edward A. James" <eajames@us.ibm.com>
References: <1502830355-502-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502830355-502-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6d0edce7-5e96-b6d4-8503-cf0f27f72d51@roeck-us.net>
Date: Wed, 16 Aug 2017 06:42:43 -0700
MIME-Version: 1.0
In-Reply-To: <1502830355-502-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/15/2017 01:52 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   .../devicetree/bindings/i2c/ibm,cffps1.txt          | 21 +++++++++++++++++++++

Sorry, just noticed. Sorry for the piecemeal review :-(.
The i2c directory is used for i2c controllers, not for other i2c devices.
Please move to hwmon (and drop i2c from the subject).

Thanks,
Guenter

>   1 file changed, 21 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> new file mode 100644
> index 0000000..f68a0a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
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
> 

