Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9CF331A6A
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 23:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149253; cv=none; b=BVIrsbtdggTaa6iZEKal4uivwwVzEnwJ1LbfP4HlGhUGo+T3yIWeZ42g/PtHlWA+SoU3En/j8gfrSvfWxoYPRerK+nJLYQT+57BjuQRFgLwvARzPusdxsA+puuw0Ss6kR2aHp1NDp2tO/QlzJIK84Tx+IZzcnDlNECOS/yXszkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149253; c=relaxed/simple;
	bh=gn+cOfF/F4cYRQ3QeQLFMG7qTcz35DSCAEo+VgG5XHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXAXyxRXzolTEfGpScY6bG4fHigX1KucR9yOU6hMTW1tEWYHjs7Hi2oxqzUNajP4ap4E+aAmnzVxpNNxNU8gqLXeHMJNdluyR8+Jo7S0suzocShhfG+K2rzMhU3hYuKrToNs3Uxfns17MKDUmsRLUHzcld8BqNXlMLuTEo4r/Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sq5geHye; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sq5geHye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD641C2BCAF
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 23:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772149252;
	bh=gn+cOfF/F4cYRQ3QeQLFMG7qTcz35DSCAEo+VgG5XHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sq5geHyeT7mlyWRsAy5G3+x9hfYtpm1fkKhZfpgdMeXSBKAUVqQU6QBnhBK27tZCk
	 1671PPU2P4SLucfP7D4Y0PGHc8vIPsb6QRQPpe7vsKKLJuP7svltPR3YKAoUyhcOMX
	 O+/sZuf75067/NI+YDemqjKCvr2HQU+tL214s9WUOYoWlTQQr06pNIjs29Q0sVRfLX
	 yo+ClUdUmS1XVfSd8qxaWFjd5MOT1TiQtxlmHCXQF3T+rnaCPUSEFdQ0mZhX/7khZd
	 CZm4j+fgh3X2eIuyvu/HwW6wVEz+6jbVTtKPhA+wRqBFRN3uaI7yp86UT4kbIH66pT
	 /j5DjF5spoq2A==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7927261a3acso12210737b3.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 15:40:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNO143m30ure9XcXzPssa8geyXWu/d36wLggh8mRb6XQtv4/XkSit+h5Cp7qu8m+HSkWpYUItgsVwDuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Ftwjj9mJcE2itCaJg0B1FwcxFo9jVkKSH7viPw/gq9O5g/nx
	X6DZOUfku98UO5j039hCitPTS/5Rd/a6VmEuGeRvUPiGP+1VMakcL6cYHet+iM2uLJzbS/qD25X
	cifoSNidI4Ztzm2s+IqxyfvX2LftPuRc=
X-Received: by 2002:a05:690c:386:b0:797:cbd1:64f7 with SMTP id
 00721157ae682-79885444b6fmr10392467b3.1.1772149251999; Thu, 26 Feb 2026
 15:40:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de> <20260225171545.1980385-5-o.rempel@pengutronix.de>
In-Reply-To: <20260225171545.1980385-5-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 00:40:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLnrXHi3dEGWDK1ymnKUvbtSr+BjFzxMXzH+gAS8RToj-A@mail.gmail.com>
X-Gm-Features: AaiRm538ikF13dD9gPC6ZLjWEUCrDkd6xK63wATo4wmFTjcG-RNo69RfFvroE7Q
Message-ID: <CAD++jLnrXHi3dEGWDK1ymnKUvbtSr+BjFzxMXzH+gAS8RToj-A@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] pinctrl: add NXP MC33978/MC34978 pinctrl driver
To: Oleksij Rempel <o.rempel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksij,

thanks for your patch!

On Wed, Feb 25, 2026 at 6:16=E2=80=AFPM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> - GPIO read/write: Translates physical switch states (open/closed)
>   to logical GPIO levels based on the configured switch topology
>   (Switch-to-Ground vs. Switch-to-Battery).
> - Emulated Output: Allows setting pins "high" or "low" by manipulating
>   the tri-state registers and hardware pull topologies.
> - Interrupt routing: Proxies GPIO interrupt requests to the irq_domain
>   managed by the parent MFD core driver.
>
> Signed-off-by: David Jander <david@protonic.nl>
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
(...)
> +/*
> + * The same thing for the wetting current registers, but those are 3 in =
total
> + * and each pin uses a 3-bit field, 8 pins per register, except for the =
last
> + * one.
> + */
> +#define MC33978_WREG(reg, pin) ((reg) + (MC33978_IS_SP(pin) ? \
> +                       0 : 2 + 2 * ((pin) / 8)))
> +#define MC33978_WSHIFT(pin)    (MC33978_IS_SP(pin) ? \
> +               (3 * ((pin) - MC33978_NUM_SG)) : (3 * ((pin) % 8)))
> +#define MC33978_WMASK(pin)     (7 << MC33978_WSHIFT(pin))
> +
> +#define MC33978_TRISTATE       0
> +#define MC33978_PU             1
> +#define MC33978_PD             2
> +
> +
> +

Nit: a bit of surplus space here?

> +       /* Interrupt state management */
> +       struct mutex lock;              /* Protects state, irq_rise/fall =
*/
> +       unsigned int state;             /* Last read input state */
> +       unsigned int irq_rise;          /* Rising edge config mask */
> +       unsigned int irq_fall;          /* Falling edge config mask */

Isn't regmap able to cache this stuff for you already so you
don't need local copies in the state?

> +static int mc33978_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +       return 0;
> +}
> +
> +static const char *mc33978_pinctrl_get_group_name(struct pinctrl_dev *pc=
tldev,
> +                                                       unsigned int grou=
p)
> +{
> +       return NULL;
> +}
> +
> +static int mc33978_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
> +                                               unsigned int group,
> +                                               const unsigned int **pins=
,
> +                                               unsigned int *num_pins)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static const struct pinctrl_ops mc33978_pinctrl_ops =3D {
> +       .get_groups_count =3D mc33978_pinctrl_get_groups_count,
> +       .get_group_name =3D mc33978_pinctrl_get_group_name,
> +       .get_group_pins =3D mc33978_pinctrl_get_group_pins,

Hmmmmmmm it looks like we should just patch the pin control
core to make these callback optional don't you think? It would
certainly cut down on boilerplate in your case.

Do you think you can do a patch like that?

> +#ifdef CONFIG_OF
> +       .dt_node_to_map =3D pinconf_generic_dt_node_to_map_pin,
> +       .dt_free_map =3D pinconf_generic_dt_free_map,
> +#endif

Does this driver have any value without OF?

Can't you just depend on OF in Kconfig and delete the ifdefs?

> +       /* 1. Hardware-Schutz: SG-Pins haben physikalisch keine Pull-Down=
s */
> +       /* 2. Richtung konfigurieren (Ausschlie=C3=9Flich f=C3=BCr SP-Pin=
s) */
> +       /* 3. Pull-Widerstand aktivieren oder in Tri-State versetzen
> +        * TRI-Register: 0 =3D Pull aktiv, 1 =3D Tri-State (Hochohmig)
> +        */

Ich bewundere die deutsche Sprache, muss Sie aber dennoch bitten,
dies auf Angels=C3=A4chsisch zu schreiben. Es tut mir leid.

> +/*
> + * Hardware constraint regarding PIN_CONFIG_BIAS_PULL_UP/DOWN:
> + * The MC33978 utilizes active constant current sources (wetting current=
s)
> + * rather than passive pull-resistors. Since the equivalent ohmic resist=
ance
> + * scales dynamically with the fluctuating board voltage (VBATP), comput=
ing
> + * a static ohm value is physically invalid.
> + * The driver intentionally ignores resistance arguments during configur=
ation
> + * and continuously reports 0 ohms to the pinctrl framework.
> + */

Fair enough, exotic hardware yields exotic code.

> +static int mc33978_direction_input(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +       struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +
> +       /*
> +        * This chip only has inputs. We emulate outputs by setting a
> +        * wetting current and/or using the tri-state register to turn it=
 on
> +        * and off. If a pin was an output and is now tri-stated, we shou=
ld
> +        * disable the tri-state now to make the input work correctly.
> +        */
> +       mutex_lock(&mpc->lock);
> +       mc33978_update_bits(mpc, MC33978_SPSG(MC33978_REG_TRI_SP, offset)=
,
> +                       MC33978_PINMASK(offset), 0);
> +       mutex_unlock(&mpc->lock);
> +
> +       return 0;
> +}
> +
> +static int mc33978_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +       int status, ret;
> +       bool is_switch_closed;
> +       bool is_switch_to_ground =3D true; /* Default for all SG pins */
> +
> +       mutex_lock(&mpc->lock);
> +
> +       /* Read hardware switch status (open or closed) */
> +       ret =3D mc33978_read(mpc, MC33978_REG_READ_IN, &status);
> +       if (ret < 0) {
> +               mutex_unlock(&mpc->lock);
> +               return 0;
> +       }
> +       is_switch_closed =3D !!(status & BIT(offset));
> +
> +       /* Determine current topology for SP pins */
> +       if (MC33978_IS_SP(offset)) {
> +               int config_reg;
> +
> +               ret =3D mc33978_read(mpc, MC33978_REG_CONFIG, &config_reg=
);
> +               if (ret =3D=3D 0) {
> +                       /* CONFIG: 0 =3D Switch-to-Ground (PU), 1 =3D Swi=
tch-to-Battery (PD) */
> +                       if (config_reg & MC33978_PINMASK(offset))
> +                               is_switch_to_ground =3D false;
> +               }
> +       }
> +
> +       mutex_unlock(&mpc->lock);
> +
> +       /* Translate hardware switch semantics to logical GPIO levels */
> +       if (is_switch_to_ground) {
> +               /* SG: Switch open -> High (1), Switch to GND -> Low (0) =
*/
> +               status =3D !is_switch_closed;
> +       } else {
> +               /* SB: Switch open -> Low (0), Switch to Vbat -> High (1)=
 */
> +               status =3D is_switch_closed;
> +       }

I don't think this is right.

The driver needs to report the *physical* level on the line. Then the
lines need to be flagged with GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH
on the consumers in the device tree.

The GPIO_ACTIVE_LOW will provide inversion in gpiolib.

We need to do it this way otherwise the double-inversion cases
when people *actually* start to use GPIO_ACTIVE_LOW in the
device tree for a SG input will start to look like madness.

> +static int mc33978_get_multiple(struct gpio_chip *chip,
> +                               unsigned long *mask, unsigned long *bits)
> +{
> +       struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +       unsigned int status;
> +       unsigned int config_reg =3D 0;
> +       unsigned int inv_mask;
> +       int ret;
> +
> +       mutex_lock(&mpc->lock);
> +
> +       ret =3D mc33978_read(mpc, MC33978_REG_READ_IN, &status);
> +       if (ret)
> +               goto out_unlock;
> +
> +       /* Read CONFIG register only if the requested mask involves SP pi=
ns */
> +       if (*mask & MC33978_SP_MASK) {
> +               ret =3D mc33978_read(mpc, MC33978_REG_CONFIG, &config_reg=
);
> +               if (ret)
> +                       goto out_unlock;
> +       }
> +
> +       /*
> +        * SG pins (0-13) are always Switch-to-Ground.
> +        * SP pins (14-21) are Switch-to-Ground if their CONFIG bit is 0.
> +        * Switch-to-Ground logic: HW bit 0 (open) -> Logical 1 (High)
> +        * HW bit 1 (closed) -> Logical 0 (Low)
> +        * We create a mask for all Switch-to-Ground pins and XOR the sta=
tus.
> +        */
> +       inv_mask =3D MC33978_SG_MASK | (~(config_reg << MC33978_NUM_SG) &=
 MC33978_SP_MASK);
> +
> +       *bits =3D (status ^ inv_mask) & *mask;

Again, I disagree with this.

All consumers should use GPIO_ACTIVE_LOW.

> +static int mc33978_set(struct gpio_chip *chip, unsigned int offset, int =
value)
> +{
> +       struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +       int pull;
> +       int ret;
> +
> +       /*
> +        * We only have inputs with wetting current sources, that we mis-=
use
> +        * as open-drain/-source outputs.
> +        */
> +       if (MC33978_IS_SP(offset)) {
> +               pull =3D value ? MC33978_PU : MC33978_PD;
> +               value =3D 1;
> +       } else {
> +               pull =3D MC33978_PU;
> +       }
> +
> +       mutex_lock(&mpc->lock);
> +
> +       /*
> +        * Break-before-make sequencing to prevent hardware glitches (spi=
kes).
> +        * Since SPI transfers take time, writing the pull and tri-state
> +        * registers in the wrong order causes a brief moment where curre=
nt
> +        * flows to the pin before it is masked, causing a visible LED fl=
ash.
> +        */
> +       if (value) {
> +               /*
> +                * Turn ON: Configure the underlying current source (pull=
) first,
> +                * then route it to the pin by disabling tri-state.
> +                */
> +               ret =3D mc33978_set_pull(mpc, offset, pull);
> +               if (ret)
> +                       goto out_unlock;
> +
> +               ret =3D mc33978_update_bits(mpc, MC33978_SPSG(MC33978_REG=
_TRI_SP, offset),
> +                                         MC33978_PINMASK(offset), 0);
> +       } else {
> +               /*
> +                * Turn OFF: Isolate the pin first by enabling tri-state,
> +                * then safely disable the underlying current source.
> +                */
> +               ret =3D mc33978_update_bits(mpc, MC33978_SPSG(MC33978_REG=
_TRI_SP, offset),
> +                                         MC33978_PINMASK(offset), MC3397=
8_PINMASK(offset));
> +       }

So here I'm a bit confused about what to do and the best way to
handle this.

gpiolib contains "open drain/source emulation" where we essentially
set the line as input to achieve high impedance and let pull up/down
resistors do their job.

In device tree this is possible, for example:

        i2c {
                compatible =3D "i2c-gpio";
                sda-gpios =3D <&gpio0 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>=
;
                scl-gpios =3D <&gpio0 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>=
;
                #address-cells =3D <1>;
                #size-cells =3D <0>;
...

How do you expect your code to react to these GPIO_OPEN_DRAIN
settings?

What gpiolib does is set the flag GPIOD_FLAG_OPEN_DRAIN
on the line internally, then in gpiod_direction_output_nonotify():

        if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &flags)) {
                /* First see if we can enable open drain in hardware */
                ret =3D gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_DRAIN);
                if (!ret)
                        goto set_output_value;
                /* Emulate open drain by not actively driving the line high=
 */
                if (value)
                        goto set_output_flag;
        } else if (test_bit(GPIOD_FLAG_OPEN_SOURCE, &flags)) {
                ret =3D gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_SOURCE)=
;
                if (!ret)
                        goto set_output_value;
                /* Emulate open source by not actively driving the line low=
 */
                if (!value)
                        goto set_output_flag;
        } else {
                gpio_set_config(desc, PIN_CONFIG_DRIVE_PUSH_PULL);
        }

set_output_value:
        ret =3D gpio_set_bias(desc);
        if (ret)
                return ret;
        return gpiod_direction_output_raw_commit(desc, value);

set_output_flag:
        ret =3D gpiod_direction_input_nonotify(desc);
        if (ret)
                return ret;
        /*
         * When emulating open-source or open-drain functionalities by not
         * actively driving the line (setting mode to input) we still need =
to
         * set the IS_OUT flag or otherwise we won't be able to set the lin=
e
         * value anymore.
         */
        set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
        return 0;

With this as background I think it is better if you:

- You have already implemented open drain (etc) in
  the .set_config callback of the gpio_chip.

- Whenever a line that is effectively an open drain or open
  source line, then *flag that* on the consumer in the device
  tree using the DT flags GPIO_LINE_OPEN_SOURCE
  or GPIO_LINE_OPEN_DRAIN

I guess that flag goes for anything using this chip?
GPIO_LINE_OPEN_SOURCE seems like a compulatory
flag, just like GPIO_ACTIVE_LOW is compulsory for
all SG inputs?

I understand that this makes the device trees more complicated
but I think it *does* describe the hardware way better, and the
presence of GPIO_LINE_OPEN_DRAIN is something your driver
*must* support anyway, otherwise gpiolib will start to emulate it
and there will be disaster when the driver is trying to second-guess
what the core actually wants to handle.

With these changes, I also wonder if it will be possible to use
GPIO_REGMAP to simplify the remaining set/get callbacks?

> +static int mc33978_gpio_to_irq(struct gpio_chip *chip, unsigned int offs=
et)
> +{
> +       struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +       int virq;
> +
> +       if (!mpc->domain)
> +               return -ENXIO;
> +
> +       /* * Erzeugt das Mapping zur Laufzeit (oder gibt ein bestehendes =
zur=C3=BCck).
> +        * Ohne diesen Aufruf bleibt die lineare IRQ-Domain leer.
> +        */

Language...

> +       virq =3D irq_create_mapping(mpc->domain, offset);
> +       if (!virq) {
> +               dev_err(mpc->dev, "Failed to map hwirq %u to virq\n", off=
set);
> +               return -ENXIO;
> +       }
> +
> +       return virq;
> +}

Brrrr please try at all costs to create custom gpio_to_irq() callbacks!

Try to your hardest to use the gpiolib irqchip that will provide a proper
.to_irq() callback and set up the interrupts in the core. There are
many examples of how to do this, also in MFD devices using
regmap.

But maybe the MFD has some central IRQ handling? So I'm not
100% sure here.

Yours,
Linus Walleij
