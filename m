Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7D3ED107
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189924; cv=none; b=LBut3OidbSg0jlQfV3TjK2Uv3B6cIJDus9mHnmrmNsP7DlA+Jlbt2h26zGevfRbZkRShEjsloUnhpnH3ni/4ncVm91+LAyv1LPGpECGQAKxFfDu0WMnMcdkzUbc9DyS7MiGv279wFEsJtrO5KbbYIPFhpejYLzDdLaYdSdIO1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189924; c=relaxed/simple;
	bh=BO5OlN57T54SI4qUW7xU1RSBlvNCdd8GFNxg7xaMQNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8LAiW4Z6kLCD1J6IxgZw4kf94QOwoucqsmgkEp/9Q1eoSDPpXd94nFUf173BEgEvrilZgBYcKhP9o8k3lrQtuiGy58sO2c+WHV/XoYusv1z3UkERYr96wFVzoIWqbvAf9nKRCNZCKXDXo0cyEddFtuIIHrHZMZMgUBggQN8Mng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvY5-0008Dk-5l; Fri, 27 Feb 2026 11:58:21 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvY3-002shI-1d;
	Fri, 27 Feb 2026 11:58:20 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvY4-00000008dO9-36mD;
	Fri, 27 Feb 2026 11:58:20 +0100
Date: Fri, 27 Feb 2026 11:58:20 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 4/8] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Message-ID: <aaF4zKMK1XOT7L40@pengutronix.de>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-5-o.rempel@pengutronix.de>
 <CAD++jLnrXHi3dEGWDK1ymnKUvbtSr+BjFzxMXzH+gAS8RToj-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLnrXHi3dEGWDK1ymnKUvbtSr+BjFzxMXzH+gAS8RToj-A@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Hi Linus,

On Fri, Feb 27, 2026 at 12:40:40AM +0100, Linus Walleij wrote:
..
> > +static int mc33978_get(struct gpio_chip *chip, unsigned int offset)
> > +{
> > +       struct mc33978_pinctrl *mpc = gpiochip_get_data(chip);
> > +       int status, ret;
> > +       bool is_switch_closed;
> > +       bool is_switch_to_ground = true; /* Default for all SG pins */
> > +
> > +       mutex_lock(&mpc->lock);
> > +
> > +       /* Read hardware switch status (open or closed) */
> > +       ret = mc33978_read(mpc, MC33978_REG_READ_IN, &status);
> > +       if (ret < 0) {
> > +               mutex_unlock(&mpc->lock);
> > +               return 0;
> > +       }
> > +       is_switch_closed = !!(status & BIT(offset));
> > +
> > +       /* Determine current topology for SP pins */
> > +       if (MC33978_IS_SP(offset)) {
> > +               int config_reg;
> > +
> > +               ret = mc33978_read(mpc, MC33978_REG_CONFIG, &config_reg);
> > +               if (ret == 0) {
> > +                       /* CONFIG: 0 = Switch-to-Ground (PU), 1 = Switch-to-Battery (PD) */
> > +                       if (config_reg & MC33978_PINMASK(offset))
> > +                               is_switch_to_ground = false;
> > +               }
> > +       }
> > +
> > +       mutex_unlock(&mpc->lock);
> > +
> > +       /* Translate hardware switch semantics to logical GPIO levels */
> > +       if (is_switch_to_ground) {
> > +               /* SG: Switch open -> High (1), Switch to GND -> Low (0) */
> > +               status = !is_switch_closed;
> > +       } else {
> > +               /* SB: Switch open -> Low (0), Switch to Vbat -> High (1) */
> > +               status = is_switch_closed;
> > +       }
> 
> I don't think this is right.
> 
> The driver needs to report the *physical* level on the line. Then the
> lines need to be flagged with GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH
> on the consumers in the device tree.

Returning the physical level is actually exactly what this code is
trying to do. I need to rewrite the comment :) 

The issue is that the MC33978 hardware does not report the physical
voltage level on the pin. As per section 9.10.27 (Read switch status) of
the datasheet: "A Logic [1] means the switch is closed while a Logic [0]
is an open switch."

Because it only reports this abstract "contact status", I have to
translate it back to the actual physical voltage level (1 = High, 0 =
Low) based on the pin's current configuration:

In Switch-to-Ground (SG) mode: the status bit stays 0 when the physical
voltage on the line is High (open), and reports 1 when the physical
voltage is Low (shorted to ground).
In Switch-to-Battery (SB) mode: the exact opposite happens.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
