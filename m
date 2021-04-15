Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5D7C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Apr 2021 17:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B70C61139
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Apr 2021 17:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbhDORwa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Apr 2021 13:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbhDORwa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Apr 2021 13:52:30 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5EFC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Apr 2021 10:52:07 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id b3so10337920oie.5
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Apr 2021 10:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pxqYN2rwoRDZnwvO7xHBLbLWV9nUh0ckWLyu6x4y+8E=;
        b=NbP49ykjqPhQu0lZur8sZ+yLPYIakOkzob0L1M0YMp7zeCM1Fr1sTqOqxDTPIdvETh
         PzU6Chs4Fvs4gSKojdTQ9/S/M/NI35k4ZQkbSTLkXq2OHDW0FnVExsO1mX5zws8yGIGV
         w171tTE+dLBDX3HO3tWrY4C+a6C7u5w7UxL8OAVBJob7lk2s1U+wfLRG8Y+dsKSZCAKV
         A+nbbD6PIzIZIHlf2nTwcB+yDOs11qM5AlJdg//AeVjmgAfxnUnh+O6GbjGGlrct/f7C
         LbGX+IpmMdTK8M9mhdJBGtptEqUHMlQwa5RsEVoHMtYIlhzXGkhyMhIAEuUifjRkLunT
         zRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=pxqYN2rwoRDZnwvO7xHBLbLWV9nUh0ckWLyu6x4y+8E=;
        b=Uoz/OFjQHurzpBfRV/lm4dpTM8krPjaCzMaKOcsZVWcfBeTZlCdfH3dxvXf7HIJuGv
         3FbO6WyTdeaJkDCPvs2D/rOSLCvQejmUoOQlRVL+8bxv5BWGWUJufOvfKKgNlC/BBbiO
         0Q3zZ3j+DQ06O+gVMEmB8JHR3nra7FTmjzal1COsBzaCvFx6u1EImIOBVX72x6y91gLx
         1tydgxvaPm4dj891DFDuFTesa1SUbT4HUk7gDgQLLGEm+6GkP5fmYodfYEeZi7AEs/SR
         7ehWf5K5VaD+82PAliYhcSKfq3UdajwDC35Ikv84N7Q2ntGeA+Fkvv4e4H/4PDKeklhm
         BMBg==
X-Gm-Message-State: AOAM531XqFC2WcZZe03BWoYSCtpgfaJZHlcp6JNFOVZtCnlAVZfQttNu
        VmwiDwC9swmAE3gmzRSbcI/DzzL/O2g=
X-Google-Smtp-Source: ABdhPJytcViilr3aQz0MwZJcLNeotvdg8SLzXOo4wcrhP1FYWW3QEDNU3g2DUNHQRQawYLfBqENeWA==
X-Received: by 2002:aca:308c:: with SMTP id w134mr3345586oiw.111.1618509126755;
        Thu, 15 Apr 2021 10:52:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x127sm785249oix.36.2021.04.15.10.52.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 10:52:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 15 Apr 2021 10:52:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?V=E1clav_Kubern=E1t?= <kubernat@cesnet.cz>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [hwmon:hwmon-next 33/33] drivers/hwmon/pmbus/fsp-3y.c:204:48:
 warning: missing braces around initializer
Message-ID: <20210415175204.GC30478@roeck-us.net>
References: <202104142348.TP8JF6QJ-lkp@intel.com>
 <CABKa3npWANE5EQE+bTUZ02ngDMT36kGsLO-8kdf8oroba7kjWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABKa3npWANE5EQE+bTUZ02ngDMT36kGsLO-8kdf8oroba7kjWw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 15, 2021 at 06:34:41PM +0200, Václav Kubernát wrote:
> Hello.
> 
> I received this email only after I submitted the PSU patch. I'm not
> sure what I should do. Also, I don't understand the warning, I don't
> know where the braces are missing.
> 

It wanted { } to terminate the list instead of { 0 }. Or, of course,
{NULL, 0}, but that would just add unnecessary compexity.

I fixed it up, no need to resend.

Guenter

> Václav
> 
> st 14. 4. 2021 v 17:11 odesílatel kernel test robot <lkp@intel.com> napsal:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> > head:   f0af35c3a1254fc0cca601cdc4f228b9ad24a2a4
> > commit: f0af35c3a1254fc0cca601cdc4f228b9ad24a2a4 [33/33] hwmon: Add driver for fsp-3y PSUs and PDUs
> > config: arc-allyesconfig (attached as .config)
> > compiler: arceb-elf-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=f0af35c3a1254fc0cca601cdc4f228b9ad24a2a4
> >         git remote add hwmon https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> >         git fetch --no-tags hwmon hwmon-next
> >         git checkout f0af35c3a1254fc0cca601cdc4f228b9ad24a2a4
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=arc
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/hwmon/pmbus/fsp-3y.c:204:48: warning: missing braces around initializer [-Wmissing-braces]
> >      204 | static const struct i2c_device_id fsp3y_id[] = {
> >          |                                                ^
> >    ......
> >      207 |  {0}
> >          |   {}
> >
> >
> > vim +204 drivers/hwmon/pmbus/fsp-3y.c
> >
> >    203
> >  > 204  static const struct i2c_device_id fsp3y_id[] = {
> >    205          {"ym2151e", ym2151e},
> >    206          {"yh5151e", yh5151e},
> >    207          {0}
> >    208  };
> >    209
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
