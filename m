Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45813 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754496AbcGUWKB (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 21 Jul 2016 18:10:01 -0400
Date: Thu, 21 Jul 2016 15:09:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hoan Tran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, lho@apm.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: apm: Add X-Gene SoC hwmon to device
 tree
Message-ID: <20160721220953.GC19236@roeck-us.net>
References: <1469134557-26869-1-git-send-email-hotran@apm.com>
 <1469134557-26869-4-git-send-email-hotran@apm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469134557-26869-4-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jul 21, 2016 at 01:55:57PM -0700, Hoan Tran wrote:
> This patch adds DT node to enable hwmon driver for APM X-Gene SoC.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 5 +++++
>  arch/arm64/boot/dts/apm/apm-storm.dtsi     | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> index c569f76..a5935f5 100644
> --- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> @@ -472,6 +472,11 @@
>  			mboxes = <&mailbox 0>;
>  		};
>  
> +		hwmonslimpro {
> +			compatible = "apm,xgene-slimpro-hwmon";
> +			mboxes = <&mailbox 7>;
> +		};
> +
>  		serial0: serial@10600000 {
>  			device_type = "serial";
>  			compatible = "ns16550";
> diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> index 5147d76..f8ea5b5 100644
> --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> @@ -716,6 +716,11 @@
>  			mboxes = <&mailbox 0>;
>  		};
>  
> +		hwmonslimpro {
> +			compatible = "apm,xgene-slimpro-hwmon";
> +			mboxes = <&mailbox 7>;
> +		};
> +
>  		serial0: serial@1c020000 {
>  			status = "disabled";
>  			device_type = "serial";
> -- 
> 1.9.1
> 
