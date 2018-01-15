Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45276 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932393AbeAOPYc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Jan 2018 10:24:32 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w0FFO97g133880
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jan 2018 10:24:31 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2fgvs6pc34-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jan 2018 10:24:31 -0500
Received: from localhost
        by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 15 Jan 2018 10:24:30 -0500
Subject: Re: [PATCH] hwmon: pmbus: ibm-cffps depends on LEDS_CLASS
To: Guenter Roeck <linux@roeck-us.net>
References: <ca65ed8a-ac10-641a-a8fc-e042178b7451@linux.vnet.ibm.com>
Cc: arnd@arndb.de, jdelvare@suse.com, sam@mendozajonas.com,
        Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 15 Jan 2018 09:24:25 -0600
MIME-Version: 1.0
In-Reply-To: <ca65ed8a-ac10-641a-a8fc-e042178b7451@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Message-Id: <6b9d8164-a2cf-8449-ad97-6331494d8427@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


On Fri, Jan 12, 2018 at 06:19:00PM +0100, Guenter Roeck wrote:
> On Fri, Jan 12, 2018 at 04:49:00PM +0100, Arnd Bergmann wrote:
> > Building without CONFIG_LEDS_CLASS causes a link failure:
> >
> > drivers/hwmon/pmbus/ibm-cffps.o: In function `ibm_cffps_probe':
> > ibm-cffps.c:(.text+0x4f4): undefined reference to 
> `devm_of_led_classdev_register'
> >
> > This adds the required dependency.
> >
> > Fixes: f69316d62c70 ("hwmon: (pmbus) Add IBM Common Form Factor 
> (CFF) power supply driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I wanted to let Edward decide if he wants the new dependency or 
> conditional code
> in the driver. Not having heard from him, I'll take your patch instead 
> for now.

Thanks, yes this is a good solution for this driver. Didn't think about 
that during testing... Thanks Arnd.

Eddie

>
> Thanks,
> Guenter
>
> > ---
> >  drivers/hwmon/pmbus/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index 08479006c7f9..6e4298e99222 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -39,6 +39,7 @@ config SENSORS_ADM1275
> >
> >  config SENSORS_IBM_CFFPS
> >   tristate "IBM Common Form Factor Power Supply"
> > + depends on LEDS_CLASS
> >   help
> >    If you say yes here you get hardware monitoring support for the IBM
> >    Common Form Factor power supply.
> > --
> > 2.9.0
> >
>

