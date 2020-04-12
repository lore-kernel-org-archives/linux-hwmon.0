Return-Path: <SRS0=M/a5=54=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9A2C2BB85
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Apr 2020 22:27:40 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C6F0206C3
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Apr 2020 22:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibS5j6pi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C6F0206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-hwmon-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgDLW1h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Apr 2020 18:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:57546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgDLW1h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Apr 2020 18:27:37 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A6AC0A88B5
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2020 15:27:37 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id z9so3098695pjd.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2020 15:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zfcN/hmvN45d0hn2dndhSeDC82Nofbr/rr4ABWi0Xa4=;
        b=ibS5j6piL6X1qW0aQUQi2HGa33wJp+UzMrdQ3glsMMLTmJvJGxiL0rgi46rTVd3h1S
         8j6QVqB53aEE8F10ZYrS7CQjkZR9oPKZop12AUiQfInLd57y8w6aCyBs0ESZkuYOCUqq
         KfcUonhdytszfOLUbx33/Xavacyscs48f5TlyEGlRufBmp9TOIsPb9FL3WaOXVIbCbL3
         TPdpWUuJxrGLz/NBSeRKiUpk3jNzeWyj4699ZX4ZAM9oceJMRWHKZ0Vs4K3oCTP/Wjlo
         KAlpzKiYwopbMalKgi1TcF/LW2VgYCdnnpGvW+7vXSZ0ywwnr//osCR9cB7W181wsINE
         oC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zfcN/hmvN45d0hn2dndhSeDC82Nofbr/rr4ABWi0Xa4=;
        b=NB4aRbroCOiqD56dgej4Mhx/VKeX7q5eVgLr1Tux/pv9wECDTf+gJJoyCF6BGTEOSX
         liacm/6yO4jlROBQGt+xjrX1DkSgt6vEvNGuMOx/6O2oZfywF1CdUvgjYVC/Oj3IHHWu
         pOsO81QDCly5206IlNfAOc+OriVPvRAsjHMXStKW5HwAWYrJBDLGVbpLLth8ywFPW74y
         g3v7xIo3KyxlTbMsvCOitAKkrA7gQ2oyTmJzFPPuu94JA4Kla2G/kIkG8pkR3Gndosx9
         qrFafL5yUDjADrvY8nWtUGW1z30vY2WtNZJr125En5kinyJwWuJzZZ16vG4z0iO9LS3w
         Ae6Q==
X-Gm-Message-State: AGi0PuaRM6H50rCeBpPeuFbvjjVw745SbIjU7gmG8rVqxRyg1JK7WAzA
        KRM9LF59UeBxAxRVcoEp5OA=
X-Google-Smtp-Source: APiQypKiGnrz1p8e8v0HxR6/kCsthNBKZumON0ZUmbhrh49sMaJAyJesHqWQRHiemc7OifVC6nEimw==
X-Received: by 2002:a17:902:9797:: with SMTP id q23mr4640694plp.168.1586730457453;
        Sun, 12 Apr 2020 15:27:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u3sm6906030pfu.137.2020.04.12.15.27.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:27:36 -0700 (PDT)
Date:   Sun, 12 Apr 2020 15:27:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: Add amd_energy driver to report energy
 counters
Message-ID: <20200412222735.GA232180@roeck-us.net>
References: <20200409153939.38730-1-nchatrad@amd.com>
 <e0d1a13c-e475-2b9f-c951-92aeb1dce9c0@roeck-us.net>
 <CAHfPSqAsuo+ac49L=f0Bg-iPj5gVQp3MRE9kfjSFysUx7WMHpg@mail.gmail.com>
 <75bc1938-104d-4d53-f46a-247e5ce2d2d2@roeck-us.net>
 <CAHfPSqDQmQFaN-VqrPLPz8GOGh_4VHq6=4moJQB3eEGPdRfMiA@mail.gmail.com>
 <CAHfPSqD6b-=KPVzHr0TOjrNQd5Sub1JnChGhD_aaR6b5+HO6BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHfPSqD6b-=KPVzHr0TOjrNQd5Sub1JnChGhD_aaR6b5+HO6BQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 13, 2020 at 01:34:19AM +0530, Naveen Krishna Ch wrote:
> Hi Guenter
> 
[ ... ]
> 
> Constraint:
> The platform has 2 sets of energy sensors, one at core level, one at
> socket level.
> If i populate the chip_info type as "hwmon_energy" for both sensors.
> The naming of the sysfs entries are going to be continuous and the
> user application
> should read the label to identify which entry belongs to which sensor set.
> 

I am a bit at loss. what is the problem with having multiple _energy attributes
(energy1_input, energy2_input, ..., energy100_input) ?

> Possible solutions :
> I could think of following ways to avoid this
> 1. Create 2 different hwmon devices

You could do that, following the approach used by the k10temp driver. This is
really your call. The question in that case, though, would be why you would want
have a separate driver to start with and not just enhance the k10temp driver to
also report energy (and power consumption, though I understand that the registers
reporting it are not published).

> 2. Use "hwmon_in" as type for one of the sensor sets and
> "hwmon_energy" for other.

_in is for voltages. Please don't tell me you plan to report voltages with this
driver. If so, please extend the k10temp driver instead.

> 3. Use "groups" for one of the sensor sets and populate the other via chip.

This is a no-go.

> What do you suggest ?
> 
> Also, I noticed that the sysfs filename index for the hwmon_energy
> type is starting with 1,
> while hwmon_in starts with 0. Was this a design choice ?

I think this was mostly historic, but it preceeds my involvement with the
hwmon subsystem, so I don't really know.

Guenter
