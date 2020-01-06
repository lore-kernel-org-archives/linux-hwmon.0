Return-Path: <SRS0=XbaA=23=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4881EC33C8C
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jan 2020 21:01:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E2AB21744
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jan 2020 21:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXyH2+Vc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgAFVBI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jan 2020 16:01:08 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35509 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgAFVBI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jan 2020 16:01:08 -0500
Received: by mail-pf1-f196.google.com with SMTP id i23so22076282pfo.2;
        Mon, 06 Jan 2020 13:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=byKECdttaHh4YI/ZR2UsF+RBJYKPhjUpegA9dVQuUA4=;
        b=hXyH2+VcGT0sjCDmXSZQRvu/mZi5xAx52vBOfhyY+0MAPqT/23SddhfJ+iontucYl6
         +LDfBU5G6ngSsUx9jhbX+GlyLsZid8izTC1u22+PRRluhOcba8xGKIfFChMI6Qo+ThzJ
         7hkTxhyVuELAQww0xZ1+we9MJHlL22I+BiEb9zRjrmb8Bh32L5+lvQjrDeZsIxeQohSl
         RgX1ZKfp/n0KEgSikHJltkOjiy0njiSIk222/6/ch6+9anx9SoeXVXYjhyJ7Ym9rzhqo
         n7bdmXR6dpv/9KYgZH7hn9WP1eFEuwC8/JY1aj8vdhXnPsetnAP2n3Q2PrYys0XwmlMw
         P75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=byKECdttaHh4YI/ZR2UsF+RBJYKPhjUpegA9dVQuUA4=;
        b=AetNJuIVhaoYB4f0BnKCzaBlshv8TbR+wwM38jV7FL3YqkuNXPYxulbF+mzPvUtrJ9
         LZMfshpVqVAuHfsPTDjjcqiKPDvskO1QvZiFSiWNsp/k/LC2+mF9mSqBizN0pUpzyIfD
         m6UnSCyRHI+qgfxal0YWFffpGaqtQkQ7LWGS9Bp5ZaQkaSfwhwi1B3afsSOefv3Jtmz1
         mbyEWE2zQ7P8TCSk5te3/c3qc2HVxyWb8z+sr8UDdNUnLGI5XmRIj/HRCREb3Ip48ZgP
         qPSv87J1ppyOkKOfHypDR4d4dPGt61xT2a0BVv+6KVtn/53m+b2BgyETMkoUI2bxvEZn
         6EtQ==
X-Gm-Message-State: APjAAAV8hUD7D2NmecvU8yFSU2/OGxJbOo7FHZboXxXtHwh9fKXbshkQ
        V+RGwEnX+nym2a6vDSNrMwA=
X-Google-Smtp-Source: APXvYqw4KHzjKpCtMX8Xu5gzub6KpwTMKc5lWwubjAHKKvfDYqCQ4ox6+hJAZhd4TdoWYv9y+P4W4g==
X-Received: by 2002:a63:1322:: with SMTP id i34mr115094463pgl.163.1578344467504;
        Mon, 06 Jan 2020 13:01:07 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s20sm25315095pjn.2.2020.01.06.13.01.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 13:01:05 -0800 (PST)
Date:   Mon, 6 Jan 2020 13:01:04 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Message-ID: <20200106210104.GA9219@roeck-us.net>
References: <20200105105833.30196-1-vadimp@mellanox.com>
 <20200105105833.30196-6-vadimp@mellanox.com>
 <567ebd26-529e-6b2a-2f07-cfaf0f2217a9@roeck-us.net>
 <AM6PR05MB5224F444CBAC5A0503AFBB83A23D0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a30e4f98-65a4-f93c-371e-7691aace41f7@roeck-us.net>
 <AM6PR05MB52245C747A0EB1691C3EBFBFA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
 <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 06, 2020 at 04:57:32PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: Monday, January 06, 2020 4:53 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
> > vijaykhemka@fb.com
> > Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
> > device list supported by driver
> > 
> > On 1/6/20 4:16 AM, Vadim Pasternak wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > >> Sent: Sunday, January 05, 2020 8:35 PM
> > >> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
> > >> vijaykhemka@fb.com
> > >> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
> > >> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679)
> > >> Extend device list supported by driver
> > >>
> > >> On 1/5/20 8:44 AM, Vadim Pasternak wrote:
> > >>>
> > >>>
> > >>>> -----Original Message-----
> > >>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > >>>> Sent: Sunday, January 05, 2020 6:04 PM
> > >>>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
> > >>>> vijaykhemka@fb.com
> > >>>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
> > >>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679)
> > >>>> Extend device list supported by driver
> > >>>>
> > >>>> On 1/5/20 2:58 AM, Vadim Pasternak wrote:
> > >>>>> Extends driver with support of the additional devices:
> > >>>>> Texas Instruments Dual channel DCAP+ multiphase controllers:
> > >>>>> TPS53688, SN1906016.
> > >>>>> Infineon Multi-phase Digital VR Controller Sierra devices
> > >>>>> XDPE12286C, XDPE12284C, XDPE12283C, XDPE12254C and XDPE12250C.
> > >>>>>
> > >>>>> Extend Kconfig with added devices.
> > >>>>>
> > >>>>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > >>>>> ---
> > >>>>>     drivers/hwmon/pmbus/Kconfig    |  5 +++--
> > >>>>>     drivers/hwmon/pmbus/tps53679.c | 14 ++++++++++++++
> > >>>>>     2 files changed, 17 insertions(+), 2 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/hwmon/pmbus/Kconfig
> > >>>>> b/drivers/hwmon/pmbus/Kconfig index 59859979571d..9e3d197d5322
> > >>>>> 100644
> > >>>>> --- a/drivers/hwmon/pmbus/Kconfig
> > >>>>> +++ b/drivers/hwmon/pmbus/Kconfig
> > >>>>> @@ -200,10 +200,11 @@ config SENSORS_TPS40422
> > >>>>>     	  be called tps40422.
> > >>>>>
> > >>>>>     config SENSORS_TPS53679
> > >>>>> -	tristate "TI TPS53679"
> > >>>>> +	tristate "TI TPS53679, TPS53688, SN1906016, Infineon XDPE122xxx
> > >>>> family"
> > >>>>>     	help
> > >>>>>     	  If you say yes here you get hardware monitoring support for TI
> > >>>>> -	  TPS53679.
> > >>>>> +	  TPS53679, PS53688, SN1906016 and Infineon XDPE12286C,
> > >>>> XDPE12284C,
> > >>>>
> > >>>> TPS53688. For the others, for some I can't even determine if they
> > >>>> exist in the first place (eg SN1906016, XPDE12250C) or how they
> > >>>> would differ from other variants (eg XPDE12284C vs. XPDE12284A).
> > >>>> And why would they all use the same bit map in the VOUT_MODE
> > >>>> register, the same number of PMBus pages (phases), and the same
> > >>>> attributes
> > >> in each page ?
> > >>>
> > >>> Hi Guenter,
> > >>>
> > >>> Thank you for reply.
> > >>>
> > >>> On our new system we have device XPDE12284C equipped.
> > >>> I tested this device.
> > >>>
> > >> Sounds good, but did you also make sure that all chips have the same
> > >> number of pages (phases), the same set of commands as the TI chip,
> > >> and support the same bit settings in VOUT_MODE ? It seems a bit
> > >> unlikely that TI's register definitions would make it into an Infineon chip.
> > >>
> > >> Also, what about the SN1906016 ? I don't find that anywhere, except
> > >> in one place where it is listed as MCU from TI.
> > >
> > > I'll drop SN1906016.
> > > Datasheet has a title Dual channel DCAP+ multiphase controllers:
> > > TPS53688, SN1906016.
> > > But maybe it's some custom device (anyway I'll try to check it with TI).
> > >
> > 
> > Or maybe SN1906016 means something else. Unless we have explicit
> > confirmation that the chip exists (or will exist) we should not add it to the list.
> > 
> > >>
> > >>> Infineon datasheet refers all these device as XDPE122xxC family and
> > >>> it doesn't specify any differences in register map between these devices.
> > >>
> > >> That is a bit vague, especially when it includes devices which return
> > >> zero results with Google searches.
> > >>
> > >> "A" vs. "C" may distinguish automotive vs. commercial; the "A" device
> > >> is listed under automotive. If the command set is the same, I don't
> > >> really want the "c" in the id.
> > >
> > > Got feedback from Infineon guys.
> > > No need 'C' at the end, as you wrote.
> > > All XDPE12250, XDPE12254, XDPE12283, XDPE12284, XDPE12286 are treated
> > > in the same way:
> > > same pages, same VOUT_MODE, VOUT_READ, etcetera.
> > >
> > 
> > And same as TI, including VOUT_MODE ? Also, did they confirm that the
> > unpublished chips do or will actually exist ?
> 
> Hi Gunther,
> 
> According to the input I got from Infineon guys, these device are already
> available for the customers, like XPDE12284, which is equipped on new
> Mellanox 400Gx32 Ethernet system, on which we are working now.
> 
> But I'll re-check if all these devices are available today to be on the safe
> Side.
> 
> Regarding VOUT modes:
> TPS53679 uses modes - 0x01, 0x02, 0x04, 0x05, 0x07
> TPS53688 uses modes - 0x04, 0x07
> XDPE122xxx uses modes - 0x01, 0x02, 0x03 and additionally 0x10, which is
> for 6.25mV VID table (AMD application).
> 

The problem is that PMBus does not define VID mode values. If it did, we
could add vrm version detection detection to the pmbus core. 0x01 for
TPS53679 _may_ be the same as 0x01 for XDPE122xxx, or maybe not.
There is no way to be sure without datasheets.

> I didn't add support for mode 0x10 in the patch.
> 
> The VID table for the AMD application is different from the
> Intel VID tables.
> 
> A value of 0x0 corresponds to the highest output voltage of 1.55V.
> The voltage is reduced in 6.25mV steps down to the value 0xd8,
> which corresponds to 0.2V.
> 
> The formula for the calculation of the output voltage would be:
> 
> 	case DON’T_NOW_HOW_TO_CALL_IT:

Doesn't the datasheet have something to say ?

> 		if (val >= 0x00 && val <= 0xd8)
>               			rv = 1550 – (val *6.25);
> 
> I doubled check it.
> 
> Do you think it should added as well?
> 
I am quite neutral on that. I am much more concerned with the assumption
that the mode values have the same meaning for chips from different
vendors. In this case, what do we do if TI starts shipping a chip
in the TPS53xxx series which uses mode 0x10 for something else ?

Overall I'd rather play safe and add a separate driver for the
Infineon chips.

Thanks,
Guenter
