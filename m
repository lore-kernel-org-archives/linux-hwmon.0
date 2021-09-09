Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24445C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 17:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0294961104
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 17:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238789AbhIIRDm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Sep 2021 13:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237002AbhIIRDm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Sep 2021 13:03:42 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D57C061574
        for <linux-hwmon@vger.kernel.org>; Thu,  9 Sep 2021 10:02:33 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id c79so3326621oib.11
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Sep 2021 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U6MEcy+G6Yz1WT6At+QNSoA00qn63XdwzabX0DQkqdA=;
        b=i3McpO44j2JpwFIc/KzgxEamMiDFTP/MleyfQCic+m6P7afF0lgECimefQuI78L/lt
         hRI0nxGpwF0y38HeNcSfUWbPO12co77aD5UVZKjxrlxEtvJDSLo8pT3uYJOA9ps+saj7
         bdSLblYXfY0XwBPplg9h27XOMgn4L3ulRnJI4/WQVxMD+/uxqLxcyFEj6C8EEZPc1zWQ
         2SsxzArC51M/z8bphtFzy9Knm34CysCpU2NttAjvWO5lO1Bt2nm3LfQ3v/k/BjixcaRy
         M4lJx6VX7JjttZf3/E3+l1GCZjl0hFJyZGfwE4a0WCpWaddFn1j+KZCMORHjMTRIEoo8
         LmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=U6MEcy+G6Yz1WT6At+QNSoA00qn63XdwzabX0DQkqdA=;
        b=A4zgNXJn+ryVf6YHU/l/xfBS6aphodj3nQ4pv8M1JFDtELODySW9d/xR7LKGLAVyBI
         ecfGVafMG3zsCTCcfkIFiTiAWfYpu5jwC7S04hKTTXHD2RRfuuzoIBIub3paNwDtugAx
         cuhM3i1x8vq7ZcY/8V+TDcXTf3TVPlnQaT+qIdxcgXkYip3evIC5I29B4H6D1AMVOUyu
         5c7HKnp7OPs/UqVxrsJR7OB+qjcAuo3sjynLXC3YPCYWHURtmrYIJU/VFEG0m1LTNWyg
         PFKGcWFHdYQezERJIJvOVGFbLwC6fABHdJ9FKOD64TkGgpDXgUq8ijh41I/Wm+yY98At
         9Cxw==
X-Gm-Message-State: AOAM533lKrIYMbRbV4yJfMuSuzH8uf3ST1chjNHtxGyJHZjoXIg1qPQB
        EwnBeiorz8z+BpRmkJdaUA/pFkimtp4=
X-Google-Smtp-Source: ABdhPJwA+qxF+krh/tix+onlHfVvgU9LuyNSnaFiyOhCD9eVyA+xs9yklr9Fh/mVHlbtm4V0pF8nBg==
X-Received: by 2002:a05:6808:1918:: with SMTP id bf24mr711153oib.50.1631206952411;
        Thu, 09 Sep 2021 10:02:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c75sm505494oob.47.2021.09.09.10.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 10:02:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 9 Sep 2021 10:02:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Oskar Senft <osk@google.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: nct7802 mode selection for RTD1,2,3 via device tree?
Message-ID: <20210909170230.GD3973437@roeck-us.net>
References: <CABoTLcTEjKYwnFS1dB+-rGCM9BYvFBY1T1_M0OpdjqAy+M8SCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoTLcTEjKYwnFS1dB+-rGCM9BYvFBY1T1_M0OpdjqAy+M8SCQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 08, 2021 at 08:39:23PM -0400, Oskar Senft wrote:
> Hi everyone
> 
> We're successfully using the nct7802 driver on a TYAN S7106 mainboard
> connected to an Aspeed AST2500 BMC running OpenBMC. However, on this
> board the NCT7802Y has 3 thermistors connected. For that to work, we
> reconfigured the "Mode Selection Register" (0x22) to have RTD1_MD,
> RTD2_MD and RTD3_MD set as 0x2 (Thermistor mode). So far we simply had
> a one line patch in our internal kernel repo, but we'd like to
> upstream it and make it configurable.
> 
> We explicitly reference the nct7802 in our device tree. Example:
> 
> &i2c0 {
>     status = "okay";
> 
>     /* Hardware monitor with temperature sensors */
>     nct7802@28 {
>         compatible = "nuvoton,nct7802";
>         reg = <0x28>;
>     };
> };
> 
> Note that the DTS validator complains about not knowing about
> "nuvoton,nct7802". Is that because the driver doesn't specify a
> MODULE_DEVICE_TABLE of type "struct of_device_id"? I'd be happy to fix
> that, too!
> 

The message is seen because there is no .yaml file for nct7802,
and it is not in trivial_devices either.

> Anyway, I was wondering if there would be a nice way to set the
> configuration for RTD1,2,3 from the device tree. I'll be happy to make
> the necessary changes (there are plenty of examples), but I wanted to
> check with the community and maintainers before going down any such
> road.
> 

Sure, all you need to do is to define the bindings and get them approved.
From there I'll be happy to accept the necessary patch(es).

Guenter
