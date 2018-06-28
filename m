Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53853 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934442AbeF1Wl0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Jun 2018 18:41:26 -0400
Date: Thu, 28 Jun 2018 15:41:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        vadimp@mellanox.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] net: phy: sfp: Add HWMON support for module
 sensors
Message-ID: <20180628224123.GA20118@roeck-us.net>
References: <1530218475-4369-1-git-send-email-andrew@lunn.ch>
 <1530218475-4369-3-git-send-email-andrew@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1530218475-4369-3-git-send-email-andrew@lunn.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jun 28, 2018 at 10:41:15PM +0200, Andrew Lunn wrote:
> SFP modules can contain a number of sensors. The EEPROM also contains
> recommended alarm and critical values for each sensor, and indications
> of if these have been exceeded. Export this information via
> HWMON. Currently temperature, VCC, bias current, transmit power, and
> possibly receiver power is supported.
> 
> The sensors in the modules can either return calibrate or uncalibrated
> values. Uncalibrated values need to be manipulated, using coefficients
> provided in the SFP EEPROM. Uncalibrated receive power values require
> floating point maths in order to calibrate them. Performing this in
> the kernel is hard. So if the SFP module indicates it uses
> uncalibrated values, RX power is not made available.
> 
> With this hwmon device, it is possible to view the sensor values using
> lm-sensors programs:
> 
> in0:          +3.29 V  (crit min =  +2.90 V, min =  +3.00 V)
>                        (max =  +3.60 V, crit max =  +3.70 V)
> temp1:        +33.0°C  (low  =  -5.0°C, high = +80.0°C)
>                        (crit low = -10.0°C, crit = +85.0°C)
> power1:      1000.00 nW (max = 794.00 uW, min =  50.00 uW)  ALARM (LCRIT)
>                        (lcrit =  40.00 uW, crit = 1000.00 uW)
> curr1:        +0.00 A  (crit min =  +0.00 A, min =  +0.00 A)  ALARM (LCRIT, MIN)
>                        (max =  +0.01 A, crit max =  +0.01 A)
> 
> The scaling sensors performs on the bias current is not particularly
> good. The raw values are more useful:
> 
> curr1:
>   curr1_input: 0.000
>   curr1_min: 0.002
>   curr1_max: 0.010
>   curr1_lcrit: 0.000
>   curr1_crit: 0.011
>   curr1_min_alarm: 1.000
>   curr1_max_alarm: 0.000
>   curr1_lcrit_alarm: 1.000
>   curr1_crit_alarm: 0.000
> 
> In order to keep the I2C overhead to a minimum, the constant values,
> such as limits and calibration coefficients are read once at module
> insertion time. Thus only reading *_input and *_alarm properties
> requires i2c read operations.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>

Overall looks pretty good. A couple of comments below.

Guenter

> ---
>  drivers/net/phy/sfp.c | 732 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/sfp.h   |  72 ++++-
>  2 files changed, 803 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index c4c92db86dfa..30428e94b694 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -1,5 +1,7 @@
> +#include <linux/ctype.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/hwmon.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/jiffies.h>
> @@ -131,6 +133,12 @@ struct sfp {
>  	unsigned int sm_retries;
>  
>  	struct sfp_eeprom_id id;
> +#ifdef CONFIG_HWMON

Should probably be "#if IS_ENABLED(CONFIG_HWMON)".
You might also want to add "imply HWMON" to "config SFP".

> +	struct sfp_diag diag;
> +	struct device *hwmon_dev;
> +	char *hwmon_name;
> +#endif
> +
>  };
>  
>  static bool sff_module_supported(const struct sfp_eeprom_id *id)
> @@ -316,6 +324,724 @@ static unsigned int sfp_check(void *buf, size_t len)
>  	return check;
>  }
>  
> +/* hwmon */
> +#ifdef CONFIG_HWMON

#if IS_ENABLED(CONFIG_HWMON)

> +static umode_t sfp_hwmon_is_visible(const void *data,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	const struct sfp *sfp = data;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_min_alarm:
> +		case hwmon_temp_max_alarm:
> +		case hwmon_temp_lcrit_alarm:
> +		case hwmon_temp_crit_alarm:
> +		case hwmon_temp_min:
> +		case hwmon_temp_max:
> +		case hwmon_temp_lcrit:
> +		case hwmon_temp_crit:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_min_alarm:
> +		case hwmon_in_max_alarm:
> +		case hwmon_in_lcrit_alarm:
> +		case hwmon_in_crit_alarm:
> +		case hwmon_in_min:
> +		case hwmon_in_max:
> +		case hwmon_in_lcrit:
> +		case hwmon_in_crit:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +		case hwmon_curr_min_alarm:
> +		case hwmon_curr_max_alarm:
> +		case hwmon_curr_lcrit_alarm:
> +		case hwmon_curr_crit_alarm:
> +		case hwmon_curr_min:
> +		case hwmon_curr_max:
> +		case hwmon_curr_lcrit:
> +		case hwmon_curr_crit:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_power:
> +		/* External calibration of receive power requires
> +		 * floating point arithmetic. Doing that in the kernel
> +		 * is not easy, so just skip it. If the module does
> +		 * not require external calibration, we can however
> +		 * show receiver power, since FP is then not needed.
> +		 */
> +		if (sfp->id.ext.diagmon & SFP_DIAGMON_EXT_CAL &&
> +		    channel == 1)
> +			return 0;

It would be nice if it was possible to convert the floting point to
a fixed point calculation. Would that be possible ?

> +		switch (attr) {
> +		case hwmon_power_input:
> +		case hwmon_power_min_alarm:
> +		case hwmon_power_max_alarm:
> +		case hwmon_power_lcrit_alarm:
> +		case hwmon_power_crit_alarm:
> +		case hwmon_power_min:
> +		case hwmon_power_max:
> +		case hwmon_power_lcrit:
> +		case hwmon_power_crit:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +/* Sensors values are stored as two bytes, MSB second */
> +static int sfp_hwmon_read_sensor(struct sfp *sfp, int reg, long *value)
> +{
> +	u8 val[2];
> +	int err;
> +
> +	err = sfp_read(sfp, true, reg, val, 2);
> +	if (err < 0)
> +		return err;
> +
> +	*value = val[0] << 8 | val[1];
> +

Any chance to use something like __be16 and be16_to_cpu() ?
You do that elsewhere - why not here ?

> +	return 0;
> +}
> +
> +static void sfp_hwmon_to_rx_power(long *value)
> +{
> +	*value /= 100;

DIV_ROUND_CLOSEST() ? Same for the other divide operations.

> +}
> +
> +static void sfp_hwmon_calibrate(struct sfp *sfp, unsigned int slope, int offset,
> +				long *value)
> +{
> +	if (sfp->id.ext.diagmon & SFP_DIAGMON_EXT_CAL)
> +		*value = (*value * slope) / 256 + offset;
> +}
> +
> +static void sfp_hwmon_calibrate_temp(struct sfp *sfp, long *value)
> +{
> +	sfp_hwmon_calibrate(sfp, be16_to_cpu(sfp->diag.cal_t_slope),
> +			    be16_to_cpu(sfp->diag.cal_t_offset), value);
> +
> +	if (*value >=  0x8000)

etra space (doesn't checkpatch complain about that that ?)

> +		*value -= 0x10000;
> +
> +	*value = *value * 1000 / 256;
> +}
> +
> +static void sfp_hwmon_calibrate_vcc(struct sfp *sfp, long *value)
> +{
> +	sfp_hwmon_calibrate(sfp, be16_to_cpu(sfp->diag.cal_v_slope),
> +			    be16_to_cpu(sfp->diag.cal_v_offset), value);
> +
> +	*value /= 10;
> +}
> +
> +static void sfp_hwmon_calibrate_bias(struct sfp *sfp, long *value)
> +{
> +	sfp_hwmon_calibrate(sfp, be16_to_cpu(sfp->diag.cal_txi_slope),
> +			    be16_to_cpu(sfp->diag.cal_txi_offset), value);
> +
> +	*value /= 500;
> +}
> +
> +static void sfp_hwmon_calibrate_tx_power(struct sfp *sfp, long *value)
> +{
> +	sfp_hwmon_calibrate(sfp, be16_to_cpu(sfp->diag.cal_txpwr_slope),
> +			    be16_to_cpu(sfp->diag.cal_txpwr_offset), value);
> +
> +	*value /= 10;
> +}
> +
> +static int sfp_hwmon_read_temp(struct sfp *sfp, int reg, long *value)
> +{
> +	int err;
> +
> +	err = sfp_hwmon_read_sensor(sfp, reg, value);
> +	if (err < 0)
> +		return err;
> +
> +	sfp_hwmon_calibrate_temp(sfp, value);
> +
> +	return 0;
> +}
> +
> +static int sfp_hwmon_read_vcc(struct sfp *sfp, int reg, long *value)
> +{
> +	int err;
> +
> +	err = sfp_hwmon_read_sensor(sfp, reg, value);
> +	if (err < 0)
> +		return err;
> +
> +	sfp_hwmon_calibrate_vcc(sfp, value);
> +
> +	return 0;
> +}
> +
> +static int sfp_hwmon_read_bias(struct sfp *sfp, int reg, long *value)
> +{
> +	int err;
> +
> +	err = sfp_hwmon_read_sensor(sfp, reg, value);
> +	if (err < 0)
> +		return err;
> +
> +	sfp_hwmon_calibrate_bias(sfp, value);
> +
> +	return 0;
> +}
> +
> +static int sfp_hwmon_read_tx_power(struct sfp *sfp, int reg, long *value)
> +{
> +	int err;
> +
> +	err = sfp_hwmon_read_sensor(sfp, reg, value);
> +	if (err < 0)
> +		return err;
> +
> +	sfp_hwmon_calibrate_tx_power(sfp, value);
> +
> +	return 0;
> +}
> +
> +static int sfp_hwmon_read_rx_power(struct sfp *sfp, int reg, long *value)
> +{
> +	int err;
> +
> +	err = sfp_hwmon_read_sensor(sfp, reg, value);
> +	if (err < 0)
> +		return err;
> +
> +	sfp_hwmon_to_rx_power(value);
> +
> +	return 0;
> +}
> +
> +static int sfp_hwmon_temp(struct sfp *sfp, u32 attr, long *value)
> +{
> +	u8 status;
> +	int err;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return sfp_hwmon_read_temp(sfp, SFP_TEMP, value);
> +
> +	case hwmon_temp_lcrit:
> +		*value = be16_to_cpu(sfp->diag.temp_low_alarm);
> +		sfp_hwmon_calibrate_temp(sfp, value);
> +		return 0;
> +
> +	case hwmon_temp_min:
> +		*value = be16_to_cpu(sfp->diag.temp_low_warn);
> +		sfp_hwmon_calibrate_temp(sfp, value);
> +		return 0;
> +	case hwmon_temp_max:
> +		*value = be16_to_cpu(sfp->diag.temp_high_warn);
> +		sfp_hwmon_calibrate_temp(sfp, value);
> +		return 0;
> +
> +	case hwmon_temp_crit:
> +		*value = be16_to_cpu(sfp->diag.temp_high_alarm);
> +		sfp_hwmon_calibrate_temp(sfp, value);
> +		return 0;
> +
> +	case hwmon_temp_lcrit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM0_TEMP_LOW);
> +		return 0;
> +
> +	case hwmon_temp_min_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN0_TEMP_LOW);
> +		return 0;
> +
> +	case hwmon_temp_max_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN0_TEMP_HIGH);
> +		return 0;
> +
> +	case hwmon_temp_crit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM0_TEMP_HIGH);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sfp_hwmon_vcc(struct sfp *sfp, u32 attr, long *value)
> +{
> +	u8 status;
> +	int err;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return sfp_hwmon_read_vcc(sfp, SFP_VCC, value);
> +
> +	case hwmon_in_lcrit:
> +		*value = be16_to_cpu(sfp->diag.volt_low_alarm);
> +		sfp_hwmon_calibrate_vcc(sfp, value);
> +		return 0;
> +
> +	case hwmon_in_min:
> +		*value = be16_to_cpu(sfp->diag.volt_low_warn);
> +		sfp_hwmon_calibrate_vcc(sfp, value);
> +		return 0;
> +
> +	case hwmon_in_max:
> +		*value = be16_to_cpu(sfp->diag.volt_high_warn);
> +		sfp_hwmon_calibrate_vcc(sfp, value);
> +		return 0;
> +
> +	case hwmon_in_crit:
> +		*value = be16_to_cpu(sfp->diag.volt_high_alarm);
> +		sfp_hwmon_calibrate_vcc(sfp, value);
> +		return 0;
> +
> +	case hwmon_in_lcrit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM0_VCC_LOW);
> +		return 0;
> +
> +	case hwmon_in_min_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN0_VCC_LOW);
> +		return 0;
> +
> +	case hwmon_in_max_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN0_VCC_HIGH);
> +		return 0;
> +
> +	case hwmon_in_crit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM0_VCC_HIGH);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sfp_hwmon_bias(struct sfp *sfp, u32 attr, long *value)
> +{
> +	u8 status;
> +	int err;
> +
> +	switch (attr) {
> +	case hwmon_curr_input:
> +		return sfp_hwmon_read_bias(sfp, SFP_TX_BIAS, value);
> +
> +	case hwmon_curr_lcrit:
> +		*value = be16_to_cpu(sfp->diag.bias_low_alarm);
> +		sfp_hwmon_calibrate_bias(sfp, value);
> +		return 0;
> +
> +	case hwmon_curr_min:
> +		*value = be16_to_cpu(sfp->diag.bias_low_warn);
> +		sfp_hwmon_calibrate_bias(sfp, value);
> +		return 0;
> +
> +	case hwmon_curr_max:
> +		*value = be16_to_cpu(sfp->diag.bias_high_warn);
> +		sfp_hwmon_calibrate_bias(sfp, value);
> +		return 0;
> +
> +	case hwmon_curr_crit:
> +		*value = be16_to_cpu(sfp->diag.bias_high_alarm);
> +		sfp_hwmon_calibrate_bias(sfp, value);
> +		return 0;
> +
> +	case hwmon_curr_lcrit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM0_TX_BIAS_LOW);
> +		return 0;
> +
> +	case hwmon_curr_min_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN0_TX_BIAS_LOW);
> +		return 0;
> +
> +	case hwmon_curr_max_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN0_TX_BIAS_HIGH);
> +		return 0;
> +
> +	case hwmon_curr_crit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM0_TX_BIAS_HIGH);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sfp_hwmon_tx_power(struct sfp *sfp, u32 attr, long *value)
> +{
> +	u8 status;
> +	int err;
> +
> +	switch (attr) {
> +	case hwmon_power_input:
> +		return sfp_hwmon_read_tx_power(sfp, SFP_TX_POWER, value);
> +
> +	case hwmon_power_lcrit:
> +		*value = be16_to_cpu(sfp->diag.txpwr_low_alarm);
> +		sfp_hwmon_calibrate_tx_power(sfp, value);
> +		return 0;
> +
> +	case hwmon_power_min:
> +		*value = be16_to_cpu(sfp->diag.txpwr_low_warn);
> +		sfp_hwmon_calibrate_tx_power(sfp, value);
> +		return 0;
> +
> +	case hwmon_power_max:
> +		*value = be16_to_cpu(sfp->diag.txpwr_high_warn);
> +		sfp_hwmon_calibrate_tx_power(sfp, value);
> +		return 0;
> +
> +	case hwmon_power_crit:
> +		*value = be16_to_cpu(sfp->diag.txpwr_high_alarm);
> +		sfp_hwmon_calibrate_tx_power(sfp, value);
> +		return 0;
> +
> +	case hwmon_power_lcrit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM0_TXPWR_LOW);
> +		return 0;
> +
> +	case hwmon_power_min_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN0_TXPWR_LOW);
> +		return 0;
> +
> +	case hwmon_power_max_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN0_TXPWR_HIGH);
> +		return 0;
> +
> +	case hwmon_power_crit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM0, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM0_TXPWR_HIGH);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sfp_hwmon_rx_power(struct sfp *sfp, u32 attr, long *value)
> +{
> +	u8 status;
> +	int err;
> +
> +	switch (attr) {
> +	case hwmon_power_input:
> +		return sfp_hwmon_read_rx_power(sfp, SFP_RX_POWER, value);
> +
> +	case hwmon_power_lcrit:
> +		*value = be16_to_cpu(sfp->diag.rxpwr_low_alarm);
> +		sfp_hwmon_to_rx_power(value);
> +		return 0;
> +
> +	case hwmon_power_min:
> +		*value = be16_to_cpu(sfp->diag.rxpwr_low_warn);
> +		sfp_hwmon_to_rx_power(value);
> +		return 0;
> +
> +	case hwmon_power_max:
> +		*value = be16_to_cpu(sfp->diag.rxpwr_high_warn);
> +		sfp_hwmon_to_rx_power(value);
> +		return 0;
> +
> +	case hwmon_power_crit:
> +		*value = be16_to_cpu(sfp->diag.rxpwr_high_alarm);
> +		sfp_hwmon_to_rx_power(value);
> +		return 0;
> +
> +	case hwmon_power_lcrit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM1, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM1_RXPWR_LOW);
> +		return 0;
> +
> +	case hwmon_power_min_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN1, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN1_RXPWR_LOW);
> +		return 0;
> +
> +	case hwmon_power_max_alarm:
> +		err = sfp_read(sfp, true, SFP_WARN1, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_WARN1_RXPWR_HIGH);
> +		return 0;
> +
> +	case hwmon_power_crit_alarm:
> +		err = sfp_read(sfp, true, SFP_ALARM1, &status, sizeof(status));
> +		if (err < 0)
> +			return err;
> +
> +		*value = !!(status & SFP_ALARM1_RXPWR_HIGH);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sfp_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *value)
> +{
> +	struct sfp *sfp = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		return sfp_hwmon_temp(sfp, attr, value);
> +	case hwmon_in:
> +		return sfp_hwmon_vcc(sfp, attr, value);
> +	case hwmon_curr:
> +		return sfp_hwmon_bias(sfp, attr, value);
> +	case hwmon_power:
> +		switch (channel) {
> +		case 0:
> +			return sfp_hwmon_tx_power(sfp, attr, value);
> +		case 1:
> +			return sfp_hwmon_rx_power(sfp, attr, value);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops sfp_hwmon_ops = {
> +	.is_visible = sfp_hwmon_is_visible,
> +	.read = sfp_hwmon_read,
> +};
> +
> +static u32 sfp_hwmon_chip_config[] = {
> +	HWMON_C_REGISTER_TZ,
> +	0,
> +};
> +
> +static const struct hwmon_channel_info sfp_hwmon_chip = {
> +	.type = hwmon_chip,
> +	.config = sfp_hwmon_chip_config,
> +};
> +
> +static u32 sfp_hwmon_temp_config[] = {
> +	HWMON_T_INPUT |
> +	HWMON_T_MAX | HWMON_T_MIN |
> +	HWMON_T_MAX_ALARM | HWMON_T_MIN_ALARM |
> +	HWMON_T_CRIT | HWMON_T_LCRIT |
> +	HWMON_T_CRIT_ALARM | HWMON_T_LCRIT_ALARM,
> +	0,
> +};
> +
> +static const struct hwmon_channel_info sfp_hwmon_temp_channel_info = {
> +	.type = hwmon_temp,
> +	.config = sfp_hwmon_temp_config,
> +};
> +
> +static u32 sfp_hwmon_vcc_config[] = {
> +	HWMON_I_INPUT |
> +	HWMON_I_MAX | HWMON_I_MIN |
> +	HWMON_I_MAX_ALARM | HWMON_I_MIN_ALARM |
> +	HWMON_I_CRIT | HWMON_I_LCRIT |
> +	HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM,
> +	0,
> +};
> +
> +static const struct hwmon_channel_info sfp_hwmon_vcc_channel_info = {
> +	.type = hwmon_in,
> +	.config = sfp_hwmon_vcc_config,
> +};
> +
> +static u32 sfp_hwmon_bias_config[] = {
> +	HWMON_C_INPUT |
> +	HWMON_C_MAX | HWMON_C_MIN |
> +	HWMON_C_MAX_ALARM | HWMON_C_MIN_ALARM |
> +	HWMON_C_CRIT | HWMON_C_LCRIT |
> +	HWMON_C_CRIT_ALARM | HWMON_C_LCRIT_ALARM,
> +	0,
> +};
> +
> +static const struct hwmon_channel_info sfp_hwmon_bias_channel_info = {
> +	.type = hwmon_curr,
> +	.config = sfp_hwmon_bias_config,
> +};
> +
> +static u32 sfp_hwmon_power_config[] = {
> +	/* Transmit power */
> +	HWMON_P_INPUT |
> +	HWMON_P_MAX | HWMON_P_MIN |
> +	HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
> +	HWMON_P_CRIT | HWMON_P_LCRIT |
> +	HWMON_P_CRIT_ALARM | HWMON_P_LCRIT_ALARM,
> +	/* Receive power */
> +	HWMON_P_INPUT |
> +	HWMON_P_MAX | HWMON_P_MIN |
> +	HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
> +	HWMON_P_CRIT | HWMON_P_LCRIT |
> +	HWMON_P_CRIT_ALARM | HWMON_P_LCRIT_ALARM,
> +	0,
> +};
> +
> +static const struct hwmon_channel_info sfp_hwmon_power_channel_info = {
> +	.type = hwmon_power,
> +	.config = sfp_hwmon_power_config,
> +};
> +
> +static const struct hwmon_channel_info *sfp_hwmon_info[] = {
> +	&sfp_hwmon_chip,
> +	&sfp_hwmon_vcc_channel_info,
> +	&sfp_hwmon_temp_channel_info,
> +	&sfp_hwmon_bias_channel_info,
> +	&sfp_hwmon_power_channel_info,
> +	NULL,
> +};
> +
> +static const struct hwmon_chip_info sfp_hwmon_chip_info = {
> +	.ops = &sfp_hwmon_ops,
> +	.info = sfp_hwmon_info,
> +};
> +
> +static int sfp_hwmon_insert(struct sfp *sfp)
> +{
> +	int err, i, j;
> +
> +	if (sfp->id.ext.sff8472_compliance == SFP_SFF8472_COMPLIANCE_NONE)
> +		return 0;
> +
> +	if (!(sfp->id.ext.diagmon & SFP_DIAGMON_DDM))
> +		return 0;
> +
> +	if (sfp->id.ext.diagmon & SFP_DIAGMON_ADDRMODE)
> +		/* This driver in general does not support address
> +		 * change.
> +		 */
> +		return 0;
> +
> +	err = sfp_read(sfp, true, 0, &sfp->diag, sizeof(sfp->diag));
> +	if (err < 0)
> +		return err;
> +
> +	sfp->hwmon_name = devm_kstrdup(sfp->dev, dev_name(sfp->dev),
> +				       GFP_KERNEL);
> +	if (!sfp->hwmon_name)
> +		return -ENODEV;
> +
> +	for (i = j = 0; sfp->hwmon_name[i]; i++) {
> +		if (isalnum(sfp->hwmon_name[i])) {
> +			if (i != j)
> +				sfp->hwmon_name[j] = sfp->hwmon_name[i];
> +			j++;
> +		}
> +	}

It might be better and simpler to replace invalid characters with '_'
instead of dropping them. Also note that '_' is a valid character.
Strictly speaking only "-* \t\n" are invalid.

> +	sfp->hwmon_name[j] = '\0';
> +
Is it possible that j == 0 ?

> +	sfp->hwmon_dev = devm_hwmon_device_register_with_info(sfp->dev,
> +				sfp->hwmon_name, sfp, &sfp_hwmon_chip_info,
> +				NULL);
> +
> +	return PTR_ERR_OR_ZERO(sfp->hwmon_dev);
> +}
> +
> +static void sfp_hwmon_remove(struct sfp *sfp)
> +{
> +	devm_hwmon_device_unregister(sfp->hwmon_dev);

If registartion and removal are not tied to a device, it doesn't make sense
to use devm_ functions. Either use hwmon_device_register_with_info()
and hwmon_device_unregister(), or drop the remove function.

> +}
> +#else
> +static int sfp_hwmon_insert(struct sfp *sfp)
> +{
> +	return 0;
> +}
> +
> +static void sfp_hwmon_remove(struct sfp *sfp)
> +{
> +}
> +#endif
> +
>  /* Helpers */
>  static void sfp_module_tx_disable(struct sfp *sfp)
>  {
> @@ -636,6 +1362,10 @@ static int sfp_sm_mod_probe(struct sfp *sfp)
>  		dev_warn(sfp->dev,
>  			 "module address swap to access page 0xA2 is not supported.\n");
>  
> +	ret = sfp_hwmon_insert(sfp);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = sfp_module_insert(sfp->sfp_bus, &sfp->id);
>  	if (ret < 0)
>  		return ret;
> @@ -647,6 +1377,8 @@ static void sfp_sm_mod_remove(struct sfp *sfp)
>  {
>  	sfp_module_remove(sfp->sfp_bus);
>  
> +	sfp_hwmon_remove(sfp);
> +
>  	if (sfp->mod_phy)
>  		sfp_sm_phy_detach(sfp);
>  
> diff --git a/include/linux/sfp.h b/include/linux/sfp.h
> index ebce9e24906a..d37518e89db2 100644
> --- a/include/linux/sfp.h
> +++ b/include/linux/sfp.h
> @@ -231,6 +231,50 @@ struct sfp_eeprom_id {
>  	struct sfp_eeprom_ext ext;
>  } __packed;
>  
> +struct sfp_diag {
> +	__be16 temp_high_alarm;
> +	__be16 temp_low_alarm;
> +	__be16 temp_high_warn;
> +	__be16 temp_low_warn;
> +	__be16 volt_high_alarm;
> +	__be16 volt_low_alarm;
> +	__be16 volt_high_warn;
> +	__be16 volt_low_warn;
> +	__be16 bias_high_alarm;
> +	__be16 bias_low_alarm;
> +	__be16 bias_high_warn;
> +	__be16 bias_low_warn;
> +	__be16 txpwr_high_alarm;
> +	__be16 txpwr_low_alarm;
> +	__be16 txpwr_high_warn;
> +	__be16 txpwr_low_warn;
> +	__be16 rxpwr_high_alarm;
> +	__be16 rxpwr_low_alarm;
> +	__be16 rxpwr_high_warn;
> +	__be16 rxpwr_low_warn;
> +	__be16 laser_temp_high_alarm;
> +	__be16 laser_temp_low_alarm;
> +	__be16 laser_temp_high_warn;
> +	__be16 laser_temp_low_warn;
> +	__be16 tec_cur_high_alarm;
> +	__be16 tec_cur_low_alarm;
> +	__be16 tec_cur_high_warn;
> +	__be16 tec_cur_low_warn;
> +	__be32 cal_rxpwr4;
> +	__be32 cal_rxpwr3;
> +	__be32 cal_rxpwr2;
> +	__be32 cal_rxpwr1;
> +	__be32 cal_rxpwr0;
> +	__be16 cal_txi_slope;
> +	__be16 cal_txi_offset;
> +	__be16 cal_txpwr_slope;
> +	__be16 cal_txpwr_offset;
> +	__be16 cal_t_slope;
> +	__be16 cal_t_offset;
> +	__be16 cal_v_slope;
> +	__be16 cal_v_offset;
> +} __packed;
> +
>  /* SFP EEPROM registers */
>  enum {
>  	SFP_PHYS_ID			= 0x00,
> @@ -384,7 +428,33 @@ enum {
>  	SFP_TEC_CUR			= 0x6c,
>  
>  	SFP_STATUS			= 0x6e,
> -	SFP_ALARM			= 0x70,
> +	SFP_ALARM0			= 0x70,
> +	SFP_ALARM0_TEMP_HIGH		= BIT(7),
> +	SFP_ALARM0_TEMP_LOW		= BIT(6),
> +	SFP_ALARM0_VCC_HIGH		= BIT(5),
> +	SFP_ALARM0_VCC_LOW		= BIT(4),
> +	SFP_ALARM0_TX_BIAS_HIGH		= BIT(3),
> +	SFP_ALARM0_TX_BIAS_LOW		= BIT(2),
> +	SFP_ALARM0_TXPWR_HIGH		= BIT(1),
> +	SFP_ALARM0_TXPWR_LOW		= BIT(0),
> +
> +	SFP_ALARM1			= 0x71,
> +	SFP_ALARM1_RXPWR_HIGH		= BIT(7),
> +	SFP_ALARM1_RXPWR_LOW		= BIT(6),
> +
> +	SFP_WARN0			= 0x74,
> +	SFP_WARN0_TEMP_HIGH		= BIT(7),
> +	SFP_WARN0_TEMP_LOW		= BIT(6),
> +	SFP_WARN0_VCC_HIGH		= BIT(5),
> +	SFP_WARN0_VCC_LOW		= BIT(4),
> +	SFP_WARN0_TX_BIAS_HIGH		= BIT(3),
> +	SFP_WARN0_TX_BIAS_LOW		= BIT(2),
> +	SFP_WARN0_TXPWR_HIGH		= BIT(1),
> +	SFP_WARN0_TXPWR_LOW		= BIT(0),
> +
> +	SFP_WARN1			= 0x75,
> +	SFP_WARN1_RXPWR_HIGH		= BIT(7),
> +	SFP_WARN1_RXPWR_LOW		= BIT(6),
>  
>  	SFP_EXT_STATUS			= 0x76,
>  	SFP_VSL				= 0x78,
> -- 
> 2.18.0.rc2
> 
