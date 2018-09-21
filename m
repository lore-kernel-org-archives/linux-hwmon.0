Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33820 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725749AbeIUGbW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 02:31:22 -0400
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add ina3221 documentation
To: Nicolin Chen <nicoleotsuka@gmail.com>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180921000753.21846-1-nicoleotsuka@gmail.com>
 <20180921000753.21846-2-nicoleotsuka@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d744da89-ebd3-6059-31bf-e65e4c3d2ea4@roeck-us.net>
Date: Thu, 20 Sep 2018 17:45:07 -0700
MIME-Version: 1.0
In-Reply-To: <20180921000753.21846-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/20/2018 05:07 PM, Nicolin Chen wrote:
> Texas Instruments INA3221 is a triple-channel shunt and bus
> voltage monitor. This patch adds a DT binding doc for it.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>   .../devicetree/bindings/hwmon/ina3221.txt     | 23 +++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> new file mode 100644
> index 000000000000..266c9586c9b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
> @@ -0,0 +1,23 @@
> +ina3221 properties
> +
> +Required properties:
> +- compatible: Must be "ti,ina3221"
> +- reg: I2C address
> +
> +Optional properties:
> +
> +- ti,channel1-name:
> +- ti,channel2-name:
> +- ti,channel3-name:
> +	The names of the input sources (described in the schematics)
> +	Set the names with "NC" to indicate not-connected channels
> +

I don't really think this is a good idea - first to specify sensor
names this way, and much less specifying that "NC" means that a sensor
shall be disconnected/disabled.

Also, if we define devicetree support for this chip, it should include
all configuration options required to configure it. This should at
the very least include shunt resistor values.

Thanks,
Guenter

> +Example:
> +
> +ina3221@40 {
> +	compatible = "ti,ina3221";
> +	reg = <0x40>;
> +	ti,channel1-name = "NC";
> +	ti,channel2-name = "VDD_5V0_EXT";
> +	ti,channel3-name = "VDD_19V";
> +};
> 
