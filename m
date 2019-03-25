Return-Path: <SRS0=S2uc=R4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252D2C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 17:12:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0FB32087C
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 17:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbfCYRMO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Mar 2019 13:12:14 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:41938 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729503AbfCYRMO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Mar 2019 13:12:14 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2PH9RG2003850;
        Mon, 25 Mar 2019 12:10:57 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2rdj70dh5y-1;
        Mon, 25 Mar 2019 12:10:57 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 7BE32611C8AC;
        Mon, 25 Mar 2019 12:10:56 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Mon, 25 Mar 2019
 17:10:55 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id
 x2PHAsxv022618;        Mon, 25 Mar 2019 17:10:54 GMT
Date:   Mon, 25 Mar 2019 17:10:54 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190325171054.GG46536@ediswmail.ad.cirrus.com>
References: <20190325110020.4349-1-ckeepax@opensource.cirrus.com>
 <20190325110020.4349-2-ckeepax@opensource.cirrus.com>
 <7cd9502f-f986-d513-45a6-e7e40bd67b1f@roeck-us.net>
 <20190325131651.GF46536@ediswmail.ad.cirrus.com>
 <20190325164622.GB28275@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190325164622.GB28275@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903250125
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 25, 2019 at 09:46:22AM -0700, Guenter Roeck wrote:
> On Mon, Mar 25, 2019 at 01:16:51PM +0000, Charles Keepax wrote:
> > On Mon, Mar 25, 2019 at 04:17:31AM -0700, Guenter Roeck wrote:
> > > On 3/25/19 4:00 AM, Charles Keepax wrote:
> > > >From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > Apologies couldn't find an archive for the hwmon list going
> > back far enough, so just had to copy that in, hopefully your
> > own records go back far enough. I am certainly open to other
> > options such as your other suggest of a newer higher precision
> > file being added.
> > 
> Try lore.kernel.org/linux-hwmon.
> 

Indeed here we go:

https://lore.kernel.org/linux-hwmon/32c30882-2466-a992-158b-870cc8af5b40@opensource.cirrus.com/

Apologies for not finding that, over reliance on Google.

> > As regards the averaging, the draw of the audio hardware can be
> > quite spikey and since we want to check the power consumption
> > averaging is greatly preferable. As I mentioned in my previous
> > email the average actually takes place in analog so it helps
> > us get power numbers that include the spikes. Without that one
> > could greatly over/under estimate depending on your luck with
> > the timing of the current measurements.
> > 
> That makes some sense. Maybe add a note to the code describing the
> reason for taking several measurements ?
> 

Can do.

> > We could potentially switch to millivolts rather than microvolts,
> > as our use-cases don't generally need the precision on voltage,
> > if you prefer? But for current we will need to come up with some
> > solution to pass more accurate measurements.
> > 
> I do have some second thoughts about my 2017 comments. From an ABI
> perspective, it is highly undesirable to provide false data on purpose.
> 
> Do you need micro-units for all measurements ? If not, or even if so,
> a simple solution might be to provide currX_input_ua and possibly
> inX_input_uv for those attributes where needed, in addition to the
> default attributes, which would be reported in mV / mA. That would meet
> both the ABI and your requirements.
> 
> There is another possibility which might meet your requirements: If the
> important attribute is power consumption, you might consider providing
> power attributes. Those _are provided in micro-units. That isn't exactly
> as expected, as drivers should only provide power attributes if actually
> reported by the HW, but there is an argument to make that it makes sense
> here. You could then even provide powerX_average and make the number
> of samples indirectly configurable with powerX_average_interval.
> 

Thank you for the suggestions I will investigate them and see
where I get to. The power option does sound tempting as the
ability to configure the number of samples feels like something
that could be handy in the future. But on the flip side adding
high accuracy APIs might be useful for others in the future.

Thanks,
Charles
