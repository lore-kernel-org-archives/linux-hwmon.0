Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49732 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751488AbcIMO3R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Sep 2016 10:29:17 -0400
Subject: Re: [PATCH] hwmon: (lm95241) Update module description to include
 LM95231
To: Axel Lin <axel.lin@ingics.com>
References: <1473751668-12177-1-git-send-email-axel.lin@ingics.com>
Cc: Davide Rizzo <elpa.rizzo@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9ef46b31-3129-22b0-8b6e-7da766ea47b0@roeck-us.net>
Date: Tue, 13 Sep 2016 07:29:15 -0700
MIME-Version: 1.0
In-Reply-To: <1473751668-12177-1-git-send-email-axel.lin@ingics.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/13/2016 12:27 AM, Axel Lin wrote:
> This driver also supports LM95231.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Applied to -next.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm95241.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
> index 844c2a0..8c573e6 100644
> --- a/drivers/hwmon/lm95241.c
> +++ b/drivers/hwmon/lm95241.c
> @@ -505,5 +505,5 @@ static struct i2c_driver lm95241_driver = {
>  module_i2c_driver(lm95241_driver);
>
>  MODULE_AUTHOR("Davide Rizzo <elpa.rizzo@gmail.com>");
> -MODULE_DESCRIPTION("LM95241 sensor driver");
> +MODULE_DESCRIPTION("LM95231/LM95241 sensor driver");
>  MODULE_LICENSE("GPL");
>

