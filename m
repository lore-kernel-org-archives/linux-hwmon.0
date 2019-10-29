Return-Path: <SRS0=fVv9=YW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D24CCA9EAE
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Oct 2019 12:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F91B21734
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Oct 2019 12:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVW/ianL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731068AbfJ2M2C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Oct 2019 08:28:02 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34301 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729317AbfJ2M2B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Oct 2019 08:28:01 -0400
Received: by mail-pl1-f195.google.com with SMTP id k7so7543244pll.1;
        Tue, 29 Oct 2019 05:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bRqsU0FAlQQqAiPlj1ZBRRbHzHEqFM5qE9H5nBbrVNI=;
        b=SVW/ianL7vH+K2MEz6Mm4Tn6i83kscScAxlhcrc/YLLGBMSlTrfYpWMYHP3cymQH2s
         zcU3F9b1HacpJiE/3hVDnebLN2+RofLZmYRmeJDA1N02o7uBIREurZabXPIP3ldfIn4P
         7hP5ixgPiNa3QQ0j96VLrQ2J1gvUwPW+4EEr/qbXhUnlYJJXhwSOUaoXuY1v0HsMZhgu
         L+OiBda0dHNUwrUK+MPSq9tX0RVUPjeIcSM+QDoJci80fxpPNWN1U500C8Ms68aqNTOH
         l/2PiipgFlHQ14mycEFDItAowt4nqPZinKztTFccfDri9Sckp1UWQyzlJv8hQovxC9v8
         WOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=bRqsU0FAlQQqAiPlj1ZBRRbHzHEqFM5qE9H5nBbrVNI=;
        b=s0lTPIF8txk3McxPuJSiu/T5D5yXjV69sC0YPPly0hTXldFWZ2PjVHnvBLN3kdeInO
         e/+VkuiNLV9XOuScMg2OTltMRml16zjVDQMna2lnsvp6s/AHCvKAIK2oDHpyF6Bvh8aw
         p87xPUtD1feeZqDXtvJrIvGHao0CW1aJIdjlFV3r+RdWmor/hXprwLvhritbITwFkgHY
         dhfe6u8Yi+mmOArhFGc6T2Y/J0Btv2EGIKHemS77b41P53mugkkOMrD1hXztssOvWdv0
         nB7c9FKwJtc4mkNVuT1NYBDJ/aYA7ooUGDTKUOvK+LvLEDK1ibaiwbftwWKud0R9lXsR
         r7hA==
X-Gm-Message-State: APjAAAVg7yqdJcm+FLlny5Ii/ieH3TQU9pXpljrPPm8soRS1jMKxnLWR
        QFceCsgsPrG+1dKXj8vYR8c=
X-Google-Smtp-Source: APXvYqye3oFYJMHHWRiHNhLbw5/kavIwFul1a6w6zWfvDAoFk/il60K1UQfqQhxI73o/f6q1BQiBqg==
X-Received: by 2002:a17:902:bd84:: with SMTP id q4mr3912657pls.333.1572352081065;
        Tue, 29 Oct 2019 05:28:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dw19sm2306891pjb.27.2019.10.29.05.28.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2019 05:28:00 -0700 (PDT)
Date:   Tue, 29 Oct 2019 05:27:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 1/2] hwmon: Add support for ltc2947
Message-ID: <20191029122759.GA19337@roeck-us.net>
References: <20191021154115.319073-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191021154115.319073-1-nuno.sa@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 21, 2019 at 05:41:14PM +0200, Nuno Sá wrote:
> The ltc2947 is a high precision power and energy monitor with an
> internal sense resistor supporting up to +/- 30A. Three internal no
> Latency ADCs ensure accurate measurement of voltage and current, while
> high-bandwidth analog multiplication of voltage and current provides
> accurate power measurement in a wide range of applications. Internal or
> external clocking options enable precise charge and energy measurements.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

[ ... ]

> +
> +static ssize_t ltc2947_show_value(struct device *dev,
> +				  struct device_attribute *da, char *buf)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	int ret;
> +	s64 val = 0;
> +
> +	switch (attr->index) {
> +	case LTC2947_REG_ENERGY1:
> +	case LTC2947_REG_ENERGY2:
> +		ret = ltc2947_val_read(st, attr->index, PAGE0, 6, &val);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

This complexity is also unnecessary: index is either LTC2947_REG_ENERGY1 or
LTC2947_REG_ENERGY2. I removed the case statement when applying.

Guenter
