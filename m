Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47984 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751281AbdFXNxQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Jun 2017 09:53:16 -0400
Subject: Re: [PATCH 1/2 v3] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
To: Patrick Venture <venture@google.com>, joel@jms.id.au
Cc: linux-hwmon@vger.kernel.org, emilyshaffer@google.com,
        peterh@google.com
References: <20170624033946.120501-1-venture@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d2b275f1-cbb2-5266-51e0-4c50aa9b8798@roeck-us.net>
Date: Sat, 24 Jun 2017 06:53:14 -0700
MIME-Version: 1.0
In-Reply-To: <20170624033946.120501-1-venture@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/23/2017 08:39 PM, Patrick Venture wrote:
> Reduce the fan_tach period such that the fan controller uses a shorter
> period to measure the rpm.
> 

This explains what you are doing, but not why. What is the problem you are
trying to solve, and why doesn't it create other problems ? Presumably there
was a reason for the larger period used earlier. If not, if it was just a
conservative setting, here is the place to say it.

I'd update the information myself, but I don't think the underlying specification
is public, or at least I did not find it.

Guenter

> Testing: Tested on an ast2400 sitting on a quanta-q71l.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
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

