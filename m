Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx3.molgen.mpg.de ([141.14.17.11]:45979 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S935291AbeFMUGV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jun 2018 16:06:21 -0400
Subject: Re: [PATCH] hwmon: (nct6775) Fix loop limit
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <1528902636-9810-1-git-send-email-linux@roeck-us.net>
From: Paul Menzel <pmenzel+linux-hwmon@molgen.mpg.de>
Message-ID: <5db32968-c376-2568-6f1f-31f12e2b4237@molgen.mpg.de>
Date: Wed, 13 Jun 2018 22:06:16 +0200
MIME-Version: 1.0
In-Reply-To: <1528902636-9810-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Dear Guenter,


Am 13.06.2018 um 17:10 schrieb Guenter Roeck:
> Commit cc66b3038254 ("hwmon: (nct6775) Rework temperature source and label
> handling") changed a loop limit from "data->temp_label_num - 1" to "32",
> as part of moving from a string array to a bit mask. This results in the
> following error, reported by UBSAN.
> 
> UBSAN: Undefined behaviour in drivers/hwmon/nct6775.c:4179:27
> shift exponent 32 is too large for 32-bit type 'long unsigned int'
> 
> Similar to the original loop, the limit has to be one less than the
> number of bits.
> 
> Fixes: cc66b3038254 ("hwmon: (nct6775) Rework temperature source and label handling")
> Reported-by: Paul Menzel <pmenzel+linux-hwmon@molgen.mpg.de>
> Cc: Paul Menzel <pmenzel+linux-hwmon@molgen.mpg.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   drivers/hwmon/nct6775.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index aebce560bfaf..b14eb73bc3c9 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -4175,7 +4175,7 @@ static int nct6775_probe(struct platform_device *pdev)
>   	 * The temperature is already monitored if the respective bit in <mask>
>   	 * is set.
>   	 */
> -	for (i = 0; i < 32; i++) {
> +	for (i = 0; i < 31; i++) {
>   		if (!(data->temp_mask & BIT(i + 1)))
>   			continue;
>   		if (!reg_temp_alternate[i])

Thank you for the patch. I tested that the UBSAN message is gone, and 
that the module loads.

Tested-by: Paul Menzel <pmenzel+linux-hwmon@molgen.mpg.de>


Kind regards

Paul
