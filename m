Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:52217 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932210AbdKACEg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2017 22:04:36 -0400
Date: Wed, 1 Nov 2017 11:04:33 +0900
From: Stafford Horne <shorne@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Message-ID: <20171101020433.GF29237@lianli.shorne-pla.net>
References: <20171101013421.8488-1-joel@jms.id.au>
 <d70eef8b-385e-4591-17b4-6fde3907df0f@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d70eef8b-385e-4591-17b4-6fde3907df0f@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 31, 2017 at 06:53:15PM -0700, Guenter Roeck wrote:
> On 10/31/2017 06:34 PM, Joel Stanley wrote:
> > The ASPEED SoC must deassert a reset in order to use the PWM/tach
> > peripheral.
> > 
> > The device tree bindings are updated to document the resets phandle, and
> > the example is updated to match what is expected for both the reset and
> > clock phandle. Note that the bindings should have always had the reset
> > controller, as the hardware is unusable without it.
> > 
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> Presumably the driver is being used. This change makes it incompatible with
> existing users. This is unacceptable; after all, it is possible that the
> device is taken out of reset by ROMMON or BIOS.
> 
> On top of that, the reset controller code is quite strict and issues a
> backtrace if CONFIG_RESET_CONTROLLER is not enabled. Yet, there is no
> dependency added on RESET_CONTROLLER. You might want to consider making
> the new control optional and using devm_reset_control_get_optional_exclusive().
> 
> The DT change should be a separate patch.
> 
> More comments below.

[..]

> >   	return PTR_ERR_OR_ZERO(hwmon);
> >   }
> > +static int aspeed_pwm_tacho_remove(struct platform_device *pdev)
> > +{
> > +	struct aspeed_pwm_tacho_data *priv = platform_get_drvdata(pdev);
> > +
> > +	reset_control_deassert(priv->rst);
> 
> This seems to be quite pointless. Also, did you test this code ?
> 
> > +
> > +	return 0;
> > +}
> > +
> >   static const struct of_device_id of_pwm_tacho_match_table[] = {
> >   	{ .compatible = "aspeed,ast2400-pwm-tacho", },
> >   	{ .compatible = "aspeed,ast2500-pwm-tacho", },
> > @@ -969,6 +989,7 @@ MODULE_DEVICE_TABLE(of, of_pwm_tacho_match_table);
> >   static struct platform_driver aspeed_pwm_tacho_driver = {
> >   	.probe		= aspeed_pwm_tacho_probe,
> > +	.probe		= aspeed_pwm_tacho_remove,

Also, this cant be right (should be .remove)?

> >   	.driver		= {
> >   		.name	= "aspeed_pwm_tacho",
> >   		.of_match_table = of_pwm_tacho_match_table,
> > 
> 
