Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43203 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbeL1PLD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Dec 2018 10:11:03 -0500
Date: Fri, 28 Dec 2018 07:11:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tony_Ao@wiwynn.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matt_Chen@wiwynn.com,
        vijaykhemka@fb.com
Subject: Re: [PATCH] hwmon: (tmp421) Correct the misspelling of the tmp442
 compatible attribute in OF device ID table
Message-ID: <20181228151100.GA22978@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Dec 28, 2018 at 02:03:22AM +0000, Tony_Ao@wiwynn.com wrote:
> Hi there,
> 
> Correct a typo in OF device ID table.
> The last one should be 'ti,tmp442'.
> 

Good catch. Unfortunately, the patch is corrupted and does not apply
(tabs replaced with spaces). Please resend and make sure that your
mailer leaves it alone (possibly use git send-email).

Also, please drop the "confidential" trailer.

Thanks,
Guenter

> Signed-off-by: Cheng-Min Ao <tony_ao@wiwynn.com>
> Signed-off-by: Yu-Hsiang Chen <matt_chen@wiwynn.com>
> ---
> drivers/hwmon/tmp421.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 8844c95..7053be5 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -88,7 +88,7 @@
>                 .data = (void *)2
>         },
>         {
> -               .compatible = "ti,tmp422",
> +               .compatible = "ti,tmp442",
>                 .data = (void *)3
>         },
>         { },
> --
> 1.9.1
> 
> Regards,
> Tony
> 
> 
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient. 
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
