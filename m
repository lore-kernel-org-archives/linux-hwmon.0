Return-Path: <SRS0=M5ZX=6J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B2AC55191
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Apr 2020 16:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D7EE20714
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Apr 2020 16:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf0Lr/6C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgDYQtl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Apr 2020 12:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgDYQtk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Apr 2020 12:49:40 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86466C09B04D
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Apr 2020 09:49:40 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x23so10315469lfq.1
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Apr 2020 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p97voc/Orq8NeVdYc47x5QeKAMuvOkEH+98Lj6Y3Log=;
        b=Gf0Lr/6CUEFqBI+FxleOdp888Tp6lZdcfdjmEY4F+JfWxG+zU/vUIRS3IbO0HtKeAA
         dTn11fQK9tPqCIDMhsMss3/qVHv8YzRLKvn9xw633GgFDlG/wSMWVctq1OxGBH0FwvTb
         b8XKiEKhCJWBJhDnjJj0R+4gpgAitgwO02sHAk6xnZ0a8euW8PKaIeXDzfdnntKIrtJ0
         HggtfNHlnAsvH8RNtyMGHO72XrJOR/h1kKqZLMZsIVtFtysi8K5fiLFWrtaY3ok1AxEi
         KvoaJG7FJXoz/QXf3ikrqpMDlqIRRnKrwexAgNY5B+Rm0tPvJ74uefCdHOfO+sbus+j6
         9b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p97voc/Orq8NeVdYc47x5QeKAMuvOkEH+98Lj6Y3Log=;
        b=LYWsg9qmXi1VhI7lKRThrawwpRTF0cULNug2TbRmZhgvJnujAeJu7mLHQV5qUK0lwi
         cZFrNG72EOfkHAERtBeXq1xVYycEF01A0p/yzr4qfME/K8/Q0RVg6djCFgJsMHnZ2kLL
         jmrLyZ4ufv8EuzG7QDAA5ZqJzHNuHMQcjQs/eepBG+VMNeOpyOiuVSbB+2S9lazSUX6S
         1vvVH/eMqeojQATT3P56lds5bP1lZZvkoFCfvwwSY9lTli1y11YdEHhJgelBxKqgnIhD
         ItDecNUh9gaBs7A3yxIqWIQAE6+peVx+2l2+6JEt+oYdt6NnpavMRNAJ9E8jnVt7J/ln
         OlRg==
X-Gm-Message-State: AGi0PuZZ9mlpeWTVnJdYgfAe77LFQFerwo7iKdb62hbeuYNl0t1obtOA
        x934OoPTSelpbUmE4LKg6x0EIb2oUZxvm3Rc2b0=
X-Google-Smtp-Source: APiQypIvfOcp19/id2IrSnA8+SeP+MeFUVOtg2WzuA4WiRfh3ouscyOh4P4LPieU0VJcv5JYEadAR+86pDMd3y7UsvQ=
X-Received: by 2002:a05:6512:308c:: with SMTP id z12mr10022101lfd.195.1587833378968;
 Sat, 25 Apr 2020 09:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200425154112.GA2170@roeck-us.net>
In-Reply-To: <20200425154112.GA2170@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Sat, 25 Apr 2020 22:19:27 +0530
Message-ID: <CAHfPSqC2b3Wj4GR0FuE2j55foAj=mZ1pCerRuC=BF0AG3FWbzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hwmon: (amd_energy) Add documentation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Sat, 25 Apr 2020 at 21:11, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Apr 24, 2020 at 08:50:55AM +0530, Naveen Krishna Chatradhi wrote:
> > Document amd_energy driver with all chips supported by it.
> >
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > ---
> > Changes in v4:
> > None
>
> Still:
>
> /home/groeck/src/linux-stable/Documentation/hwmon/amd_energy.rst:36: WARNING: Unexpected indentation.
> /home/groeck/src/linux-stable/Documentation/hwmon/amd_energy.rst:40: WARNING: Unexpected indentation.
> /home/groeck/src/linux-stable/Documentation/hwmon/amd_energy.rst:44: WARNING: Unexpected indentation.
>
> Please run something like 'make SPHINXDIRS=hwmon htmldocs' and make sure
> it doesn't report any warnings.
My bad, I was not aware of the indentation in the Documentation.
I could Identify the issue. Thank you for the tip, will keep this in mind.
>
> Thanks,
> Guenter



-- 
Shine bright,
(: Nav :)
