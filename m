Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:34349 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753160AbdDLK1a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2017 06:27:30 -0400
MIME-Version: 1.0
In-Reply-To: <20170410134703.GB1918@mwanda>
References: <20170410134703.GB1918@mwanda>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Apr 2017 19:57:08 +0930
Message-ID: <CACPK8XcBAibmvN+xKqSWpP_benEYx7QRR8KgAdWsxszwY5n0hg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (tacho) Remove an unused variable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Apr 10, 2017 at 11:17 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> We never use this global variable.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Joel Stanley <joel@jms.id.au>

>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 2f22add5c73b..b96fff50a3ee 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -153,8 +153,6 @@
>  #define M_TACH_UNIT 0x1000
>  #define INIT_FAN_CTRL 0xFF
>
> -void __iomem *regs;
> -
>  struct aspeed_pwm_tacho_data {
>         struct regmap *regmap;
>         unsigned long clk_freq;
