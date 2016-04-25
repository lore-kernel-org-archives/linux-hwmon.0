From: Rob Herring <robh@kernel.org>
To: linux-hwmon@vger.kernel.org
Date: Mon, 25 Apr 2016 05:58:03 -0700
Subject: Re: [PATCH 08/11] dt-bindings: mfd: Add Altera A10-SR power supply alarm
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160425125713.GA6578@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Apr 22, 2016 at 10:33:36AM -0500, ttha...@opensource.altera.com wrote:
> From: Thor Thayer <ttha...@opensource.altera.com>
> 
> Add power supply alarm from the hwmon framework.

hwmon framework is a Linuxism that has nothing to do with the h/w 
description.
 
> Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> ---
>  .../devicetree/bindings/mfd/altera-a10sr.txt       |    8 ++++++++
>  1 file changed, 8 insertions(+)

Just squash this into the 1st patch.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
