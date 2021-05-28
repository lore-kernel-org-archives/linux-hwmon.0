Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E23C2B9F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 18:40:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78241613C9
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 18:40:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhE1Sm2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 14:42:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:57334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhE1Sm2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 14:42:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CA30613B6;
        Fri, 28 May 2021 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622227253;
        bh=6dyWL1rXQ3+D0eLsRKa/QXgeYIUh4Vqy/YRCyjDIi+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f0C25nSXgilcMeFuzsYQyOKB0bLJHXlig9E6Tk8zdnFq/LF3oenrq7c0tyj6fhjt1
         GpUqfamSbtoErmdVUmX9UYtb8++9HPF9unj/2af2b54FYZ46i4zL5CBOpRAXDqMJ5d
         cacGKEt6j5fF74jflexlUOej5JL3dxl8v9Iui5zzjEQvklHpae/UDVuUHOWRmh8lvx
         IAQVFLd4aw5qm5fsGpp29thPt0AtD/uiiQm2/GTTanYGxJ1RPOzZlNo/3Yyf1K0Ttq
         wjDer1LsilzLMaEKm5TIXduSCPqYEwDRFKDLNKNuV0LRQr48WBPVza32PtmUgF4IyG
         Wx+QIsDXCsB6A==
Received: by pali.im (Postfix)
        id 01C8BB0B; Fri, 28 May 2021 20:40:50 +0200 (CEST)
Date:   Fri, 28 May 2021 20:40:50 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Convert to new hwmon registration api
Message-ID: <20210528184050.q35nt5rkyg322wga@pali>
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528183254.cvleypq54gz2m5sj@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210528183254.cvleypq54gz2m5sj@pali>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 28 May 2021 20:32:54 Pali Rohár wrote:
> On Friday 28 May 2021 19:37:10 W_Armin@gmx.de wrote:
> > From: Armin Wolf <W_Armin@gmx.de>
> > 
> > This patch series is converting the dell-smm-hwmon driver
> > to the new hwmon registration API. In order to do so,
> > it introduces a platform device in the first patch, and
> > applies some optimisations in the next three patches.
> > The switch to the new hwmon registration API is done in
> > the last patch.
> > 
> > The caching of the fan/temp values was modified to better fit
> > the new hwmon API.
> > 
> > The patches work fine for my Dell Latitude C600, but i whould
> > appreciate someone testing the code on another model too.
> > 
> > Changes in v2:
> > - Fix coverletter title
> > - Update docs regarding pwm1_enable
> > 
> > Armin Wolf (6):
> >   hwmon: (dell-smm-hwmon) Use platform device
> >   hwmon: (dell-smm-hwmon) Mark functions as __init
> >   hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
> >   hwmon: (dell-smm-hwmon) Move variables into a driver private data
> >     structure
> >   hwmon: (dell-smm-hwmon) Convert to
> >     devm_hwmon_device_register_with_info()
> >   hwmon: (dell-smm-hwmon) Update docs
> > 
> >  Documentation/hwmon/dell-smm-hwmon.rst |   2 +-
> >  drivers/hwmon/dell-smm-hwmon.c         | 860 ++++++++++++-------------
> >  2 files changed, 426 insertions(+), 436 deletions(-)
> > 
> > --
> > 2.20.1
> > 
> 
> Hello! I tried to apply this patch series but it failed on error
> malformed patch. I guess that it is because patches in emails were sent
> in quoted-printable transfer encoding (instead of transparent 8-bit).
> I will look later how to convert them into 8-bit, for clean apply.

Quick "hack": in mutt just open email body in "v"-view and then save
content. It is then clean 8-bit, fully decoded and patch can be applied.
