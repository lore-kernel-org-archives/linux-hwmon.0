Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45172 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbdHMNgi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Aug 2017 09:36:38 -0400
Date: Sun, 13 Aug 2017 06:36:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [v2,1/4] hwmon: (pmbus): Switch status registers to 16 bit
Message-ID: <20170813133635.GA5085@roeck-us.net>
References: <1502402270-15328-2-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502402270-15328-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 10, 2017 at 04:57:47PM -0500, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Switch the storage of status registers to 16 bit values. This allows us
> to store all the bits of STATUS_WORD.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index f1eff6b..4ec7586 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -112,7 +112,7 @@ struct pmbus_data {
>  	 * A single status register covers multiple attributes,
>  	 * so we keep them all together.
>  	 */
> -	u8 status[PB_NUM_STATUS_REG];
> +	u16 status[PB_NUM_STATUS_REG];
>  	u8 status_register;
>  
>  	u8 currpage;
> @@ -716,10 +716,10 @@ static int pmbus_get_boolean(struct pmbus_data *data, struct pmbus_boolean *b,
>  {
>  	struct pmbus_sensor *s1 = b->s1;
>  	struct pmbus_sensor *s2 = b->s2;
> -	u16 reg = (index >> 8) & 0xffff;
> -	u8 mask = index & 0xff;
> +	u16 reg = (index >> 16) & 0xffff;
> +	u16 mask = index & 0xffff;
>  	int ret, status;
> -	u8 regval;
> +	u16 regval;
>  
>  	status = data->status[reg];
>  	if (status < 0)
> @@ -860,7 +860,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
>  			     const char *name, const char *type, int seq,
>  			     struct pmbus_sensor *s1,
>  			     struct pmbus_sensor *s2,
> -			     u16 reg, u8 mask)
> +			     u16 reg, u16 mask)
>  {
>  	struct pmbus_boolean *boolean;
>  	struct sensor_device_attribute *a;
> @@ -876,7 +876,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
>  	boolean->s1 = s1;
>  	boolean->s2 = s2;
>  	pmbus_attr_init(a, boolean->name, S_IRUGO, pmbus_show_boolean, NULL,
> -			(reg << 8) | mask);
> +			(reg << 16) | mask);
>  
>  	return pmbus_add_attribute(data, &a->dev_attr.attr);
>  }
> @@ -962,7 +962,7 @@ struct pmbus_limit_attr {
>   */
>  struct pmbus_sensor_attr {
>  	u16 reg;			/* sensor register */
> -	u8 gbit;			/* generic status bit */
> +	u16 gbit;			/* generic status bit */
>  	u8 nlimit;			/* # of limit registers */
>  	enum pmbus_sensor_classes class;/* sensor class */
>  	const char *label;		/* sensor label */
