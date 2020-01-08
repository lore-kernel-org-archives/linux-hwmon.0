Return-Path: <SRS0=XJeT=25=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45CFC282DD
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jan 2020 16:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A43842070E
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jan 2020 16:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iidq6aVw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbgAHQrv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:47:51 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37717 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727606AbgAHQrv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jan 2020 11:47:51 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so1328118pjb.2;
        Wed, 08 Jan 2020 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I/iJML5ATipLJpCzFxPDsc2+WpGDDa+OYyCfapgnpuk=;
        b=Iidq6aVwz8nS3WShTOFkInEwzt6ganUQzttY4cRX8NLY3fbqRkJFWuKygnu6aQMgbr
         AzqEEOlqEBAmguR6s1PgYfq5EoWuICf4Mjb4CtVmMfLM/QAqH1CVPGp4RmZnax3WgMWq
         oqk/pPKaWC7HyrU79A/904ELMmoRdH6uPNxeh7HeKEtrZx6SFbYLA0+X2k6W+9DwSjVZ
         /4/BvFD2zYCcA8UE+AzmHZVafUvZZ5QJYlK8lojIDd5TIMnGBZX1dCFIHURiaRBg2m7P
         SOkpNGQWjtgpL8O6S4wm0S6HsUrHZmPMd9YI6NWl+jb2itqUcqiJC2E4aNPh1Z+iOLPt
         e8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=I/iJML5ATipLJpCzFxPDsc2+WpGDDa+OYyCfapgnpuk=;
        b=GVfVOqnCYAdVGAn1hnLmx1sgEYQd1Ig95OzNHIi6koyKS4Olw/0o6Q6CmjZHbHDO7H
         hsmTacr/4R672E0LAbG2AZvwhtzWKKPYU3lVhrjuZixExFr1ut9Bb/g4QVqCdG/ktcvZ
         TM09YxXZxVhgLyzBFMwlsj1HFsCLPh0oLyP6A88bOZQztZXmYpt3Pn1OzJtaAblZczFN
         +8qcyaVNsBiJD//plN/CMA8H9WgZwCOwDRl/6SrPI50C4SJ0g8/mYoqaervgQzROHQMY
         G2AE/Q4dIQNDGJVI199xqfEwbm/KsA/LsZVrYqueZUd9iJtFEEDYm9omatFq2w0zAIKx
         jk1A==
X-Gm-Message-State: APjAAAVlCT4+oljdB8+hq6qzS6IQUrXhMelk0mIPmFIHoLYtbfCvxtCK
        bnN7Q+cgOeOIOVVpRtTbZck=
X-Google-Smtp-Source: APXvYqzzGkEEGsLXeTYKJAJ/+KdmWL93yCDNsIM2ps556QxDnnfkgD5wsj3MJEiMTtTQn+YNXO0p0g==
X-Received: by 2002:a17:902:9b86:: with SMTP id y6mr5803846plp.253.1578502070224;
        Wed, 08 Jan 2020 08:47:50 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z26sm3838266pgu.80.2020.01.08.08.47.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 08:47:49 -0800 (PST)
Date:   Wed, 8 Jan 2020 08:47:48 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>
Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Message-ID: <20200108164748.GD28993@roeck-us.net>
References: <a30e4f98-65a4-f93c-371e-7691aace41f7@roeck-us.net>
 <AM6PR05MB52245C747A0EB1691C3EBFBFA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
 <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200106210104.GA9219@roeck-us.net>
 <AM6PR05MB52247DB7AB2677F5F36BAAE9A23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a76015b5-74e3-5f84-dfce-f5cce34c302a@roeck-us.net>
 <AM6PR05MB5224ED5368BD037051F5BF92A23F0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <5be3c6c4-81e8-7731-2b6e-39b7ad6531d5@roeck-us.net>
 <AM6PR05MB5224C166E608C3BBD09E4606A23E0@AM6PR05MB5224.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR05MB5224C166E608C3BBD09E4606A23E0@AM6PR05MB5224.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 08, 2020 at 02:10:50PM +0000, Vadim Pasternak wrote:
> 
> Hi Guenter,
> 
> We are looking for possibility to provide some kind of flexible driver to handle
> different devices from different vendors, but which have common nature,
> like support of two pages for telemetry with same set of functions and same
> formats. (Actually driver could be flexible regarding the number of pages).
> 
> While the difference only in VID codes mapping.
> 
> The motivation for that is to give free hand to HW design to choose which
> particular device to use on the same system type.
> There are two main reasons for such requirement:
> - Quality of device (we already had a serios problems with ucd9224 and
>   tps53679, caused system meltdown). In such case the intention is to move
>   to fallback devices in the next batches.
> - Device availability in stock. Sometimes vendors can't supply in time the
>    necessary quantity.
> 
> Currently there are the devices from three vendor: TI tps536xx, Infineon
> xdpe122 and MPS mp2975.
> All have different mapping of VID codes.
> 
> It could be also few additional devices, which are supposed to be used as
> fallback devices.
> 
> We have several very big customers ordering now huge quantity of our
> systems, which are very conservative regarding image upgrade.
> Means we can provide now support for tps536xx, xdpe122xx and mp2975
> but in case new devices are coming soon, we will be able to support it in kernel
> for their image after year or even more.
> 
> We can provide ACPI pmbus driver, which will read VID mapping from ACPI
> DSDT table. This mapping table will contain the names of available modes
> and specific vendor code for this mode. Like:
> PMBVR11=1
> PMBVR12=2
> PMBVR13=5
> PMBIMVP9=10
> And driver will set info->vrm_version[i] according to this mapping.
> 

The DSDT would have to provide all properties, not just the VID modes.
At the very least that would have to be the number of pages, data formats,
vrm version, and the supported attributes per page. It should be possible
to also add m/b/R information for each of the sensor classes, but I guess
the actual implementation could be postponed until it is needed.

This could all be done through the existing generic driver (pmbus.c);
it would not really require a new driver. ACPI/DSDT could provide firmware
properties, and pmbus.c could read those using device_property API
functions (eg device_property_read_u32(dev, "vrm-mode")). Would that work
for you ?

Thanks,
Guenter
