Return-Path: <SRS0=FSWF=R5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA987C4360F
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Mar 2019 10:06:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDCA220863
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Mar 2019 10:06:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730239AbfCZKGY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Mar 2019 06:06:24 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:52780 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726042AbfCZKGX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Mar 2019 06:06:23 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2QA3Oaa012011;
        Tue, 26 Mar 2019 05:05:54 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0a-001ae601.pphosted.com with ESMTP id 2rdj70eqpe-1;
        Tue, 26 Mar 2019 05:05:54 -0500
Received: from EX17.ad.cirrus.com (ex17.ad.cirrus.com [172.20.9.81])
        by mail3.cirrus.com (Postfix) with ESMTP id 8EC92611C8B4;
        Tue, 26 Mar 2019 05:06:16 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Tue, 26 Mar 2019
 10:05:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id
 x2QA5pTX008575;        Tue, 26 Mar 2019 10:05:52 GMT
Date:   Tue, 26 Mar 2019 10:05:51 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190326100551.GI46536@ediswmail.ad.cirrus.com>
References: <20190325110020.4349-1-ckeepax@opensource.cirrus.com>
 <20190325110020.4349-2-ckeepax@opensource.cirrus.com>
 <7cd9502f-f986-d513-45a6-e7e40bd67b1f@roeck-us.net>
 <20190325131651.GF46536@ediswmail.ad.cirrus.com>
 <20190325164622.GB28275@roeck-us.net>
 <20190325171054.GG46536@ediswmail.ad.cirrus.com>
 <20190325184711.GA3195@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190325184711.GA3195@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903260075
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 25, 2019 at 11:47:11AM -0700, Guenter Roeck wrote:
> On Mon, Mar 25, 2019 at 05:10:54PM +0000, Charles Keepax wrote:
> > On Mon, Mar 25, 2019 at 09:46:22AM -0700, Guenter Roeck wrote:
> > > On Mon, Mar 25, 2019 at 01:16:51PM +0000, Charles Keepax wrote:
> > > > On Mon, Mar 25, 2019 at 04:17:31AM -0700, Guenter Roeck wrote:
> > > > > On 3/25/19 4:00 AM, Charles Keepax wrote:
> > > > > >From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > > There is another possibility which might meet your requirements: If the
> > > important attribute is power consumption, you might consider providing
> > > power attributes. Those _are provided in micro-units. That isn't exactly
> > > as expected, as drivers should only provide power attributes if actually
> > > reported by the HW, but there is an argument to make that it makes sense
> > > here. You could then even provide powerX_average and make the number
> > > of samples indirectly configurable with powerX_average_interval.
> > > 
> > 
> > Thank you for the suggestions I will investigate them and see
> > where I get to. The power option does sound tempting as the
> > ability to configure the number of samples feels like something
> > that could be handy in the future. But on the flip side adding
> > high accuracy APIs might be useful for others in the future.
> > 
> Agreed, but we would have to think about it more before jumping into
> it. There would be several possible solutions. Adding new sysfs files
> might be one. Another might be "scale" attributes or similar. Or get rid
> of the sysfs ABI entirely and use something similar to iio. Or go further
> and create a hwmon->iio bridge and use iio to report high resolution
> information.
> 

Ok I think I will have a look at the using the power entries
first and we can see what that looks like. I am leaning in that
direction as it would be nice to get something merged in the not
too distant future and having configuration for the averaging
does seem like it protects against the hardware guys going "for
this project we need to average over this many samples".

On another note I have not really done a lot with hwmon/iio
before, my assumption was this should really be an hwmon device
since it is monitoring the state of the hardware and only
supports simple single readings, no buffering etc. Are you also
comfortable that this is the sub-system this device belongs in?

Thanks,
Charles
