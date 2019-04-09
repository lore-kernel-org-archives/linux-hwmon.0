Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D338C10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 16:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D225A2084F
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 16:30:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXjw70Da"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfDIQaG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 12:30:06 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33724 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfDIQaG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Apr 2019 12:30:06 -0400
Received: by mail-pg1-f194.google.com with SMTP id k19so9613745pgh.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Apr 2019 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mJsN/SMFXQHfem9NAo5vFCAwn6gOauYfHEWTaDfmqSQ=;
        b=RXjw70Dakdag3kjkM4dlgIAVg+hxP1ZfrZlWeqMo/hi622zVzu8BtFJS70ATdwJvCL
         c2wpmF3Av8gfiYD8r0WNeNOa2vOyH1EdVmuInSNQKheHEQZvd+912PMKU2N2FyfppEVE
         i/0cITRo7pK2yxeSyp2XJML7lksmIdwmScM2dhd8KLzNaehm39MuIVV9B6H6D6pXBP6P
         +9udhXb7zLMW0o9wijfEQXypahwinUnhLBUosEH34/ycc1pOpKy3TrCq14r/RvhKT9X/
         ns7jh1S7GASYjwzzMWeRmvOaO+TVzVle4kj0SCIhJunJ2txVK4A4E3ShyAS58TCqbTbS
         cVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=mJsN/SMFXQHfem9NAo5vFCAwn6gOauYfHEWTaDfmqSQ=;
        b=i27raxAdpMvCavdWAYDtdGJHs++7l2JvVsxNP5DeOc5HeOkNt3jaK/ElNlQec4UxpH
         7Mse1+O9Cmhg7JxPgZ9KmUeEc4PJ0THts53ubGoYaKMt9FfyS468EXE4BoH7VAAd5bt5
         jIg0Da+f+BGVTx+5d0ji2NYdn+Oab4HNgskiNtAOtStQnGemRfKtn3SaYghDBJhn2ghh
         /pxcUeMrhpUsYw8QfccpPfb4n8AKMHhGdhAer84/+6NJZ5KdiS86QvNWoC6MIB/kqibJ
         T4M5t4zggBzKBao+WMSJIrZyvTOqZt0jpk4YL5as1pvSohfwwLRLKR0QoSUgJmrobOyJ
         H+sw==
X-Gm-Message-State: APjAAAVyQq8GgU2Rixcg68X0m+mq4AcjwjLXqzU9jPgeZ0fQKoB3k1f6
        IT3qmPZkWk+m1GhAUtFMdWA=
X-Google-Smtp-Source: APXvYqyWuMsNt8Qk9suQ8zfSaRR+W5POgTF5t6xEDDbHR+NkktU2/FvvAvDgNF6Ij5IsGlWBICCFRg==
X-Received: by 2002:a63:4a5a:: with SMTP id j26mr35608364pgl.361.1554827405127;
        Tue, 09 Apr 2019 09:30:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a85sm26176303pfa.166.2019.04.09.09.30.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 09:30:03 -0700 (PDT)
Date:   Tue, 9 Apr 2019 09:30:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eddie James <eajames@linux.vnet.ibm.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
        Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH] hwmon: OCC drivers are PowerPC-only
Message-ID: <20190409163002.GA432@roeck-us.net>
References: <20190409144509.19da00c4@endymion>
 <a07ecf9c-2ad2-70f6-0f2f-1c438be3acdc@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a07ecf9c-2ad2-70f6-0f2f-1c438be3acdc@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 09, 2019 at 10:20:22AM -0500, Eddie James wrote:
> 
> On 4/9/19 7:45 AM, Jean Delvare wrote:
> >Don't propose PowerPC-only drivers on other architectures, unless
> >build-testing.
> 
> 
> This driver does NOT only run on PowerPC; rather it runs on a BMC processor
> connected to a PowerPC processor. BMC will most likely be ARM, but shouldn't
> be restricted to that arch only.
> 
> 
> >
> >Also drop configuration symbol SENSORS_OCC which serves no purpose
> >that I can see.
> >
> >Signed-off-by: Jean Delvare <jdelvare@suse.de>
> >Cc: Eddie James <eajames@linux.ibm.com>
> >Cc: Guenter Roeck <linux@roeck-us.net>
> >---
> >SENSORS_OCC *would* serve a purpose if the common code between the
> >POWER8 driver and the POWER9 driver would go in a separate, shared
> >module, and occ-p8-hwmon and occ-p9-hwmon would only contain the
> >specific code. This would avoid packaging the same code twice in 2
> >separate modules, therefore saving some storage space for ppc
> >distributions.
> 
> 
> Well you'd never have both P8 and P9 enabled at once, so space shouldn't be
> an issue. I agree this could be cleaner but I think I was getting duplicate
> symbol errors for the compile test and so I did it this way. If this doesn't
> lead to errors in the compile test, I'm fine with this (without the change
> for PPC only though).
>

Any common code would have to be in a separate module to avoid duplicate
symbols. You'd bundle common.c and sysfs.c into one module and export
the functions called from p8/p9 specific code.

Something like

occ-common-objs := common.o sysfs.o

obj-$(CONFIG_SENSORS_OCC) += occ-common.o
obj-$(CONFIG_SENSORS_OCC_P8_I2C) += p8_i2c.o
obj-$(CONFIG_SENSORS_OCC_P9_SBE) += p9-sbe.o

Guenter

> 
> Thanks,
> 
> Eddie
> 
> >
> >As far as I can see, this would simply require exporting 2 functions
> >(occ_setup and occ_shutdown). Is there any reason why things were not
> >done that way in the first place? This would look cleaner to me.
> >
> >  drivers/hwmon/Makefile    |    2 +-
> >  drivers/hwmon/occ/Kconfig |    8 ++------
> >  2 files changed, 3 insertions(+), 7 deletions(-)
> >
> >--- linux-5.0.orig/drivers/hwmon/occ/Kconfig	2019-03-04 00:21:29.000000000 +0100
> >+++ linux-5.0/drivers/hwmon/occ/Kconfig	2019-04-09 14:08:41.316551071 +0200
> >@@ -5,7 +5,7 @@
> >  config SENSORS_OCC_P8_I2C
> >  	tristate "POWER8 OCC through I2C"
> >  	depends on I2C
> >-	select SENSORS_OCC
> >+	depends on POWERPC || COMPILE_TEST
> >  	help
> >  	 This option enables support for monitoring sensors provided by the
> >  	 On-Chip Controller (OCC) on a POWER8 processor. Communications with
> >@@ -17,7 +17,7 @@ config SENSORS_OCC_P8_I2C
> >  config SENSORS_OCC_P9_SBE
> >  	tristate "POWER9 OCC through SBE"
> >  	depends on FSI_OCC
> >-	select SENSORS_OCC
> >+	depends on POWERPC || COMPILE_TEST
> >  	help
> >  	 This option enables support for monitoring sensors provided by the
> >  	 On-Chip Controller (OCC) on a POWER9 processor. Communications with
> >@@ -25,7 +25,3 @@ config SENSORS_OCC_P9_SBE
> >  	 This driver can also be built as a module. If so, the module will be
> >  	 called occ-p9-hwmon.
> >-
> >-config SENSORS_OCC
> >-	bool "POWER On-Chip Controller"
> >-	depends on SENSORS_OCC_P8_I2C || SENSORS_OCC_P9_SBE
> >--- linux-5.0.orig/drivers/hwmon/Makefile	2019-03-04 00:21:29.000000000 +0100
> >+++ linux-5.0/drivers/hwmon/Makefile	2019-04-09 14:33:49.605510047 +0200
> >@@ -178,7 +178,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-h
> >  obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
> >  obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
> >-obj-$(CONFIG_SENSORS_OCC)	+= occ/
> >+obj-y				+= occ/
> >  obj-$(CONFIG_PMBUS)		+= pmbus/
> >  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> >
> >
> 
