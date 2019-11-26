Return-Path: <SRS0=QcRA=ZS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FDAC432C3
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Nov 2019 18:20:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D71422073F
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Nov 2019 18:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsJqp2IJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfKZSUy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Nov 2019 13:20:54 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:35204 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfKZSUy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Nov 2019 13:20:54 -0500
Received: by mail-oi1-f176.google.com with SMTP id k196so1178779oib.2
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Nov 2019 10:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tZiXx7XM5RPPNOc+gM7Q/eRA5D2pxi4QQH0/hSsSGa8=;
        b=lsJqp2IJyGylQuppHyFikCdA+KwvNaJ54IQ4xWet+CQ59o3QrdbWEsW8DOmpkSQIWn
         nk0a3K0WXTfoJDo7/cdv36tRR1Yoa+cejoK/S/vSwzMt2lmixMVjdx/uG3YFVpTD+O26
         8Ycq8InTgufGfJcpJxeVtDeCcYvJf5ex4W0syfILmsAEkcaWi49yb29K3uKygZWPRTIP
         8aoTISld6whJSQPDML/UV55X2F4rJwU1KpiURF6NJdt75aUquEhpYEIr+UXeTiJU2ysH
         X0b5q6f2JmTqkj5po+vQ5HoQFsBemS+XC3t+FrZFis7DdOWhANTiBpdxCE39eAVQXMgT
         tQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=tZiXx7XM5RPPNOc+gM7Q/eRA5D2pxi4QQH0/hSsSGa8=;
        b=e4YI3TgIEL2r6wQBw5v9upuNqPgHnFivmCyA6GY0QJZBsXhrsnQPbQukCYwuP3xER0
         xv6wR3TkIKi8sIQ+Sfikoypyntep9CxEAjtOKKiFmN0sdHxYFLiUDMhdLzQtzmf/vEin
         /8YdmLXYLBWCUr+0I1AqutCqXGJPD6KMnAbe8Vm7QVGan5qkwbhJcZe5BBMFd1gelIgt
         DP2V1t4pDpsriQZn665Pg2wUFI6Y0mzJHmkJIflUv3ZboG3nH+6leqhvt/k4P4409NXB
         wQ1gRZPXW4ITljyayY2Lxyt/RBPh/2g+07PJ2xM9KrfPfQJk5zD+P+D+N06rkInnNUyk
         XYuQ==
X-Gm-Message-State: APjAAAX/8f3gObDZyW0aagG4kbTkdkQUmhB9K+WRzjH3IyxKAZLrajC8
        21WyrDvtZa87l3+jz9CDjOA=
X-Google-Smtp-Source: APXvYqyfbfPQ6FFpmz3hicYUF45hnRRSRlFd4/iNspfGQ3cfD7ykrw+Hqb0MiEstH4p/CAjm80UZUA==
X-Received: by 2002:a54:4105:: with SMTP id l5mr285891oic.135.1574792452357;
        Tue, 26 Nov 2019 10:20:52 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n5sm3934685oie.16.2019.11.26.10.20.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2019 10:20:51 -0800 (PST)
Date:   Tue, 26 Nov 2019 10:20:49 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Gilles Buloz <Gilles.Buloz@kontron.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: hwmon: (nct7802) buggy VSEN1/2/3 alarm
Message-ID: <20191126182049.GA24175@roeck-us.net>
References: <5DDBD386.4070408@kontron.com>
 <6cde95e5-0ab3-016f-b67d-73db8c16ff71@roeck-us.net>
 <5DDC04FB.1030705@kontron.com>
 <20191125173538.GA21072@roeck-us.net>
 <5DDC1812.9080009@kontron.com>
 <5DDCF86F.7010703@kontron.com>
 <fc7c1f0b-abaf-0281-7b1b-726f08abcb16@roeck-us.net>
 <5DDD5732.5050503@kontron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5DDD5732.5050503@kontron.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 26, 2019 at 04:47:47PM +0000, Gilles Buloz wrote:
> OK, so to have "ALARM" reported as long as we are outside limits, I did not find another method than checking against limits by 
> software, but still clear the related status register to have a working interrupt.
> The patch below is working for voltages.
> If you're OK, I can extend it to the temperatures and fans
> 
> --- nct7802.c.orig    2019-11-26 10:37:08.753693088 +0100
> +++ nct7802.c    2019-11-26 17:27:56.000000000 +0100
> @@ -32,8 +32,8 @@
>   static const u8 REG_VOLTAGE[5] = { 0x09, 0x0a, 0x0c, 0x0d, 0x0e };
> 
>   static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
> -    { 0x40, 0x00, 0x42, 0x44, 0x46 },
> -    { 0x3f, 0x00, 0x41, 0x43, 0x45 },
> +    { 0x46, 0x00, 0x40, 0x42, 0x44 },
> +    { 0x45, 0x00, 0x3f, 0x41, 0x43 },
>   };
> 
>   static const u8 REG_VOLTAGE_LIMIT_MSB[5] = { 0x48, 0x00, 0x47, 0x47, 0x48 };
> @@ -377,6 +377,32 @@
>       return err ? : count;
>   }
> 
> +static ssize_t show_in_alarm(struct device *dev, struct device_attribute *attr,
> +                 char *buf)
> +{
> +    struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> +    struct nct7802_data *data = dev_get_drvdata(dev);
> +    int volt, min, max, ret;
> +    unsigned int val;
> +
> +    volt = nct7802_read_voltage(data, sattr->nr, 0);
> +    if (volt < 0)
> +        return volt;
> +    min = nct7802_read_voltage(data, sattr->nr, 1);
> +    if (min < 0)
> +        return min;
> +    max = nct7802_read_voltage(data, sattr->nr, 2);
> +    if (max < 0)
> +        return max;
> +
> +    /* also clear related status register to have functional interrupt */
> +    ret = regmap_read(data->regmap, sattr->index, &val);
> +    if (ret < 0)
> +        return ret;
> +

According to the datasheet, the status register bits should be set while
voltages are out of range. Are you sure that this is not the case ?

The next question is how the status registers behave. If the bits are set
whenever voltages cross a limit, we could use that knowledge and compare
voltages against limits only after a status register bit was set.
Something like
	if (status register bit is set) {
		alarm = (voltage is out of range);
		cache alarm;
	}
	print alarm;

Thanks,
Guenter

> +    return sprintf(buf, "%u\n", (volt < min) || (volt > max));
> +}
> +
>   static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
>                char *buf)
>   {
> @@ -714,7 +740,7 @@
>                   0, 1);
>   static SENSOR_DEVICE_ATTR_2(in0_max, S_IRUGO | S_IWUSR, show_in, store_in,
>                   0, 2);
> -static SENSOR_DEVICE_ATTR_2(in0_alarm, S_IRUGO, show_alarm, NULL, 0x1e, 3);
> +static SENSOR_DEVICE_ATTR_2(in0_alarm, S_IRUGO, show_in_alarm, NULL, 0, 0x1e);
>   static SENSOR_DEVICE_ATTR_2(in0_beep, S_IRUGO | S_IWUSR, show_beep, store_beep,
>                   0x5a, 3);
> 
> @@ -725,7 +751,7 @@
>                   2, 1);
>   static SENSOR_DEVICE_ATTR_2(in2_max, S_IRUGO | S_IWUSR, show_in, store_in,
>                   2, 2);
> -static SENSOR_DEVICE_ATTR_2(in2_alarm, S_IRUGO, show_alarm, NULL, 0x1e, 0);
> +static SENSOR_DEVICE_ATTR_2(in2_alarm, S_IRUGO, show_in_alarm, NULL, 2, 0x1e);
>   static SENSOR_DEVICE_ATTR_2(in2_beep, S_IRUGO | S_IWUSR, show_beep, store_beep,
>                   0x5a, 0);
> 
> @@ -734,7 +760,7 @@
>                   3, 1);
>   static SENSOR_DEVICE_ATTR_2(in3_max, S_IRUGO | S_IWUSR, show_in, store_in,
>                   3, 2);
> -static SENSOR_DEVICE_ATTR_2(in3_alarm, S_IRUGO, show_alarm, NULL, 0x1e, 1);
> +static SENSOR_DEVICE_ATTR_2(in3_alarm, S_IRUGO, show_in_alarm, NULL, 3, 0x1e);
>   static SENSOR_DEVICE_ATTR_2(in3_beep, S_IRUGO | S_IWUSR, show_beep, store_beep,
>                   0x5a, 1);
> 
> @@ -743,7 +769,7 @@
>                   4, 1);
>   static SENSOR_DEVICE_ATTR_2(in4_max, S_IRUGO | S_IWUSR, show_in, store_in,
>                   4, 2);
> -static SENSOR_DEVICE_ATTR_2(in4_alarm, S_IRUGO, show_alarm, NULL, 0x1e, 2);
> +static SENSOR_DEVICE_ATTR_2(in4_alarm, S_IRUGO, show_in_alarm, NULL, 4, 0x1e);
>   static SENSOR_DEVICE_ATTR_2(in4_beep, S_IRUGO | S_IWUSR, show_beep, store_beep,
>                   0x5a, 2);
> 
> 
> Le 26/11/2019 13:22, Guenter Roeck a écrit :
> > On 11/26/19 2:03 AM, Gilles Buloz wrote:
> >> I have a functional patch (see below), but before going further (split and cleanup), I would like to have your opinion on how the
> >> NCT7802Y handles the thresholds status.
> >> Except for temperatures and in "comparator interrupt mode", the status bits are NOT set after each ADC conversion, but only once
> >> when crossing a threshold. So an alarm for a threshold is reported only to the first process reading the status and not to the 
> >> others.
> >> For instance if you run "sensors" you only get "ALARM" once the nothing until the threshold is crossed again in the other direction.
> >> Maybe the expected behaviour would be to display "ALARM" as long as we are outside the thresholds, not only once.
> >>
> >
> > Yes, that is the expected behavior.
> >
> > Guenter
> >
> >> --- nct7802.c.orig    2019-11-25 22:17:04.845718422 +0100
> >> +++ nct7802.c    2019-11-25 23:22:00.905387154 +0100
> >> @@ -32,8 +32,8 @@
> >>    static const u8 REG_VOLTAGE[5] = { 0x09, 0x0a, 0x0c, 0x0d, 0x0e };
> >>
> >>    static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
> >> -    { 0x40, 0x00, 0x42, 0x44, 0x46 },
> >> -    { 0x3f, 0x00, 0x41, 0x43, 0x45 },
> >> +    { 0x46, 0x00, 0x40, 0x42, 0x44 },
> >> +    { 0x45, 0x00, 0x3f, 0x41, 0x43 },
> >>    };
> >>
> >>    static const u8 REG_VOLTAGE_LIMIT_MSB[5] = { 0x48, 0x00, 0x47, 0x47, 0x48 };
> >> @@ -60,6 +60,9 @@
> >>    #define REG_CHIP_ID        0xfe
> >>    #define REG_VERSION_ID        0xff
> >>
> >> +#define REG_CACHE_START        0x17
> >> +#define REG_CACHE_END        0x20
> >> +
> >>    /*
> >>     * Data structures and manipulation thereof
> >>     */
> >> @@ -67,6 +70,7 @@
> >>    struct nct7802_data {
> >>        struct regmap *regmap;
> >>        struct mutex access_lock; /* for multi-byte read and write operations */
> >> +    u8 reg_cache[REG_CACHE_END - REG_CACHE_START + 1];
> >>    };
> >>
> >>    static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
> >> @@ -467,6 +471,15 @@  static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
> >>        if (ret < 0)
> >>            return ret;
> >>
> >> +    /*
> >> +     * For registers cleared on read, use a cache to keep all bits
> >> +     * that are set until they are returned to the caller
> >> +     */
> >> +    if ((sattr->nr >= REG_CACHE_START) && (sattr->nr <= REG_CACHE_END)) {
> >> +        val |= data->reg_cache[sattr->nr - REG_CACHE_START];
> >> +        data->reg_cache[sattr->nr - REG_CACHE_START] = val & ~(1 << bit);
> >> +    }
> >> +
> >>        return sprintf(buf, "%u\n", !!(val & (1 << bit)));
> >>    }
> >>
> >> Le 25/11/2019 19:06, Gilles BULOZ a écrit :
> >>> Le 25/11/2019 18:35, Guenter Roeck a écrit :
> >>>> On Mon, Nov 25, 2019 at 04:44:44PM +0000, Gilles Buloz wrote:
> >>>>> Le 25/11/2019 15:31, Guenter Roeck a écrit :
> >>>>>> On 11/25/19 5:13 AM, Gilles Buloz wrote:
> >>>>>>> Hi Guenter,
> >>>>>>>
> >>>>>>> According to the NCT7802Y datasheet, the REG_VOLTAGE_LIMIT_LSB definition is wrong and leads to wrong threshold registers
> >>>>>>> used. It
> >>>>>>> should be :
> >>>>>>> static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
> >>>>>>>             { 0x46, 0x00, 0x40, 0x42, 0x44 },
> >>>>>>>             { 0x45, 0x00, 0x3f, 0x41, 0x43 },
> >>>>>>> };
> >>>>>>> With this definition, the right bit is set in "Voltage SMI Status Register @0x1e" for each threshold reached (using i2cget to
> >>>>>>> check)
> >>>>>>>
> >>>>>> Good catch. Care to send a patch ?
> >>>>> As a fix for this is only useful with a fix for the problem below, maybe a single patch for both would be better.
> >>>> Not really. Those are two separate issues. The reported and selected
> >>>> limits are wrong, period. This will require two patches.
> >>> OK
> >>>>>>> But I'm unable to get any "ALARM" reported by the command "sensors" for VSEN1/2/3 = in2,in3,in4 because status for in0 is read
> >>>>>>> before (unless I set "ignore in0" in sensors file). The problem is that status bits in "Voltage SMI Status Register @0x1e" are
> >>>>>>> cleared when reading, and a read is done for each inX processed, so only the first inX has a chance to get its alarm bit set.
> >>>>>>> For this problem I don't see how to fix this easily; just to let you know ...
> >>>>>>>
> >>>>>> One possible fix would be to cache each alarm register and to clear the cache
> >>>>>> either after reading it (bitwise) or after a timeout. The latter is probably
> >>>>>> better to avoid stale information.
> >>>>> As we have status registers cleared at byte level and we want them to be cleared at bit level when each bit is read, I think a
> >>>>> cache
> >>>>> would be better. I suggest this :
> >>>>> - have a cached value for each status register, by default at 0x00
> >>>>> - when reading a register to get a bit, "OR" its byte value with its cached value, then use its cached value for processing.
> >>>>> - then clear the bit that has been processed from the cached value.
> >>>>>
> >>>> Both methods I suggested would have to involve a cache. The question is
> >>>> when to clear the cache - either clear a bit after reporting it, or
> >>>> clear it after a timeout.
> >>>>
> >>>>> I think a timeout would not be obvious to set : at least the time for sensors to read all info (including when terminal is a 
> >>>>> serial
> >>>>> line and output is slower) and to deal with possible latencies, but not too long...
> >>>> The timeout would be determined by the chip's conversion rate (register 0x26),
> >>> As I understand, the status must be kept in cache between the first read of status register @1E for in0 (clearing all status
> >>> bits), and the last read for in4. This duration depends on the "sensors" execution time and I'can see any link with the conversion
> >>> rate here.
> >>>> or, for simplicity, just be set to one second. I don't immediately see why
> >>>> that would be difficult to implement. Not that it matters much, really;
> >>>> I would accept patches with and without timeout.
> >>>>
> >>>> Guenter
> >>>> .
> >>>>
> >>>
> >>
> >
> > .
> >
