Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798B0C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:54:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FB9C60F5E
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbhG1Vyj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 17:54:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:43858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231668AbhG1Vyi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 17:54:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD9996103E;
        Wed, 28 Jul 2021 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627509276;
        bh=ztqK5CmU1wxcdYsDe+kr4lWl0t5kyCRnf4z52Pk7fgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GOVV6Y+lxSdN7wHDJ3R2gLGbe0oT+2rkYiyZGo9R/uARq9q34/Bs62L9NYcgbglCQ
         HBXs1zaPk3WqJ+wwRn6H71zzjzm+xD6jaf4211ym4voG9pKBpLE6NtFQ07fLVRcRRv
         XhqPvF5PpboGDQSPM+F8gLbY+k6tuq0tOsCYD3rtbYtWXytAqH80tY8jXJTjDC7P70
         b7M9nvutnQLRYvJ6q0ZlEMgnb5E3F9rINRSRqomqeqWWidvW4s/X0vZ2J+znKXT2+v
         7LR3X7pEMzwJNDnLB6/JitdEDVsulbJkhHAH7uWiE3IozraEzqnKgAYxbtKCwTMBe9
         iqlDF9++G1j3w==
Received: by pali.im (Postfix)
        id A398996B; Wed, 28 Jul 2021 23:54:33 +0200 (CEST)
Date:   Wed, 28 Jul 2021 23:54:33 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
Message-ID: <20210728215433.yelg3y2ll7evnxba@pali>
References: <20210728205142.8959-1-W_Armin@gmx.de>
 <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
 <340a960b-3031-77de-8e62-5fd933ec9a62@gmx.de>
 <0500dd39-c82c-8268-91a3-0a97103ab3d0@roeck-us.net>
 <cac1b3ef-b51c-4514-cc7b-000b0d48ac8e@gmx.de>
 <938db8a5-3199-d468-5979-9978171bb138@roeck-us.net>
 <db21294b-48cf-65ad-77dd-494a779650dc@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db21294b-48cf-65ad-77dd-494a779650dc@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wednesday 28 July 2021 23:40:21 Armin Wolf wrote:
> Am 28.07.21 um 23:37 schrieb Guenter Roeck:
> > On 7/28/21 2:34 PM, Armin Wolf wrote:
> > > Am 28.07.21 um 23:28 schrieb Guenter Roeck:
> > > > On 7/28/21 2:19 PM, Armin Wolf wrote:
> > > > > On 28.07.21 23:07 Guenter Roeck wrote:
> > > > > > On 7/28/21 1:51 PM, W_Armin@gmx.de wrote:
> > > > > > > From: Armin Wolf <W_Armin@gmx.de>
> > > > > > > 
> > > > > > > This patch series is converting the dell-smm-hwmon driver
> > > > > > > to the new hwmon registration API. In order to do so,
> > > > > > > it introduces a platform device in the first patch, and
> > > > > > > applies some optimisations in the next three patches.
> > > > > > > The switch to the new hwmon registration API is done in
> > > > > > > the next patch. The last patch is fixing a small bug.
> > > > > > > 
> > > > > > > The caching of the fan/temp values was modified to better fit
> > > > > > > the new hwmon API.
> > > > > > > 
> > > > > > > The patches work fine for my Dell Latitude C600, but i whould
> > > > > > > appreciate someone testing the code on another model too.
> > > > > > > 
> > > > > > > Changes in v6:
> > > > > > > - Make pwm1_enable permissions write-only
> > > > > > 
> > > > > > Sorry, guess I am missing something. Why ?
> > > > > > 
> > > > > > Guenter
> > > > > > 
> > > > > pwm1_enable used SENSOR_DEVICE_ATTR_WO before the patch, so the file
> > > > > permissions where 0200.
> > > > > In the v5 patch series however, the file permission where not 0200,
> > > > > so i
> > > > > changed that.
> > > > > 
> > > > 
> > > > Is there a _reason_ for declaring this attribute write only, other than
> > > > "it used to be that way" ?
> > > > 
> > > > Guenter
> > > 
> > > I dont think so, dell_smm_read will just return -EOPNOTSUPP if
> > > someone tries to read pwm1_enable.
> > > 
> > > Armin
> > > 
> > That is not what I meant. Is there a reason to not report
> > the current status of pwm1_enable to the user ? In other
> > words, does the firmware not report its current status ?
> > 
> > Guenter
> 
> Pali said the driver cannot query the state of pwm1_enable from the BIOS, and with userspace tools being able to change
> the state of BIOS fan control behind our back, we cannot simply return the last set value.

We have already discussed this problem years ago, see:
https://lore.kernel.org/linux-hwmon/20160522152823.GA18331@roeck-us.net/

And also again this year:
https://lore.kernel.org/linux-hwmon/20210528211037.2tnblovgb3rkcwnq@pali/

Basically there is no known firmware command to retrieve current status
yet. And both userspace and SMM/firmware itself can change state. So
kernel has no way how to retrieve current status and caching last value
cannot be used (due to userspace and firmware can change it).

Whole SMM API is undocumented and seems that Dell does not want to
provide any documentation for it.

I know that it is pity that we have no read functionality, but we have
to deal with it...

Maybe it would make sense to add comment into driver code, why attribute
is write-only...
