Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46784 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932142AbeGCHvV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 3 Jul 2018 03:51:21 -0400
Date: Tue, 3 Jul 2018 09:51:18 +0200
From: Jean Delvare <jdelvare@suse.de>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Mark expected switch fall-throughs
Message-ID: <20180703095118.5f08abd6@endymion>
In-Reply-To: <20180702213017.GA27242@embeddedor.com>
References: <20180702213017.GA27242@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Gustavo,

On Mon, 2 Jul 2018 16:30:17 -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.

That's a great initiative, thanks for doing that.

> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/hwmon/emc1403.c | 2 ++
>  drivers/hwmon/nct6775.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> index 1ea7ca5..aaebeb7 100644
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
> @@ -443,8 +443,10 @@ static int emc1403_probe(struct i2c_client *client,
>  	switch (id->driver_data) {
>  	case emc1404:
>  		data->groups[2] = &emc1404_group;
> +		/* fall through */
>  	case emc1403:
>  		data->groups[1] = &emc1403_group;
> +		/* fall through */
>  	case emc1402:
>  		data->groups[0] = &emc1402_group;
>  	}
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index 3714990..c6bd61e 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -2541,7 +2541,7 @@ static void pwm_update_registers(struct nct6775_data *data, int nr)
>  	case thermal_cruise:
>  		nct6775_write_value(data, data->REG_TARGET[nr],
>  				    data->target_temp[nr]);
> -		/* intentional */
> +		/* fall through  */

Do you know which -Wimplicit-fallthrough level we will be using? Level
1 would be happy with the initial comment, no change would be needed.
If level 2-4 then yes the change is needed.

>  	default:
>  		reg = nct6775_read_value(data, data->REG_FAN_MODE[nr]);
>  		reg = (reg & ~data->tolerance_mask) |

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
