Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55832 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934706AbcHBMWX (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 08:22:23 -0400
Date: Tue, 2 Aug 2016 14:22:13 +0200
From: Greg KH <greg@kroah.com>
To: Baole Ni <baolex.ni@intel.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, airlied@linux.ie,
	kgene@kernel.org, k.kozlowski@samsung.com,
	dougthompson@xmission.com, bp@alien8.de,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, aduggan@synaptics.com,
	dianders@chromium.org
Subject: Re: [PATCH 0239/1285] Replace numeric parameter like 0444 with macro
Message-ID: <20160802122213.GA23544@kroah.com>
References: <20160802105221.29678-1-baolex.ni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160802105221.29678-1-baolex.ni@intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 02, 2016 at 06:52:21PM +0800, Baole Ni wrote:
> I find that the developers often just specified the numeric value
> when calling a macro which is defined with a parameter for access permission.
> As we know, these numeric value for access permission have had the corresponding macro,
> and that using macro can improve the robustness and readability of the code,
> thus, I suggest replacing the numeric parameter with the macro.
> 
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Signed-off-by: Baole Ni <baolex.ni@intel.com>
> ---
>  drivers/hwmon/fschmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
> index d58abdc..a7e4885 100644
> --- a/drivers/hwmon/fschmd.c
> +++ b/drivers/hwmon/fschmd.c
> @@ -602,7 +602,7 @@ static ssize_t store_alert_led(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(alert_led, 0644, show_alert_led, store_alert_led);
> +static DEVICE_ATTR(alert_led, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_alert_led, store_alert_led);

Use DEVICE_ATTR_RW() please.
