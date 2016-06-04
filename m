Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49990 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbcFDEPU (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Jun 2016 00:15:20 -0400
Subject: Re: [PATCH] hwmon: ina2xx: Document compatible for INA231
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1464774192-21887-1-git-send-email-k.kozlowski@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <575255DA.607@roeck-us.net>
Date: Fri, 3 Jun 2016 21:15:22 -0700
MIME-Version: 1.0
In-Reply-To: <1464774192-21887-1-git-send-email-k.kozlowski@samsung.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/01/2016 02:43 AM, Krzysztof Kozlowski wrote:
> Document the compatible for INA231 sensor.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Applied.

Thanks,
Guenter

> ---
>   Documentation/devicetree/bindings/hwmon/ina2xx.txt | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/ina2xx.txt b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
> index 9bcd5e87830d..02af0d94e921 100644
> --- a/Documentation/devicetree/bindings/hwmon/ina2xx.txt
> +++ b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
> @@ -7,6 +7,7 @@ Required properties:
>   	- "ti,ina220" for ina220
>   	- "ti,ina226" for ina226
>   	- "ti,ina230" for ina230
> +	- "ti,ina231" for ina231
>   - reg: I2C address
>
>   Optional properties:
>

