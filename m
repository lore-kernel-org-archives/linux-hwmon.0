Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:48116 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932134AbdJUP4s (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Oct 2017 11:56:48 -0400
Date: Sat, 21 Oct 2017 08:56:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hotran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, lho@apm.com, patches@apm.com
Subject: Re: [v4] hwmon: xgene: Support hwmon v2
Message-ID: <20171021155644.GA11487@roeck-us.net>
References: <1508264914-4614-1-git-send-email-hotran@apm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508264914-4614-1-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 17, 2017 at 11:28:34AM -0700, hotran wrote:
> This patch supports xgene-hwmon v2 which uses the non-cachable memory
> as the PCC shared memory.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>
> ---
> v4
>  - Initialize version variable

I would have preferred for you to drop the #ifdefs, but this shall do.
Subsequent patches please on top of this one.

Applied to hwmon-next.

Guenter

> 
> v3
>  - Use local version variable
>  - Use inline calls instead of the private map function
> 
> v2
>  - Map PCC shared mem by ioremap() in case hwmon is v2
> 
>  drivers/hwmon/xgene-hwmon.c | 40 +++++++++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 9c0dbb8..b4e3f11 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -91,6 +91,11 @@
>  #define to_xgene_hwmon_dev(cl)		\
>  	container_of(cl, struct xgene_hwmon_dev, mbox_client)
>  
> +enum xgene_hwmon_version {
> +	XGENE_HWMON_V1 = 0,
> +	XGENE_HWMON_V2 = 1,
> +};
> +
>  struct slimpro_resp_msg {
>  	u32 msg;
>  	u32 param1;
> @@ -609,6 +614,15 @@ static void xgene_hwmon_tx_done(struct mbox_client *cl, void *msg, int ret)
>  	}
>  }
>  
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
> +	{"APMC0D29", XGENE_HWMON_V1},
> +	{"APMC0D8A", XGENE_HWMON_V2},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
> +#endif
> +
>  static int xgene_hwmon_probe(struct platform_device *pdev)
>  {
>  	struct xgene_hwmon_dev *ctx;
> @@ -650,6 +664,16 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		}
>  	} else {
>  		struct acpi_pcct_hw_reduced *cppc_ss;
> +		int version = XGENE_HWMON_V1;
> +#ifdef CONFIG_ACPI
> +		const struct acpi_device_id *acpi_id;
> +
> +		acpi_id = acpi_match_device(xgene_hwmon_acpi_match, &pdev->dev);
> +		if (!acpi_id)
> +			return -EINVAL;
> +
> +		version = (int)acpi_id->driver_data;
> +#endif
>  
>  		if (device_property_read_u32(&pdev->dev, "pcc-channel",
>  					     &ctx->mbox_idx)) {
> @@ -690,7 +714,13 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		 */
>  		ctx->comm_base_addr = cppc_ss->base_address;
>  		if (ctx->comm_base_addr) {
> -			ctx->pcc_comm_addr = memremap(ctx->comm_base_addr,
> +			if (version == XGENE_HWMON_V2)
> +				ctx->pcc_comm_addr = (void __force *)ioremap(
> +							ctx->comm_base_addr,
> +							cppc_ss->length);
> +			else
> +				ctx->pcc_comm_addr = memremap(
> +							ctx->comm_base_addr,
>  							cppc_ss->length,
>  							MEMREMAP_WB);
>  		} else {
> @@ -758,14 +788,6 @@ static int xgene_hwmon_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_ACPI
> -static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
> -	{"APMC0D29", 0},
> -	{},
> -};
> -MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
> -#endif
> -
>  static const struct of_device_id xgene_hwmon_of_match[] = {
>  	{.compatible = "apm,xgene-slimpro-hwmon"},
>  	{}
