Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55974 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdE3WJx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 May 2017 18:09:53 -0400
Date: Tue, 30 May 2017 15:09:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Select REGMAP
Message-ID: <20170530220951.GA9139@roeck-us.net>
References: <1495893275-32017-1-git-send-email-linux@roeck-us.net>
 <CACPK8XdMask2f_Ewoo54+FPAjPbGJMxp2E5YeJHC-r-aokPkCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XdMask2f_Ewoo54+FPAjPbGJMxp2E5YeJHC-r-aokPkCg@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, May 30, 2017 at 03:48:22PM +0930, Joel Stanley wrote:
> On Sat, May 27, 2017 at 11:24 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > The driver uses regmap and thus has to select it to avoid build
> > errors such as the following.
> >
> > drivers/hwmon/aspeed-pwm-tacho.c:337:21: error: variable
> >         'aspeed_pwm_tacho_regmap_config' has initializer but incomplete type
> 
> While we're at it the driver should also depend on OF.
> 
The driver compiles without it, so that isn't strictly necessary.

> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Acked-by: Joel Stanley <joel@jms.id.au>
> 
Thanks,

Guenter

> Cheers,
> 
> Joel
> 
> 
> > ---
> >  drivers/hwmon/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 22d5eafd6815..5ef2814345ef 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -343,6 +343,7 @@ config SENSORS_ASB100
> >
> >  config SENSORS_ASPEED
> >         tristate "ASPEED AST2400/AST2500 PWM and Fan tach driver"
> > +       select REGMAP
> >         help
> >           This driver provides support for ASPEED AST2400/AST2500 PWM
> >           and Fan Tacho controllers.
> > --
> > 2.7.4
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
