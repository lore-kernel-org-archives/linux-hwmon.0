Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48719 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751356AbdFXP6r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Jun 2017 11:58:47 -0400
Subject: Re: [PATCH 1/2 v4] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
To: Patrick Venture <venture@google.com>, joel@jms.id.au
Cc: linux-hwmon@vger.kernel.org, emilyshaffer@google.com,
        peterh@google.com
References: <20170624153932.8895-1-venture@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <25244af5-84b9-c4c0-1960-86fffa47d4f5@roeck-us.net>
Date: Sat, 24 Jun 2017 08:58:44 -0700
MIME-Version: 1.0
In-Reply-To: <20170624153932.8895-1-venture@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/24/2017 08:39 AM, Patrick Venture wrote:
> Reduce the fan_tach period such that the fan controller uses a shorter
> period to measure the rpm.
> 
> The original period of 0x1000 was chosen as a conversative value from the
> reference implementation.  Through experimentation on the quanta-q71l
> board, I was able to drive the number down which ultimately reduced the
> time the controller would use to determine the fan_tach.  This value was
> recently tested and accepted downstream on the IBM Zaius board which uses
> the ast2500.
> 
> Future work: It may be worthwhile as this is a tunable parameter to the
> system, to allow overriding it through the device tree.
> 
> Testing: Tested on an ast2400 sitting on a quanta-q71l and ast2500 on
> power9.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Applied, thanks.

Guenter

> ---
> v4: Added explanation for value.
> v3: Added missing change log
> v2: Updated commit message language
> ---
>   drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 86e2ea8287a7..b2ab5612d8a4 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -160,7 +160,7 @@
>    * 11: reserved.
>    */
>   #define M_TACH_MODE 0x02 /* 10b */
> -#define M_TACH_UNIT 0x1000
> +#define M_TACH_UNIT 0x00c0
>   #define INIT_FAN_CTRL 0xFF
>   
>   struct aspeed_pwm_tacho_data {
> 

