Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D7EC3E8C5
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Nov 2020 16:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76404221EB
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Nov 2020 16:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="zHyxCsFr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730985AbgK0Qak (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Nov 2020 11:30:40 -0500
Received: from gproxy10-pub.mail.unifiedlayer.com ([69.89.20.226]:57793 "EHLO
        gproxy10-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730603AbgK0Qaj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Nov 2020 11:30:39 -0500
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
        by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id 7B2B2140438
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2020 09:30:37 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id igdokPqZuDlydigdpkEEaV; Fri, 27 Nov 2020 09:30:37 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=Kev8TzQD c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=75MfFJLnZXMnBOZUvNoA:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WPpuTU+XUm25A1NDRVwyMF19Teqymq03fFkeuI9GXnA=; b=zHyxCsFrX7bWa03wZe/GMyD0Ma
        55HOyadKScxlt80FZacrqecHeqfi/j+uqm23wOSNsJZZlqxKh+F7kwqIMqiD+YMArYBwOoRzCX7py
        XFF2eiyOCaBoKSgDqgptxeJ5ruCDVslk/KW3ScnLYpT5pLaVGFI0wTP1guqDHEt0JxNNfbkIJNqgq
        es+0tmtBXtVSsZFcjZGrrmkrb82UWfZaWGUut4bGx5aMtFzCmz2YOi/vh5SfhwnLBqfF59h2/mrCj
        NrkYQSXpqSneeo5SjiUrBWaYz+6G5O5oJ8rfwNA9j8HUQ6e9Jrc+aoaxoBar7Rw/2/3G51tBigLBS
        oYxprw0A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43514 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kigdo-002sex-Ht; Fri, 27 Nov 2020 16:30:36 +0000
Date:   Fri, 27 Nov 2020 08:30:35 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dongjin Kim <tobetter@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pwm-fan) add fan pwm1_enable attribute
Message-ID: <20201127163035.GC9881@roeck-us.net>
References: <20201125163242.GA1264232@paju>
 <20201126020536.GE111386@roeck-us.net>
 <20201126154247.GA24875@paju>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126154247.GA24875@paju>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kigdo-002sex-Ht
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:43514
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 27, 2020 at 12:42:47AM +0900, Dongjin Kim wrote:
> On Wed, Nov 25, 2020 at 06:05:36PM -0800, Guenter Roeck wrote:
> > On Thu, Nov 26, 2020 at 01:32:42AM +0900, Dongjin Kim wrote:
> > > This patch adds to new attribute 'pwm1_enable' to change the fan speed
> > > control method as documented in 'Documentation/hwmon/sysfs-interface'.
> > > 
> > > Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> > 
> > The new attribute needs to be documented in
> > Documentation/hwmon/pwm-fan.rst, with supported values.
> > 
> > > ---
> > >  drivers/hwmon/pwm-fan.c | 52 ++++++++++++++++++++++++++++++++++++-----
> > >  1 file changed, 46 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> > > index 1f63807c0399..834275309421 100644
> > > --- a/drivers/hwmon/pwm-fan.c
> > > +++ b/drivers/hwmon/pwm-fan.c
> > > @@ -39,6 +39,7 @@ struct pwm_fan_ctx {
> > >  	unsigned int pwm_fan_max_state;
> > >  	unsigned int *pwm_fan_cooling_levels;
> > >  	struct thermal_cooling_device *cdev;
> > > +	int enable;
> > >  };
> > >  
> > >  /* This handler assumes self resetting edge triggered interrupt. */
> > > @@ -76,6 +77,10 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
> > >  	struct pwm_state state = { };
> > >  
> > >  	mutex_lock(&ctx->lock);
> > > +
> > > +	if (ctx->enable == 0)
> > > +		pwm = MAX_PWM;
> > > +
> > >  	if (ctx->pwm_value == pwm)
> > >  		goto exit_set_pwm_err;
> > >  
> > > @@ -137,11 +142,42 @@ static ssize_t rpm_show(struct device *dev,
> > >  	return sprintf(buf, "%u\n", ctx->rpm);
> > >  }
> > >  
> > > +static ssize_t enable_store(struct device *dev,
> > > +		struct device_attribute *attr,
> > > +		const char *buf, size_t count)
> > > +{
> > > +	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> > > +	int err;
> > > +	unsigned long val;
> > > +
> > > +	err = kstrtoul(buf, 10, &val);
> > > +	if (err)
> > > +		return err;
> > > +
> > 
> > 'val' must be validated and only accept permitted values.
> Sure.
> > 
> > > +	mutex_lock(&ctx->lock);
> > > +	ctx->enable = val;
> > > +	mutex_unlock(&ctx->lock);
> > > +
> > > +	err = __set_pwm(ctx, ctx->pwm_fan_cooling_levels[ctx->pwm_fan_state]);
> > > +
> > > +	return err ? err : count;
> > > +}
> > > +
> > > +static ssize_t enable_show(struct device *dev, struct device_attribute *attr,
> > > +			   char *buf)
> > > +{
> > > +	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> > > +
> > > +	return sprintf(buf, "%u\n", ctx->enable);
> > > +}
> > > +
> > >  static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
> > > +static SENSOR_DEVICE_ATTR_RW(pwm1_enable, enable, 0);
> > >  static SENSOR_DEVICE_ATTR_RO(fan1_input, rpm, 0);
> > >  
> > >  static struct attribute *pwm_fan_attrs[] = {
> > >  	&sensor_dev_attr_pwm1.dev_attr.attr,
> > > +	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
> > >  	&sensor_dev_attr_fan1_input.dev_attr.attr,
> > >  	NULL,
> > >  };
> > > @@ -153,7 +189,7 @@ static umode_t pwm_fan_attrs_visible(struct kobject *kobj, struct attribute *a,
> > >  	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> > >  
> > >  	/* Hide fan_input in case no interrupt is available  */
> > > -	if (n == 1 && ctx->irq <= 0)
> > > +	if (n == 2 && ctx->irq <= 0)
> > >  		return 0;
> > >  
> > >  	return a->mode;
> > > @@ -200,7 +236,7 @@ static int
> > >  pwm_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> > >  {
> > >  	struct pwm_fan_ctx *ctx = cdev->devdata;
> > > -	int ret;
> > > +	int ret = 0;
> > >  
> > >  	if (!ctx || (state > ctx->pwm_fan_max_state))
> > >  		return -EINVAL;
> > > @@ -208,10 +244,12 @@ pwm_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> > >  	if (state == ctx->pwm_fan_state)
> > >  		return 0;
> > >  
> > > -	ret = __set_pwm(ctx, ctx->pwm_fan_cooling_levels[state]);
> > > -	if (ret) {
> > > -		dev_err(&cdev->device, "Cannot set pwm!\n");
> > > -		return ret;
> > > +	if (ctx->enable >= 2) {
> > 
> > What is "automatic" here ? I don't see how this driver or the underlying
> > pwm controller/chip would support automatic fan speed control. This is
> > completely independent of thermal control: thermal device support does _not_
> > imply or suggest "automatic" fan speed control from a pwm chip perspective.
> > 
> My understanding of 'automatic' is to set the fan speed by a thermal device
> with the trip points, it changes the cooling state and change the fan speed.
> Please correct me if I am wrong.

Yes, you are wrong. "automatic" means the controller performs pwm control
automatically, on its own, without interference by the Linux kernel or userspace.
It is also autonomous to thermal subsystem control. In general, "automatic" and
thermal control by the Linux kernel contradict each other: "automatic" implies
that the device is _not_ under thermal subsystem control. That would, from
a device perspective, be "manual".

> 
> > This makes me also very concerned about this attribute in the first please:
> > All it does, in its current implementation, is to disable thermal device 
> > control. That is not the idea here, and it doesn't make any sense to me.
> > On the contrary, all I can find is that it is dangerous.
> > 
> I don't intend to change the thermal control itself in 'manual' mode, but does
> not change the fan speed with given cooling state. In 'automatic' mode, the
> fan speed will be changed by the thermal device.
> 
> > Please describe in detail what you think this attribute is supposed to
> > accomplish, and why you think it is needed or even makes sense. Overriding
> > thermal control doesn't make sense to me: If you want that, just disable
> > thermal control, or don't register this device as cooling device in the
> > first place.  Other than that, the whole driver implies manual pwm control.
> > That means pwm can already be "disabled" by writing a 0 pwm value. An
> > additional attributes doesn't add value and only makes the driver ABI
> > unnecessarily complex. So please prepare a detailed rationale to convince
> > me otherwise.
> >
> I am using this driver to run a fan on ARM SBC and thought 'fancontrol' can
> help to map the fan speed with pwm value if necessary instead of using the pwm
> values in a device tree by writing '1' to 'pwm1_enable'. When this driver is
> not registered as a cooling device, as you suggested, OS should provide the
> default fancontrol config to run fully in manual mode if my understanding is
> correct. Based on this what I am thinking is that OS images for ARM SBC should
> have a fan control service or a tool if it allows user to change the fan speed.
> But this could be very various for all SBC, I would prefer to provide the
> default cooling device in the device tree to prevent the absence of fan
> control due to the missing or wrong config.

'fancontrol' and in-kernel thermal management should not both run at the same
time. In-kernel thermal control would in general be preferred, and should be
configurable through the thermal subsystem. Either case, we can't use hwmon
attributes to switch between the two methods for thermal control. If
'fancontrol' is to be used, the thermal subsystem should be completely
disabled. However, again, I would not recommend doing that since it is much more
comprehensive than 'fancontrol'.

Guenter

> 
> > We can have a separate discussion if disabling a pwm controller using the
> > hwmon ABI should disable that pwm controller from a thermal (cooling) device
> > perspective. If so, we'll need to think about the implications. We can not
> > just disable thermal cooling device support without telling the thermal
> > subsystem that this means of temperature control doesn't work anymore.
> > That should, however, be a completely separate discussion, independent
> > of this driver, and it should include thermal subsystem maintainers
> > and the thermal subsystem mailing list.
> Ok, thank you for your advice and review. :)
> 
> Dongjin.
> > 
> > Thanks,
> > Guenter
> > 
> > > +		ret = __set_pwm(ctx, ctx->pwm_fan_cooling_levels[state]);
> > > +		if (ret) {
> > > +			dev_err(&cdev->device, "Cannot set pwm!\n");
> > > +			return ret;
> > > +		}
> > >  	}
> > >  
> > >  	ctx->pwm_fan_state = state;
> > > @@ -298,6 +336,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(ctx->pwm))
> > >  		return dev_err_probe(dev, PTR_ERR(ctx->pwm), "Could not get PWM\n");
> > >  
> > > +	ctx->enable = 2;
> > > +
> > >  	platform_set_drvdata(pdev, ctx);
> > >  
> > >  	ctx->irq = platform_get_irq_optional(pdev, 0);
> > > -- 
> > > 2.25.1
> > > 
