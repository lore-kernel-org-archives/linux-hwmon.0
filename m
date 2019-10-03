Return-Path: <SRS0=ibG4=X4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564D1C10F14
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 20:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23A45207FF
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 20:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3Ggnd6t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbfJCUeB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Oct 2019 16:34:01 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34257 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbfJCUeB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Oct 2019 16:34:01 -0400
Received: by mail-pf1-f196.google.com with SMTP id b128so2498904pfa.1
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Oct 2019 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6dKZHglxvsu4Bidy/jSl4Kh9DhLwbxo7LDpq+/vXXec=;
        b=h3Ggnd6tXg3h6f1Hj40TBHKZdQWsMcjr+GbR/p1q8cqnI8rPMOknVAdVX8U5G6TT4E
         xoOa7VvdzSsEbw8wGKST6PXWDmOcKGojkyAqmueecKDAyTY96mvqjySVardRvWx0cLLl
         V/U9gtJPH8d8PdJSlOUExobgBrOH7TUJgLwpXNYuyt1nlr25jwIK+sYLxUO3qXUNmwYK
         iY2QT18z316z4dLJ5mDIkLWqyUBhyY25ER2Mc8KZPsX/2pPQjC1OWKOWDluiykmPH4Eo
         Cb8s+nhaIUfrxxd5tqjUADr/y8C+VqQmtfNkd+4ACvnA2ibNUy72VQpow3KY9HfUss4J
         VCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6dKZHglxvsu4Bidy/jSl4Kh9DhLwbxo7LDpq+/vXXec=;
        b=HdRE3AcNZq2rlGVREDEKEzCFjEiVtNPMLIBXoY3PAJ3v63E1mI1awmAd1BJMN6cgGG
         P17yYFr3Tr/Cqd9Vlg9/8ZBbDhXQoQxh+AWNW6/YDzJ0A/dGxeGWRGyQLnujYFJjGwb4
         NFaeZLG4JVKvltZWX/OYwsZYowgw81fKfZk8wiMjlaNfTZpOhhtNKlsomDWdRiBJEkL5
         NJ+YhSvhIn1/Tx2LrJXE2j9TfYB3aymljJ3rNCdvDJSCqL1rfZkp80qyUpCicQH23Jff
         uGlfPf2c54UdYCw3lG/n11FV1MSLl47tNatA+SKP06jYJcyQXSp3/61To63MZHInU4u+
         gYvg==
X-Gm-Message-State: APjAAAV3GZ2gCE927qes75wFMTA+MBGX7GpMp62d0u88xicBPNUmpJJn
        1pTAroWWBV80AweDzNzI75E=
X-Google-Smtp-Source: APXvYqwrLQD0nid2DEX7rdMfNZEabp97+EhUVmrVdgJ8xFV5BL1kIoUljqBqKj4F2N5PIVJ3/5YT2Q==
X-Received: by 2002:a63:705b:: with SMTP id a27mr11335961pgn.136.1570134840876;
        Thu, 03 Oct 2019 13:34:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q2sm4618684pfg.144.2019.10.03.13.33.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 13:34:00 -0700 (PDT)
Date:   Thu, 3 Oct 2019 13:33:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191003203358.GA16786@roeck-us.net>
References: <BL0PR01MB48359D174C7CE498D7367B42959F0@BL0PR01MB4835.prod.exchangelabs.com>
 <BL0PR01MB48354C0BF0D094921233611A959F0@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB48354C0BF0D094921233611A959F0@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 03, 2019 at 06:35:51PM +0000, Tremblay, Eric wrote:
> > Version three of the driver for Texas Instruments TMP512/513 sensors.
> > 
> > Thanks again for the review, I think we are getting close. I'm not in an easy position for now to test the driver without device tree. I
> > can put the required effort to
> 
> Sorry, I mean that I'm not in a good position to test it, but I can put the required effort to if needed.

All you would need to do is to use device_ API functions instead of
of_device_ API functions, so I can not entirely follow your logic.

Guenter

> > 
> > Main changes from version 2:
> > 	- Remove the neccessity to provide a shunt-resistor value
> > 	- Remove max-expected-current-ma configuration and always
> > 	  use max possible current for calibration
> > 	- Make sure calculation during calibration can't overflow
> > 	- Add value clamping for DT value and runtime parameters
> > 	- Support non DT system
> > 	- Move hysteresis from DT to standard attribute
> > 
> > Main changes from version 1:
> > 	- Use the with_info API instead of sysfs attributes.
> > 	- Remove non-standard attributes and raw value.
> > 	- Move settings that were non-standard attributes to
> > 	  device tree, update documentation as well.
> > 	- Fix coding style issues
> > 
> > Eric Tremblay (2):
> >   Add driver for Texas Instruments TMP512/513 sensor chips.
> >   Add DT bindings for TMP513 driver
> > 
> >  .../devicetree/bindings/hwmon/tmp513.txt      |  33 +
> >  Documentation/hwmon/tmp513.rst                | 102 ++
> >  MAINTAINERS                                   |   7 +
> >  drivers/hwmon/Kconfig                         |  10 +
> >  drivers/hwmon/Makefile                        |   1 +
> >  drivers/hwmon/tmp513.c                        | 901 ++++++++++++++++++
> >  include/linux/platform_data/tmp513.h          |  28 +
> >  7 files changed, 1082 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
> >  create mode 100644 Documentation/hwmon/tmp513.rst  create mode 100644 drivers/hwmon/tmp513.c  create mode 100644
> > include/linux/platform_data/tmp513.h
> > 
> > --
> > 2.17.1
> 
