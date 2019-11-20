Return-Path: <SRS0=7wWQ=ZM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB93C432C0
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Nov 2019 18:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0C712071C
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Nov 2019 18:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJztbXnT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfKTSrq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Nov 2019 13:47:46 -0500
Received: from mail-pj1-f54.google.com ([209.85.216.54]:35789 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfKTSrq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Nov 2019 13:47:46 -0500
Received: by mail-pj1-f54.google.com with SMTP id s8so222142pji.2
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Nov 2019 10:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IVoSLOwHqXkTVb2ERYz4sGonCfaJuuxeGU51vsVPyGI=;
        b=rJztbXnTK54fATMh8gvkw4YnK3cvdvzpqtauTExlP/dyNO3WH6eiRJl1EmeG4xCI7l
         xiASv4CW98zVAxUWHEa/OXRuSdn0APIeZ57af9Dn/HlYupy13rgqLLuxHyhU/ZFVB8Gb
         x/eVrSiujUS0JQRn0CyJFImwk4oL4QqQR0CDuIQHPs7XhQhMRG3OIKrIrzblfnJlBcOX
         SAD401jw/I5mNgI8icot5GOSnYR6gRfMeRh1kTv0MN0R4rkrKDzatq4XrKy99pl+eDfD
         7p1o04OcfV6+/WCxTsD5m/+rLipiNsklvk1sS1kiYa/cIXYjjmlKKKHzr187zRebyXaZ
         Er7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=IVoSLOwHqXkTVb2ERYz4sGonCfaJuuxeGU51vsVPyGI=;
        b=UqioAT2P7XRRpFUfvZ+S5Q7OQMWzJ1S7y/QkUxh5exakloDR/q/cCd82D6WWzkpUoK
         H9L4K1uSbVKBg7MPEF4trIHFmdS7raGpWzQ5VL3qd6ZqeidNhRA5hZs+sm1lz/w3SGAi
         j70SilQ/8/I+s63ZsMlnHGQwH/8waOw+43Ew7qEY0/WZ0wMGj9f063g4g3AVfX/1lK+n
         srvDO5vBvBujpt3VQnYdFP1FQGHhHpSx9I+D/38nmhCMY2ETLITKB7qtV6jB8TNZTX7N
         Z/1YxKE9WN/n6m9pr3c551fj8o8ASrx+bj/22pBI14rFleCSlmu1NKOru6gQ+IQzrb39
         qNjw==
X-Gm-Message-State: APjAAAWhMH6/1dopsO/by077DQm5XiAHCLgoo+86iEJjT7XEQ8XaGwb8
        hmNu7gtP0Z1mWZVvElDP/ng=
X-Google-Smtp-Source: APXvYqx7Us2yEDpVtGoRJQq//MWmKhyTV6/Vz8xGiiac1EIwtoCcQBNBIXeQpasoC0/JlldBaE+a/A==
X-Received: by 2002:a17:902:b693:: with SMTP id c19mr4434670pls.89.1574275665197;
        Wed, 20 Nov 2019 10:47:45 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x186sm83133pfx.105.2019.11.20.10.47.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 10:47:44 -0800 (PST)
Date:   Wed, 20 Nov 2019 10:47:43 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Dr. David Alan Gilbert" <linux@treblig.org>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: WIP: [PATCH] hwmon: (w83627ehf) convert to with_info interface
Message-ID: <20191120184743.GA12192@roeck-us.net>
References: <20191119181822.GC26171@gallifrey>
 <20191119212108.GA16985@roeck-us.net>
 <20191120172616.GA22683@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120172616.GA22683@gallifrey>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 20, 2019 at 05:26:16PM +0000, Dr. David Alan Gilbert wrote:
> * Guenter Roeck (linux@roeck-us.net) wrote:
> > On Tue, Nov 19, 2019 at 06:18:22PM +0000, Dr. David Alan Gilbert wrote:
> > > 
> > > Hi Jean, Guenter,
> > >   I'm part way through converting w83627ehf to use the devm_hwmon_device_register_with_info
> > > interface and had some questions I'd appreciate the answer to.  My WIP
> > > code is attached below.
> > > 
> > >   a) In the existing driver, all the pseudo files are showing up as:
> > >      /sys/devices/platform/w83627ehf.656/blah_input
> > >      with the rework:
> > >      /sys/devices/platform/w83627ehf.656/hwmon/hwmon1/
> > > 
> > >      my reading is that the reworked one is correct?
> > >      Although I guess the change is a pain for people with paths
> > >      in tools.
> > > 
> 
> Thanks for the reply.
> 
> > No one should have absolute path names like the above in their tools.
> > So far none of the driver conversions caused trouble, so hopefully
> > we should be fine.
> 
> OK, great.
> 
> > >   b) The device has an intrusion0_alarm & intrusion1_alarm
> > >      that seems pretty common looking in drivers/hwmon - some other
> > >      devices have a intrustion%d_beep.  Does it make sense to add
> > >      a new hwmon_intrusion type to hwmon_sensor_types  ?
> > > 
> > Yes, we should add hwmon_intrusion to hwmon_sensor_types, with _alarm
> > and _beep as supported attributes.
> 
> OK, will do.
> 
> > >   c) The device has a bunch more pwm variants:
> > >      pwm2_max_output, pwm2_start_output, pwm2_step_output, pwm2_stop_output,
> > >      pwm2_stop_time, pwm2_target, pwm2_tolerance
> > > 
> > >      for each/some of it's outputs.   What's the right thing to
> > >      do there? Add them all to hwmon_pwm_attr_templates ?
> > >      (Unfortunately it looks like everyone has fun with their own
> > >       pwm settings).
> > > 
> > We'll have to keep sysfs files for those for the time being,
> > unless there are some which are officially listed in
> > Documentation/hwmon/sysfs-interface.rst.
> 
> OK, that's a bit messy; so just keep the existing sysfs code - do
> I need to tweak that to match the new directory path?
> Would another way be to use @extra_groups on the with_info call?
> 
Yes, that is what you are supposed to do.

Guenter
