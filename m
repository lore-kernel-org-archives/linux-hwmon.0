Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1495893275-32017-1-git-send-email-linux@roeck-us.net>
References: <1495893275-32017-1-git-send-email-linux@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 May 2017 15:48:22 +0930
Message-ID: <CACPK8XdMask2f_Ewoo54+FPAjPbGJMxp2E5YeJHC-r-aokPkCg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Select REGMAP
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, May 27, 2017 at 11:24 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> The driver uses regmap and thus has to select it to avoid build
> errors such as the following.
>
> drivers/hwmon/aspeed-pwm-tacho.c:337:21: error: variable
>         'aspeed_pwm_tacho_regmap_config' has initializer but incomplete type

While we're at it the driver should also depend on OF.

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel


> ---
>  drivers/hwmon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 22d5eafd6815..5ef2814345ef 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -343,6 +343,7 @@ config SENSORS_ASB100
>
>  config SENSORS_ASPEED
>         tristate "ASPEED AST2400/AST2500 PWM and Fan tach driver"
> +       select REGMAP
>         help
>           This driver provides support for ASPEED AST2400/AST2500 PWM
>           and Fan Tacho controllers.
> --
> 2.7.4
>
