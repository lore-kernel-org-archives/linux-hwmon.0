Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42666 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751878AbdDMVD5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Apr 2017 17:03:57 -0400
Date: Thu, 13 Apr 2017 14:03:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lee.jones@linaro.org, olof@lixom.net,
        jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        Moritz Fischer <mdf@kernel.org>
Subject: Re: [PATCH 1/3] mfd: cros-ec: Add functions to read mapped memory
Message-ID: <20170413210354.GA17134@roeck-us.net>
References: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Apr 07, 2017 at 03:00:08PM -0700, Moritz Fischer wrote:
> From: Moritz Fischer <mdf@kernel.org>
> 
> The ChromeOS EC has mapped memory regions where things like temperature
> sensors and fan speed are stored. Provide access to those from the
> cros-ec mfd device.
> 

Turns out struct cros_ec_device already provides a cmd_readmem callback,
which is widely used by other drivers. Why don't you just use it ?

Thanks,
Guenter

> Signed-off-by: Moritz Fischer <mdf@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c | 55 +++++++++++++++++++++++++++++++++
>  include/linux/mfd/cros_ec.h             | 39 +++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index ed5dee7..28063de 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -494,3 +494,58 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev)
>  		return get_keyboard_state_event(ec_dev);
>  }
>  EXPORT_SYMBOL(cros_ec_get_next_event);
> +
> +static int __cros_ec_read_mapped_mem(struct cros_ec_device *ec, uint8_t offset,
> +				     void *buf, size_t size)
> +{
> +	int ret;
> +	struct ec_params_read_memmap *params;
> +	struct cros_ec_command *msg;
> +
> +	msg = kzalloc(sizeof(*msg) + max(sizeof(*params), size), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	msg->version = 0;
> +	msg->command = EC_CMD_READ_MEMMAP;
> +	msg->insize = size;
> +	msg->outsize = sizeof(*params);
> +
> +	params = (struct ec_params_read_memmap *)msg->data;
> +	params->offset = offset;
> +	params->size = size;
> +
> +	ret = cros_ec_cmd_xfer(ec, msg);
> +	if (ret < 0 || msg->result != EC_RES_SUCCESS) {
> +		dev_warn(ec->dev, "cannot read mapped reg: %d/%d\n",
> +			 ret, msg->result);
> +		goto out_free;
> +	}
> +
> +	memcpy(buf, msg->data, size);
> +
> +out_free:
> +	kfree(msg);
> +	return ret;
> +}
> +
> +int cros_ec_read_mapped_mem32(struct cros_ec_device *ec, const uint8_t offset,
> +			      uint32_t *data)
> +{
> +	return __cros_ec_read_mapped_mem(ec, offset, data, sizeof(*data));
> +}
> +EXPORT_SYMBOL_GPL(cros_ec_read_mapped_mem32);
> +
> +int cros_ec_read_mapped_mem16(struct cros_ec_device *ec, const uint8_t offset,
> +			      uint16_t *data)
> +{
> +	return __cros_ec_read_mapped_mem(ec, offset, data, sizeof(*data));
> +}
> +EXPORT_SYMBOL_GPL(cros_ec_read_mapped_mem16);
> +
> +int cros_ec_read_mapped_mem8(struct cros_ec_device *ec, const uint8_t offset,
> +			     uint8_t *data)
> +{
> +	return __cros_ec_read_mapped_mem(ec, offset, data, sizeof(*data));
> +}
> +EXPORT_SYMBOL_GPL(cros_ec_read_mapped_mem8);
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
> index b3d04de..c2de878 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -190,6 +190,45 @@ struct cros_ec_dev {
>  };
>  
>  /**
> + * cros_ec_read_mapped_mem8 - Read mapped memory in the ChromeOS EC
> + *
> + * This can be called by drivers to access the mapped memory in the EC
> + *
> + * @ec_dev: Device to read from
> + * @offset: Offset to read
> + * @data: Return data
> + * @return: 0 if Ok, -ve on error
> + */
> +int cros_ec_read_mapped_mem8(struct cros_ec_device *ec, const uint8_t offset,
> +			     uint8_t *data);
> +
> +/**
> + * cros_ec_read_mapped_mem16 - Read mapped memory in the ChromeOS EC
> + *
> + * This can be called by drivers to access the mapped memory in the EC
> + *
> + * @ec_dev: Device to read from
> + * @offset: Offset to read
> + * @data: Return data
> + * @return: 0 if Ok, -ve on error
> + */
> +int cros_ec_read_mapped_mem16(struct cros_ec_device *ec, const uint8_t offset,
> +			      uint16_t *data);
> +
> +/**
> + * cros_ec_read_mapped_mem32 - Read mapped memory in the ChromeOS EC
> + *
> + * This can be called by drivers to access the mapped memory in the EC
> + *
> + * @ec_dev: Device to read from
> + * @offset: Offset to read
> + * @data: Return data
> + * @return: 0 if Ok, -ve on error
> + */
> +int cros_ec_read_mapped_mem32(struct cros_ec_device *ec, const uint8_t offset,
> +			      uint32_t *data);
> +
> +/**
>   * cros_ec_suspend - Handle a suspend operation for the ChromeOS EC device
>   *
>   * This can be called by drivers to handle a suspend event.
> -- 
> 2.7.4
> 
