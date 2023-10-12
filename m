Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66D2CDB46E
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Oct 2023 17:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347373AbjJLRi1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Oct 2023 13:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347370AbjJLRiT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Oct 2023 13:38:19 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43547172B
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Oct 2023 10:36:45 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-452c0d60616so765624137.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Oct 2023 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132204; x=1697737004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZp2e2hedcoORxjl3JEHBQ49SkP3BSutq8l8Phq1ZXE=;
        b=NOkjJqtpkpb12j1dQ/iIEr893xN+R+DLX1iRJztHlDJnkFkG/HOyjAJG/eMqPflCvw
         LNT+0KbNUObUmp6j28zpEtbUL+BSIq5H0v6VyVmlPSMWRM8iJoPQrqPK9tsA2w2kcI6w
         i4S8EJne3XYrNuV2joZEPo+jAfmLZtwXmc6Bivv343FijdL+aMLxadw9Ltu7y3ZtBlPs
         Vo/MYCj7Domplz2/MLVJlp+hxvdId2vFlZA7O0PUcoPIrbw+Ruiq/gvRViDj5WiEwcll
         cHGZgvGZZ55oLNiJ4z0bABsJrmC5kRN4GXGt8s+LapyvOjRXFJHyCacSPinIAJ3eJ229
         T8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132204; x=1697737004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZp2e2hedcoORxjl3JEHBQ49SkP3BSutq8l8Phq1ZXE=;
        b=LDAsJwU63IxIGYYAUBXKc4N5nq6Z/v4bFX4ikykc9ABMcIRTY66xfHUX41esJmdNh4
         waJTU19MdjB0w7Te00RNI/spCXcisII+pZNunr2VRtVmuV8xtMYs6h9BzShuK6GSZKpk
         VEyyNDPCXuJ6dADCdHA+FPzG0p5C3jwO4iDvR9Dcom0MVKgd82VOUIdlJGiSm32XhnAm
         z3liaEv2r/GtnwGNiHn1r9hisvcHgFwIEiZSqNT2p8UixkGM5YMYZOoYdYKHYOT44BOc
         eyp4Y1By9rsGnPylHtRsjc7t5dYlEp1mqIop5iie75i8QXestGch+drYXSrtKvtUFyjW
         UK1w==
X-Gm-Message-State: AOJu0YyHCW3cxEcy9a1vZ4GDoezOI5pY06ZO5DPy0F67i1s/tMw/txck
        yM6y1BajDgpLVC/AB3ea31FXz4K51eA=
X-Google-Smtp-Source: AGHT+IEw9Vlr+pFTHWoL3AqWALUrPQsAYAdj3UuhmNFj7OaY/fiRMMpzx/tmi1OpU+zTtDxuDxGebw==
X-Received: by 2002:a67:f656:0:b0:452:61fa:1e04 with SMTP id u22-20020a67f656000000b0045261fa1e04mr11462867vso.9.1697132204313;
        Thu, 12 Oct 2023 10:36:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q3-20020ab04a03000000b0079b3282b5f5sm3224457uae.2.2023.10.12.10.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:36:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 12 Oct 2023 10:36:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Shenhar, Talel" <talel@amazon.com>
Cc:     "Ben Shaul, Almog" <almogbs@amazon.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: HWMON periodically collection
Message-ID: <1b4b34d9-39c4-4650-82d2-99f798dbdc03@roeck-us.net>
References: <B8B37F39-A91A-4925-8100-4818FDA202DC@amazon.com>
 <2d22df1b-f5a8-4161-b4e3-a3fcba6b3308@roeck-us.net>
 <169cad22-702c-445a-a9d7-74c68509bfb1@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169cad22-702c-445a-a9d7-74c68509bfb1@amazon.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 12, 2023 at 01:18:37PM +0300, Shenhar, Talel wrote:
> 
> On 10/11/2023 6:09 PM, Guenter Roeck wrote:
> > 
> > On Wed, Oct 11, 2023 at 10:45:03AM +0000, Ben Shaul, Almog wrote:
> > > Hi all,
> > > 
> > > We'd like to collect hwmon sensors and get their min/max/avg for our platforms.
> > > 
> > > Those sensors doesn't support min/max by HW and only support reading current values (they also don't support avg but that is likely the case for all other devices).
> > > 
> > > For that goal of getting min/max/avg we have two options:
> > > 
> > > 1. Write userspace service that will constantly read the values and do the calculations (and later report to our database)
> > Yes, this is what you'll have to do.
> We appreciate the prompt response!
> > 
> > > 2. Extend HWMON subsystem/library so each registering hwmon device will ask the subsystem to do it for you.
> > >      Then kernel will create workqueue and constantly read the values and make the calculations (which shall later be readable via hwmon sysfs)
> > No. This would add runtime overhead to each hwmon device even if the
> > information is not used (which would be the case for almost every user).
> 
> That is a fair point.
> 
> What about enabling this during runtime in case user will want to utilize
> this?
> 
> e.g. ioctl/sysfs/debugfs
> 

No.

> Of course users can configure the interval during runtime (or even devfreq
> based?).
> 
> 
> The only concern we had for doing it from usrespace is the short interval
> (and multiple sensors) required will create overhead. Of course doing that
> in kernel space doesn't make this overhead go away and even worsen it as we
> don't go via scheduler. (but does ease userspace/kernelspace context
> switch).

Following your logic, we should implement pretty much everything in the
kernel to avoid userspace/kernelspace context switches. Sorry, we'll have
to agree to disagree here.

> 
> And of course the added value of contributing such a feature which does make
> sense as probably many want to know across their HW what is the power
> consumption. are you aware of some package that supply this kind of info? or
> everyone interested is doing some sort of home made solution?
> 
Presumably various userspace packages implement this, but I don't know of
any specific ones.

Guenter
