Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34551 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751052AbdIKX5H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Sep 2017 19:57:07 -0400
Received: by mail-lf0-f65.google.com with SMTP id h80so4617182lfe.1
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Sep 2017 16:57:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170911224155.146738-1-venture@google.com>
References: <20170911224155.146738-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Sep 2017 09:56:45 +1000
Message-ID: <CACPK8Xedi=nffTNUFOrdzKdNc9EXbwVi_dGK6fYZCB_-6ANiTg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) increase fan tach period
To: Patrick Venture <venture@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Kun Yi <kunyi@google.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Patrick,

On Tue, Sep 12, 2017 at 8:41 AM, Patrick Venture <venture@google.com> wrote:
> The previous value reduced the time required to determine
> the fan value, however, it's also used as the final timeout
> mechanism.  The prevous value would work for any fan speed
> greater than around 3k RPM.  This increased value, lets the fan
> speeds return quickly but will wait longer to handle speeds below 3k
> RPM.

Given you've had to tweak this value a few times, should we instead
make it a device tree property?

We could still use the result of your findings to provide a sensible
default, but machines that have specific fan configurations could use
the property to tweak the driver.

Cheers,

Joel

>
> Testing: this value was determined through experimentation on the ast2400
> on the Quanta-q71l.  This configurations runs 8 fans attached to the
> controller.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 69b97d45e3cb..f914e5f41048 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -161,7 +161,7 @@
>   * 11: reserved.
>   */
>  #define M_TACH_MODE 0x02 /* 10b */
> -#define M_TACH_UNIT 0x00c0
> +#define M_TACH_UNIT 0x0210
>  #define INIT_FAN_CTRL 0xFF
>
>  /* How long we sleep in us while waiting for an RPM result. */
> --
> 2.14.1.581.gf28d330327-goog
>
