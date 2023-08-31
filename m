Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4F6C83F37
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Aug 2023 18:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347078AbjHaSmB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Aug 2023 14:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjHaSmA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Aug 2023 14:42:00 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E9CE65
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Aug 2023 11:41:57 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26f6b2c8e80so831387a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Aug 2023 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693507317; x=1694112117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I5ChSmKazSx23s1Wn9L0e1jbuOoLwOeqFS1zmJOj+pc=;
        b=Sbn820Y2t1VrGYJLx03xoo1soWUGFh6FdsfmIcpyD2o5PW929BlgNUt7YwaQ55uAox
         Hlr02ZeVuEaFv0fK2XCdqrrObL+08Nykr3XXicRQLrQxeBJkjMrsTMCLOS/7590NNmF2
         Yy6bh1kuWZXAuvF3KQ2RJSnTsuOGacEA5AdH6dl+m7InJBuCk0CtuVyDGynA6mC+sMzP
         sFJI5U7WnxBwcJlBb0tA/x5s8aTmOGEqW/JDd2kuZCC5QguR+DI+Bms8SVOFepqa6sCs
         EAOyRPKSvCpkPL7uFs72fCRbNaRaatD24/bB8WjtHgzIYIhn+mnffhRjhtFA26DYuHJn
         qdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693507317; x=1694112117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5ChSmKazSx23s1Wn9L0e1jbuOoLwOeqFS1zmJOj+pc=;
        b=FKqpMDjOxWyMR6HEXl2GleK+bHvGVOw6rC52e3ZMIv8vohS/M40z+a+UakwXheKpQM
         ZaTH03Lqru4uhvaPNloj4JR4PFCr9CaBXV+aPxx7a+tvtCM1TjJl8Aro6Wj0WwXfpifE
         /EIiQm7d0x3ZACaJ39I8zrMWk0BOZLzocA2XiWFob9lsTI2EQ6o1wvj3uW2B6QEIjtkb
         e94E2GuszYBgv6NsniArsfePNuKVYst6nqIEMAJGkEp/OEMIf40gAzFlfyPQNeXAGTB8
         Sr8gidl44NSfY2b1O0YHmPCIs7RtaTFSTJUSc/tnvNRq2IUXlXXKWDlEQM4elKqwSAB+
         g5tA==
X-Gm-Message-State: AOJu0YyrKF+kF4sm+83gmaeCAfrECgLE0IQJ8CaRJ2l8xl4VsdelJeWC
        oB/om8PQs1xmG2jWh47IIxv470fbkGrlKu6pBwx3YA==
X-Google-Smtp-Source: AGHT+IH7P0udp27gF7WoaIK8quI86T1Rkg5UneAJLa76Rjycml/SAA0iGsGta93UOBQfMggY0Jy1LaDWA1sMMZuKs8s=
X-Received: by 2002:a17:90a:bb96:b0:26d:291b:cfc7 with SMTP id
 v22-20020a17090abb9600b0026d291bcfc7mr169830pjr.45.1693507317351; Thu, 31 Aug
 2023 11:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230830103620.3611761-1-Naresh.Solanki@9elements.com>
 <20230830-waving-stinky-d510fefbbf82@spud> <CABqG17hvSYbsnYYGOQxVsiXsqLXFnovXvkhgc=pYR9osgF0-1g@mail.gmail.com>
 <20230831-defrost-rebalance-5efda5e5ff5c@spud>
In-Reply-To: <20230831-defrost-rebalance-5efda5e5ff5c@spud>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Fri, 1 Sep 2023 00:11:49 +0530
Message-ID: <CABqG17hxe+mn_qiXQ8ikPcU32KrU__FqkVaq_Aam=w_yF7qTkg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Add Infineon TDA38640
To:     Conor Dooley <conor@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On Thu, 31 Aug 2023 at 21:24, Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Aug 31, 2023 at 12:49:32AM +0530, Naresh Solanki wrote:
> > Hi
> >
> > On Wed, 30 Aug 2023 at 21:02, Conor Dooley <conor@kernel.org> wrote:
> > > On Wed, Aug 30, 2023 at 12:36:16PM +0200, Naresh Solanki wrote:
>
> > > > +      Indicates that the chip ENABLE pin is at fixed level or left
> > > > +      unconnected(has internal pull-down).
> > >
> > > Maybe you've already been over this, but if the pin is called "enable"
> > > why not use the same wording in the property?
> > EN & ENABLE is used interchangeably in the datasheet.
>
> Maybe we can go 1 for 2 in terms of consistency then, rather than 0 for
> 2.
Ack.
Will go for EN as that's what is mentioned as pin name in datasheet.
>
> > Just to keep property name short I use EN.
>
> Consistency & readability trump brevity. Please pick one term, or point
> out that this is called two things in the datasheet.
Sure will pick one. i.e., EN. EN is pin name & description as mentioned in
datasheet is 'Enable pin to turn on and off the IC'

Regards,
Naresh

>
