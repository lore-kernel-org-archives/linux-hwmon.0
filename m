Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:37335 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751035AbdJAOaV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 1 Oct 2017 10:30:21 -0400
Date: Sun, 1 Oct 2017 07:30:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hotran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@riken.jp>, lho@apm.com,
        kdinh@apm.com, patches@apm.com
Subject: Re: [1/2] hwmon: xgene: Support hwmon v2
Message-ID: <20171001143019.GA1093@roeck-us.net>
References: <1506014230-13933-2-git-send-email-hotran@apm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506014230-13933-2-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Sep 21, 2017 at 10:17:09AM -0700, hotran wrote:
> This patch supports xgene-hwmon v2 which uses the non-cachable memory
> as the PCC shared memory.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/xgene-hwmon.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 9c0dbb8..5cd327e 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -761,6 +761,7 @@ static int xgene_hwmon_remove(struct platform_device *pdev)
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
>  	{"APMC0D29", 0},
> +	{"APMC0D8A", 0},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
