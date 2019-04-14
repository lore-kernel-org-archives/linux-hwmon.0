Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19B5C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 14:27:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 678022084E
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 14:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1N8f/x9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbfDNO1u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 10:27:50 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45580 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfDNO1u (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 10:27:50 -0400
Received: by mail-pg1-f195.google.com with SMTP id y3so7330347pgk.12
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Apr 2019 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TXGf87cW5ox8o7kl5OLEtcOrfzyKEfSOR/3apNvlllw=;
        b=g1N8f/x9BtR6F1RDijsv4lsglW720ug9/mbfvJaMFGZhCQnyFPc+1vJsW8LVI0s8hE
         jURLlbBXgpkprH0OFoPNWFNEbdkxjxYtIeJcuo8eZuYQ9MLDYbzKIU7FgXjrxx8TrPEv
         HqzshePFnjP9JrBDmj7UDbG4gEC3C+0jDfq5g/HPI4VoTq2MpAgMG6JU5HNMS4faMnPd
         6WVrrLie9bR6z+jVtjv8wExFCunW1KMowXx27QPZdgUM92yPWBDOUS74+lB2vR/VJ5Ya
         nNPQeJljESPCII229xHn6hsJpqWi51qhmUO9kmiutLJyjI2IRV7Jj/mj6nZr5r4WOBlt
         sWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TXGf87cW5ox8o7kl5OLEtcOrfzyKEfSOR/3apNvlllw=;
        b=Jco+FqIG4oMTDSzVgjswOKXQIWOYxZb8xcgSnCj/XKZfuS6fKWwisbhHfx7cIyXiTw
         0i3CiN1S7OgSzrpdEZDbbNN0J2+lblI2IeD8gqEt29hCcHmMGuNL2oY3ZD+NM6pvfzld
         hsxxHkrFs4NEWVvW1ttt074XFUBwxfrVxSx4cc2e40tNatlQ8XuRTYz5YPZdS3ww/Jrb
         zmBkOGUXzq5SG2M8utw0YYSSZ77iM/uegE3Yjm34lvGw95Eh4s6somdVtCzrG8ZbAcx4
         K7NIVGpW7mMk32ISaRSefTb82yel+nR2l5gdQxWoHuN35vVSxF/OTAw6hYuZuWT0XZEY
         miuw==
X-Gm-Message-State: APjAAAVOOwQurUdagivpJHoO2fpB4LjeyGY77iELV1/jGEm4UjFUnY+V
        OTP2s70oUg/Hd+t7/kL0JyQ=
X-Google-Smtp-Source: APXvYqyB8yPo1HbaoXWif2E6V6bwvCYdUuHn+fBj+Vsfu8Ug+5DI7ZoD/weC6MXwBq2USsrxg3wDSw==
X-Received: by 2002:a05:6a00:dc:: with SMTP id e28mr36002533pfj.186.1555252069614;
        Sun, 14 Apr 2019 07:27:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm57655189pgh.93.2019.04.14.07.27.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 07:27:48 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Jean Delvare <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
 <a2e0f8d21ecd61d4a1c1445c872f5abd9b685a18.1555171278.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4e51a07b-a7ec-a3a8-38b1-1bfee1d6b00e@roeck-us.net>
Date:   Sun, 14 Apr 2019 07:27:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a2e0f8d21ecd61d4a1c1445c872f5abd9b685a18.1555171278.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/13/19 9:03 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> Those virtual registers can be used to export manufacturer specific
> functionality for controlling the number of samples for average values
> reported by the device.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   Documentation/hwmon/sysfs-interface |  18 +++++
>   drivers/hwmon/pmbus/pmbus.h         |  15 ++++
>   drivers/hwmon/pmbus/pmbus_core.c    | 114 ++++++++++++++++++++++++++++
>   3 files changed, 147 insertions(+)
> 
> diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysfs-interface
> index 2b9e1005d88b..7b91706d01c8 100644
> --- a/Documentation/hwmon/sysfs-interface
> +++ b/Documentation/hwmon/sysfs-interface
> @@ -756,6 +756,24 @@ intrusion[0-*]_beep
>   		1: enable
>   		RW
>   
> +********************************
> +* Average sample configuration *
> +********************************
> +
> +Devices allowing for reading {in,power,curr,temp}_average values may export
> +attributes for controlling number of samples used to compute average.
> +
> +samples		Sets number of average samples for all types of measurements.
> +		RW
> +
> +in_samples
> +power_samples
> +curr_samples
> +temp_samples    Sets number of average samples for specific type of measurements.
> +		Note that on some devices it won't be possible to set all of them
> +		to different values so changing one might also change some others.
> +		RW
> +
>   

Separate patch for the above, please. Adding the ABI is one subject, adding support
for it into a driver (or driver core) is another.


>   sysfs attribute writes interpretation
>   -------------------------------------
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 1d24397d36ec..e73289cc867d 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -217,6 +217,20 @@ enum pmbus_regs {
>   	PMBUS_VIRT_PWM_ENABLE_2,
>   	PMBUS_VIRT_PWM_ENABLE_3,
>   	PMBUS_VIRT_PWM_ENABLE_4,
> +
> +	/* Samples for average
> +	 *
> +	 * Drivers wanting to expose functionality for changing the number of
> +	 * samples used for average values should implement support in
> +	 * {read,write}_word_data callback for either PMBUS_VIRT_SAMPLES if it
> +	 * applies to all types of measurements, or any number of specific
> +	 * PMBUS_VIRT_*_SAMPLES registers to allow for individual control.
> +	 */
> +	PMBUS_VIRT_SAMPLES,
> +	PMBUS_VIRT_IN_SAMPLES,
> +	PMBUS_VIRT_CURR_SAMPLES,
> +	PMBUS_VIRT_POWER_SAMPLES,
> +	PMBUS_VIRT_TEMP_SAMPLES,
>   };
>   
>   /*
> @@ -371,6 +385,7 @@ enum pmbus_sensor_classes {
>   #define PMBUS_HAVE_STATUS_VMON	BIT(19)
>   #define PMBUS_HAVE_PWM12	BIT(20)
>   #define PMBUS_HAVE_PWM34	BIT(21)
> +#define PMBUS_HAVE_SAMPLES	BIT(22)
>   
>   #define PMBUS_PAGE_VIRTUAL	BIT(31)
>   
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 2e2b5851139c..31b6bf49518c 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1901,6 +1901,116 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>   	return 0;
>   }
>   
> +struct pmbus_samples_attr {
> +	int reg;
> +	char *name;
> +};
> +
> +struct pmbus_samples_reg {
> +	int page;
> +	struct pmbus_samples_attr *attr;
> +	struct device_attribute dev_attr;
> +};
> +
> +static struct pmbus_samples_attr pmbus_samples_registers[] = {
> +	{
> +		.reg = PMBUS_VIRT_SAMPLES,
> +		.name = "samples",
> +	}, {
> +		.reg = PMBUS_VIRT_IN_SAMPLES,
> +		.name = "in_samples",
> +	}, {
> +		.reg = PMBUS_VIRT_CURR_SAMPLES,
> +		.name = "curr_samples",
> +	}, {
> +		.reg = PMBUS_VIRT_POWER_SAMPLES,
> +		.name = "power_samples",
> +	}, {
> +		.reg = PMBUS_VIRT_TEMP_SAMPLES,
> +		.name = "temp_samples",
> +	}
> +};
> +
> +#define to_samples_reg(x) container_of(x, struct pmbus_samples_reg, dev_attr)
> +
> +static ssize_t pmbus_show_samples(struct device *dev,
> +				  struct device_attribute *devattr, char *buf)
> +{
> +	int val;
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
> +
> +	val = _pmbus_read_word_data(client, reg->page, reg->attr->reg);
> +	if (val < 0)
> +		return val;
> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n", val);
> +}
> +
> +static ssize_t pmbus_set_samples(struct device *dev,
> +				 struct device_attribute *devattr,
> +				 const char *buf, size_t count)
> +{
> +	int ret;
> +	long val;
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
> +
> +	if (kstrtol(buf, 0, &val) < 0)
> +		return -EINVAL;
> +
> +	ret = _pmbus_write_word_data(client, reg->page, reg->attr->reg, val);
> +
> +	return ret ? : count;
> +}
> +
> +static int pmbus_add_samples_attr(struct pmbus_data *data, int page,
> +				  struct pmbus_samples_attr *attr)
> +{
> +	struct pmbus_samples_reg *reg;
> +
> +	reg = devm_kzalloc(data->dev, sizeof(*reg), GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	reg->attr = attr;
> +	reg->page = page;
> +
> +	pmbus_dev_attr_init(&reg->dev_attr, attr->name, (S_IWUSR | S_IRUGO),

S_IWUSR ran out of favor and generates a checkpatch warning.
Please use 0644.

> +			    pmbus_show_samples, pmbus_set_samples);
> +
> +	return pmbus_add_attribute(data, &reg->dev_attr.attr);
> +}
> +
> +static int pmbus_add_samples_attributes(struct i2c_client *client,
> +					struct pmbus_data *data)
> +{
> +	const struct pmbus_driver_info *info = data->info;
> +	int page;
> +
> +	for (page = 0; page < info->pages; page++) {

This won't work as intended on multi-page chips. If the driver writer
is not careful, it will try to generate multiple similar attributes,
one per page. I would suggest to only check this for page 0.
At some point we may need to add a separate func pointer for
chip specific attributes, but that should do for now.

> +		int s;:
> +
> +		if (!(info->func[page] & PMBUS_HAVE_SAMPLES))
> +			continue;
> +
> +		for (s = 0; s < ARRAY_SIZE(pmbus_samples_registers); s++) {
> +			int ret;
> +			struct pmbus_samples_attr *attr;
> +

Please use reverse christmas tree here

			struct pmbus_samples_attr *attr;
			int ret;

> +			attr = &pmbus_samples_registers[s];
> +			if (!pmbus_check_word_register(client, page, attr->reg))
> +				continue;
> +
> +			ret = pmbus_add_samples_attr(data, page, attr);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int pmbus_find_attributes(struct i2c_client *client,
>   				 struct pmbus_data *data)
>   {
> @@ -1932,6 +2042,10 @@ static int pmbus_find_attributes(struct i2c_client *client,
>   
>   	/* Fans */
>   	ret = pmbus_add_fan_attributes(client, data);
> +	if (ret)
> +		return ret;
> +
> +	ret = pmbus_add_samples_attributes(client, data);
>   	return ret;
>   }
>   
> 

