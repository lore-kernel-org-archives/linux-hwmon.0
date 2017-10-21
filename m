Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:57008 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932134AbdJUP5y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Oct 2017 11:57:54 -0400
Date: Sat, 21 Oct 2017 08:57:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Ian King <colin.king@canonical.com>
Cc: George Joseph <george.joseph@fairview5.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: hwmon: (asc7621): remove redundant assignment to newval
Message-ID: <20171021155749.GA11642@roeck-us.net>
References: <20171018121038.29409-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171018121038.29409-1-colin.king@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 18, 2017 at 01:10:38PM +0100, Colin Ian King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The setting of newval to zero is redundant as the following if/else
> stanzas will always update newval to a new value. Remove the
> redundant setting, cleans up clang build warning:
> 
> drivers/hwmon/asc7621.c:582:2: warning: Value stored to 'newval' is
> never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/asc7621.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwmon/asc7621.c b/drivers/hwmon/asc7621.c
> index 4875e99b59c9..6d34c05a4f83 100644
> --- a/drivers/hwmon/asc7621.c
> +++ b/drivers/hwmon/asc7621.c
> @@ -579,7 +579,6 @@ static ssize_t show_pwm_enable(struct device *dev,
>  	mutex_unlock(&data->update_lock);
>  
>  	val = config | (altbit << 3);
> -	newval = 0;
>  
>  	if (val == 3 || val >= 10)
>  		newval = 255;
