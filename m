Return-Path: <SRS0=Ro9r=3C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5BAC33CA9
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 20:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 102A32187F
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 20:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/HEujJ5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgAMU4R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jan 2020 15:56:17 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40468 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbgAMU4R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jan 2020 15:56:17 -0500
Received: by mail-pj1-f68.google.com with SMTP id bg7so4804836pjb.5;
        Mon, 13 Jan 2020 12:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qV5TDyFKNI2zN/NdXqAq0zZmtP9faiRwm9x6yaHxwlU=;
        b=H/HEujJ5WtH2WWuNL2bJfQt9Pgh6rHxRE8EE5+qcTjy4CVwvSMmbIiAkQmILjMSN3S
         yKnhe2RgDzJJWUycMBssCqyDIOMq615WRCvJsUzyL0xfGm+8acBmuVLoe9+0R0izChjk
         Auc+4qf9vB0l3kgZpKOo5BI+88YLNu/yytUeWexkT8HY0qWe/BwnxKvUt0wEjtKBHKiT
         gY+l+cYXxmplbLq5fhjg1nSbC7nDYnaQpsujd0+fUeLeLuvAiZvwymNZ8CF2ZbxE+2Zw
         Sex7K1DjLe9Befzy7g+bzEUDfbXjGK1TygTXr2bbPkM3PwEkcQCECxq7twmCFR0xoGEP
         pm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qV5TDyFKNI2zN/NdXqAq0zZmtP9faiRwm9x6yaHxwlU=;
        b=jPI430ttKLYat2fFkaTUu0IO97Fnizg9ft8LoAYUdjApcsnRClvtq3dfubh3KbEfDb
         NHeOipB89Jh3hqTuFy1mckmeAk7rXaQ0A7IXYLCGS3vqNOTzOBUvsq8XF7+Opcz9ljoj
         t+/dHG8nqlRfU9Zx1kIivQrKNW/v68COEiKKqcgzpra0wH7ELcuf6pOBtOUM3YEMKWHG
         orQ82Y4anBGSXDj7VXfr3chDpQD/wj4rUv5ZBHecL7LIAXbCughkeSKBdKShPSFljZ23
         ia6XpXUf9jv6TU33uCeONvW3kWhTJCWa7+/yGs+LKsr7N9Q+Ku/2NhDlhqhru6P08leJ
         PKbQ==
X-Gm-Message-State: APjAAAXPn1dR3Fjdwei3Jm7JU3CI/BKWlGsEWFIVz0JQ7JQd+S3hG65h
        aBzspeuWECGiCAFmg7GMXD8=
X-Google-Smtp-Source: APXvYqx0DgEo55wguzYPd3WtYvB+kCzDmPzFefjGM54twdUm/jJnEbCu/SiahWY30jzN8SeUQFPi3A==
X-Received: by 2002:a17:902:bb83:: with SMTP id m3mr16246851pls.258.1578948976472;
        Mon, 13 Jan 2020 12:56:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j2sm15073585pfi.22.2020.01.13.12.56.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 12:56:15 -0800 (PST)
Date:   Mon, 13 Jan 2020 12:56:14 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>,
        Ofer Levy <oferl@mellanox.com>
Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Message-ID: <20200113205614.GA24228@roeck-us.net>
References: <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
 <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200106210104.GA9219@roeck-us.net>
 <AM6PR05MB52247DB7AB2677F5F36BAAE9A23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a76015b5-74e3-5f84-dfce-f5cce34c302a@roeck-us.net>
 <AM6PR05MB5224ED5368BD037051F5BF92A23F0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <5be3c6c4-81e8-7731-2b6e-39b7ad6531d5@roeck-us.net>
 <AM6PR05MB5224C166E608C3BBD09E4606A23E0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200108164748.GD28993@roeck-us.net>
 <AM6PR05MB5224026B612B674681E81DF9A2350@AM6PR05MB5224.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR05MB5224026B612B674681E81DF9A2350@AM6PR05MB5224.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Vadim,

On Mon, Jan 13, 2020 at 12:25:44PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: Wednesday, January 08, 2020 6:48 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: robh+dt@kernel.org; vijaykhemka@fb.com; linux-hwmon@vger.kernel.org;
> > devicetree@vger.kernel.org; Michael Shych <michaelsh@mellanox.com>
> > Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
> > device list supported by driver
> > 
> > On Wed, Jan 08, 2020 at 02:10:50PM +0000, Vadim Pasternak wrote:
> > >
> > > Hi Guenter,
> > >
> > > We are looking for possibility to provide some kind of flexible driver
> > > to handle different devices from different vendors, but which have
> > > common nature, like support of two pages for telemetry with same set
> > > of functions and same formats. (Actually driver could be flexible regarding the
> > number of pages).
> > >
> > > While the difference only in VID codes mapping.
> > >
> > > The motivation for that is to give free hand to HW design to choose
> > > which particular device to use on the same system type.
> > > There are two main reasons for such requirement:
> > > - Quality of device (we already had a serios problems with ucd9224 and
> > >   tps53679, caused system meltdown). In such case the intention is to move
> > >   to fallback devices in the next batches.
> > > - Device availability in stock. Sometimes vendors can't supply in time the
> > >    necessary quantity.
> > >
> > > Currently there are the devices from three vendor: TI tps536xx,
> > > Infineon
> > > xdpe122 and MPS mp2975.
> > > All have different mapping of VID codes.
> > >
> > > It could be also few additional devices, which are supposed to be used
> > > as fallback devices.
> > >
> > > We have several very big customers ordering now huge quantity of our
> > > systems, which are very conservative regarding image upgrade.
> > > Means we can provide now support for tps536xx, xdpe122xx and mp2975
> > > but in case new devices are coming soon, we will be able to support it
> > > in kernel for their image after year or even more.
> > >
> > > We can provide ACPI pmbus driver, which will read VID mapping from
> > > ACPI DSDT table. This mapping table will contain the names of
> > > available modes and specific vendor code for this mode. Like:
> > > PMBVR11=1
> > > PMBVR12=2
> > > PMBVR13=5
> > > PMBIMVP9=10
> > > And driver will set info->vrm_version[i] according to this mapping.
> > >
> > 
> > The DSDT would have to provide all properties, not just the VID modes.
> > At the very least that would have to be the number of pages, data formats, vrm
> > version, and the supported attributes per page. It should be possible to also add
> > m/b/R information for each of the sensor classes, but I guess the actual
> > implementation could be postponed until it is needed.
> > 
> > This could all be done through the existing generic driver (pmbus.c); it would not
> > really require a new driver. ACPI/DSDT could provide firmware properties, and
> > pmbus.c could read those using device_property API functions (eg
> > device_property_read_u32(dev, "vrm-mode")). Would that work for you ?
> 
> Hi Guenter,
> 
> We thought that it's possible to provide just modified DSDT with the specific
> configuration as an external table, which is loaded during system boot.
> 
> It should not be integrated into BIOS image.
> We want to avoid releasing of new BIOS or new each time system configuration
> is changed.
> New BIOS is released only when new CPU type should be supported.
> Also BIOS overwriting is not an option, sine we have to support secured BIOS.
> 
> It should not be located in initrd.
> The new system batch is released with BIOS, SMBIOS and with customer's OS or
> with install environment like ONIE.
> Means no kernel changes.
> Also not all our customers use initrd.
>  
> So, it seems there is no place, when we can locate modified DSDT and load
> it dynamically.
> But we should think more about possible methods for doing it.
> 
> Today all the static devices are instantiated  from the user space.
> It's supposed to work for us while we have to support some pre-defined set of
> devices, for which we can detect the specific configuration through DMI tables
> (SKU in particular).
> But it'll not work for some new coming devices.
> 
> We have a possibility to provide VID mapping info through CPLD device.
> But in this case we'll have to implement Mellanox specific PMBus driver aware
> of CPLD register map.
> Not sure if such approach is accepted?
> 

How about a platform driver which loads the parameters into device
properties from whatever location and instantiates the pmbus driver ?
The PMBus driver would then read the device attributes and instantiate
itself accordingly.

If the other PMBus attributes can be auto-detected, it might actually be
sufficient to have a per-page vrm-mode property and otherwise use the
auto-detect mechanism of pmbus.c.

Thanks,
Guenter
