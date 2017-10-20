Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48086 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752938AbdJTTaa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 Oct 2017 15:30:30 -0400
Message-ID: <1508527826.3255.7.camel@collabora.co.uk>
Subject: Re: [PATCH] hwmon: da9052 Increase sample rate when using TSI
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>
Date: Fri, 20 Oct 2017 20:30:26 +0100
In-Reply-To: <6ED8E3B22081A4459DAC7699F3695FB7019413286D@SW-EX-MBX02.diasemi.com>
References: <1508428304-31106-1-git-send-email-martyn.welch@collabora.co.uk>
         <6ED8E3B22081A4459DAC7699F3695FB7019413286D@SW-EX-MBX02.diasemi.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, 2017-10-20 at 14:30 +0000, Steve Twiss wrote:
> Hi Martyn,
> 
> On 19 October 2017 16:52, Martyn Welch wrote:
> 
> > To: Support Opensource; Jean Delvare; Guenter Roeck
> > Subject: [PATCH] hwmon: da9052 Increase sample rate when using TSI
> > 
> > The TSI channel, which is usually used for touchscreen support, but can
> > be used as 4 general purpose ADCs. When used as a touchscreen interface
> > the touchscreen driver switches the device into 1ms sampling mode (rather
> > than the default 10ms economy mode) as recommended by the
> > manufacturer.
> > When using the TSI channels as a general purpose ADC we are currently not
> > doing this and testing suggests that this can result in ADC timeouts:
> > 
> > [ 5827.198289] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> > [ 5827.728293] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> > [ 5993.808335] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> > [ 5994.328441] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> > [ 5994.848291] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> > 
> > Switching to the 1ms timing resolves this issue.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> > ---
> >  drivers/hwmon/da9052-hwmon.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
> > index 97a62f5..a973eb6 100644
> > --- a/drivers/hwmon/da9052-hwmon.c
> > +++ b/drivers/hwmon/da9052-hwmon.c
> > @@ -477,6 +477,11 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
> >  		/* disable touchscreen features */
> >  		da9052_reg_write(hwmon->da9052, DA9052_TSI_CONT_A_REG, 0x00);
> > 
> > +		/* Sample every 1ms */
> > +		da9052_reg_update(hwmon->da9052, DA9052_ADC_CONT_REG,
> > +					  DA9052_ADCCONT_ADCMODE,
> > +					  DA9052_ADCCONT_ADCMODE);
> > +
> 
> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> 
> According to the DA9053 Datasheet, Revision 2.1, 31-Aug-2016, Section 18.3, page 143.
> 
> 	[The ADC] can be used either in high speed mode with measurements
> 	sequences repeated every 1ms or in economy mode with sequences
> 	performed every 10ms.
> 
> Also, DA9053 Datasheet, Revision 2.1, 31-Aug-2016, Section 18.17,
> Table 56: GP-ADC Control Registers, Register Address R82 ADC_CONT, page 150,
> 
> 	Bit 6, ADC_MODE
> 	0: Measurement sequence interval 10 ms (economy mode)
> 	1: Measurement sequence interval 1 ms (recommended for TSI mode)
> 
> I can't find any reason why a global change to the sampling rate cannot be
> applied during the ADC measurements in this case. After all, as you said, this
> is gated by the previous change by Sebastian Reichel which enforces a
> protection of ADC measurements when using the TSI as a general ADC (see commit
> ebf555111bc11a5da9144e4af524260731a8b968).
> 

Hi Steve,

We were running with the above mentioned patch/commit applied, but we
were getting the above timeouts during out testing.

The only way we have managed to make this reliable is to run in 1ms
mode. We suspected that there may be something in the "recommended for
TSI mode" regarding reliability.

Martyn

> Regards,
> Steve
> 


