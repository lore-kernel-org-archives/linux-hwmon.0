Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35759 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbeJJHzz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Oct 2018 03:55:55 -0400
Date: Tue, 9 Oct 2018 17:36:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin King <colin.king@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (tmp421) make const array 'names' static
Message-ID: <20181010003623.GA21661@roeck-us.net>
References: <20181009121157.21656-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181009121157.21656-1-colin.king@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 09, 2018 at 01:11:57PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The const array 'names' can be made static, saves populating it on
> the stack and will make it read-only.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/tmp421.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index e36399213324..8844c9565d2a 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -226,8 +226,10 @@ static int tmp421_detect(struct i2c_client *client,
>  {
>  	enum chips kind;
>  	struct i2c_adapter *adapter = client->adapter;
> -	const char * const names[] = { "TMP421", "TMP422", "TMP423",
> -				       "TMP441", "TMP442" };
> +	static const char * const names[] = {
> +		"TMP421", "TMP422", "TMP423",
> +		"TMP441", "TMP442"
> +	};
>  	int addr = client->addr;
>  	u8 reg;
>  
