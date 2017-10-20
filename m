Return-Path: <stwiss.opensource@diasemi.com>
Return-path: <stwiss.opensource@diasemi.com>
From: Steve Twiss <stwiss.opensource@diasemi.com>
To: Martyn Welch <martyn.welch@collabora.co.uk>, Jean Delvare
	<jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Support Opensource
	<Support.Opensource@diasemi.com>
Subject: RE: [PATCH] hwmon: da9052 Increase sample rate when using TSI
Date: Fri, 20 Oct 2017 14:30:19 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB7019413286D@SW-EX-MBX02.diasemi.com>
References: <1508428304-31106-1-git-send-email-martyn.welch@collabora.co.uk>
In-Reply-To: <1508428304-31106-1-git-send-email-martyn.welch@collabora.co.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Hi Martyn,

On 19 October 2017 16:52, Martyn Welch wrote:

> To: Support Opensource; Jean Delvare; Guenter Roeck
> Subject: [PATCH] hwmon: da9052 Increase sample rate when using TSI
>=20
> The TSI channel, which is usually used for touchscreen support, but can
> be used as 4 general purpose ADCs. When used as a touchscreen interface
> the touchscreen driver switches the device into 1ms sampling mode (rather
> than the default 10ms economy mode) as recommended by the
> manufacturer.
> When using the TSI channels as a general purpose ADC we are currently not
> doing this and testing suggests that this can result in ADC timeouts:
>=20
> [ 5827.198289] da9052 spi2.0: timeout waiting for ADC conversion interrup=
t
> [ 5827.728293] da9052 spi2.0: timeout waiting for ADC conversion interrup=
t
> [ 5993.808335] da9052 spi2.0: timeout waiting for ADC conversion interrup=
t
> [ 5994.328441] da9052 spi2.0: timeout waiting for ADC conversion interrup=
t
> [ 5994.848291] da9052 spi2.0: timeout waiting for ADC conversion interrup=
t
>=20
> Switching to the 1ms timing resolves this issue.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> ---
>  drivers/hwmon/da9052-hwmon.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
> index 97a62f5..a973eb6 100644
> --- a/drivers/hwmon/da9052-hwmon.c
> +++ b/drivers/hwmon/da9052-hwmon.c
> @@ -477,6 +477,11 @@ static int da9052_hwmon_probe(struct platform_device=
 *pdev)
>  		/* disable touchscreen features */
>  		da9052_reg_write(hwmon->da9052, DA9052_TSI_CONT_A_REG, 0x00);
>=20
> +		/* Sample every 1ms */
> +		da9052_reg_update(hwmon->da9052, DA9052_ADC_CONT_REG,
> +					  DA9052_ADCCONT_ADCMODE,
> +					  DA9052_ADCCONT_ADCMODE);
> +

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

According to the DA9053 Datasheet, Revision 2.1, 31-Aug-2016, Section 18.3,=
 page 143.

	[The ADC] can be used either in high speed mode with measurements
	sequences repeated every 1ms or in economy mode with sequences
	performed every 10ms.

Also, DA9053 Datasheet, Revision 2.1, 31-Aug-2016, Section 18.17,
Table 56: GP-ADC Control Registers, Register Address R82 ADC_CONT, page 150=
,

	Bit 6, ADC_MODE
	0: Measurement sequence interval 10 ms (economy mode)
	1: Measurement sequence interval 1 ms (recommended for TSI mode)

I can't find any reason why a global change to the sampling rate cannot be
applied during the ADC measurements in this case. After all, as you said, t=
his
is gated by the previous change by Sebastian Reichel which enforces a
protection of ADC measurements when using the TSI as a general ADC (see com=
mit
ebf555111bc11a5da9144e4af524260731a8b968).

Regards,
Steve
