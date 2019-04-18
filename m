Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2147CC10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3F8C206B6
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ow1aQLDz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389866AbfDRUML (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:12:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37204 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732589AbfDRUML (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 16:12:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id e6so1684576pgc.4
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 13:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4nvL2px4ZQ6fULyiZjN1zCUvsUktWkuEEsTUuyBxBzU=;
        b=Ow1aQLDzuLfwEly1j/GTY6URuhxRHUoAiExzDtgpLOh8FZ63Srx6HnNvolVJaEvdhx
         BnS0UUJBgN+ViUEPtmpK6EVILdlJbjMiwOo5VsxPUfaFt+eSND/aIOO5Z3590kKJHjCz
         XTKQnKc8E3hp3u5Qc2KK9vRTJsQee2KSEIHy3K1NP4DlDEthcVQNwrdYKepR7ywK9I21
         cDRc3q3tCAKUBIjjalnsqY+I28lDAo+AfNblTJ8nsFQTP8IBQPzMd6oe+Vbh1Vtb7YHS
         /XekGGmO/WXVj8jau6lSv4XfYh/iD2I6ZR0GJvKZoAANVWNKmcR4SSmacZ7zMpJ83qZ0
         g/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4nvL2px4ZQ6fULyiZjN1zCUvsUktWkuEEsTUuyBxBzU=;
        b=FbOtLST+AddmSoLw26TdMnmPARwzRcJOJLYrRX38zr4JtZy03hpC4ev9zO1DB+LjQI
         HnL/VcpBKp6u/NeDI4nb7h2ffYDKcDBwiSPzymVvvBrfwYM7uVYl04LDld1TiCiGFyzM
         3skv7rORO1y1JWM4rUvdnlU9nv6qoFbK/c9fiKFj42+dl0iykwl6DsP+lGu6ylJ+9Rmr
         qELVGrjJNZxJ/Iyc3Fn+uZ2wwvT4e1wTguIWhjNEQyw+ND+2ONmph6SyEGv3DLzlbdwC
         LpVtxdsAGQYINNty7CBNgwBs6v8Mv4IAScnor3gXn+uRnXFES2y5pGSZiGaV6+tm0iKV
         j89Q==
X-Gm-Message-State: APjAAAWsoh7NmoCMgcLeEchCpnref7hokXAAv12O+3zSkWQLdq7AxJrD
        79XLf+ZAVxeP1piu5re+7sMPynrG
X-Google-Smtp-Source: APXvYqzqDyIwqQkn3aiUU/KJsJjFXVpNeesqRF6LJ4bE6QBdYiAL5BHTGqxHnfXYETXDkWrLWjJw3Q==
X-Received: by 2002:a65:408b:: with SMTP id t11mr85872014pgp.372.1555618330527;
        Thu, 18 Apr 2019 13:12:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u62sm4583925pfa.124.2019.04.18.13.12.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 13:12:09 -0700 (PDT)
Date:   Thu, 18 Apr 2019 13:12:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190418201208.GA10459@roeck-us.net>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
 <20190418173856.GB7804@roeck-us.net>
 <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
 <20190418180623.GA18588@roeck-us.net>
 <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 18, 2019 at 03:54:32PM -0400, Jean-Francois Dagenais wrote:
> 
> 
> > On Apr 18, 2019, at 14:06, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> > On Thu, Apr 18, 2019 at 02:02:48PM -0400, Jean-Francois Dagenais wrote:
> >> 
> >>> On Apr 18, 2019, at 13:38, Guenter Roeck <linux@roeck-us.net> wrote:
> >>> 
> >>>> +#if IS_ENABLED(CONFIG_THERMAL)
> >>> 
> >>> This will result in missing symbols if THERMAL is built as module
> >>> and this driver is built into the kernel. You'll have to adjust
> >>> Kconfig dependencies accordingly. See other drivers for examples.
> >> 
> >> Right! Was not a problem for me, but I do remember seing the "funny"
> >> ifdefs around.
> >> 
> > 
> > I know, it is annoying. There was an effort to make THERMAL boolean
> > instead of tristate, but it looks like that has stalled or was
> > rejected.
> 
> Ok, so I had used pwm-fan.c as a reference and simply forgotten to copy over the
> Kconfig bit which makes sure if the thermal is a module, then so is the chip
> driver. I will put in v3.
> 
> > 
> >>> 
> >>>> +	data->cooling_dev =
> >>>> +		thermal_of_cooling_device_register(client->dev.of_node,
> >>>> +						   id->name, data,
> >>>> +						   &max6650_cooling_ops);
> >>>> +	if (IS_ERR(data->cooling_dev)) {
> >>>> +		err = PTR_ERR(data->cooling_dev);
> >>>> +		dev_err(&client->dev,
> >>>> +			"Failed to register as cooling device (%d)\n", err);
> >>>> +		return err;
> >>> 
> >>> Why would it be fatal for the driver if this fails ? It wasn't
> >>> fatal before.
> >> 
> >> Mmmh, you are right. This assumes that all users of max6650 would now require to
> >> be referred to in some thermal zone. Again, this was not a problem for my test
> >> environment.
> 
> And about this bit... I had confused the thermal cooling register with the
> thermal_of_sensor register. So if my static analysis of the code in
> __thermal_cooling_device_register is correct, the function cannot really fail
> unless something is terribly wrong in the kernel... like a malloc failure or
> something.
> 

That explains why the other drivers don't generate an error message.
You might want to reconsider the dev_err() above; it appears it adds zero
value.

> If I am wrong, then pwm-fan.c should also be visited since my max6650_probe code
> was copy-pasted from it.
> 

You are correct, that should not fail either. But two wrongs don't make it right.

> 
> On a related note, I am worried about everyone having to progressively add
> thermal-zone support to each fan chip in drivers/hwmon. Would it not be possible
> for hwmon to detect, through `enum hwmon_sensor_types` set to `hwmon_fan` in
> `struct hwmon_channel_info` to be registered as cooling device in thermal ? Of
> course for max665x to work, it would have to be modified to use
> `devm_hwmon_device_register_with_info` instead of
> `devm_hwmon_device_register_with_groups`
> 

Yes, that would be desirable. Patches welcome. And, yes, the driver would have
to be reworked to use the new API.

> Another possiblity would be to create a new driver in drivers/thermal for
> max665x as a thermal cooling device. Or even a

Only if we also drop the existing driver from hwmon. Fine with me if others
agree and let you do it (one less hwmon driver to maintain).

Note that I just submitted a patch series to introduce
devm_thermal_of_cooling_device_register(). We'll see if the thermal maintainers
accept it.

Guenter

> drivers/thermal/thermal-generic-hwmon-fan.c or something, where DTS would
> instanciate such a cooling device which references a hwmon device's specific
> pwm channel.
> 

