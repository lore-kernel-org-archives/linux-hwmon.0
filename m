Return-Path: <SRS0=miNt=ZL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBFDC43215
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Nov 2019 21:21:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5256B206F4
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Nov 2019 21:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayKVfloQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKSVVM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Nov 2019 16:21:12 -0500
Received: from mail-pj1-f44.google.com ([209.85.216.44]:41386 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfKSVVL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Nov 2019 16:21:11 -0500
Received: by mail-pj1-f44.google.com with SMTP id gc1so3165820pjb.8
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Nov 2019 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G0i5Sy9sa3dUwSa3yz3aHZk0kJw00v3vCB9/vZQIH7o=;
        b=ayKVfloQ7GiMDqA5OnyhkKUpZkX6tDlhScn4R2lYf7mqsJkD4AFiVEONJlfSehNR89
         sPgD+f+MAZfr/NkVpfHMtEyg0HKFG+TuYW1QiLRggD+HbdoiL6vof8PyxBos9teZkNnx
         5j7ROXD5ZDW0DYACz+1U4jderoIkR5XEAdVWyp7C7RblzhnsQUbBrk39C4uIP+F67VVx
         PHa1Hpq/dWkpzBPuIxXATU/9h4RIUoe5t7Mus2erHntpF5aE85qEF0BMXA0pIIU9V+uT
         H4lmdwiuVq+VNh0UIGYTmj1yvEKGI0CTFx+NT+g497qD4HfCCXfeRciWlEgKyNzYMer8
         x7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=G0i5Sy9sa3dUwSa3yz3aHZk0kJw00v3vCB9/vZQIH7o=;
        b=FSB/7Ecr5xLbWsgsJPry4eHqfwsyUgOX8TVvtGyBuhlXf7MVz0cmBuarmq/dCRwgLP
         bKA7DX/nxmwub3WE1cLURA0MN+CUjxyoE4xgWcYYaXDrzkGxeUkE1hJGkvHTL2zehnN7
         KDFzs9F5PyvvddriDJwCp4CnruRtUJ/0twRMvaxer6NFyQ9Nrk7g8FPlokkz4LJRb0Tg
         kFI8oG1wWTCpkpKX7N76zLqAUUvuMPGpVfJCDEVY1mqFOyatz5LrBHhA0GxtCz/MFhZ8
         /UwKbK6Z2TifLI+napCto4B6fxjN1JMahyEjYSHd3FVvmNFbjRvo7678SdeujkXvEewg
         xXXw==
X-Gm-Message-State: APjAAAUy8K44VL/6yzxzvhW5pfMavj+fJGSZmGqe554CFNWlVThWuBw3
        TFHVz1PAEoPCmCUJ4fT6Syo=
X-Google-Smtp-Source: APXvYqyqP/RVkIPqo9X/QNKW3ZMnMWmX3LVYpFijuHd8SMnOEIOBxrcGPY2dohLgA1BiQdNXZq7sdw==
X-Received: by 2002:a17:90a:d152:: with SMTP id t18mr9178260pjw.119.1574198471033;
        Tue, 19 Nov 2019 13:21:11 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c2sm26343532pfn.55.2019.11.19.13.21.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 13:21:09 -0800 (PST)
Date:   Tue, 19 Nov 2019 13:21:08 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Dr. David Alan Gilbert" <linux@treblig.org>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: WIP: [PATCH] hwmon: (w83627ehf) convert to with_info interface
Message-ID: <20191119212108.GA16985@roeck-us.net>
References: <20191119181822.GC26171@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119181822.GC26171@gallifrey>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 19, 2019 at 06:18:22PM +0000, Dr. David Alan Gilbert wrote:
> 
> Hi Jean, Guenter,
>   I'm part way through converting w83627ehf to use the devm_hwmon_device_register_with_info
> interface and had some questions I'd appreciate the answer to.  My WIP
> code is attached below.
> 
>   a) In the existing driver, all the pseudo files are showing up as:
>      /sys/devices/platform/w83627ehf.656/blah_input
>      with the rework:
>      /sys/devices/platform/w83627ehf.656/hwmon/hwmon1/
> 
>      my reading is that the reworked one is correct?
>      Although I guess the change is a pain for people with paths
>      in tools.
> 

No one should have absolute path names like the above in their tools.
So far none of the driver conversions caused trouble, so hopefully
we should be fine.

>   b) The device has an intrusion0_alarm & intrusion1_alarm
>      that seems pretty common looking in drivers/hwmon - some other
>      devices have a intrustion%d_beep.  Does it make sense to add
>      a new hwmon_intrusion type to hwmon_sensor_types  ?
> 
Yes, we should add hwmon_intrusion to hwmon_sensor_types, with _alarm
and _beep as supported attributes.

>   c) The device has a bunch more pwm variants:
>      pwm2_max_output, pwm2_start_output, pwm2_step_output, pwm2_stop_output,
>      pwm2_stop_time, pwm2_target, pwm2_tolerance
> 
>      for each/some of it's outputs.   What's the right thing to
>      do there? Add them all to hwmon_pwm_attr_templates ?
>      (Unfortunately it looks like everyone has fun with their own
>       pwm settings).
> 
We'll have to keep sysfs files for those for the time being,
unless there are some which are officially listed in
Documentation/hwmon/sysfs-interface.rst.

> For reference, I seem to have a w83667hg on an ASRock P55M Pro.
> 
> The current status is that 'reading' seems to work (from what I can tell
> but not looked at the PWM), and I've not converted the writers yet.
> 
Good start. I would suggest to run your patch through checkpatch.
It will tell you, for example, that S_IRUGO et al ran out of favor,
and that you are supposed to use octals instead.

Thanks,
Guenter
