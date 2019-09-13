Return-Path: <SRS0=xywD=XI=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37319C4CEC7
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Sep 2019 00:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0165920684
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Sep 2019 00:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yao0EwSv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfIMANC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Sep 2019 20:13:02 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:34999 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbfIMANC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Sep 2019 20:13:02 -0400
Received: by mail-pl1-f182.google.com with SMTP id s17so7553068plp.2
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2019 17:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BVpnHRleMcBL/RSuJjEWLYKnaefaFiEJtPdLUKyg97Q=;
        b=Yao0EwSv2MKiADXhNd8dXelQ65WSVY3pa/GlQsAbKZBAAxLtA3Q0NmMH4GzdPNM/fx
         kfcxfmkZImV+n6p5Co4CaXk4eZZCFyEMZI3Y6q2qi72Z2KUXBpsSxR8mmdrK78eHYTrU
         cOii8G6gNCqhQovXth4MDCvgRlH7RYDAs2nFtFZdOhI4D516pSj7er2D8tZsG+UPMgmD
         HBfeSiy44CkrClsfN/+P8uaPoTWrOXxslkPJKuWMivd2PChd1CUCE6MP3qSH3AdeZmYp
         nFoXuefIJ3w155lsefWaIdSSRaVIq5ZbHykF8SO6Kxaw5sr8KnWGS01XIxaReeDvZEvT
         YzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BVpnHRleMcBL/RSuJjEWLYKnaefaFiEJtPdLUKyg97Q=;
        b=PW3/VyjuCqyhMhSVUJOcaTEmQe7sLThMGO9LwjpavDpSgdIC9yFNegRiOZZEo7XQp+
         jULSgF+/IbGZUjv0eI27Y4dDu2+oMUFoM0I2Z++4gkNzQwHso8T4k2XddYBkL7/2RqYi
         FuVduXeihHxcxuFBK8rzNE0QN0zZsI2RzBZqjItAzxZucgneF5l46rY43K0t5JGz/dqw
         6FrdM1zm8c6YxnYnyQBqTb6zbCmeQn0oYcg2Yc1UcyfANMNLZzmvLjdrkQb5h2Z5IezA
         pvNi3qUI3vSNuzksQCt5CewPGiVYvAf7YfUq0NsWScBCN/Hio2vOT3RmCJS17qY1cogq
         jqBQ==
X-Gm-Message-State: APjAAAX+Nt8Rj4YFya5jxMMsXaVmPCi7ETZ+y4hkwLypZHUdQAbm/o54
        FvFKC8cmPhD0n9q3WaCI8kuC5NRm
X-Google-Smtp-Source: APXvYqx3DxreQysqn+lrRQmzxmZC3WSn1BAB1G8feAT4kwIOhIjOFiyZ8YTJS9xxMY0hlBHUmaZhNw==
X-Received: by 2002:a17:902:8506:: with SMTP id bj6mr46778211plb.79.1568333581513;
        Thu, 12 Sep 2019 17:13:01 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id h3sm4896177pgb.13.2019.09.12.17.13.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 17:13:01 -0700 (PDT)
Date:   Thu, 12 Sep 2019 17:12:38 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: ABI for these two registers?
Message-ID: <20190913001237.GA31111@Asurada-Nvidia.nvidia.com>
References: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
 <20190912183218.GA5065@roeck-us.net>
 <20190912210957.GA21945@Asurada-Nvidia.nvidia.com>
 <20190912220947.GA8072@roeck-us.net>
 <20190912224528.GA24937@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912224528.GA24937@Asurada-Nvidia.nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 12, 2019 at 03:45:29PM -0700, Nicolin Chen wrote:
> On Thu, Sep 12, 2019 at 03:09:47PM -0700, Guenter Roeck wrote:
> > On Thu, Sep 12, 2019 at 02:09:58PM -0700, Nicolin Chen wrote:
> > > Hello Guenter,
> > > 
> > > On Thu, Sep 12, 2019 at 11:32:18AM -0700, Guenter Roeck wrote:
> > > > On Wed, Sep 11, 2019 at 05:28:14PM -0700, Nicolin Chen wrote:
> > > > > Hello Guenter,
> > > > > 
> > > > > Datasheet: http://www.ti.com/lit/ds/symlink/ina3221.pdf
> > > > > (At page 32, chapter 8.6.2.14 and 8.6.2.15)
> > > > > 
> > > > > I have two registers that I need to expose to user space:
> > > > > 	Shunt-Voltage-Sum and Shunt-Voltage-Limit registers
> > > > > 
> > > > > Right now in[123]_input of INA3221 are for voltage channels
> > > > > while in[456]_input are for Shunt voltage channels.
> > > > > 
> > > > > So can I just use in7_input and in7_crit for them?
> > > > > 
> > > > Doesn't Shunt-Voltage-Limit apply to in[456]_input ?
> > > > If so, the limit should be attached to those.
> > > 
> > > The initial patch of ina3221 driver applied Shunt-Voltage-Limits,
> > > being named as "Critical Alert Limit Registers" in the datasheet,
> > > to curr[123]_crit, corresponding to curr[123] and in[456]_input.
> > > 
> > > And this Shunt-Voltage-Limit-Sum is more related to the reading
> > > from Shunt-Voltage-Sum, which we just agreed it to be in7_input.
> > > 
> > You didn't say Shunt-Voltage-Limit-Sum earlier. You said
> 
> Ah....right...it's my fault. Sorry.
> 
> > Shunt-Voltage-Limit. I would agree that Shunt-Voltage-Limit-Sum is
> > associated with Shunt-Voltage-Sum, but, again, that is not what you
> > said earlier. Confused :-(
> 
> So, those two should be in7_input and in7_crit?

And a couple of more questions upon it:

1) There are 3 control bits for the summation of this
   shunt-voltage-sum register to enable corresponding
   input channels. But in7_enable only allows users to
   en/disable all three channels at the same time. So
   how should I attach three enable bits using ABI?
   Or should I create a device-specific sysfs node?

2) We have a requirement of providing current-sum and
   current-limit-sum nodes, for use cases where those
   enabled channels use same value shunt resistors.
   It's similar to provide curr[1-3]_crit by dividing
   shunt[123]_resistor from in[456]_input. So could I
   deploy curr4_input and curr4_crit nodes for this
   requirement?

Thank you!
