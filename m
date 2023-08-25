Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205B4C71133
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Aug 2023 03:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbjHYDLv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Aug 2023 23:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjHYDL1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Aug 2023 23:11:27 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CB3A1
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 20:11:24 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id BED405C02A6;
        Thu, 24 Aug 2023 23:11:23 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute6.internal (MEProxy); Thu, 24 Aug 2023 23:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
        cc:cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1692933083; x=1693019483; bh=fW
        +U7qm7VXD9kvD3ZBDZFG7hDtMrYekRiLGj5R3scDk=; b=YjMTZDSI78lHOaY20Y
        Z61OZLO8wJheUNXsP9sSGZnLJx/1fHzkCHBcY9W+Dg8go+tRCQ2GS7xyOd/EGEdC
        /DYMpYaWX69ICZqY35zoCAWHuMo2j/GHPHN5ZgMPZqFPtgDZcWs5LDPOQq9yTHs0
        QhjiRaDF0SHP2MPEh8mD2UXEj6oYC9ksWc97S7gI+ngT6TBsaMiXhMJo9v7RGeOA
        xZ9f2Ss15vlA08dvTSvtBWdzsTOx+UlO/xOarmxol/GBj2iTOc2s859i4+zh3Rhj
        Zd9i1i5RrafLDm5C2P0PlJHGWs3QRgSrYgK7wci6PYmZ20JtAR0VT4cmj8WFnKPs
        C2yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692933083; x=1693019483; bh=fW+U7qm7VXD9k
        vD3ZBDZFG7hDtMrYekRiLGj5R3scDk=; b=SYtg2jiJT404uvLvRhGFk3a6znrOO
        XNaAl/mI6akKiyomKWrgO5Oelvo2tIXAz2TJlQ3lNk5LMNZqumb9xeKICrGMQygW
        FDAi5DQUikl7SOsIkMbdZAYDnhd2Tt9lCKNCowu7X61HpPaSQB4SwsQwS7iibHxu
        r27s/Yn3flKriwoOLNqbRD2JV5yFSXrtKJryHm+JmQg8iTc+QuA8nHgC1mK/Uw6T
        kpL6Y55RpX6OnKs5BswmRvIRiJZiaEh+OG+x9gOy4AzK939c8HeGSlEZmdvcsdal
        h18dvsqB9OBAJmvCZcIMdPPigfHxJtSnqDiBodxYhM0kQnPNs/XFuq0Jw==
X-ME-Sender: <xms:2xvoZMyUVpsMsWOoSfyz0TsPfosHZM9mRvMLwN52RNSvhvIFdmx8KA>
    <xme:2xvoZAS_kkmCnUiK5cWPyjVB8joXxsyf_MfOksFmp2_CW7Nft2S6SwXHwwC5Wocj2
    5v3MkSQXLbNr6Dv4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvjedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghm
    hiesshihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeekfeethedtjeevve
    elteejfeeiffehfeduveeftdeugfdvieettedvhfehueelffenucffohhmrghinheprhhs
    thdrihhtpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedunecurfgrrh
    grmhepmhgrihhlfhhrohhmpehjvghrvghmhiesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:2xvoZOVEKbIE2wDqgJsVUjXffNn0RQMSmeYzJEDXhUq5e0ZMDzWNsQ>
    <xmx:2xvoZKh_d01UPT8XfArEK1k9MFXWwdKFYljnX7sZHJzt1nzxIwSYgA>
    <xmx:2xvoZOAOtvM-zw0pleNxAg_nMUYk0RBMUQ1IBAH5zFajsCFPutSkew>
    <xmx:2xvoZF9O5ifxLDT-IJjwj-lgQ1-j5KYOQsc1mzEEzCkJuVKLNwOxyQ>
Feedback-ID: ic629427b:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4C94836A0075; Thu, 24 Aug 2023 23:11:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-647-g545049cfe6-fm-20230814.001-g545049cf
Mime-Version: 1.0
Message-Id: <4778fd69-453d-479c-a309-9063bad2e994@app.fastmail.com>
In-Reply-To: <4dd9b410-9bbe-45a1-99b9-01fdb05f06cf@app.fastmail.com>
References: <84162cdd-cf70-4148-96ea-2a9d28a37ae2@app.fastmail.com>
 <a3af270b-d432-4cf2-b896-2512dc6b3a1d@roeck-us.net>
 <e50f3375-b3d2-40e8-bfa3-5e0bbb0f386f@app.fastmail.com>
 <a2cc2fea-ae5c-4c03-8cf6-a913d39c253d@app.fastmail.com>
 <fc68960f-609e-4fe4-a3e9-c23023717beb@app.fastmail.com>
 <4d3dff93-5c70-4ca1-b819-7f0eca3a8b38@app.fastmail.com>
 <94fb1d6c-7ddc-4d7c-8ef7-44a1f3fe7038@roeck-us.net>
 <4dd9b410-9bbe-45a1-99b9-01fdb05f06cf@app.fastmail.com>
Date:   Thu, 24 Aug 2023 21:11:04 -0600
From:   "Jeremy Soller" <jeremy@system76.com>
To:     "Guenter Roeck" <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: Add System76 Thelio Io driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Almost none of your commentary is about the actual change.

-- 
  Jeremy Soller
  System76
  Principal Engineer
  jeremy@system76.com

On Thu, Aug 24, 2023, at 9:10 PM, Jeremy Soller wrote:
> I give up.
>
> -- 
>   Jeremy Soller
>   System76
>   Principal Engineer
>   jeremy@system76.com
>
> On Thu, Aug 24, 2023, at 8:56 PM, Guenter Roeck wrote:
>> On Thu, Aug 24, 2023 at 02:39:02PM -0600, Jeremy Soller wrote:
>>> The System76 Thelio Io is a fan and power button LED controller. This
>>> driver fully supports the System76 Thelio Io, by exposing fan controls
>>> and sending the system suspend/resume state.
>>> 
>>
>> You might want to consider reading
>> Documentation/process/submitting-patches.rst. It would tell you that
>>
>> ... However, for a multi-patch series, it is generally
>> best to avoid using In-Reply-To: to link to older versions of the
>> series.  This way multiple versions of the patch don't become an
>> unmanageable forest of references in email clients.  If a link is
>> helpful, you can use the https://lore.kernel.org/ redirector (e.g., in
>> the cover email text) to link to an earlier version of the patch series.
>>
>> It might possibly make sense to also add a note saying something like
>> "don't send X revisions of your patch in a row".
>>
>>> Signed-off-by: Jeremy Soller <jeremy@system76.com>
>>> ---
>>
>> Missing change log. You are flooding me with patch revisions. Do you
>> really expect me to look into each of those to figure out what you
>> changed ?
>>
>> Random feedback below. Since the is no explanation for what has
>> changed and what hasn't and why, the feedback is necessarily
>> incomplete.
>>
>>>  Documentation/hwmon/system76-thelio-io.rst |  31 ++
>>
>> Missing reference in Documentation/hwmon/index.rst
>>
>>>  MAINTAINERS                                |   7 +
>>>  drivers/hwmon/Kconfig                      |  10 +
>>>  drivers/hwmon/Makefile                     |   1 +
>>>  drivers/hwmon/system76-thelio-io.c         | 424 +++++++++++++++++++++
>>>  5 files changed, 473 insertions(+)
>>>  create mode 100644 Documentation/hwmon/system76-thelio-io.rst
>>>  create mode 100644 drivers/hwmon/system76-thelio-io.c
>>> 
>>> diff --git a/Documentation/hwmon/system76-thelio-io.rst b/Documentation/hwmon/system76-thelio-io.rst
>>> new file mode 100644
>>> index 000000000000..7ca34bb47bbb
>>> --- /dev/null
>>> +++ b/Documentation/hwmon/system76-thelio-io.rst
>>> @@ -0,0 +1,31 @@
>>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +Kernel driver system76-thelio-io
>>> +==========================
>>> +
>>> +Supported devices:
>>> +
>>> +  * System76 Thelio Io (thelio_io_2)
>>> +
>>> +Author: Jeremy Soller
>>> +
>>> +Description
>>> +-----------
>>> +
>>> +This driver implements the sysfs interface for the System76 Thelio Io.
>>> +The System76 Thelio Io is a USB device with 4 fan connectors and a
>>> +power button LED.
>>> +
>>> +Usage Notes
>>> +-----------
>>> +
>>> +Since it is a USB device, hotswapping is possible. The device is autodetected.
>>> +
>>> +Sysfs entries
>>> +-------------
>>> +
>>> +======================= =====================================================================
>>> +fan[1-4]_input		Connected fan rpm.
>>> +fan[1-4]_label		Shows fan connector name.
>>> +pwm[1-4]		Sets the fan speed. Values from 0-255.
>>> +======================= =====================================================================
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 48abe1a281f2..f4e8f7bdd1f5 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -20738,6 +20738,13 @@ L:	platform-driver-x86@vger.kernel.org
>>>  S:	Maintained
>>>  F:	drivers/platform/x86/system76_acpi.c
>>>  
>>> +SYSTEM76 THELIO IO DRIVER
>>> +M:	Jeremy Soller <jeremy@system76.com>
>>> +M:	System76 <info@system76.com>
>>> +L:	linux-hwmon@vger.kernel.org
>>> +S:	Maintained
>>> +F:	drivers/hwmon/system76-thelio-io.c
>>> +
>>>  SYSV FILESYSTEM
>>>  S:	Orphan
>>>  F:	Documentation/filesystems/sysv-fs.rst
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index 307477b8a371..fdcf0baa2669 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -1965,6 +1965,16 @@ config SENSORS_SMM665
>>>  	  This driver can also be built as a module. If so, the module will
>>>  	  be called smm665.
>>>  
>>> +config SENSORS_SYSTEM76_THELIO_IO
>>> +	tristate "System76 Thelio Io controller"
>>> +	depends on HID
>>> +	help
>>> +	  If you say yes here you get support for the System76 Thelio Io
>>> +	  controller.
>>> +
>>> +	  This driver can also be built as a module. If so, the module
>>> +	  will be called system76-thelio-io.
>>> +
>>>  config SENSORS_ADC128D818
>>>  	tristate "Texas Instruments ADC128D818"
>>>  	depends on I2C
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>> index 3f4b0fda0998..7cfdabb4e66f 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -199,6 +199,7 @@ obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>>>  obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
>>>  obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
>>>  obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
>>> +obj-$(CONFIG_SENSORS_SYSTEM76_THELIO_IO) += system76-thelio-io.o
>>>  obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
>>>  obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
>>>  obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
>>> diff --git a/drivers/hwmon/system76-thelio-io.c b/drivers/hwmon/system76-thelio-io.c
>>> new file mode 100644
>>> index 000000000000..4d9c2229cd3d
>>> --- /dev/null
>>> +++ b/drivers/hwmon/system76-thelio-io.c
>>> @@ -0,0 +1,424 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + *
>>> + * system76-thelio-io.c - Linux driver for System76 Thelio Io
>>> + * Copyright (C) 2023 System76
>>> + *
>>> + * Based on:
>>> + * corsair-cpro.c - Linux driver for Corsair Commander Pro
>>> + * Copyright (C) 2020 Marius Zachmann <mail@mariuszachmann.de>
>>> + *
>>> + * This driver uses hid reports to communicate with the device to allow hidraw userspace drivers
>>> + * still being used. The device does not use report ids. When using hidraw and this driver
>>> + * simultaniously, reports could be switched.
>>> + */
>>> +
>>> +#include <linux/bitops.h>
>>> +#include <linux/completion.h>
>>> +#include <linux/hid.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/suspend.h>
>>> +#include <linux/types.h>
>>> +
>>> +#define BUFFER_SIZE	32
>>> +#define REQ_TIMEOUT	300
>>
>> Nit: It is customary to either add a comment describing the unit
>> (here: milli-seconds) or to indicate it in the define (e.g.
>> REQ_TIMEOUT_MS).
>>> +
>>> +#define HID_CMD		0
>>> +#define HID_RES		1
>>> +#define HID_DATA	2
>>> +
>>> +#define CMD_FAN_GET		7
>>> +#define CMD_FAN_SET		8
>>> +#define CMD_LED_SET_MODE	16
>>> +#define CMD_FAN_TACH		22
>>> +
>>> +struct thelio_io_device {
>>> +	struct hid_device *hdev;
>>> +	struct device *hwmon_dev;
>>> +#ifdef CONFIG_PM_SLEEP
>>> +	struct notifier_block pm_notifier;
>>> +#endif
>>> +	struct completion wait_input_report;
>>> +	struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
>>> +	u8 *buffer;
>>> +};
>>> +
>>> +/* converts response error in buffer to errno */
>>> +static int thelio_io_get_errno(struct thelio_io_device *thelio_io)
>>> +{
>>> +	switch (thelio_io->buffer[HID_RES]) {
>>> +	case 0x00: /* success */
>>> +		return 0;
>>> +	default:
>>> +		return -EIO;
>>> +	}
>>> +}
>>> +
>>> +/* send command, check for error in response, response in thelio_io->buffer */
>>> +static int send_usb_cmd(struct thelio_io_device *thelio_io, u8 command,
>>> +			u8 byte1, u8 byte2, u8 byte3)
>>> +{
>>> +	int ret;
>>> +
>>> +	memset(thelio_io->buffer, 0x00, BUFFER_SIZE);
>>> +	thelio_io->buffer[HID_CMD] = command;
>>> +	thelio_io->buffer[HID_DATA] = byte1;
>>> +	thelio_io->buffer[HID_DATA + 1] = byte2;
>>> +	thelio_io->buffer[HID_DATA + 2] = byte3;
>>> +
>>> +	reinit_completion(&thelio_io->wait_input_report);
>>> +
>>> +	ret = hid_hw_output_report(thelio_io->hdev, thelio_io->buffer, BUFFER_SIZE);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	if (!wait_for_completion_timeout(&thelio_io->wait_input_report,
>>> +					 msecs_to_jiffies(REQ_TIMEOUT)))
>>> +		return -ETIMEDOUT;
>>> +
>>> +	return thelio_io_get_errno(thelio_io);
>>> +}
>>> +
>>> +static int thelio_io_raw_event(struct hid_device *hdev, struct hid_report *report,
>>> +			       u8 *data, int size)
>>> +{
>>> +	struct thelio_io_device *thelio_io = hid_get_drvdata(hdev);
>>> +
>>> +	/* only copy buffer when requested */
>>> +	if (completion_done(&thelio_io->wait_input_report))
>>> +		return 0;
>>> +
>>> +	memcpy(thelio_io->buffer, data, min(BUFFER_SIZE, size));
>>> +	complete(&thelio_io->wait_input_report);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/* requests and returns single data values depending on channel */
>>> +static int get_data(struct thelio_io_device *thelio_io, int command, int channel,
>>> +		    bool two_byte_data)
>>> +{
>>> +	int ret;
>>> +
>>> +	mutex_lock(&thelio_io->mutex);
>>> +
>>> +	ret = send_usb_cmd(thelio_io, command, channel, 0, 0);
>>> +	if (ret)
>>> +		goto out_unlock;
>>> +
>>> +	ret = thelio_io->buffer[HID_DATA + 1];
>>> +	if (two_byte_data)
>>> +		ret |= thelio_io->buffer[HID_DATA + 2] << 8;
>>> +
>>> +out_unlock:
>>> +	mutex_unlock(&thelio_io->mutex);
>>> +	return ret;
>>> +}
>>> +
>>> +static int set_pwm(struct thelio_io_device *thelio_io, int channel, long val)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (val < 0 || val > 255)
>>> +		return -EINVAL;
>>> +
>>> +	mutex_lock(&thelio_io->mutex);
>>> +
>>> +	ret = send_usb_cmd(thelio_io, CMD_FAN_SET, channel, val, 0);
>>> +
>>> +	mutex_unlock(&thelio_io->mutex);
>>> +	return ret;
>>> +}
>>> +
>>> +static int thelio_io_read_string(struct device *dev, enum hwmon_sensor_types type,
>>> +				 u32 attr, int channel, const char **str)
>>> +{
>>> +	switch (type) {
>>> +	case hwmon_fan:
>>> +		switch (attr) {
>>> +		case hwmon_fan_label:
>>> +			switch (channel) {
>>> +			case 0:
>>> +				*str = "CPU Fan";
>>> +				return 0;
>>> +			case 1:
>>> +				*str = "Intake Fan";
>>> +				return 0;
>>> +			case 2:
>>> +				*str = "GPU Fan";
>>> +				return 0;
>>> +			case 3:
>>> +				*str = "Aux Fan";
>>> +				return 0;
>>> +			default:
>>> +				break;
>>> +			}
>>> +		default:
>>> +			break;
>>> +		}
>>> +		break;
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>> +	return -EOPNOTSUPP;
>>> +}
>>> +
>>> +static int thelio_io_read(struct device *dev, enum hwmon_sensor_types type,
>>> +			  u32 attr, int channel, long *val)
>>> +{
>>> +	struct thelio_io_device *thelio_io = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	switch (type) {
>>> +	case hwmon_fan:
>>> +		switch (attr) {
>>> +		case hwmon_fan_input:
>>> +			ret = get_data(thelio_io, CMD_FAN_TACH, channel, true);
>>> +			if (ret < 0)
>>> +				return ret;
>>> +			*val = ret;
>>> +			return 0;
>>> +		default:
>>> +			break;
>>> +		}
>>> +		break;
>>> +	case hwmon_pwm:
>>> +		switch (attr) {
>>> +		case hwmon_pwm_input:
>>> +			ret = get_data(thelio_io, CMD_FAN_GET, channel, false);
>>> +			if (ret < 0)
>>> +				return ret;
>>> +			*val = ret;
>>> +			return 0;
>>> +		default:
>>> +			break;
>>> +		}
>>> +		break;
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>> +	return -EOPNOTSUPP;
>>> +};
>>> +
>>> +static int thelio_io_write(struct device *dev, enum hwmon_sensor_types type,
>>> +			   u32 attr, int channel, long val)
>>> +{
>>> +	struct thelio_io_device *thelio_io = dev_get_drvdata(dev);
>>> +
>>> +	switch (type) {
>>> +	case hwmon_pwm:
>>> +		switch (attr) {
>>> +		case hwmon_pwm_input:
>>> +			return set_pwm(thelio_io, channel, val);
>>> +		default:
>>> +			break;
>>> +		}
>>> +		break;
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>> +	return -EOPNOTSUPP;
>>> +};
>>> +
>>> +static umode_t thelio_io_is_visible(const void *data, enum hwmon_sensor_types type,
>>> +				    u32 attr, int channel)
>>> +{
>>> +	switch (type) {
>>> +	case hwmon_fan:
>>> +		switch (attr) {
>>> +		case hwmon_fan_input:
>>> +			return 0444;
>>> +		case hwmon_fan_label:
>>> +			return 0444;
>>> +		default:
>>> +			break;
>>> +		}
>>> +		break;
>>> +	case hwmon_pwm:
>>> +		switch (attr) {
>>> +		case hwmon_pwm_input:
>>> +			return 0644;
>>> +		default:
>>> +			break;
>>> +		}
>>> +		break;
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>> +	return 0;
>>> +};
>>> +
>>> +static const struct hwmon_ops thelio_io_hwmon_ops = {
>>> +	.is_visible = thelio_io_is_visible,
>>> +	.read = thelio_io_read,
>>> +	.read_string = thelio_io_read_string,
>>> +	.write = thelio_io_write,
>>> +};
>>> +
>>> +static const struct hwmon_channel_info *thelio_io_info[] = {
>>> +	HWMON_CHANNEL_INFO(chip,
>>> +			   HWMON_C_REGISTER_TZ),
>>> +	HWMON_CHANNEL_INFO(fan,
>>> +			   HWMON_F_INPUT | HWMON_F_LABEL,
>>> +			   HWMON_F_INPUT | HWMON_F_LABEL,
>>> +			   HWMON_F_INPUT | HWMON_F_LABEL,
>>> +			   HWMON_F_INPUT | HWMON_F_LABEL
>>> +			   ),
>>> +	HWMON_CHANNEL_INFO(pwm,
>>> +			   HWMON_PWM_INPUT,
>>> +			   HWMON_PWM_INPUT,
>>> +			   HWMON_PWM_INPUT,
>>> +			   HWMON_PWM_INPUT
>>> +			   ),
>>> +	NULL
>>> +};
>>> +
>>> +static const struct hwmon_chip_info thelio_io_chip_info = {
>>> +	.ops = &thelio_io_hwmon_ops,
>>> +	.info = thelio_io_info,
>>> +};
>>> +
>>> +#ifdef CONFIG_PM_SLEEP
>>
>> You suggested in one of your replies that is would by my responsibility
>> to prove that standard PM calls are insufficient. That is not the case.
>>
>>> +static int thelio_io_pm(struct notifier_block *nb, unsigned long action, void *data)
>>> +{
>>> +	struct thelio_io_device *thelio_io = container_of(nb, struct thelio_io_device, pm_notifier);
>>> +
>>> +	switch (action) {
>>> +	case PM_HIBERNATION_PREPARE:
>>> +	case PM_SUSPEND_PREPARE:
>>> +		mutex_lock(&thelio_io->mutex);
>>> +		send_usb_cmd(thelio_io, CMD_LED_SET_MODE, 0, 1, 0);
>>> +		mutex_unlock(&thelio_io->mutex);
>>> +		break;
>>> +
>>> +	case PM_POST_HIBERNATION:
>>> +	case PM_POST_SUSPEND:
>>> +		mutex_lock(&thelio_io->mutex);
>>> +		send_usb_cmd(thelio_io, CMD_LED_SET_MODE, 0, 0, 0);
>>> +		mutex_unlock(&thelio_io->mutex);
>>> +		break;
>>> +
>>> +	case PM_POST_RESTORE:
>>> +	case PM_RESTORE_PREPARE:
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>> +	return NOTIFY_DONE;
>>> +}
>>> +#endif
>>> +
>>> +static int thelio_io_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>> +{
>>> +	struct thelio_io_device *thelio_io;
>>> +	int ret;
>>> +
>>> +	thelio_io = devm_kzalloc(&hdev->dev, sizeof(*thelio_io), GFP_KERNEL);
>>> +	if (!thelio_io)
>>> +		return -ENOMEM;
>>> +
>>> +	thelio_io->buffer = devm_kmalloc(&hdev->dev, BUFFER_SIZE, GFP_KERNEL);
>>> +	if (!thelio_io->buffer)
>>> +		return -ENOMEM;
>>> +
>>> +	ret = hid_parse(hdev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = hid_hw_open(hdev);
>>> +	if (ret)
>>> +		goto out_hw_stop;
>>> +
>>> +	thelio_io->hdev = hdev;
>>> +	hid_set_drvdata(hdev, thelio_io);
>>> +	mutex_init(&thelio_io->mutex);
>>> +	init_completion(&thelio_io->wait_input_report);
>>> +
>>> +	hid_device_io_start(hdev);
>>> +
>>
>> Just in case the below is _really_ necessary, which seems unlikely to me,
>> why call hid_device_io_start() even if no hwmon device is going to be
>> registered ? Why start IO on a device that isn't doing anything ?
>>
>>> +	if (hdev->maxcollection == 1 && hdev->collection[0].usage == 0xFF600061) {
>>> +		thelio_io->hwmon_dev = hwmon_device_register_with_info(&hdev->dev,
>>> +								       "system76_thelio_io",
>>> +								       thelio_io,
>>> +								       &thelio_io_chip_info,
>>> +								       0);
>>> +		if (IS_ERR(thelio_io->hwmon_dev)) {
>>> +			ret = PTR_ERR(thelio_io->hwmon_dev);
>>> +			goto out_hw_close;
>>> +		}
>>> +
>>> +	#ifdef CONFIG_PM_SLEEP
>>> +		thelio_io->pm_notifier.notifier_call = thelio_io_pm;
>>> +		register_pm_notifier(&thelio_io->pm_notifier);
>>> +	#endif
>>> +	}
>>
>> Ok, whatever your explanation for this is: I am not going to accept it,
>> period. It doesn't make sense to instantiate a driver that doesn't do
>> anything. If this would for whatever reason _really_ _really_ _really_
>> be necessary, I'd expect a lengthy comment describing why this is the
>> case and why it would be necessary to keep possibly multiple instances
>> of this driver around that don't do anything.
>>
>> And, no, I am not going to dig through all your replies trying
>> to figure out your rationale for doing this. Note that, given that
>> there is not a single driver in the kernel doing anything similar,
>> you might have a hard time convincing me that this makes sense
>> and is necessary (both the check and successfully instantiating the
>> driver without registering a hwmon device).
>>
>>> +
>>> +	return 0;
>>> +
>>> +out_hw_close:
>>> +	hid_hw_close(hdev);
>>> +out_hw_stop:
>>> +	hid_hw_stop(hdev);
>>> +	return ret;
>>> +}
>>> +
>>> +static void thelio_io_remove(struct hid_device *hdev)
>>> +{
>>> +	struct thelio_io_device *thelio_io = hid_get_drvdata(hdev);
>>> +
>>> +	if (thelio_io->hwmon_dev) {
>>> +		hwmon_device_unregister(thelio_io->hwmon_dev);
>>> +
>>> +	#ifdef CONFIG_PM_SLEEP
>>> +		unregister_pm_notifier(&thelio_io->pm_notifier);
>>> +	#endif
>>> +	}
>>> +
>>> +	hid_hw_close(hdev);
>>> +	hid_hw_stop(hdev);
>>> +}
>>> +
>>> +static const struct hid_device_id thelio_io_devices[] = {
>>> +	{ HID_USB_DEVICE(0x3384, 0x000B) }, /* thelio_io_2 */
>>> +	{ }
>>> +};
>>> +
>>> +static struct hid_driver thelio_io_driver = {
>>> +	.name = "system76-thelio-io",
>>> +	.id_table = thelio_io_devices,
>>> +	.probe = thelio_io_probe,
>>> +	.remove = thelio_io_remove,
>>> +	.raw_event = thelio_io_raw_event,
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(hid, thelio_io_devices);
>>> +MODULE_LICENSE("GPL");
>>> +
>>> +static int __init thelio_io_init(void)
>>> +{
>>> +	return hid_register_driver(&thelio_io_driver);
>>> +}
>>> +
>>> +static void __exit thelio_io_exit(void)
>>> +{
>>> +	hid_unregister_driver(&thelio_io_driver);
>>> +}
>>> +
>>> +/*
>>> + * When compiling this driver as built-in, hwmon initcalls will get called before the
>>> + * hid driver and this driver would fail to register. late_initcall solves this.
>>> + */
>>> +late_initcall(thelio_io_init);
>>> +module_exit(thelio_io_exit);
>>> -- 
>>> 2.34.1
