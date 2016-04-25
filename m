From: Rob Herring <robh@kernel.org>
To: linux-hwmon@vger.kernel.org
Date: Mon, 25 Apr 2016 05:55:50 -0700
Subject: Re: [PATCH 01/11] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160425125514.GA5100@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Apr 22, 2016 at 10:33:29AM -0500, ttha...@opensource.altera.com wrote:
> From: Thor Thayer <ttha...@opensource.altera.com>
> 
> The Altera Arria10 Devkit System Resource chip is a Multi-Function
> Device with a GPIO expander and power supply alarm.

An alarm with no interrupt? Are the GPIOs interrupt capable?
 
> This patch adds documentation for the Altera A10-SR DT bindings.
> 
> Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> ---
>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 
> ++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
