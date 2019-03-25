Return-Path: <SRS0=S2uc=R4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ECFC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 18:47:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AA8C2075D
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 18:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaSWy3Zb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbfCYSrQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Mar 2019 14:47:16 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39998 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729283AbfCYSrP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Mar 2019 14:47:15 -0400
Received: by mail-pl1-f195.google.com with SMTP id b11so366532plr.7;
        Mon, 25 Mar 2019 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3b2a8OCAipSMBcDQce4vuGUzSEzuS4dch4x63vM8zuE=;
        b=XaSWy3ZboPDxlbiD5VRYMdtFpdVbsfFA1BfmjNyRlQSmcHuJv4Dt4rI1fSB1Z61eUP
         k0MuuHzxlFvPj+FKhtyHzMDvvtUv3IXTPOVX1hvBtRgCQT1Ju4K8121edyrRJ1W1OTyr
         /Y1s+Erk16NcKdoXc8mLQNS0YVZMjhC451zuckPbLFl0yMyJMNmDgF3LxD3cgQK0OK9Z
         YVo93d4hmf6YB1bj9VcJz4NvLl3QAE/f5nBWtLJp7an/esghBaA6jaRV7xtXBmb20ig5
         oHPcZyP3E9MrH/YvA2nounRUSsxwMIdiY5T8YSliKdv3u4QXABmqiqNQvmdm8Ws/UntT
         yNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3b2a8OCAipSMBcDQce4vuGUzSEzuS4dch4x63vM8zuE=;
        b=IXmw6CcAVYqmRbQM0BsCjDBFjeZBN5umjdwNsPdgzGn5fxx7pyAPiNEcnByW0WMwyA
         g1vIIBVTnlIA+hoU9KPIBjyYtaPP7E2S8Xlabtd7kGAZQqMke69OEb8GVPxZ0vIzIGCd
         7ypgHo9GSAH/D6QSMhn6dyDL2z4eispvLUAsV6T6Gn1KmHfiBBEqVnUdoh5vbs3feBFf
         /zGK1I9AQ19wKucm4B4YtW1Cf1kfGsSn4AiZm4ork5nJar+k+PMQSM4Ye/K18LKX+sL9
         lRACnjzCnTJUUrk3EGo9yQwWHQK2c96r4vBnt89e+IkqAQXLxy9oHG2gqbRT4bilcUCM
         rPNQ==
X-Gm-Message-State: APjAAAXQatvzrqmc6Cxy8sIQs11MFyrW1IBbhXbMIc11pmFF04qS2vrO
        oYid6gHzhSZ19f6WsjaZCIA=
X-Google-Smtp-Source: APXvYqz+sUeTBCpPq0Z2VQxeCd8AWN7NEi0Am8TxMZHUJU95YrZ0AU8M1b/+t5RcyOHQFQRuBxO9/A==
X-Received: by 2002:a17:902:168:: with SMTP id 95mr27297823plb.212.1553539634817;
        Mon, 25 Mar 2019 11:47:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u86sm38551633pfj.69.2019.03.25.11.47.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2019 11:47:13 -0700 (PDT)
Date:   Mon, 25 Mar 2019 11:47:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190325184711.GA3195@roeck-us.net>
References: <20190325110020.4349-1-ckeepax@opensource.cirrus.com>
 <20190325110020.4349-2-ckeepax@opensource.cirrus.com>
 <7cd9502f-f986-d513-45a6-e7e40bd67b1f@roeck-us.net>
 <20190325131651.GF46536@ediswmail.ad.cirrus.com>
 <20190325164622.GB28275@roeck-us.net>
 <20190325171054.GG46536@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190325171054.GG46536@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 25, 2019 at 05:10:54PM +0000, Charles Keepax wrote:
> On Mon, Mar 25, 2019 at 09:46:22AM -0700, Guenter Roeck wrote:
> > On Mon, Mar 25, 2019 at 01:16:51PM +0000, Charles Keepax wrote:
> > > On Mon, Mar 25, 2019 at 04:17:31AM -0700, Guenter Roeck wrote:
> > > > On 3/25/19 4:00 AM, Charles Keepax wrote:
> > > > >From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > > Apologies couldn't find an archive for the hwmon list going
> > > back far enough, so just had to copy that in, hopefully your
> > > own records go back far enough. I am certainly open to other
> > > options such as your other suggest of a newer higher precision
> > > file being added.
> > > 
> > Try lore.kernel.org/linux-hwmon.
> > 
> 
> Indeed here we go:
> 
> https://lore.kernel.org/linux-hwmon/32c30882-2466-a992-158b-870cc8af5b40@opensource.cirrus.com/
> 
> Apologies for not finding that, over reliance on Google.
> 
> > > As regards the averaging, the draw of the audio hardware can be
> > > quite spikey and since we want to check the power consumption
> > > averaging is greatly preferable. As I mentioned in my previous
> > > email the average actually takes place in analog so it helps
> > > us get power numbers that include the spikes. Without that one
> > > could greatly over/under estimate depending on your luck with
> > > the timing of the current measurements.
> > > 
> > That makes some sense. Maybe add a note to the code describing the
> > reason for taking several measurements ?
> > 
> 
> Can do.
> 
> > > We could potentially switch to millivolts rather than microvolts,
> > > as our use-cases don't generally need the precision on voltage,
> > > if you prefer? But for current we will need to come up with some
> > > solution to pass more accurate measurements.
> > > 
> > I do have some second thoughts about my 2017 comments. From an ABI
> > perspective, it is highly undesirable to provide false data on purpose.
> > 
> > Do you need micro-units for all measurements ? If not, or even if so,
> > a simple solution might be to provide currX_input_ua and possibly
> > inX_input_uv for those attributes where needed, in addition to the
> > default attributes, which would be reported in mV / mA. That would meet
> > both the ABI and your requirements.
> > 
> > There is another possibility which might meet your requirements: If the
> > important attribute is power consumption, you might consider providing
> > power attributes. Those _are provided in micro-units. That isn't exactly
> > as expected, as drivers should only provide power attributes if actually
> > reported by the HW, but there is an argument to make that it makes sense
> > here. You could then even provide powerX_average and make the number
> > of samples indirectly configurable with powerX_average_interval.
> > 
> 
> Thank you for the suggestions I will investigate them and see
> where I get to. The power option does sound tempting as the
> ability to configure the number of samples feels like something
> that could be handy in the future. But on the flip side adding
> high accuracy APIs might be useful for others in the future.
> 
Agreed, but we would have to think about it more before jumping into
it. There would be several possible solutions. Adding new sysfs files
might be one. Another might be "scale" attributes or similar. Or get rid
of the sysfs ABI entirely and use something similar to iio. Or go further
and create a hwmon->iio bridge and use iio to report high resolution
information.

Guenter
