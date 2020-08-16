Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3FBC433DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 00:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 856FA20704
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 00:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhQoQkjr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgHPAB2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 20:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgHPAB1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 20:01:27 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F481C061786;
        Sat, 15 Aug 2020 17:01:27 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id kr4so6023279pjb.2;
        Sat, 15 Aug 2020 17:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1g3oensl/bRAchzBqZesu45uMev3BVjyPYbpqq5ZTYw=;
        b=YhQoQkjrhc4CoUh9sASFDCH0SMnhl7ngh7zBs7klpt8VO2cs4Me+6fG1qx2thMkoh3
         hY7KfTDSTKsfzE4ynOj9QFv11SvkOsmDhPZ23vGLVxuZpYU1aNO+I+6+wdEMVlU9xVXJ
         /K3BHd5I9Qs9KR1xpzCSd5iC6hlP2QddLTlEoe2QQBFaMcT+RG8/GFTbod0WLsFPhkut
         y74lOQZ1dWs2dOx4+r3yJI/0BYHp5yXYVt1BmaN9Asizb6ny4GWnybxzerp+wgTPaiyH
         g7Aqf9ewvJT+gjloF1eJRTA4RUrPTAnupmc+3NXDj/8paaj2ntOjjn86N2d0QOg4P9nG
         ZfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1g3oensl/bRAchzBqZesu45uMev3BVjyPYbpqq5ZTYw=;
        b=AQk7bvvv0aDQgeTxloEO657wBF6GRdZ1w/t4DoHkLpCBqSRD7BecaUxuptIqZJJ4BT
         AWVtWgt7nNFVZ944UIF62jThLYva9gI8eGo14xBzSGAn8w38kVJcjyhiGaWZrEK3SG78
         leb1UPhglEufs/FI52ven5IK5z8LR+1gDJobfxGsgad3IhY+20wxWR5L74tF9I58SnCB
         Qha5Vus6k0ybSatxBA8gLK6GCqVgERzZccTIGBa/UrToDzC/mwBcAUFg/Ueu/ks90F5n
         VmwPn5KjM8KwQPngU/M9u6kjzac82oEX69xfbs6UGbJXFZMvDeFjAcNfZuSoYpB8KwgV
         fQqA==
X-Gm-Message-State: AOAM532OkXM+ep5Nfs1EzPToO5Is4avnai2zJR0XynJ+0xyTXBtITVAV
        tWV4MH+tj9RCRqMPDA+6DV0US0wZZ0Y=
X-Google-Smtp-Source: ABdhPJwcOAiD2ZgSBwZ4khkwD9ryCFX4hF9DtA9TE0908GBlymopsknjXZYmiIM1v3GFBJUoUfG8mQ==
X-Received: by 2002:a17:902:8a85:: with SMTP id p5mr6689380plo.193.1597536086014;
        Sat, 15 Aug 2020 17:01:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t25sm13063178pfe.51.2020.08.15.17.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2020 17:01:25 -0700 (PDT)
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        jaap aarts <jaap.aarts1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20200815211617.86565-1-jaap.aarts1@gmail.com>
 <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <99ee823b-b1fa-74a0-e377-31dc97e4d985@roeck-us.net>
Date:   Sat, 15 Aug 2020 17:01:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/15/20 3:54 PM, Barnabás Pőcze wrote:
> Hello,
> 
> there are a couple things that I did not notice in v3, or were introduced in
> this version of the patch.
> 
> 
>> [...]
>> +
>> +#define max_fan_count 2
>> +#define max_pwm_channel_count max_fan_count
>> +
> 
> I think these should be all-caps as per
> https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enums-and-rtl
> 
> 
>> [...]
>> +
>> +#define default_curve quiet_curve
>> +
> 
> I am inclined to say that this should be all-caps as well.
> 
> 
>> [...]
>> +static int transfer_usb(struct hydro_i_pro_device *hdev,
>> +			unsigned char *send_buf, unsigned char *recv_buf,
>> +			int send_len, int recv_len)
>> +{
>> +	int retval;
>> +	int wrote;
>> +	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
>> +	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
>> +
>> +	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, send_len, &wrote,
>> +			      BULK_TIMEOUT);
>> +	if (retval)
>> +		return retval;
>> +
>> +	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, &wrote,
>> +			      BULK_TIMEOUT);
>> +	if (retval)
>> +		return retval;
>> +	return 0;
> 
> The preceding 5 lines could be simplified to the following:
> 
> return usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, &wrote,
> 		    BULK_TIMEOUT);
> 
> And if you don't use 'wrote', you can simply pass 'NULL' as the 5th argument of
> usb_bulk_msg(). Although you should either check the value or set 'recv_buf' to
> all zeroes in the calling function to avoid the possibility of a failed transaction
> being recognized as successful.
> 
> 
>> +}
>> +
>> +static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
>> +			     struct hwmon_fan_data *fan_data,
>> +			     struct curve_point point[7])
>> +{
>> +	int retval;
>> +	unsigned char *send_buf = hdev->bulk_out_buffer;
>> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
>> +
>> +	memcpy(fan_data->curve, point, sizeof(struct curve_point) * 7);
>> +
> 
> Personally, I'd use 'sizeof(fan_data->curve)' here. And consider making that
> seven a named constant.
> 
> Beware that even though the size is there in 'struct curve_point point[7]',
> you can still pass arrays that are smaller than that. Consider using
> 'struct curve_point point[static 7]'.
> 
> 
>> +	send_buf[0] = PWM_FAN_CURVE_CMD;
>> +	send_buf[1] = fan_data->fan_channel;
>> +	send_buf[2] = point[0].temp;
>> +	send_buf[3] = point[1].temp;
>> +	send_buf[4] = point[2].temp;
>> +	send_buf[5] = point[3].temp;
>> +	send_buf[6] = point[4].temp;
>> +	send_buf[7] = point[5].temp;
>> +	send_buf[8] = point[6].temp;
>> +	send_buf[9] = point[0].pwm;
>> +	send_buf[10] = point[1].pwm;
>> +	send_buf[11] = point[2].pwm;
>> +	send_buf[12] = point[3].pwm;
>> +	send_buf[13] = point[4].pwm;
>> +	send_buf[14] = point[5].pwm;
>> +	send_buf[15] = point[6].pwm;
>> +
>> +	retval = transfer_usb(hdev, send_buf, recv_buf, 16, 4);
>> +	if (retval)
>> +		return retval;
>> +
>> +	if (!check_succes(send_buf[0], recv_buf)) {
>> +		dev_warn(
>> +			&hdev->udev->dev,
>> +			"failed setting fan pwm/temp curve for %s on channel %d %d,%d,%d\n",
>> +			hdev->config->name, recv_buf[3], recv_buf[0],
>> +			recv_buf[1], recv_buf[2]);
>> +		return -EINVAL;
>> +	}
>> +	return 0;
>> +}
>> +
>> [...]
>> +
>> +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
>> +			      struct hwmon_fan_data *fan_data, u8 val)
>> +{
>> +	int retval;
>> +	unsigned char *send_buf = hdev->bulk_out_buffer;
>> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
>> +
>> +	fan_data->fan_target = 0;
>> +	fan_data->fan_pwm_target = val;
>> +
>> +	send_buf[0] = PWM_FAN_TARGET_CMD;
>> +	send_buf[1] = fan_data->fan_channel;
>> +	send_buf[3] = fan_data->fan_pwm_target;
>> +
>> +	retval = transfer_usb(hdev, send_buf, recv_buf, 4, 6);
>> +	if (retval)
>> +		return retval;
>> +
>> +	if (!check_succes(send_buf[0], recv_buf)) {
> 
> Any reason why you don't check recv_buf[3] as in get_fan_current_rpm()?
> (same applies to set_fan_pwm_curve() and set_fan_target_rpm())
> 
> 
>> +		dev_warn(
>> +			&hdev->udev->dev,
>> +			"failed setting fan pwm for %s on channel %d %d,%d,%d\n",
>> +			hdev->config->name, recv_buf[3], recv_buf[0],
>> +			recv_buf[1], recv_buf[2]);
>> +		return -EINVAL;
>> +	}
>> +	return 0;
>> +}
>> +
>> [...]
>> +
>> +static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>> +		       u32 attr, int channel, long val)
>> +{
>> +	struct hwmon_data *data = dev_get_drvdata(dev);
>> +	struct hydro_i_pro_device *hdev = data->hdev;
>> +	struct hwmon_fan_data *fan_data;
>> +	int retval = 0;
>> +
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		switch (attr) {
>> +		case hwmon_fan_target:
>> +			fan_data = data->channel_data[channel];
>> +			if (fan_data->mode != 1)
>> +				return -EINVAL;
>> +
>> +			if (val < (2 ^ 16) - 2)
> 
> Did you intend to write 2 to the power of 16? Because 2^16 is not that.
> 2 to the power 16 may be written as '(1 << 16)' or 'BIT(16)'
> (you may need to include linux/bits.h for the latter)
> 
> But something like this is my suggestion:
> 
> if (val < 0 || 0xFFFF < val)
> 	return -EINVAL;
> 

I would suggest to use clamp_val; we don't expect users to know device
specific limits. Also, FTR, I won't accept any Yoda programming.

Guenter

> Though, I suspect the fans won't go up to 60000 RPM or so.
> 
> 
>> +				return -EINVAL;
>> +
>> +			retval = acquire_lock(hdev);
>> +			if (retval)
>> +				goto exit;
>> +
>> +			retval = set_fan_target_rpm(hdev, fan_data, val);
>> +			if (retval)
>> +				goto cleanup;
>> +
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		break;
>> +	case hwmon_pwm:
>> +		switch (attr) {
>> +		case hwmon_pwm_input:
>> +			fan_data = data->channel_data[channel];
>> +			if (fan_data->mode != 1)
>> +				return -EINVAL;
>> +
>> +			if (val < (2 ^ 8) - 2)
> 
> Same here, 2^8 != 2 to the power of 8.
> 
> I suggest you simply do something like the following:
> 
> if (val < 0 || 0xFF < val)
> 	return -EINVAL;
> 
> 
>> +				return -EINVAL;
>> +
>> +			retval = acquire_lock(hdev);
>> +			if (retval)
>> +				goto exit;
>> +
>> +			retval = set_fan_target_pwm(hdev, fan_data, val);
>> +			if (retval)
>> +				goto cleanup;
>> +
>> +			break;
>> +		case hwmon_pwm_enable:
>> +			fan_data = data->channel_data[channel];
>> +
>> +			switch (val) {
>> +			case 0:
>> +				retval = acquire_lock(hdev);
>> +				if (retval)
>> +					goto exit;
>> +
>> +				retval = set_fan_pwm_curve(hdev, fan_data,
>> +							   default_curve);
>> +				if (retval)
>> +					goto cleanup;
>> +				fan_data->mode = 0;
>> +				break;
>> +			case 1:
>> +				retval = acquire_lock(hdev);
>> +				if (retval)
>> +					goto exit;
>> +
>> +				if (fan_data->fan_target != 0) {
>> +					retval = set_fan_target_rpm(
>> +						hdev, fan_data,
>> +						fan_data->fan_target);
>> +					if (retval)
>> +						goto cleanup;
>> +				} else if (fan_data->fan_pwm_target != 0) {
>> +					retval = set_fan_target_pwm(
>> +						hdev, fan_data,
>> +						fan_data->fan_pwm_target);
>> +					if (retval)
>> +						goto cleanup;
>> +				}
>> +				fan_data->mode = 1;
>> +				break;
>> +			case 2:
>> +				retval = acquire_lock(hdev);
>> +				if (retval)
>> +					goto exit;
>> +
>> +				retval = set_fan_pwm_curve(hdev, fan_data,
>> +							   default_curve);
>> +				if (retval)
>> +					goto cleanup;
>> +				fan_data->mode = 2;
>> +				break;
> 
> If I see it correctly, case 0 and case 2 are the basically the same, no?
> If so, then you could merge them.
> 
> 
>> +			default:
>> +				return -EINVAL;
>> +			}
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +cleanup:
>> +	mutex_unlock(&hdev->io_mutex);
>> +	usb_autopm_put_interface(hdev->interface);
>> +exit:
>> +	return retval;
>> +}
>> +
>> +static int hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>> +		      u32 attr, int channel, long *val)
>> +{
>> +	struct hwmon_data *data = dev_get_drvdata(dev);
>> +	struct hydro_i_pro_device *hdev = data->hdev;
>> +	struct hwmon_fan_data *fan_data;
>> +	int retval = 0;
>> +
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		switch (attr) {
>> +		case hwmon_fan_input:
>> +			fan_data = data->channel_data[channel];
>> +
>> +			retval = acquire_lock(hdev);
>> +			if (retval)
>> +				goto exit;
>> +
>> +			retval = get_fan_current_rpm(hdev, fan_data, val);
>> +			if (retval)
>> +				goto cleanup;
>> +
>> +			goto cleanup;
> 
> The preceding 3 lines can be replaced by a single 'break' given that the
> 'goto exit' is replaced by a 'break' after the 'switch (attr)'
> 
> 
>> +		case hwmon_fan_target:
>> +			fan_data = data->channel_data[channel];
>> +			if (fan_data->mode != 1) {
>> +				*val = 0;
>> +				goto exit;
>> +			}
>> +			*val = fan_data->fan_target;
>> +			goto exit;
>> +		case hwmon_fan_min:
>> +			*val = 200;
>> +			goto exit;
>> +
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		goto exit;
>> +
> 
> I don't see why this goto is needed here. It has no effect on the control flow.
> 
> 
>> +	case hwmon_pwm:
>> +		switch (attr) {
>> +		case hwmon_pwm_enable:
>> +			fan_data = data->channel_data[channel];
>> +			*val = fan_data->mode;
>> +			goto exit;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		goto exit;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +cleanup:
>> +	mutex_unlock(&hdev->io_mutex);
>> +	usb_autopm_put_interface(hdev->interface);
>> +exit:
>> +	return retval;
>> +}
>> +
>> +static const struct hwmon_ops i_pro_ops = {
>> +	.is_visible = hwmon_is_visible,
>> +	.read = hwmon_read,
>> +	.write = hwmon_write,
>> +};
>> +
>> +static void hwmon_init(struct hydro_i_pro_device *hdev)
>> +{
>> +	u8 fan_id;
>> +	struct device *hwmon_dev;
>> +	struct hwmon_fan_data *fan;
>> +	struct hwmon_data *data = devm_kzalloc(
>> +		&hdev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
>> +	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
>> +		&hdev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
>> +
>> +	/* You did something bad!! Either adjust  max_fan_count or the fancount for the config!*/
>> +	WARN_ON(hdev->config->fancount >= max_pwm_channel_count);
> 
> If this warning is triggered, then that leads to the overflow of 'data->channel_data' later on.
> 
> 
>> +	data->channel_count = hdev->config->fancount;
>> +
>> +	/* For each fan create a data channel a fan config entry and a pwm config entry */
>> +	for (fan_id = 0; fan_id < data->channel_count; fan_id++) {
>> +		fan = devm_kzalloc(&hdev->udev->dev,
>> +				   sizeof(struct hwmon_fan_data), GFP_KERNEL);
>> +		fan->fan_channel = fan_id;
>> +		fan->mode = 0;
>> +		data->channel_data[fan_id] = fan;
>> +	}
>> +
>> +	hwmon_info->ops = &i_pro_ops;
>> +	hwmon_info->info = hdev->config->hwmon_info;
>> +
>> +	data->hdev = hdev;
>> +	hwmon_dev = devm_hwmon_device_register_with_info(
>> +		&hdev->udev->dev, hdev->config->name, data, hwmon_info, NULL);
>> +	dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->name);
>> +}
>> +
> 
> There is absolutely no error checking in hwmon_init().
> 
> 
>> +const int USB_VENDOR_ID_CORSAIR = 0x1b1c;
>> +const int USB_PRODUCT_ID_H100I_PRO = 0x0c15;
> 
> I think these should be either - preferably - #define's or 'static' at least.
> 
> 
>> +/*
>> + * Devices that work with this driver.
>> + * More devices should work, however none have been tested.
>> + */
>> +static const struct usb_device_id astk_table[] = {
>> +	{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_H100I_PRO),
>> +	  .driver_info = (kernel_ulong_t)&config_table[0] },
>> +	{},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(usb, astk_table);
>> +
>> +static int init_device(struct usb_device *udev)
>> +{
>> +	int retval;
>> +
>> +	/*
>> +	 * This is needed because when running windows in a vm with proprietary driver
>> +	 * and you switch to this driver, the device will not respond unless you run this.
>> +	 */
>> +	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
>> +				 0xffff, 0x0000, 0, 0, 0);
>> +	/*this always returns error*/
>> +	if (retval)
>> +		;
> 
> Shouldn't you check if it's the "good" kind of error?
> 
> 
>> +
>> +	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
>> +				 0x0002, 0x0000, 0, 0, 0);
>> +	return retval;
>> +}
>> +
>> +static int deinit_device(struct usb_device *udev)
>> +{
>> +	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
>> +			       0x0004, 0x0000, 0, 0, 0);
>> +}
>> +
>> +static void astk_delete(struct hydro_i_pro_device *hdev)
>> +{
>> +	usb_put_intf(hdev->interface);
>> +	usb_put_dev(hdev->udev);
>> +	kfree(hdev->bulk_in_buffer);
>> +	kfree(hdev->bulk_out_buffer);
>> +	kfree(hdev);
>> +}
>> +
> 
> I think you should call mutex_destroy() in astk_delete().
> 
> 
>> +static int astk_probe(struct usb_interface *interface,
>> +		      const struct usb_device_id *id)
>> +{
>> +	struct hydro_i_pro_device *hdev =
>> +		kzalloc(sizeof(struct hydro_i_pro_device), GFP_KERNEL);
> 
> I think this should be modifed to use 'sizeof(*ptr)' as per
> https://www.kernel.org/doc/html/latest/process/coding-style.html#allocating-memory
> (and everything else that uses the same pattern)
> 
> 
> 
>> [...]
>> +	retval = init_device(hdev->udev);
>> +	if (retval) {
>> +		dev_err(&interface->dev, "failed initialising %s\n",
>> +			hdev->config->name);
> 
> If you print the error code, that helps immensely with troubleshooting.
> 
> 
>> +		kfree(hdev);
>> +		goto exit;
>> +	}
>> +
>> +	hwmon_init(hdev);
>> +
>> +	usb_set_intfdata(interface, hdev);
>> +	mutex_init(&hdev->io_mutex);
>> +exit:
>> +	return retval;
>> +}
>> +
>> [...]
> 
> 
> Barnabás Pőcze
> 

