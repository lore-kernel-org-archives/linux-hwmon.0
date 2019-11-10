Return-Path: <SRS0=h/x4=ZC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B41C43331
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Nov 2019 16:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7135320854
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Nov 2019 16:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vXD1abRn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKJQa1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Nov 2019 11:30:27 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34560 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKJQa1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Nov 2019 11:30:27 -0500
Received: by mail-pg1-f193.google.com with SMTP id z188so1690769pgb.1
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Nov 2019 08:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UTjXs81R/qeyVjr3pfkjjKOz97DJl742hXi2YeErYJk=;
        b=vXD1abRnXNiR84SS0YjI4eaaeo0QCWoiGsMBH9FbHqwqGuHErV4SjVy5zQ3EVv9AXc
         ZzSktovxd13XQLb/dCsnVeX/k751uDpNSTNWl/tF5hmGP7Nir97oxSBQ6hJkBx62X2/c
         oArQLArwcG+8OqCCVeL7fRWbPL1bRnaUTm7l42mLwx7UL7nT1Swt/IokX7k8rehKqSgk
         kIPzYQLqsSgo7NKK82UB9v+f6zZ4etUkC69OqaZlLEHQ5ZM6QePbem/ZAR/xW2/HUp2N
         QXd28HwsVouxB5T4ajVucVZn/uX6IrIjUG7g3dRhr2H/IKfpy9ex57C3MAlf9CMnraba
         cfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UTjXs81R/qeyVjr3pfkjjKOz97DJl742hXi2YeErYJk=;
        b=NOHw6W14/htXjcFwlyhad6ZQpjQFC4gFCElYKlJ5hP2ifpiPdKHdmIFoYc1c1DNJNx
         eVKsv06bZz9BvkK9HMV7mEL4x/0GhTgfHsJRdqmUgQcEsEZoqVVXAUXXaeSFM0BhQdz/
         dJqZYf4kL3nb4PD2u8Ii46X1ZAJN3JDTz7eUW7M0jmAck08iPd+5F3cgo+TvsFzCJiiY
         7+Mrv2LiO2DyJzbgDtGi/vLQ+Ec+b/xD18+RpTxevtrmSpRt/89biS5EKRYlCECcSmq9
         7vYYJ3eoYMxRVJQ6ywam5mRgea1GA2p0aQBojarglEA7WPvN4x9fL0WL7l0WAf8Uke8x
         rhuw==
X-Gm-Message-State: APjAAAWlf36UND7d+5HPv90dfnbWmGYtKwN0mSzP7U3r1+9SXGNhgVly
        itYu/g02klA83SQRTf+T1Zc=
X-Google-Smtp-Source: APXvYqw95yIAuxu3XHlPAcffm7K9Nd3Wt3/nRUP1TsqSO0eU9dedQSVAg464ycpwXO9RGZSABeg0Gw==
X-Received: by 2002:a17:90a:2ec3:: with SMTP id h3mr28906479pjs.131.1573403425958;
        Sun, 10 Nov 2019 08:30:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9sm12964447pgc.80.2019.11.10.08.30.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Nov 2019 08:30:25 -0800 (PST)
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d3c0c9a7-00b9-0465-16e1-6fd7ba97dfd0@roeck-us.net>
Date:   Sun, 10 Nov 2019 08:30:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/10/19 6:17 AM, Akinobu Mita wrote:
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
> This also provides alarm attributes for each temperature sensor.  But all
> alarm conditions are same, because there is only a single bit in
> Critical Warning field that indicates one of the temperature is outside of
> a temperature threshold.
> 

I think it would be more appropriate to report the alarm only for the
composite temperature, reason being that we don't really know which individual
sensor it is associated with.

> Example output from the "sensors" command:
> 
> nvme-pci-0100
> Adapter: PCI adapter
> Composite:    +53.0 C  (low  = -273.0 C, high = +70.0 C)
>                         (crit = +80.0 C)
> Sensor 1:     +56.0 C  (low  = -273.0 C, high = +65262.0 C)
> Sensor 2:     +51.0 C  (low  = -273.0 C, high = +65262.0 C)
> Sensor 5:     +73.0 C  (low  = -273.0 C, high = +65262.0 C)
> 

Have you tried writing the limits ? On my Intel NVME drive (SSDPEKKW512G7), writing
any minimum limit on the Composite temperature sensor results in a temperature
warning, and that warning is sticky until I reset the controller.
I don't see that problem on Samsung SSD 970 EVO 500GB; I have not yet tried others.

root@jupiter:/sys/class/hwmon/hwmon0# sensors nvme-pci-0100
nvme-pci-0100
Adapter: PCI adapter
Composite:    +30.0°C  (low  = -273.0°C, high = +70.0°C)
                        (crit = +80.0°C)

root@jupiter:/sys/class/hwmon/hwmon0# echo 0 > temp1_min
root@jupiter:/sys/class/hwmon/hwmon0# sensors nvme-pci-0100
nvme-pci-0100
Adapter: PCI adapter
Composite:    +30.0°C  (low  =  +0.0°C, high = +70.0°C)  ALARM
                        (crit = +80.0°C)

It doesn't seem to matter which temperature I write; writing -273000 has
the same result.

[This is actually why I didn't use the features commands; not that I had observed
  the problem, but I was concerned that problems like this would show up.]

> Cc: Keith Busch <kbusch@kernel.org>
> Cc: Jens Axboe <axboe@fb.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Sagi Grimberg <sagi@grimberg.me>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
> This patch depends on the patch "nvme: Add hardware monitoring support" [1]
> [1] http://lists.infradead.org/pipermail/linux-nvme/2019-November/027883.html
> 
>   drivers/nvme/host/nvme-hwmon.c | 98 ++++++++++++++++++++++++++++++++++++------
>   include/linux/nvme.h           |  6 +++
>   2 files changed, 90 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/nvme/host/nvme-hwmon.c b/drivers/nvme/host/nvme-hwmon.c
> index 5480cbb..79323b2 100644
> --- a/drivers/nvme/host/nvme-hwmon.c
> +++ b/drivers/nvme/host/nvme-hwmon.c
> @@ -15,6 +15,46 @@ struct nvme_hwmon_data {
>   	struct mutex read_lock;
>   };
>   
> +static int nvme_get_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
> +				long *temp)
> +{
> +	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
> +	int status;
> +	int ret;
> +
> +	if (under)
> +		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
> +
> +	ret = nvme_get_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
> +				&status);
> +	if (!ret)
> +		*temp = ((status & NVME_TEMP_THRESH_MASK) - 273) * 1000;
> +
> +	return ret <= 0 ? ret : -EIO;
> +}
> +
> +static int nvme_set_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
> +				long temp)
> +{
> +	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
> +	int status;
> +	int ret;
> +
> +	temp = temp / 1000 + 273;
> +	if (temp > NVME_TEMP_THRESH_MASK)
> +		return -EINVAL;
> +

Traditionally we use clamp_val() in hwmon drivers to adjust value ranges
for limit attributes, reason being that we can't expect userspace to dig
through per-sensor-type documentation to identify valid limits. Also, note
that the above does not handle negative values well (-274000 -> -274 -> -1).
I would suggest something like

	temp = temp / 1000 + 273;
	temp = clamp_val(temp, 0, NVME_TEMP_THRESH_MASK);

or, if you want to be fancy;

	temp = DIV_ROUND_CLOSEST(temp, 1000) - 273;
	temp = clamp_val(temp, 0, NVME_TEMP_THRESH_MASK);

> +	threshold |= temp;
> +
> +	if (under)
> +		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
> +
> +	ret = nvme_set_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
> +				&status);

I am a bit baffled here. The last parameter of nvme_set_features() (and nvme_get_features)
is a pointer to u32, but status is declared as int. I would have assumed this generates
a compiler warning, but it doesn't, at least not with my version of gcc.

Either case, it might be better to declare status as u32 (unless I did not have enough
coffee and I am missing something).

Also, I assume that the returned status value is irrelevant. I don't find useful
information in the specification, but I may be missing it.

> +
> +	return ret <= 0 ? ret : -EIO;
> +}
> +
>   static int nvme_hwmon_get_smart_log(struct nvme_hwmon_data *data)
>   {
>   	int ret;
> @@ -39,8 +79,12 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>   	 */
>   	switch (attr) {
>   	case hwmon_temp_max:
> -		*val = (data->ctrl->wctemp - 273) * 1000;
> +		err = nvme_get_temp_thresh(data->ctrl, channel, false, val);
> +		if (err)
> +			*val = (data->ctrl->wctemp - 273) * 1000;

This would report WCTEMP for all sensors on errors, including errors seen while
the controller is resetting. I think it should be something like

		int err = 0;
		...

		if (!channel)
			*val = (data->ctrl->wctemp - 273) * 1000;
		else
			err = nvme_get_temp_thresh(data->ctrl, channel, false, val);
		return err;

assuming we keep using ctrl->wctemp (see below). If changing the upper Composite
temperature sensor limit changes wctemp, and we don't update it, we should not
use it at all after registration and just report the error.

>   		return 0;
> +	case hwmon_temp_min:
> +		return nvme_get_temp_thresh(data->ctrl, channel, true, val);
>   	case hwmon_temp_crit:
>   		*val = (data->ctrl->cctemp - 273) * 1000;
>   		return 0;
> @@ -73,6 +117,23 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>   	return err;
>   }
>   
> +static int nvme_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct nvme_hwmon_data *data = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_temp_max:
> +		return nvme_set_temp_thresh(data->ctrl, channel, false, val);

Does this change WCTEMP if written on channel 0 ? If so, we would have to update
the cached value of ctrl->wctemp (or never use it after registration).

> +	case hwmon_temp_min:
> +		return nvme_set_temp_thresh(data->ctrl, channel, true, val);
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
>   static const char * const nvme_hwmon_sensor_names[] = {
>   	"Composite",
>   	"Sensor 1",
> @@ -105,13 +166,13 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
>   			return 0444;
>   		break;
>   	case hwmon_temp_max:
> +	case hwmon_temp_min:
>   		if (!channel && data->ctrl->wctemp)
> -			return 0444;
> +			return 0644;
> +		else if (data->log.temp_sensor[channel - 1])
> +			return 0644;

This ends up with a negative index into data->log.temp_sensor
if data->ctrl->wctemp == 0. It needs to be
		else if (channel && data->log.temp_sensor[channel - 1])
It can also be written as a single conditional since the return value is the same.

>   		break;
>   	case hwmon_temp_alarm:
> -		if (!channel)
> -			return 0444;
> -		break;
>   	case hwmon_temp_input:
>   	case hwmon_temp_label:
>   		if (!channel || data->log.temp_sensor[channel - 1])
> @@ -126,16 +187,24 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
>   static const struct hwmon_channel_info *nvme_hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>   	HWMON_CHANNEL_INFO(temp,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_CRIT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
>   				HWMON_T_LABEL | HWMON_T_ALARM,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL),
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +				HWMON_T_LABEL | HWMON_T_ALARM),
>   	NULL
>   };
>   
> @@ -143,6 +212,7 @@ static const struct hwmon_ops nvme_hwmon_ops = {
>   	.is_visible	= nvme_hwmon_is_visible,
>   	.read		= nvme_hwmon_read,
>   	.read_string	= nvme_hwmon_read_string,
> +	.write		= nvme_hwmon_write,
>   };
>   
>   static const struct hwmon_chip_info nvme_hwmon_chip_info = {
> diff --git a/include/linux/nvme.h b/include/linux/nvme.h
> index 269b2e8..347a44f 100644
> --- a/include/linux/nvme.h
> +++ b/include/linux/nvme.h
> @@ -803,6 +803,12 @@ struct nvme_write_zeroes_cmd {
>   
>   /* Features */
>   
> +enum {
> +	NVME_TEMP_THRESH_MASK		= 0xffff,
> +	NVME_TEMP_THRESH_SELECT_SHIFT	= 16,
> +	NVME_TEMP_THRESH_TYPE_UNDER	= 0x100000,
> +};
> +
>   struct nvme_feat_auto_pst {
>   	__le64 entries[32];
>   };
> 

