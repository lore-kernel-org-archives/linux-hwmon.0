Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:52353 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932093AbcEWUat (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 23 May 2016 16:30:49 -0400
Date: Mon, 23 May 2016 15:30:44 -0500
From: Rob Herring <robh@kernel.org>
To: Hoan Tran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, lho@apm.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: dtb: xgene: Add hwmon dts binding
 documentation
Message-ID: <20160523203044.GA17450@rob-hp-laptop>
References: <1463415447-29903-1-git-send-email-hotran@apm.com>
 <1463415447-29903-2-git-send-email-hotran@apm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1463415447-29903-2-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, May 16, 2016 at 09:17:25AM -0700, Hoan Tran wrote:
> This patch adds the APM X-Gene hwmon device tree node documentation.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>
> ---
>  .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
> new file mode 100644
> index 0000000..49a482e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
> @@ -0,0 +1,14 @@
> +APM X-Gene hwmon driver
> +
> +Hwmon driver accesses sensors over the "SLIMpro" mailbox.

DT bindings describe h/w, not driver data. I'm not sure this belongs in 
DT and perhaps the devices for the mailbox should be created by the 
mailbox driver.

> +
> +Required properties :
> + - compatible : should be "apm,xgene-slimpro-hwmon"
> + - mboxes : use the label reference for the mailbox as the first parameter.
> +	    The second parameter is the channel number.

When do you expect this to be different mailbox numbers? 

> +
> +Example :
> +	hwmonslimpro {
> +		compatible = "apm,xgene-slimpro-hwmon";
> +		mboxes = <&mailbox 7>;
> +	};
> -- 
> 1.9.1
> 
