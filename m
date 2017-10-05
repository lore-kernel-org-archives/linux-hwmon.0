Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34521 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751421AbdJEUbZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 5 Oct 2017 16:31:25 -0400
Date: Thu, 5 Oct 2017 15:31:23 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/9] hwmon: gpio-fan: Move DT bindings to the right place
Message-ID: <20171005203123.3ks7umid7gha3io2@rob-hp-laptop>
References: <20170925230911.20824-1-linus.walleij@linaro.org>
 <20170925230911.20824-2-linus.walleij@linaro.org>
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
> ---
>  Documentation/devicetree/bindings/{gpio => hwmon}/gpio-fan.txt | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{gpio => hwmon}/gpio-fan.txt (100%)

Acked-by: Rob Herring <robh@kernel.org>

