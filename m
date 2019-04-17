Return-Path: <SRS0=hA7Y=ST=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5570BC10F14
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 01:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18C6420872
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 01:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=babayev.com header.i=@babayev.com header.b="V71Lz4M8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfDQB6R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Apr 2019 21:58:17 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37058 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfDQB6R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Apr 2019 21:58:17 -0400
Received: by mail-io1-f66.google.com with SMTP id x7so19313409ioh.4
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2019 18:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=references:user-agent:from:to:cc:subject:message-id:in-reply-to
         :date:mime-version;
        bh=pTf6CqltW0FIDdPp5liGh7R5dI59lPVUwc4DYfwKKZg=;
        b=V71Lz4M8pjYcoLQXfQqYDlhZ4X6nab3wH/uhawCxQPQIZRqXJu80sNmfD7wYU+FpDk
         GUO8uIysfz7GQg66wpkvNNbqM5Cm7ss8yMPD3pIAITMms86QuWdFp79D263MnlRHcEVH
         8wS60IfRuZ2Q2y67NXacqTp7GAWqyXbU/eH6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :message-id:in-reply-to:date:mime-version;
        bh=pTf6CqltW0FIDdPp5liGh7R5dI59lPVUwc4DYfwKKZg=;
        b=WeQ8g5NtlURDQNCWTWNhVp5eCe1S1ime/naulOEaoZ+9KV9DITM/YqziiaCma32CES
         xdS1hFSZcum++PLdtK2/q+qOPhHQ2jOvywN2SY3YS8EeqePkPYcjNe9yYIr1M+j6bfL9
         iNVHO4QeeMAmjLKGeJLgu5X/YNM5VKg5xRhLUTiiyitNy9zT0E4o3H06XKB3J3oe+UnP
         b31NwQSYcVDlyu4qjIS9z89vSyoGtxmGI5pYdFpIAwe9+31QPZj0mCjG5L6WxnByk0LE
         uPbKX+7GGwxGipwZp6fusbvLpxlMxgRnttKUAykCLBvGCwEVDgP0e6auXy6Zp2oYNITh
         DQnA==
X-Gm-Message-State: APjAAAUPVBMjhD6yTBXF1T0/FL4r3H0rZrnTqxQtJbEyGxoy0c/+LAz1
        1PpX8VK5i+/j7iZz3a6ckaI635MkCs7bhkPy
X-Google-Smtp-Source: APXvYqwKNLHTZHDalnMVgAcL0b5MnBQQ27PVMnCf6oaJHCxPwqlAzUbQjyrtuuYOG/wCNSTuGISOLQ==
X-Received: by 2002:a6b:7b05:: with SMTP id l5mr54517265iop.260.1555466296693;
        Tue, 16 Apr 2019 18:58:16 -0700 (PDT)
Received: from localhost (50-46-216-15.evrt.wa.frontiernet.net. [50.46.216.15])
        by smtp.gmail.com with ESMTPSA id w6sm19677440iom.22.2019.04.16.18.58.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2019 18:58:15 -0700 (PDT)
References: <20190416183620.39950-1-ruslan@babayev.com> <20190416195255.GC8093@roeck-us.net>
User-agent: mu4e 1.0; emacs 26.1
From:   Ruslan Babayev <ruslan@babayev.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ruslan Babayev <ruslan@babayev.com>, xe-linux-external@cisco.com,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (pmbus) add support for output voltage registers
Message-ID: <8736mhe6m9.fsf@babayev.com>
In-reply-to: <20190416195255.GC8093@roeck-us.net>
Date:   Tue, 16 Apr 2019 18:58:15 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org
Message-ID: <20190417015815.hepCWwncONCar2JJLowIlBHJflom9_3hSU7-idTlP88@z>

Hi Guenter,

Thanks for taking the time to review these patches. Please see my
comments inline.

Guenter Roeck writes:

> On Tue, Apr 16, 2019 at 11:36:16AM -0700, Ruslan Babayev wrote:
>> +static ssize_t pmbus_show_operation(struct device *dev,
>> +				    struct device_attribute *devattr, char *buf)
>> +{
>> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>> +	struct pmbus_operation *operation = to_pmbus_operation(attr);
>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>> +	int ret;
>> +
>> +	ret = pmbus_read_byte_data(client, operation->page, PMBUS_OPERATION);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ret & PB_OPERATION_CONTROL_ON) {
>> +		if (ret & PB_OPERATION_MARGIN_HIGH)
>> +			return snprintf(buf, PAGE_SIZE, "high\n");
>> +		else if (ret & PB_OPERATION_MARGIN_LOW)
>> +			return snprintf(buf, PAGE_SIZE, "low\n");
>> +		else
>> +			return snprintf(buf, PAGE_SIZE, "on\n");
>> +	} else {
>> +			return snprintf(buf, PAGE_SIZE, "off\n");
>> +	}
>> +}
>> +
>> +static ssize_t pmbus_set_operation(struct device *dev,
>> +				   struct device_attribute *devattr,
>> +				   const char *buf, size_t count)
>> +{
>> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>> +	struct pmbus_operation *operation = to_pmbus_operation(attr);
>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>> +	int ret;
>> +	u8 val;
>> +
>> +	/*
>> +	 * sysfs_streq() doesn't need the \n's, but we add them so the strings
>> +	 * will be shared with pmbus_show_operation() above.
>> +	 */
>
> Saving a few bytes of data in the driver is not worth such limitations.
> I would not want to have to deal with users sending "echo -n on" to the
> driver and complain that it doesn't work.
>

Sending "echo -n on" works just fine. sysfs_streq ignores \n's as
mentioned in the comment. This was actually shamelessly stolen from
drivers/regulator/virtual.c set_mode().

>> +	if (sysfs_streq(buf, "on\n"))
>> +		val = PB_OPERATION_CONTROL_ON;
>> +	else if (sysfs_streq(buf, "off\n"))
>> +		val = 0;
>> +	else if (sysfs_streq(buf, "high\n"))
>> +		val = PB_OPERATION_CONTROL_ON | PB_OPERATION_ACT_ON_FAULT |
>> +		      PB_OPERATION_MARGIN_HIGH;
>> +	else if (sysfs_streq(buf, "low\n"))
>> +		val = PB_OPERATION_CONTROL_ON | PB_OPERATION_ACT_ON_FAULT |
>> +		      PB_OPERATION_MARGIN_LOW;
>> +	else
>> +		return -EINVAL;
>> +
>> +	ret = pmbus_write_byte_data(client, operation->page,
>> +				    PMBUS_OPERATION, val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
> I am not convinced that it is a good idea to implement this as sysfs
> attributes. It is notmally only used in manufacturing, and there the
> registers can be acccessed directly.
>
> Either case, we can not implement this in the pmbus driver as generic code.
> Operation commands are notoriously implemented with slight differences across
> different devices. It would also probably be more appropriate to implement
> as regulator, since it affects setting voltages, not limits.
>

The OPERATION command as well as VOUT_COMMAND and VOUT_MARGIN_{HIGH,LOW}
are standard registers specified in PMBus Spec Part II, Rev 1.2 Section
13. "Output Voltage Related Commands". The devices I have seen so far
(the ones that support voltage margining) all seem to be compliant with
the standard as far as the OPERATION register is concerned.

Some devices like TPS40422 use manufacturer specific registers instead of
VOUT_MARGIN_{HIGH,LOW}. Those can be handled by overriding
{read,write}_word_data to make it look standard to pmbus_core (as I have
done in the PATCH 4/4)

>> +
>> +static const struct pmbus_sensor_attr vout_attributes[] = {
>> +	{
>> +		.reg = PMBUS_VOUT_COMMAND,
>> +		.class = PSC_VOLTAGE_OUT,
>> +		.label = "command",
>
> Bad name for a label.

Could you please suggest a better name?

>>  static int pmbus_find_attributes(struct i2c_client *client,
>>  				 struct pmbus_data *data)
>>  {
>> @@ -1912,6 +2089,12 @@ static int pmbus_find_attributes(struct i2c_client *client,
>>  	if (ret)
>>  		return ret;
>>
>> +	/* Output Voltage sensors */
>> +	ret = pmbus_add_vout_attrs(client, data, "out", vout_attributes,
>> +				   ARRAY_SIZE(vout_attributes));
>> +	if (ret)
>> +		return ret;
>> +
>
> The sensors you are adding are not output voltage sensors. They are not
> sensors in the first place, and should probably not be reported as sensor
> values. And setting voltages as limits is really not appropriate.
>

I understand your concerns about exposing these registers as sysfs
entries in hwmon. These devices _are_ voltage regulators, and these
registers are not exactly "sensors", although a lot of the existing
pmbus_core code can be reused by pretending they are. Like VOUT_MODE
exponent handling, linear16 format etc.

I have looked at the regulator framework and into extending the
pmbus_regulator_ops to support voltage margining with standard PMBUS
VOUT_MARGIN registers. My predicament is that regulator framework

1) Does NOT have the concept of "margining".

2) Is not expected to be used at ALL on ACPI based systems. With ACPI
   kernel assumes power control is done with Power Resource Objects
   (ACPI section 7.1).

The latter is a bigger issue for us - our system is Intel based. It
seems like sysfs attributes is our only option.

How would you feel if these registers (namely OPERATION and
VOUT_MARGIN_{HIGH,LOW}) were exposed only in the drivers without making
any changes to pmbus_core.c? Would these drivers have a chance of
getting upstreamed? I hate the idea of maintaining out-of-tree drivers.

Best regards,
Ruslan
