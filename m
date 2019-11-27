Return-Path: <SRS0=aIlX=ZT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98782C432C0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Nov 2019 19:32:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F291206E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Nov 2019 19:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8Tpy86i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbfK0TcZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Nov 2019 14:32:25 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43927 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbfK0TcY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Nov 2019 14:32:24 -0500
Received: by mail-oi1-f194.google.com with SMTP id l20so21132515oie.10
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Nov 2019 11:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5kIwtRkSu6WKPUvk1dl2DD+A0PJLI68bCiL43T+jEHc=;
        b=r8Tpy86i5T69oS0V+RHx/qxcERmsf1mZPT9d51fHvWZ486oAxY85sxxwoR5vx078Ov
         JSSsSq1cs+f54LfJUKRN/lgeUOYUFGlEsU6J89uYeC5g0G8lngplxmuTAcWamWjGiuUv
         BNldXMAP/2dpbWbbB4UAsvOwOLmwPgstjXT8DXEKhohn2gRY/tGL2s7O2yAhsa+TvxmP
         eYoXEU7d754BXMGEwqV6RoZb2cALQvq00IbPSi9cIrZYLdthRaWfLZtECK1RUU+XNHSs
         L/pbWHEhWaNjs8y042WoNTd6kd1aWWEHKXtZo2vd0BaA/brL2VhqAFrRt8xbY6/pZu1f
         hqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5kIwtRkSu6WKPUvk1dl2DD+A0PJLI68bCiL43T+jEHc=;
        b=Rao1+DHNb8caJ+y11XDKZ+0fUTtCdArHdFwhV6EkBBhGWOje0CYwVtPPhK5cUePxjx
         OVZJSTpyPW8rLKThKeElhrdrkz0MtSk/2WuMOD9M7fDwBu4Rkra2QN/4NosLLkHmtJyN
         vde77tJXR2/iniphH64tRHYiKOv9ltKpbeQ9XrhZRfka49urKjNUoZBnUiv7EzPh0t9R
         3v2SJ/6pjSYXTGgXuOwA+8t98+67HLnpSqq7x90QGsrFlN12D8jkDhzYmyjU0BHGzrNw
         Xc10z8SKGbsci84ZZnlkhn65aGTb8f9LsjUVFRutcY43mp7Pr5QalPJcBN16D9sJI/Mo
         abAw==
X-Gm-Message-State: APjAAAVy8rFpsYhXxna8aENAdPUd+tB0NysKHIsihgHzrHJnZRMmXW1U
        Eq0zDd4+Nuep1PnrpOVW4YSFXxyN
X-Google-Smtp-Source: APXvYqxlrxPCzGJvdgMEE7pAs54r7QdAoohoW/B1tc0knlcANIMj4WDtMtc4+IlIW6Nt5drkLiEPVg==
X-Received: by 2002:aca:b303:: with SMTP id c3mr5607734oif.100.1574883143709;
        Wed, 27 Nov 2019 11:32:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u1sm5262312oie.37.2019.11.27.11.32.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 11:32:22 -0800 (PST)
Subject: Re: hwmon: (nct7802) buggy VSEN1/2/3 alarm
To:     Gilles Buloz <Gilles.Buloz@kontron.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <5DDBD386.4070408@kontron.com>
 <6cde95e5-0ab3-016f-b67d-73db8c16ff71@roeck-us.net>
 <5DDC04FB.1030705@kontron.com> <20191125173538.GA21072@roeck-us.net>
 <5DDC1812.9080009@kontron.com> <5DDCF86F.7010703@kontron.com>
 <fc7c1f0b-abaf-0281-7b1b-726f08abcb16@roeck-us.net>
 <5DDD5732.5050503@kontron.com> <20191126182049.GA24175@roeck-us.net>
 <5DDE8B04.4080800@kontron.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e69d0a21-ff80-4e51-9e48-bf5913720829@roeck-us.net>
Date:   Wed, 27 Nov 2019 11:32:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5DDE8B04.4080800@kontron.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/27/19 6:41 AM, Gilles Buloz wrote:
> According to your suggestions, I've made and tested this patch that works :
> 
> --- nct7802.c.orig    2019-11-26 10:37:08.753693088 +0100
> +++ nct7802.c    2019-11-27 15:15:51.000000000 +0100
> @@ -32,8 +32,8 @@
>    static const u8 REG_VOLTAGE[5] = { 0x09, 0x0a, 0x0c, 0x0d, 0x0e };
> 
>    static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
> -    { 0x40, 0x00, 0x42, 0x44, 0x46 },
> -    { 0x3f, 0x00, 0x41, 0x43, 0x45 },
> +    { 0x46, 0x00, 0x40, 0x42, 0x44 },
> +    { 0x45, 0x00, 0x3f, 0x41, 0x43 },
>    };
> 
>    static const u8 REG_VOLTAGE_LIMIT_MSB[5] = { 0x48, 0x00, 0x47, 0x47, 0x48 };
> @@ -67,6 +67,7 @@
>    struct nct7802_data {
>        struct regmap *regmap;
>        struct mutex access_lock; /* for multi-byte read and write operations */
> +    u8 in_status_cache;
>    };
> 
>    static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
> @@ -377,6 +378,56 @@
>        return err ? : count;
>    }
> 
> +static ssize_t show_in_alarm(struct device *dev, struct device_attribute *attr,
> +                 char *buf)
> +{
> +    struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> +    struct nct7802_data *data = dev_get_drvdata(dev);
> +    int volt, min, max, ret, i;
> +    unsigned int val;
> +
> +    /*
> +     * The SMI Voltage statys register is the only register giving a status
> +     * for volatges. A bit is set for each input crossing a threshold, in
> +     * both direction, but the "inside" or "outside" limits info is not
> +     * available. Also this register is cleared on read.

Might add a note that this is form experiment, and not explicitly spelled
out in the datasheet.

> +     * To deal with this we use a status cache with one validity bit and
> +     * one status bit for each input. Validity is cleared at startup and
> +     * each time the register reports a change, and the status is processed
> +     * by software based on current value and limits.
> +     */
> +    ret = regmap_read(data->regmap, 0x1E, &val); /* SMI Voltage status */

We are using lowercase for hex numbers elsewhere in this driver,
so please use lowercase here as well.

> +    if (ret < 0)
> +        return ret;
> +
> +    /* if status of an input has changed, invalidate its cached status */
> +    for (i=0; i<=3; i++)

Spaces before and after assignments, please.

> +        if (val & (1 << i))
> +            data->in_status_cache &= ~(0x10 << i);
> +
> +    /* if cached status for requested input is invalid, update it */
> +    if (!(data->in_status_cache & (0x10 << sattr->index))) {
> +        volt = nct7802_read_voltage(data, sattr->nr, 0);
> +        if (volt < 0)
> +            return volt;
> +        min = nct7802_read_voltage(data, sattr->nr, 1);
> +        if (min < 0)
> +            return min;

Do we need to check min ? The register description suggests "over limit".
No idea though what the min limits are for in that case. Might be worth
running some checks to understand this better (if you did not do that
already).

> +        max = nct7802_read_voltage(data, sattr->nr, 2);
> +        if (max < 0)
> +            return max;
> +
> +        if ((volt < min) || (volt > max))

Unnecessary inner ( )

Guenter
