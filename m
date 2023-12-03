Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JvV19AXC"
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51C6F4
	for <linux-hwmon@vger.kernel.org>; Sun,  3 Dec 2023 06:14:11 -0800 (PST)
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 9nEUrOgUx2dY39nEUruSbe; Sun, 03 Dec 2023 15:14:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1701612849;
	bh=vHH2Bjj48Djz2RY9cadX3OGXazgeoGZS6s9g0Hw2khU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JvV19AXC2mDarEzEI3CJF4WQd0A/kKs9PeYNCmInPJQ4gT1ta96UZOjrU9I26rjyN
	 bZGNokqYmrPnECPZJ+EFxhEM9CCeAzslkSyLamP0M5MCPbZCiYT7PyPkNXHnsBq74W
	 BvzQAJ4ag08L/SapDPDBykUuMngmi3BSakO4McFQ6XY6CsqvJIKw2KQZntmrlGntLj
	 WEwkYG4RViURq0vkuH94nk6/ca6b9DRuFQ+nalLvlfUbVhnKT8eA7l2Q0/kj9zUFRK
	 npMUFKikdXjUVvILHelWDTj5RtsYZfs7igJbMKY0+Q4nSy60Lj+cLdIXcE05wslK0Q
	 zTqia6ZWn9IOA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Dec 2023 15:14:08 +0100
X-ME-IP: 92.140.202.140
Message-ID: <2a89f0b4-990a-4d0d-8e54-c4215579c23c@wanadoo.fr>
Date: Sun, 3 Dec 2023 15:14:05 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add driver for Gigabyte AORUS Waterforce AIO
 coolers
Content-Language: fr
To: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231203120651.371429-1-savicaleksa83@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20231203120651.371429-1-savicaleksa83@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/12/2023 à 13:06, Aleksa Savic a écrit :
> This driver exposes hardware sensors of the Gigabyte AORUS Waterforce
> all-in-one CPU liquid coolers, which communicate through a proprietary
> USB HID protocol. Report offsets were initially discovered in [1] and
> confirmed by me on a Waterforce X240 by observing the sent reports from
> the official software.
> 
> Available sensors are pump and fan speed in RPM, as well as coolant
> temperature. Also available through debugfs is the firmware version.
> 
> Attaching a fan is optional and allows it to be controlled from the
> device. If it's not connected, the fan-related sensors will report
> zeroes.
> 
> The addressable RGB LEDs and LCD screen are not supported in this
> driver and should be controlled through userspace tools.
> 
> [1]: https://github.com/liquidctl/liquidctl/issues/167
> 
> Signed-off-by: Aleksa Savic <savicaleksa83@gmail.com>
> ---

Hi,
...

> +/* Writes the command to the device with the rest of the report filled with zeroes */
> +static int waterforce_write_expanded(struct waterforce_data *priv, const u8 *cmd, int cmd_length)
> +{
> +	int ret;
> +
> +	mutex_lock(&priv->buffer_lock);
> +
> +	memset(priv->buffer, 0x00, MAX_REPORT_LENGTH);
> +	memcpy(priv->buffer, cmd, cmd_length);

Is memcpy_and_pad() useful here?

> +	ret = hid_hw_output_report(priv->hdev, priv->buffer, MAX_REPORT_LENGTH);
> +
> +	mutex_unlock(&priv->buffer_lock);
> +	return ret;
> +}

...

> +static int waterforce_read(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	int ret;
> +	struct waterforce_data *priv = dev_get_drvdata(dev);
> +
> +	if (time_after(jiffies, priv->updated + msecs_to_jiffies(STATUS_VALIDITY))) {
> +		/* Request status on demand */
> +		ret = waterforce_get_status(priv);
> +		if (ret < 0)
> +			return -ENODATA;
> +	}
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		*val = priv->temp_input[channel];
> +		break;
> +	case hwmon_fan:
> +		*val = priv->speed_input[channel];
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			*val = DIV_ROUND_CLOSEST(priv->duty_input[channel] * 255, 100);
> +			break;
> +		default:
> +			break;

Should we return an error here?

> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;	/* unreachable */
> +	}
> +
> +	return 0;
> +}

...

> +static int waterforce_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	struct waterforce_data *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->hdev = hdev;
> +	hid_set_drvdata(hdev, priv);
> +
> +	/*
> +	 * Initialize priv->updated to STATUS_VALIDITY seconds in the past, making
> +	 * the initial empty data invalid for waterforce_read() without the need for
> +	 * a special case there.
> +	 */
> +	priv->updated = jiffies - msecs_to_jiffies(STATUS_VALIDITY);
> +
> +	ret = hid_parse(hdev);
> +	if (ret) {
> +		hid_err(hdev, "hid parse failed with %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Enable hidraw so existing user-space tools can continue to work.
> +	 */
> +	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	if (ret) {
> +		hid_err(hdev, "hid hw start failed with %d\n", ret);
> +		goto fail_and_stop;

Should this be 'return ret;' (the _start has failed, so why stop?)

> +	}
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		hid_err(hdev, "hid hw open failed with %d\n", ret);
> +		goto fail_and_close;

Should this be 'fail_and_stop' (the _open has failed, so why close?)

> +	}
> +
> +	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
> +	if (!priv->buffer) {
> +		ret = -ENOMEM;
> +		goto fail_and_close;
> +	}
> +
> +	mutex_init(&priv->status_report_request_mutex);
> +	mutex_init(&priv->buffer_lock);
> +	spin_lock_init(&priv->status_report_request_lock);
> +	init_completion(&priv->status_report_received);
> +	init_completion(&priv->fw_version_processed);
> +
> +	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "waterforce",
> +							  priv, &waterforce_chip_info, NULL);
> +	if (IS_ERR(priv->hwmon_dev)) {
> +		ret = PTR_ERR(priv->hwmon_dev);
> +		hid_err(hdev, "hwmon registration failed with %d\n", ret);
> +		goto fail_and_close;
> +	}
> +
> +	hid_device_io_start(hdev);
> +	ret = waterforce_get_fw_ver(hdev);
> +	if (ret < 0)
> +		hid_warn(hdev, "fw version request failed with %d\n", ret);
> +	hid_device_io_stop(hdev);
> +
> +	waterforce_debugfs_init(priv);
> +
> +	return 0;
> +
> +fail_and_close:
> +	hid_hw_close(hdev);
> +fail_and_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void waterforce_remove(struct hid_device *hdev)
> +{
> +	struct waterforce_data *priv = hid_get_drvdata(hdev);
> +
> +	hwmon_device_unregister(priv->hwmon_dev);

Should debugfs_remove_recursive(() be called?
(if CONFIG_DEBUG_FS is defined)

CJ

> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}

...

