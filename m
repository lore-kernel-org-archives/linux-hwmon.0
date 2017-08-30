Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59171 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751851AbdH3BB1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2017 21:01:27 -0400
Date: Tue, 29 Aug 2017 18:00:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Eckert <fe@dev.tdt.de>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, dev@kresin.me
Subject: Re: [v2,2/2] hwmon: (ltq-cputemp) add devicetree bindings
 documentation
Message-ID: <20170830010051.GA15869@roeck-us.net>
References: <20170821124123.17470-2-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170821124123.17470-2-fe@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 21, 2017 at 02:41:23PM +0200, Florian Eckert wrote:
> Document the devicetree bindings for the ltq-cputemp
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>

When you resend, please copy DT maintainers.

> ---
>  Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
> new file mode 100644
> index 000000000000..991b05cbcb4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
> @@ -0,0 +1,10 @@
> +Lantiq cpu temperatur sensor driver

Nitpick: s/driver//

The file describes the sensor, not the driver.

> +
> +Requires node properties:

Required

> +- "compatible" value :

Just "- compatible:" (without the '"')

> +	"lantiq,cputemp"
> +
> +Example:
> +	cputemp@0 {
> +		compatible = "lantiq,cputemp";
> +	};
