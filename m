Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46463 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753089AbdDJUbn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Apr 2017 16:31:43 -0400
Subject: Re: [PATCH 1/2] hwmon: (tacho) Fix a condition in
 aspeed_get_fan_tach_ch_rpm()
To: Dan Carpenter <dan.carpenter@oracle.com>,
        Joel Stanley <joel@jms.id.au>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
References: <20170410134621.GA1918@mwanda>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0e7d4c14-0710-cf45-32d6-a805004cb8e2@roeck-us.net>
Date: Mon, 10 Apr 2017 13:31:38 -0700
MIME-Version: 1.0
In-Reply-To: <20170410134621.GA1918@mwanda>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Dan,

On 04/10/2017 06:46 AM, Dan Carpenter wrote:
> What we want is for regmap_read() to return zero meaning success and
> for RESULT_STATUS_MASK which is BIT(31) to be set set.
>
> The current code is buggy in two ways.  It requires both failure
> conditions should be met before it fails.  And if it times out then it
> returns zero instead of -EIO.
>
> Fixes: cc96f6f6d766 ("hwmon: Support for ASPEED PWM/Fan tach")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  Not tested.

Thanks for the report. My fault - I had asked for this and the problem
in the next patch to be fixed, I got a new version of the patch with the fix,
but I did not find the time to apply it. Sorry for the noise.

Guenter

>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 29010ad94208..2f22add5c73b 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -512,11 +512,11 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>
>  	msleep(sec);
>
> -	while (!(regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val))
> -			& !(val & RESULT_STATUS_MASK)) {
> +	while (regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val) ||
> +	       !(val & RESULT_STATUS_MASK)) {
>  		timeout++;
>  		if (timeout > 1)
> -			return 0;
> +			return -EIO;
>  		msleep(sec);
>  	}
>
>

