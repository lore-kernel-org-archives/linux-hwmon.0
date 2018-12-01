Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43395 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbeLBFs2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Dec 2018 00:48:28 -0500
Date: Sat, 1 Dec 2018 10:35:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Colin King <colin.king@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ltc2978): Fix spelling mistake "comppatible" ->
 "compatible"
Message-ID: <20181201183519.GA24535@roeck-us.net>
References: <20181126162832.28060-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181126162832.28060-1-colin.king@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 26, 2018 at 04:28:32PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the module description text, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ltc2978.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 07afb92bb36b..29c0b7219aaa 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -795,5 +795,5 @@ static struct i2c_driver ltc2978_driver = {
>  module_i2c_driver(ltc2978_driver);
>  
>  MODULE_AUTHOR("Guenter Roeck");
> -MODULE_DESCRIPTION("PMBus driver for LTC2978 and comppatible chips");
> +MODULE_DESCRIPTION("PMBus driver for LTC2978 and compatible chips");
>  MODULE_LICENSE("GPL");
