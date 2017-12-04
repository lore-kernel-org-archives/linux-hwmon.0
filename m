Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:45423 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752916AbdLDEXr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Dec 2017 23:23:47 -0500
Received: by mail-it0-f65.google.com with SMTP id z6so9604109iti.4
        for <linux-hwmon@vger.kernel.org>; Sun, 03 Dec 2017 20:23:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1512353636-13985-1-git-send-email-linux@roeck-us.net>
References: <1512353636-13985-1-git-send-email-linux@roeck-us.net>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 4 Dec 2017 12:23:46 +0800
Message-ID: <CAARXrtmg-DYb7W_yZeVqMJz3P9LSPKoWSMOUTcmnHDsm7ZoaxA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (w83773g) Fix fault detection and reporting
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Reviewed-by: Lei YU <mine260309@gmail.com>

Thanks for catching this.


On Mon, Dec 4, 2017 at 10:13 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> Smatch reports:
>
> drivers/hwmon/w83773g.c:105
>         get_fault() warn: shift has higher precedence than mask
>
> Code analysis shows that the code is indeed wrong.
> Fix it, and while we are at it, drop unnecessary typecast.
>
> Fixes: 86a10c802362 ("hwmon: Add W83773G driver")
> Cc: Lei YU <mine260309@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/w83773g.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
> index 0b97c285b049..e858093ac806 100644
> --- a/drivers/hwmon/w83773g.c
> +++ b/drivers/hwmon/w83773g.c
> @@ -102,7 +102,7 @@ static int get_fault(struct regmap *regmap, int index, long *val)
>         if (ret < 0)
>                 return ret;
>
> -       *val = (u8)regval & 0x04 >> 2;
> +       *val = (regval & 0x04) >> 2;
>         return 0;
>  }
>
> --
> 2.7.4
>
