Return-Path: <SRS0=13Sa=SA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680C7C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 14:00:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FEE620651
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 14:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbfC2OAN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Mar 2019 10:00:13 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:49408 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728720AbfC2OAN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Mar 2019 10:00:13 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2TDhcB6029457;
        Fri, 29 Mar 2019 08:59:46 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2rdh7k5h53-1;
        Fri, 29 Mar 2019 08:59:45 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 6AA97611C8B0;
        Fri, 29 Mar 2019 08:59:45 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Fri, 29 Mar 2019
 13:59:44 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id
 x2TDxhlL032492;        Fri, 29 Mar 2019 13:59:43 GMT
Date:   Fri, 29 Mar 2019 13:59:43 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Rob Herring <robh@kernel.org>
CC:     Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
Message-ID: <20190329135943.GM46536@ediswmail.ad.cirrus.com>
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
 <20190328174615.GA6068@bogus>
 <20190329092236.GL46536@ediswmail.ad.cirrus.com>
 <CAL_JsqJDp_AftJ_J-gpJ4Spt7vUi7PQ-0uidJYB0PPVKfrhJXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJDp_AftJ_J-gpJ4Spt7vUi7PQ-0uidJYB0PPVKfrhJXg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903290100
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 29, 2019 at 08:28:35AM -0500, Rob Herring wrote:
> On Fri, Mar 29, 2019 at 4:22 AM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > On Thu, Mar 28, 2019 at 12:46:15PM -0500, Rob Herring wrote:
> > > On Thu, Mar 28, 2019 at 01:09:36PM +0000, Charles Keepax wrote:
> > > > Lochnagar is an evaluation and development board for Cirrus
> > > > Logic Smart CODEC and Amp devices. It allows the connection of
> > > > most Cirrus Logic devices on mini-cards, as well as allowing
> > > > connection of various application processor systems to provide a
> > > > full evaluation platform. This driver supports the board
> > > > controller chip on the Lochnagar board.
> > > >
> > > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > > ---
> > > > +Example:
> > > > +
> > > > +lochnagar-hwmon {
> > > > +   compatible = "cirrus,lochnagar2-hwmon";
> > >
> > > You don't have any resources in DT, the parent MFD driver can just
> > > instantiate this child device.
> > >
> >
> > + Lee Jones
> >
> > Lee, was very very keen for me to not mix mfd_add_devices and
> > of_platform_populate in the MFD driver. As such we moved all the
> > sub-drivers into DT. I agree it is a little odd that this exists
> > only to bind in this driver but I think it is probably a bit late
> > to change that. If we were going to have the MFD instantiating
> > children directly a lot of the rest of the binding would have
> > been done very differently.
> 
> Okay. This is why I don't like incomplete examples...
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you, and apologies for that. I do not think it will
always be possible to include all the functionality in the
first sending, certainly from a code perspective. But we could
look at least to include some stubs/as much as we can foresee in
the binding document. Would that be the sort of direction you
had in mind?

Thanks,
Charles
