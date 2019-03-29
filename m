Return-Path: <SRS0=13Sa=SA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29758C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 09:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F19E32082F
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 09:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfC2JXH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:23:07 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:57634 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726590AbfC2JXH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Mar 2019 05:23:07 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2T9L6D4002691;
        Fri, 29 Mar 2019 04:22:39 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0b-001ae601.pphosted.com with ESMTP id 2rdh7k4vvg-1;
        Fri, 29 Mar 2019 04:22:39 -0500
Received: from EX17.ad.cirrus.com (ex17.ad.cirrus.com [172.20.9.81])
        by mail3.cirrus.com (Postfix) with ESMTP id D7B00611C8B8;
        Fri, 29 Mar 2019 04:23:02 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Fri, 29 Mar 2019
 09:22:38 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id
 x2T9Maln014185;        Fri, 29 Mar 2019 09:22:36 GMT
Date:   Fri, 29 Mar 2019 09:22:36 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Rob Herring <robh@kernel.org>, <lee.jones@linaro.org>
CC:     <jdelvare@suse.com>, <linux@roeck-us.net>, <mark.rutland@arm.com>,
        <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
Message-ID: <20190329092236.GL46536@ediswmail.ad.cirrus.com>
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
 <20190328174615.GA6068@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190328174615.GA6068@bogus>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903290068
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 28, 2019 at 12:46:15PM -0500, Rob Herring wrote:
> On Thu, Mar 28, 2019 at 01:09:36PM +0000, Charles Keepax wrote:
> > Lochnagar is an evaluation and development board for Cirrus
> > Logic Smart CODEC and Amp devices. It allows the connection of
> > most Cirrus Logic devices on mini-cards, as well as allowing
> > connection of various application processor systems to provide a
> > full evaluation platform. This driver supports the board
> > controller chip on the Lochnagar board.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > +Required properties:
> > +
> > +  - compatible : One of the following strings:
> > +                 "cirrus,lochnagar2-hwmon"
> > +
> > +Example:
> > +
> > +lochnagar-hwmon {
> > +	compatible = "cirrus,lochnagar2-hwmon";
> 
> You don't have any resources in DT, the parent MFD driver can just 
> instantiate this child device.
> 

+ Lee Jones

Lee, was very very keen for me to not mix mfd_add_devices and
of_platform_populate in the MFD driver. As such we moved all the
sub-drivers into DT. I agree it is a little odd that this exists
only to bind in this driver but I think it is probably a bit late
to change that. If we were going to have the MFD instantiating
children directly a lot of the rest of the binding would have
been done very differently.

Thanks,
Charles
