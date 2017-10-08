Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42031 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751027AbdJHPDS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Oct 2017 11:03:18 -0400
Date: Sun, 8 Oct 2017 07:21:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>, devicetree@vger.kernel.org
Subject: Re: [1/9] hwmon: gpio-fan: Move DT bindings to the right place
Message-ID: <20171008142141.GA13877@roeck-us.net>
References: <20170925230911.20824-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170925230911.20824-2-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 26, 2017 at 01:09:03AM +0200, Linus Walleij wrote:
> This moves the GPIO fan bindings to the hwmon bindings. The GPIO
> fan is a hwmon class hardware, not related to GPIO other than being
> a consumer of GPIOs.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/{gpio => hwmon}/gpio-fan.txt | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{gpio => hwmon}/gpio-fan.txt (100%)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-fan.txt b/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/gpio/gpio-fan.txt
> rename to Documentation/devicetree/bindings/hwmon/gpio-fan.txt
