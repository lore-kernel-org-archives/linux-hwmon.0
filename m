Return-Path: <SRS0=pmHe=RY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5815DC43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Mar 2019 12:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A0B121874
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Mar 2019 12:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbfCUMAA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Mar 2019 08:00:00 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:33928 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725985AbfCUMAA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Mar 2019 08:00:00 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2LBtCYr020908;
        Thu, 21 Mar 2019 06:59:33 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0a-001ae601.pphosted.com with ESMTP id 2ratnq4jhb-1;
        Thu, 21 Mar 2019 06:59:32 -0500
Received: from EX17.ad.cirrus.com (ex17.ad.cirrus.com [172.20.9.81])
        by mail3.cirrus.com (Postfix) with ESMTP id 4CD16611C8AC;
        Thu, 21 Mar 2019 06:59:53 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Thu, 21 Mar 2019
 11:59:31 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id
 x2LBxUov000692;        Thu, 21 Mar 2019 11:59:30 GMT
Date:   Thu, 21 Mar 2019 11:59:30 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 3/3] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190321115930.GX46536@ediswmail.ad.cirrus.com>
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
 <20190320145818.30644-3-ckeepax@opensource.cirrus.com>
 <20190320164010.GA13650@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190320164010.GA13650@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903210088
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Mar 20, 2019 at 09:40:10AM -0700, Guenter Roeck wrote:
> On Wed, Mar 20, 2019 at 02:58:18PM +0000, Charles Keepax wrote:
> > From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > 
> > Lochnagar is an evaluation and development board for Cirrus
> > Logic Smart CODEC and Amp devices. It allows the connection of
> > most Cirrus Logic devices on mini-cards, as well as allowing
> > connection of various application processor systems to provide a
> > full evaluation platform.
> > 
> > This driver adds support for the hardware monitoring features of
> > the Lochnagar 2 to the hwmon API. Monitoring is provided for
> > the board voltages, currents and temperature supported by the
> > board controller chip.
> > 
> > Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > +#include <linux/of_device.h>
> > +#include <linux/i2c.h>
> > +#include <asm/div64.h>
> > +
> 
> Alphabetic order, please. Also, please include linux/math64.h
> instead of asm/div64.h.
> 
> > +struct lochnagar_hwmon {
> > +	struct lochnagar *lochnagar;
> 
> The only use of this structure is to dereference regmap from it.
> Please replace it with a pointer to struct regmap.
> 
> > +
> > +	/* Lock to ensure only a single sensor is read at a time */
> > +	struct mutex sensor_lock;
> > +	struct device *hwmon_dev;
> 
> Not used anywhere.
> 
> > +static u64 float_to_int(u32 data, u32 precision)
> 
> A return type of 'long' would make more sense. Also see below.

Yup will get those all fixed up.

> 
> > +{
> > +	s64 man = data & 0x007FFFFF;
> > +	s32 exp = ((data & 0x7F800000) >> 23) - 127 - 23;
> > +	bool negative = data & 0x80000000;
> > +
> > +	man = (man + (1 << 23)) * precision;
> > +
> > +	if (exp > 0)
> > +		man <<= exp;
> > +	else if (exp < 0)
> > +		man >>= -exp;
> > +
> 
> Is this an ieee754 floating point format ? Please add a comment stating it.
> Also, if the format supports it, please check for NaN. If the HW guarantees
> to never return NaN, please add a respective comment.
> 
> How likely is it that the values overflow ? A precision multipler of
> 1,000,000,000 means that numbers will overflow quite easily. And does
> the the hardware really report voltages and currents in pico-units,
> and are temperatures really reported in micro-degrees C ?
> 

I believe the hardware can't return NaN. But will check that,
what ranges are possible and add some overflow checking.

> Overall it might make sense to reconfigure the hardware into continuous
> measurement mode and get rid of the delays (if that can be configured -
> the user guide isn't detailed enough to be able to determine for sure).
> After all, it is quite unlikely that the board will be used in an
> environment where the power savings would be worth the inconvenience
> of having to wait more than two seconds for a set of measurement values
> (adding all the current and temperature delays up).
> 

Yeah the hardware is quite slow and regrettably doesn't have a
continuous measurement mode. We could potentially add a thread to
poll them but mostly the usage for this data is just taking power
measurements of various audio use-cases so the large delay isn't
a huge problem and not sure it warrents the additional
complexity.

> > +	msleep(nsamples);
> > +
> 
> This needs some explanation how nsamples translates into millisecond waits,
> especially since that wait can add up significantly (reading the temperature
> will take forever, as will reading all currents).
> 
> > +	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL3, val,
> > +					val & LOCHNAGAR2_IMON_DONE_MASK,
> > +					5000, 2000000);
> 
> Can that indeed take another two seconds on top of the sleep above ?
> 

It does about about 1.5-2 seconds I think last time I checked.

Essentially the hardware will average a number of readings and
return that. The number of readings given in the driver is what
the hardware guys recommended for each, that said we could
potentially make it configurable if that helps at all? Also
I could get the msleep a bit closer to the actual runtime,
just need to check how linear the time is with the number of
samples take (I assume very).

> > +static int lochnagar_hwmon_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct lochnagar *lochnagar = dev_get_drvdata(dev->parent);
> > +	struct lochnagar_hwmon *priv;
> > +
> 
> It might make sense to add a check to ensure that lochnagar is not NULL.
> 

Can do.

Thanks,
Charles
