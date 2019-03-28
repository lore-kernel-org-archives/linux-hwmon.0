Return-Path: <SRS0=ZzD2=R7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FD6C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Mar 2019 11:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B7302173C
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Mar 2019 11:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfC1L0d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Mar 2019 07:26:33 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:49558 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725779AbfC1L0d (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Mar 2019 07:26:33 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2SBK0wj006852;
        Thu, 28 Mar 2019 06:25:35 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2rdh7k2570-1;
        Thu, 28 Mar 2019 06:25:34 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 6B621611C8AC;
        Thu, 28 Mar 2019 06:25:34 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Thu, 28 Mar 2019
 11:25:33 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id
 x2SBPVRo000710;        Thu, 28 Mar 2019 11:25:31 GMT
Date:   Thu, 28 Mar 2019 11:25:31 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190328112531.GK46536@ediswmail.ad.cirrus.com>
References: <20190327151328.2491-1-ckeepax@opensource.cirrus.com>
 <20190327151328.2491-2-ckeepax@opensource.cirrus.com>
 <20190327193115.GA6462@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190327193115.GA6462@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=993 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903280082
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Mar 27, 2019 at 12:31:15PM -0700, Guenter Roeck wrote:
> On Wed, Mar 27, 2019 at 03:13:28PM +0000, Charles Keepax wrote:
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
> 
> Looks pretty good. Down to nitpicks....
> 
> > +struct lochnagar_hwmon {
> > +	struct regmap *regmap;
> > +
> > +	long power_ms[ARRAY_SIZE(lochnagar_chan_names)];
> 
> Instead of storing the milli-seconds here, it might be better
> to store the number of samples and convert back to ms is/when
> asked for, ie when the sysfs file is read. That may result
> in some rounding changes, but read_power() would no longer
> have to execute the expensive DIV_ROUND_UP() for each call.
> 

Yeah I can switch over, had been leaning towards the sysfs file
reporting what was written into it, but happy to go the other
way.

> > +	static const unsigned int prec = 1000000;
> 
> Any reason for not using a #define ?
> 

Had been keeping it similar to the other measurements that
defines the precision inline. Will switch them all over to a
define.

> > +	power = div_u64(power + (prec / 2), prec);
> 
> 	DIV_ROUND_CLOSEST_ULL ?
> 

Oops... sorry about that, always miss these helpers will update
this one.

Thanks,
Charles
