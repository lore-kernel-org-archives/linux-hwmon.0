Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:44184 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752785AbeAJSQh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jan 2018 13:16:37 -0500
Date: Wed, 10 Jan 2018 10:16:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au
Subject: Re: [PATCH v2] hwmon (pmbus): cffps: Add led class device for power
 supply fault led
Message-ID: <20180110181634.GA17226@roeck-us.net>
References: <1515605383-15183-1-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1515605383-15183-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jan 10, 2018 at 11:29:43AM -0600, Eddie James wrote:
> This power supply device doesn't correctly manage it's own fault led.
> Add an led class device and register it so that userspace can manage
> power supply fault led as necessary.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
> 
>  Changes since v1:
>  - move led registration into a separate function.
>  - improve comments.
> 
>  drivers/hwmon/pmbus/ibm-cffps.c | 99 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 91 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index 2d6f4f4..cd9f685 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -13,6 +13,7 @@
>  #include <linux/fs.h>
>  #include <linux/i2c.h>
>  #include <linux/jiffies.h>
> +#include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/pmbus.h>
> @@ -25,6 +26,7 @@
>  #define CFFPS_CCIN_CMD				0xBD
>  #define CFFPS_FW_CMD_START			0xFA
>  #define CFFPS_FW_NUM_BYTES			4
> +#define CFFPS_SYS_CONFIG_CMD			0xDA
>  
>  #define CFFPS_INPUT_HISTORY_CMD			0xD6
>  #define CFFPS_INPUT_HISTORY_SIZE		100
> @@ -39,6 +41,11 @@
>  #define CFFPS_MFR_VAUX_FAULT			BIT(6)
>  #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
>  
> +#define CFFPS_LED_BLINK				BIT(0)
> +#define CFFPS_LED_ON				BIT(1)
> +#define CFFPS_LED_OFF				BIT(2)
> +#define CFFPS_BLINK_RATE_MS			250
> +
>  enum {
>  	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
>  	CFFPS_DEBUGFS_FRU,
> @@ -63,6 +70,9 @@ struct ibm_cffps {
>  	struct ibm_cffps_input_history input_history;
>  
>  	int debugfs_entries[CFFPS_DEBUGFS_NUM_ENTRIES];
> +
> +	u8 led_state;
> +	struct led_classdev led;
>  };
>  
>  #define to_psu(x, y) container_of((x), struct ibm_cffps, debugfs_entries[(y)])
> @@ -258,6 +268,69 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
>  	return rc;
>  }
>  
> +static void ibm_cffps_led_brightness_set(struct led_classdev *led_cdev,
> +					 enum led_brightness brightness)
> +{
> +	int rc;
> +	struct ibm_cffps *psu = container_of(led_cdev, struct ibm_cffps, led);
> +
> +	if (brightness == LED_OFF) {
> +		psu->led_state = CFFPS_LED_OFF;
> +	} else {
> +		brightness = LED_FULL;
> +		if (psu->led_state != CFFPS_LED_BLINK)
> +			psu->led_state = CFFPS_LED_ON;
> +	}
> +
> +	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
> +				       psu->led_state);
> +	if (rc < 0)
> +		return;
> +
> +	led_cdev->brightness = brightness;
> +}
> +
> +static int ibm_cffps_led_blink_set(struct led_classdev *led_cdev,
> +				   unsigned long *delay_on,
> +				   unsigned long *delay_off)
> +{
> +	int rc;
> +	struct ibm_cffps *psu = container_of(led_cdev, struct ibm_cffps, led);
> +
> +	psu->led_state = CFFPS_LED_BLINK;
> +
> +	if (led_cdev->brightness == LED_OFF)
> +		return 0;
> +
> +	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
> +				       CFFPS_LED_BLINK);
> +	if (rc < 0)
> +		return rc;
> +
> +	*delay_on = CFFPS_BLINK_RATE_MS;
> +	*delay_off = CFFPS_BLINK_RATE_MS;
> +
> +	return 0;
> +}
> +
> +static void ibm_cffps_create_led_class(size_t name_size, struct ibm_cffps *psu)
> +{
> +	int rc;
> +	struct i2c_client *client = psu->client;
> +	struct device *dev = &client->dev;
> +	char *led_name = (void *)(&psu[1]);
> +
I really dislike this hack. Why not allocate a sufficient
fixed length, say, 32 bytes, and just use it ? If you want
to be really wasteful, use 48 or 64 bytes; that is still better
than this code.

> +	snprintf(led_name, name_size, "%s-%x", client->name, client->addr);

%02x, maybe ? Your call, though.

Thanks,
Guenter

> +	psu->led.name = led_name;
> +	psu->led.max_brightness = LED_FULL;
> +	psu->led.brightness_set = ibm_cffps_led_brightness_set;
> +	psu->led.blink_set = ibm_cffps_led_blink_set;
> +
> +	rc = devm_led_classdev_register(dev, &psu->led);
> +	if (rc)
> +		dev_warn(dev, "failed to register led class: %d\n", rc);
> +}
> +
>  static struct pmbus_driver_info ibm_cffps_info = {
>  	.pages = 1,
>  	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> @@ -277,6 +350,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  			   const struct i2c_device_id *id)
>  {
>  	int i, rc;
> +	size_t name_size;
>  	struct dentry *debugfs;
>  	struct dentry *ibm_cffps_dir;
>  	struct ibm_cffps *psu;
> @@ -286,6 +360,23 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  	if (rc)
>  		return rc;
>  
> +	/* client name, '-', 8 chars for addr, and null terminator */
> +	name_size = strlen(client->name) + 10;
> +
> +	/*
> +	 * Don't fail the probe if there isn't enough memory for leds and
> +	 * debugfs.
> +	 */
> +	psu = devm_kzalloc(&client->dev, sizeof(*psu) + name_size, GFP_KERNEL);
> +	if (!psu)
> +		return 0;
> +
> +	psu->client = client;
> +	mutex_init(&psu->input_history.update_lock);
> +	psu->input_history.last_update = jiffies - HZ;
> +
> +	ibm_cffps_create_led_class(name_size, psu);
> +
>  	/* Don't fail the probe if we can't create debugfs */
>  	debugfs = pmbus_get_debugfs_dir(client);
>  	if (!debugfs)
> @@ -295,14 +386,6 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  	if (!ibm_cffps_dir)
>  		return 0;
>  
> -	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
> -	if (!psu)
> -		return 0;
> -
> -	psu->client = client;
> -	mutex_init(&psu->input_history.update_lock);
> -	psu->input_history.last_update = jiffies - HZ;
> -
>  	for (i = 0; i < CFFPS_DEBUGFS_NUM_ENTRIES; ++i)
>  		psu->debugfs_entries[i] = i;
>  
> -- 
> 1.8.3.1
> 
