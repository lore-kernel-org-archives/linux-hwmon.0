Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE1FC10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 18:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 045E82077C
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 18:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjf6zz0y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbfDJSZg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 14:25:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43035 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727583AbfDJSZg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 14:25:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id z9so2033172pgu.10
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dyxOkM7uNv3TdFHfE74N6TDG8CHB5xmuAgySQ8YnURM=;
        b=Yjf6zz0y7/E0Tb49MVXx3DMlPvsvUu/bLWm2ymH/hb/BOJULQvj6t1yKe4uHlckS+6
         218GtSseBwL/oOt6oI1MJS/VlyZB+dxQ8/+itBdB5s4s85ccKgyWTUfrLTOQnbjhA/5w
         QfBQaOBnTOHIACg1LwoATtXP/NwhcscqJNS3bxdsi3V7Yd02qsIGuia8RQpWHc0baJUN
         S4YmJgSiugAQgkuigNlLzP6SRKEOSFVmVu+9MSphwtfnk/Y19+XBp2iZxC2pnu5Z01iN
         4e0vm8ZW291WjfHE7hcVUnJLX2OwieOxstVTmLAqKsECVUqVk0TfnJcx106tFXpTMw/f
         NJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dyxOkM7uNv3TdFHfE74N6TDG8CHB5xmuAgySQ8YnURM=;
        b=N3tmW/gQT4cyF+bqiRUlj/p2/N3pOKo4jXXmpsb8mVgA3Y2H8vIMqCajMi3o1nivtx
         XUUB1qgjYWavOpPGWuZbfniBtIVcOZBGg6JVOO4hI7HzfP/CPuw4Ehko8EBu8PJ99l6z
         /E/xRNNM0sQ+3y4wLI/9jdLDAc9Y4CaVtwdbof94r6V2M4cZMElfQm66dsF4KeLA6WvN
         zDWP5ynUkC4MwOlPYCQiDxQQNHH0lhKZdK/2Y8xZdVljFB0iyJng5vrpW3lhe55yo6hq
         XhhmfrOVFYFDrsRkZBhHXObuzLgVp9AO/DC3ugsnX3NZKX3x2ol1RqeJ0vxBLFGEOZuP
         kucg==
X-Gm-Message-State: APjAAAX2gxuCP6rr2VbZerisWZ1Qbe7aud3HByjNJdnNFVyovH8DLDGp
        ZhPJEDC+hbEGhAvPidFDaEM=
X-Google-Smtp-Source: APXvYqxVcUB3Rf3QdkfCEwNFwoOg3tA8z54EVtqVkEfUIeg92OJWVvxDToeBwpsWB1t3fya4ddxK3w==
X-Received: by 2002:a65:524a:: with SMTP id q10mr40949320pgp.224.1554920734823;
        Wed, 10 Apr 2019 11:25:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o68sm93825897pfi.140.2019.04.10.11.25.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 11:25:34 -0700 (PDT)
Date:   Wed, 10 Apr 2019 11:25:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-hwmon@vger.kernel.org, Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] hwmon: (occ) Move common code to a separate module
Message-ID: <20190410182533.GA1524@roeck-us.net>
References: <20190410124726.2d7e9d38@endymion>
 <20190410182147.GA939@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190410182147.GA939@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 10, 2019 at 11:21:47AM -0700, Guenter Roeck wrote:
> Jean,
> 
> On Wed, Apr 10, 2019 at 12:47:26PM +0200, Jean Delvare wrote:
> > Instead of duplicating the common code into the 2 (binary) drivers,
> > move the common code to a separate module. This is cleaner.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Eddie James <eajames@linux.ibm.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> 
> what is the parent release for this patch ? I tried to apply it to mainline
> and to hwmon-next using git am, but both failed.
> 

Never mind, found it - v5.0. Both patches applied to hwmon-next.

Thanks,
Guenter

> Thanks,
> Guenter
> 
> > ---
> > Eddie, can you please give it a try and confirm it works?
> > 
> > Note: I kept the module names as they were before, hence the extra
> > "*-objs :=" statements. They could be removed if we rename the source
> > files, but that's better done in git directly. I don't mind either way
> > personally.
> > 
> >  drivers/hwmon/occ/Kconfig  |    3 +--
> >  drivers/hwmon/occ/Makefile |    6 ++++--
> >  drivers/hwmon/occ/common.c |    7 +++++++
> >  drivers/hwmon/occ/sysfs.c  |    2 ++
> >  4 files changed, 14 insertions(+), 4 deletions(-)
> > 
> > --- linux-5.0.orig/drivers/hwmon/occ/Kconfig	2019-04-10 11:30:05.579537638 +0200
> > +++ linux-5.0/drivers/hwmon/occ/Kconfig	2019-04-10 11:31:20.843383376 +0200
> > @@ -27,5 +27,4 @@ config SENSORS_OCC_P9_SBE
> >  	 called occ-p9-hwmon.
> >  
> >  config SENSORS_OCC
> > -	bool "POWER On-Chip Controller"
> > -	depends on SENSORS_OCC_P8_I2C || SENSORS_OCC_P9_SBE
> > +	tristate
> > --- linux-5.0.orig/drivers/hwmon/occ/Makefile	2019-03-04 00:21:29.000000000 +0100
> > +++ linux-5.0/drivers/hwmon/occ/Makefile	2019-04-10 11:33:23.631765535 +0200
> > @@ -1,5 +1,7 @@
> > -occ-p8-hwmon-objs := common.o sysfs.o p8_i2c.o
> > -occ-p9-hwmon-objs := common.o sysfs.o p9_sbe.o
> > +occ-hwmon-common-objs := common.o sysfs.o
> > +occ-p8-hwmon-objs := p8_i2c.o
> > +occ-p9-hwmon-objs := p9_sbe.o
> >  
> > +obj-$(CONFIG_SENSORS_OCC) += occ-hwmon-common.o
> >  obj-$(CONFIG_SENSORS_OCC_P8_I2C) += occ-p8-hwmon.o
> >  obj-$(CONFIG_SENSORS_OCC_P9_SBE) += occ-p9-hwmon.o
> > --- linux-5.0.orig/drivers/hwmon/occ/common.c	2019-03-04 00:21:29.000000000 +0100
> > +++ linux-5.0/drivers/hwmon/occ/common.c	2019-04-10 11:44:53.035573580 +0200
> > @@ -1,11 +1,13 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  
> >  #include <linux/device.h>
> > +#include <linux/export.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/hwmon-sysfs.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/kernel.h>
> >  #include <linux/math64.h>
> > +#include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/sysfs.h>
> >  #include <asm/unaligned.h>
> > @@ -1096,3 +1098,8 @@ int occ_setup(struct occ *occ, const cha
> >  
> >  	return rc;
> >  }
> > +EXPORT_SYMBOL_GPL(occ_setup);
> > +
> > +MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
> > +MODULE_DESCRIPTION("Common OCC hwmon code");
> > +MODULE_LICENSE("GPL");
> > --- linux-5.0.orig/drivers/hwmon/occ/sysfs.c	2019-03-04 00:21:29.000000000 +0100
> > +++ linux-5.0/drivers/hwmon/occ/sysfs.c	2019-04-10 11:39:38.627003382 +0200
> > @@ -12,6 +12,7 @@
> >  
> >  #include <linux/bitops.h>
> >  #include <linux/device.h>
> > +#include <linux/export.h>
> >  #include <linux/hwmon-sysfs.h>
> >  #include <linux/kernel.h>
> >  #include <linux/sysfs.h>
> > @@ -186,3 +187,4 @@ void occ_shutdown(struct occ *occ)
> >  {
> >  	sysfs_remove_group(&occ->bus_dev->kobj, &occ_sysfs);
> >  }
> > +EXPORT_SYMBOL_GPL(occ_shutdown);
> > 
> > 
> > -- 
> > Jean Delvare
> > SUSE L3 Support
