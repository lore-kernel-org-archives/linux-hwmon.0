Return-Path: <SRS0=o4ty=ZG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC74C432C3
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 19:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9B4E2071B
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 19:06:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="upBAr43+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfKNTGV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Nov 2019 14:06:21 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41289 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbfKNTGV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Nov 2019 14:06:21 -0500
Received: by mail-pf1-f194.google.com with SMTP id p26so4914003pfq.8
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Nov 2019 11:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HRWqEoTSch+XEG0ppLarZ0QbVwRNfsUYs9OZK1M4DK8=;
        b=upBAr43+LtNCNYfUjWzE6AKZHfA9ggnQAU73m3/yQK03sb+Zrs/mc8IqprMlsYeYda
         hlEbZdgj185YaYS3Exh9AYBwIe/kHcBu2Ci2cHqcZwdZMsTPTTr2AXuDojeFFni36Cm8
         tbmN/2AJAaI8uEXfnHJmGI776G6X+LqEVz/6YT/t45/8m2qXNIqdI1rebyLeVa7Nn3OK
         FxZFAcOQsGzNjBfCrTq0Dz+/WX/sVbvhGxric9YacCNM7qJY/+MEZAJIg0/nI6/JhFSd
         hz7HdZJZG87mLGpNxVdGRgklWjOZ9bXMtefDvGzemLvDLphynx9eKRPyouVCr53wVjy6
         RhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=HRWqEoTSch+XEG0ppLarZ0QbVwRNfsUYs9OZK1M4DK8=;
        b=tiYgC5bCn0nBAnCChWbROl0vqdB77UN7JCrvS/dVrJ9Q434g7ADteb8IVpLC1/Mzzp
         8hMwJ2ceZaNpqi92/hEymYGzZSnwaRYOR17F+6yeOqqmPJkJ9RsFf41jdeetXdxRobvA
         pIWmU6cbYzDr31ZaSaKfqwflHVgHa+TVo2M08qf/7cgccH36JbLP5PaLUpD82BLmVajo
         /lYGDu+QQrkuSvQNjCMRofNcFM6JldwPG2Nq8icW6/TSrfo85O8NdqQgVj5GrNTffCle
         5edxcXGeXqLzn1h/e4iIPZvPXep++2pHrUWVjE2Jzhy3davQGI2Zk1f2IpNZY7qJkuo+
         74KQ==
X-Gm-Message-State: APjAAAULPmdcQjBdWdpugeUbwyk0JPpZ+jnKClDOnstF1wYBFmc9nldA
        NFw/NrJGqiSByEKWPgj7KKzPx0uf
X-Google-Smtp-Source: APXvYqzYild/yZAw3Z7GXRsGBL+J0VP2T27fFN1s1qW1+VcFhZO4Lt5SZi156nO7BoW7eeSZJZowpA==
X-Received: by 2002:a62:14d0:: with SMTP id 199mr12643666pfu.147.1573758378849;
        Thu, 14 Nov 2019 11:06:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t8sm6472370pji.11.2019.11.14.11.06.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 11:06:17 -0800 (PST)
Date:   Thu, 14 Nov 2019 11:06:17 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 1/2] nvme: hwmon: provide temperature min and max
 values for each sensor
Message-ID: <20191114190617.GA11288@roeck-us.net>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
 <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 15, 2019 at 12:40:00AM +0900, Akinobu Mita wrote:
> According to the NVMe specification, the over temperature threshold and
> under temperature threshold features shall be implemented for Composite
> Temperature if a non-zero WCTEMP field value is reported in the Identify
> Controller data structure.  The features are also implemented for all
> implemented temperature sensors (i.e., all Temperature Sensor fields that
> report a non-zero value).
> 
> This provides the over temperature threshold and under temperature
> threshold for each sensor as temperature min and max values of hwmon
> sysfs attributes.
> 
> The WCTEMP is already provided as a temperature max value for Composite
> Temperature, but this change isn't incompatible.  Because the default
> value of the over temperature threshold for Composite Temperature is
> the WCTEMP.
> 
> Now the alarm attribute for Composite Temperature indicates one of the
> temperature is outside of a temperature threshold.  Because there is only
> a single bit in Critical Warning field that indicates a temperature is
> outside of a threshold.
> 
> Example output from the "sensors" command:
> 
> nvme-pci-0100
> Adapter: PCI adapter
> Composite:    +33.9°C  (low  = -273.1°C, high = +69.8°C)
>                        (crit = +79.8°C)
> Sensor 1:     +34.9°C  (low  = -273.1°C, high = +65261.8°C)
> Sensor 2:     +31.9°C  (low  = -273.1°C, high = +65261.8°C)
> Sensor 5:     +47.9°C  (low  = -273.1°C, high = +65261.8°C)
> 
> This also adds helper macros for kelvin from/to milli Celsius conversion,
> and replaces the repeated code in nvme-hwmon.c.
> 
> Cc: Keith Busch <kbusch@kernel.org>
> Cc: Jens Axboe <axboe@fb.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Sagi Grimberg <sagi@grimberg.me>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>

Tested with:
	INTEL SSDPEKKW512G7
	Samsung SSD 970 EVO 500GB
	THNSN5256GPU7 NVMe TOSHIBA 256GB

> ---
>  drivers/nvme/host/nvme-hwmon.c | 106 ++++++++++++++++++++++++++++++++++-------
>  include/linux/nvme.h           |   6 +++
>  2 files changed, 96 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/nvme/host/nvme-hwmon.c b/drivers/nvme/host/nvme-hwmon.c
> index 5480cbb..97a84b4 100644
> --- a/drivers/nvme/host/nvme-hwmon.c
> +++ b/drivers/nvme/host/nvme-hwmon.c
> @@ -9,12 +9,57 @@
>  
>  #include "nvme.h"
>  
> +/* These macros should be moved to linux/temperature.h */
> +#define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000)
> +#define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)
> +
>  struct nvme_hwmon_data {
>  	struct nvme_ctrl *ctrl;
>  	struct nvme_smart_log log;
>  	struct mutex read_lock;
>  };
>  
> +static int nvme_get_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
> +				long *temp)
> +{
> +	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
> +	u32 status;
> +	int ret;
> +
> +	if (under)
> +		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
> +
> +	ret = nvme_get_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
> +				&status);
> +	if (ret > 0)
> +		return -EIO;
> +	if (ret < 0)
> +		return ret;
> +	*temp = KELVIN_TO_MILLICELSIUS(status & NVME_TEMP_THRESH_MASK);
> +
> +	return 0;
> +}
> +
> +static int nvme_set_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
> +				long temp)
> +{
> +	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
> +	int ret;
> +
> +	temp = MILLICELSIUS_TO_KELVIN(temp);
> +	threshold |= clamp_val(temp, 0, NVME_TEMP_THRESH_MASK);
> +
> +	if (under)
> +		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
> +
> +	ret = nvme_set_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
> +				NULL);
> +	if (ret > 0)
> +		return -EIO;
> +
> +	return ret;
> +}
> +
>  static int nvme_hwmon_get_smart_log(struct nvme_hwmon_data *data)
>  {
>  	int ret;
> @@ -39,10 +84,11 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  	 */
>  	switch (attr) {
>  	case hwmon_temp_max:
> -		*val = (data->ctrl->wctemp - 273) * 1000;
> -		return 0;
> +		return nvme_get_temp_thresh(data->ctrl, channel, false, val);
> +	case hwmon_temp_min:
> +		return nvme_get_temp_thresh(data->ctrl, channel, true, val);
>  	case hwmon_temp_crit:
> -		*val = (data->ctrl->cctemp - 273) * 1000;
> +		*val = KELVIN_TO_MILLICELSIUS(data->ctrl->cctemp);
>  		return 0;
>  	default:
>  		break;
> @@ -59,7 +105,7 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  			temp = get_unaligned_le16(log->temperature);
>  		else
>  			temp = le16_to_cpu(log->temp_sensor[channel - 1]);
> -		*val = (temp - 273) * 1000;
> +		*val = KELVIN_TO_MILLICELSIUS(temp);
>  		break;
>  	case hwmon_temp_alarm:
>  		*val = !!(log->critical_warning & NVME_SMART_CRIT_TEMPERATURE);
> @@ -73,6 +119,23 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  	return err;
>  }
>  
> +static int nvme_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct nvme_hwmon_data *data = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_temp_max:
> +		return nvme_set_temp_thresh(data->ctrl, channel, false, val);
> +	case hwmon_temp_min:
> +		return nvme_set_temp_thresh(data->ctrl, channel, true, val);
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
>  static const char * const nvme_hwmon_sensor_names[] = {
>  	"Composite",
>  	"Sensor 1",
> @@ -105,8 +168,10 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
>  			return 0444;
>  		break;
>  	case hwmon_temp_max:
> -		if (!channel && data->ctrl->wctemp)
> -			return 0444;
> +	case hwmon_temp_min:
> +		if ((!channel && data->ctrl->wctemp) ||
> +		    (channel && data->log.temp_sensor[channel - 1]))
> +			return 0644;
>  		break;
>  	case hwmon_temp_alarm:
>  		if (!channel)
> @@ -126,16 +191,24 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
>  static const struct hwmon_channel_info *nvme_hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>  	HWMON_CHANNEL_INFO(temp,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
> -				HWMON_T_LABEL | HWMON_T_ALARM,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL),
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_CRIT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL),
>  	NULL
>  };
>  
> @@ -143,6 +216,7 @@ static const struct hwmon_ops nvme_hwmon_ops = {
>  	.is_visible	= nvme_hwmon_is_visible,
>  	.read		= nvme_hwmon_read,
>  	.read_string	= nvme_hwmon_read_string,
> +	.write		= nvme_hwmon_write,
>  };
>  
>  static const struct hwmon_chip_info nvme_hwmon_chip_info = {
> diff --git a/include/linux/nvme.h b/include/linux/nvme.h
> index 269b2e8..347a44f 100644
> --- a/include/linux/nvme.h
> +++ b/include/linux/nvme.h
> @@ -803,6 +803,12 @@ struct nvme_write_zeroes_cmd {
>  
>  /* Features */
>  
> +enum {
> +	NVME_TEMP_THRESH_MASK		= 0xffff,
> +	NVME_TEMP_THRESH_SELECT_SHIFT	= 16,
> +	NVME_TEMP_THRESH_TYPE_UNDER	= 0x100000,
> +};
> +
>  struct nvme_feat_auto_pst {
>  	__le64 entries[32];
>  };
> -- 
> 2.7.4
> 
