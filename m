Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35123 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932588AbeFTTiI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Jun 2018 15:38:08 -0400
Date: Wed, 20 Jun 2018 12:38:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joe Perches <joe@perches.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>,
        Julia Lawall <julia.lawall@lip6.fr>,
        cocci <cocci@systeme.lip6.fr>, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, avifishman70@gmail.com,
        yuenn@google.com, brendanhiggins@google.com, venture@google.com,
        joel@jms.id.au, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
Message-ID: <20180620193806.GA2054@roeck-us.net>
References: <20180619105352.97181-1-tmaimon77@gmail.com>
 <20180619105352.97181-3-tmaimon77@gmail.com>
 <20180620164853.GA3459@roeck-us.net>
 <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 20, 2018 at 11:25:08AM -0700, Joe Perches wrote:
> (adding Julia Lawall and cocci mailing list)
> 
> On Wed, 2018-06-20 at 09:48 -0700, Guenter Roeck wrote:
> []
> > > +static inline void npcm7xx_fan_start_capture(struct npcm7xx_pwm_fan_data *data,
> > > +						 u8 fan, u8 cmp)
> > > +{
> > > +	u8 fan_id = 0;
> > > +	u8 reg_mode = 0;
> > > +	u8 reg_int = 0;
> > > +	unsigned long flags;
> > > +
> > > +	fan_id = NPCM7XX_FAN_INPUT(fan, cmp);
> > > +
> > > +	/* to check whether any fan tach is enable */
> > > +	if (data->npcm7xx_fan[fan_id].FanStFlag != FAN_DISABLE) {
> > > +		/* reset status */
> > > +		spin_lock_irqsave(&data->npcm7xx_fan_lock[fan], flags);
> > > +
> > > +		data->npcm7xx_fan[fan_id].FanStFlag = FAN_INIT;
> > > +		reg_int = ioread8(NPCM7XX_FAN_REG_TIEN(data->fan_base, fan));
> > > +
> > > +		if (cmp == NPCM7XX_FAN_CMPA) {
> > > +			/* enable interrupt */
> > > +			iowrite8((u8) (reg_int | (NPCM7XX_FAN_TIEN_TAIEN |
> > > +						  NPCM7XX_FAN_TIEN_TEIEN)),
> > 
> > Is the (u8) typecast really necessary ? Seems unlikely.
> 
> The cast is not really necessary here as there would
> be an implicit cast already.
> 
> Some might complain about loss of type safety and
> "make W=123" would probably emit something here.
> 
I spent (wasted) some time browsing through the kernel.
Similar typecasts are only used if there is a real type change.
A warning here would not make sense unless NPCM7XX_FAN_TIEN_TAIEN
or NPCM7XX_FAN_TIEN_TEIEN would be outside the u8 range, and then
there would be one anyway.

So, no, I am not going to accept those typecasts. They just make the code
more difficult to read. For example, the code here could have been
simplified to something like

	reg_int = ioread8(NPCM7XX_FAN_REG_TIEN(data->fan_base, fan));
	reg_mode = ioread8(NPCM7XX_FAN_REG_TCKC(data->fan_base, fan));
	if (cmp == NPCM7XX_FAN_CMPA) {
		reg_int |= NPCM7XX_FAN_TIEN_TAIEN | NPCM7XX_FAN_TIEN_TEIEN;
		reg_mode |= NPCM7XX_FAN_TCKC_CLK1_APB;
	} else {
		reg_int |= NPCM7XX_FAN_TIEN_TBIEN | NPCM7XX_FAN_TIEN_TFIEN;
		reg_mode |= NPCM7XX_FAN_TCKC_CLK2_APB;
	}
	iowrite8(reg_int, NPCM7XX_FAN_REG_TIEN(data->fan_base, fan);
	iowrite8(reg_mode, NPCM7XX_FAN_REG_TCKC(data->fan_base, fan);

This, in turn, leads to the question if it is really not necessary
to _clear_ those mask bits in the same context.

Guenter

> But casts to the same type are not necessary.
> 
> A possible coccinelle script to find casts to the
> same type is below, but there are some false positives
> for things like __force and __user casts
> 
> Also, spatch (1.0.4) seems to have a defect for this
> when the type is used in operations that change a
> smaller type to int or unsigned int.
> 
> i.e.: (offset is u16, but offset * 2 is int)
> 
> While running the cocci script below:
> 
> HANDLING: drivers/net/ethernet/intel/igb/e1000_nvm.c
> diff = 
> diff -u -p a/drivers/net/drivers/net/ethernet/intel/igb/e1000_nvm.c b/drivers/net/ethernet/intel/igb/e1000_nvm.c
> --- a/drivers/net/ethernet/intel/igb/e1000_nvm.c
> +++ b/drivers/net/ethernet/intel/igb/e1000_nvm.c
> @@ -335,7 +335,7 @@ s32 igb_read_nvm_spi(struct e1000_hw *hw
>  
>  	/* Send the READ command (opcode + addr) */
>  	igb_shift_out_eec_bits(hw, read_opcode, nvm->opcode_bits);
> -	igb_shift_out_eec_bits(hw, (u16)(offset*2), nvm->address_bits);
> +	igb_shift_out_eec_bits(hw, (offset * 2), nvm->address_bits);
>  
>  	/* Read the data.  SPI NVMs increment the address with each byte
>  	 * read and will roll over if reading beyond the end.  This allows
> 
> ---
> 
> Anyway, here's the cocci script:
> 
> $ cat same_typecast.cocci
> @@
> type T;
> T foo;
> @@
> 
> -	(T *)&foo
> +	&foo
> 
> @@
> type T;
> T foo;
> @@
> 
> -	(T)foo
> +	foo
> 
