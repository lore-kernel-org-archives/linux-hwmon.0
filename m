Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51140 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751231AbdFWP30 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Jun 2017 11:29:26 -0400
Date: Fri, 23 Jun 2017 08:29:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Venture <venture@google.com>
Cc: joel@jms.id.au, linux-hwmon@vger.kernel.org,
        emilyshaffer@google.com, peterh@google.com
Subject: Re: [PATCH 1/2 v2] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
Message-ID: <20170623152923.GA10652@roeck-us.net>
References: <20170623150525.7014-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170623150525.7014-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jun 23, 2017 at 08:05:25AM -0700, Patrick Venture wrote:
> Reduce the fan_tach period such that the fan controller uses a shorter
> period to measure the rpm.
> 
> Testing: Tested on an ast2400 sitting on a quanta-q71l.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Please provide change logs, and keep version numbers consistent
for a series even if one patch doesn't change.

Now I'll have to go back, find the flurry of older versions, and try
to find out what changed and why. This takes time which I don't have.
I'll probably only get to this after the next commit window, sorry.

Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 86e2ea8287a7..b2ab5612d8a4 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -160,7 +160,7 @@
>   * 11: reserved.
>   */
>  #define M_TACH_MODE 0x02 /* 10b */
> -#define M_TACH_UNIT 0x1000
> +#define M_TACH_UNIT 0x00c0
>  #define INIT_FAN_CTRL 0xFF
>  
>  struct aspeed_pwm_tacho_data {
> -- 
> 2.13.1.611.g7e3b11ae1-goog
> 
