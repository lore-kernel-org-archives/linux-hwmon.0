Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:55945 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753364AbdJUQDE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Oct 2017 12:03:04 -0400
Date: Sat, 21 Oct 2017 09:02:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Support Opensource <support.opensource@diasemi.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: hwmon: da9052 Increase sample rate when using TSI
Message-ID: <20171021160254.GA12035@roeck-us.net>
References: <1508428304-31106-1-git-send-email-martyn.welch@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508428304-31106-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Oct 19, 2017 at 04:51:44PM +0100, Martyn Welch wrote:
> The TSI channel, which is usually used for touchscreen support, but can
> be used as 4 general purpose ADCs. When used as a touchscreen interface
> the touchscreen driver switches the device into 1ms sampling mode (rather
> than the default 10ms economy mode) as recommended by the manufacturer.
> When using the TSI channels as a general purpose ADC we are currently not
> doing this and testing suggests that this can result in ADC timeouts:
> 
> [ 5827.198289] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> [ 5827.728293] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> [ 5993.808335] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> [ 5994.328441] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> [ 5994.848291] da9052 spi2.0: timeout waiting for ADC conversion interrupt
> 
> Switching to the 1ms timing resolves this issue.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

Applied; replaced Cc: stable@ with Fixes:

> ---
>  drivers/hwmon/da9052-hwmon.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
> index 97a62f5..a973eb6 100644
> --- a/drivers/hwmon/da9052-hwmon.c
> +++ b/drivers/hwmon/da9052-hwmon.c
> @@ -477,6 +477,11 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
>  		/* disable touchscreen features */
>  		da9052_reg_write(hwmon->da9052, DA9052_TSI_CONT_A_REG, 0x00);
>  
> +		/* Sample every 1ms */
> +		da9052_reg_update(hwmon->da9052, DA9052_ADC_CONT_REG,
> +					  DA9052_ADCCONT_ADCMODE,
> +					  DA9052_ADCCONT_ADCMODE);
> +
>  		err = da9052_request_irq(hwmon->da9052, DA9052_IRQ_TSIREADY,
>  					 "tsiready-irq", da9052_tsi_datardy_irq,
>  					 hwmon);
