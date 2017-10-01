Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36048 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751885AbdJAObe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 1 Oct 2017 10:31:34 -0400
Date: Sun, 1 Oct 2017 07:31:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hotran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@riken.jp>, lho@apm.com,
        kdinh@apm.com, patches@apm.com
Subject: Re: [2/2] hwmon: xgene: Support PCC shared memory in IO region
Message-ID: <20171001143132.GA1237@roeck-us.net>
References: <1506014230-13933-3-git-send-email-hotran@apm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506014230-13933-3-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Sep 21, 2017 at 10:17:10AM -0700, hotran wrote:
> As the PCC shared memory could be in IO region which doesn't
> support caching, this patch simply uses ioremap() for IO region.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/xgene-hwmon.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 5cd327e..2dac1ed 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -32,6 +32,7 @@
>  #include <linux/kfifo.h>
>  #include <linux/mailbox_controller.h>
>  #include <linux/mailbox_client.h>
> +#include <linux/memblock.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -135,6 +136,14 @@ static u16 xgene_word_tst_and_clr(u16 *addr, u16 mask)
>  	return ret;
>  }
>  
> +static void __iomem *pcc_ioremap(phys_addr_t phys, size_t size)
> +{
> +	if (!memblock_is_memory(phys))
> +		return ioremap(phys, size);
> +
> +	return memremap(phys, size, MEMREMAP_WB);
> +}
> +
>  static int xgene_hwmon_pcc_rd(struct xgene_hwmon_dev *ctx, u32 *msg)
>  {
>  	struct acpi_pcct_shared_memory *generic_comm_base = ctx->pcc_comm_addr;
> @@ -690,9 +699,8 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		 */
>  		ctx->comm_base_addr = cppc_ss->base_address;
>  		if (ctx->comm_base_addr) {
> -			ctx->pcc_comm_addr = memremap(ctx->comm_base_addr,
> -							cppc_ss->length,
> -							MEMREMAP_WB);
> +			ctx->pcc_comm_addr = pcc_ioremap(ctx->comm_base_addr,
> +							 cppc_ss->length);
>  		} else {
>  			dev_err(&pdev->dev, "Failed to get PCC comm region\n");
>  			rc = -ENODEV;
