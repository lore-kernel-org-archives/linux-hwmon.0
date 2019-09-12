Return-Path: <SRS0=SwvS=XH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2299C4CEC6
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 21:10:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C9A920856
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 21:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKzVihmb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbfILVKY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Sep 2019 17:10:24 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:33264 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfILVKY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Sep 2019 17:10:24 -0400
Received: by mail-pg1-f176.google.com with SMTP id n190so14134030pgn.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2019 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GPb67I9oQnubkc/njt5Um4x2e2Ifge29AHW5/xfuJpY=;
        b=GKzVihmb3PLqDhgpqlBg0PB1bYDTFlVM7RJ8OxZTS4lWbgci00ceYbANeJ+N1pmtui
         18XODhUjAWDAg8hD69KW3RQ4jUU2Gaq4Y2BHeQGYEcJowkC/9x0h9KSH0FoveTpVFyOn
         LaOnxR+q9aE7fFjCBtKqYlxvTvtE6WGLRyTfDBXRqOAKD4Q3+2BmSyv3WvNL4x68mtqV
         fqHUgT3bCpUVjZDJrUNjfke1tSeG6i+swER9CaroW2Lw2h0RDPx51bTUiRcZk0FibPv2
         Lw+/9NWFdj1ecItQsh1tnU5yT/pOu+op1etibA/SrikahHmHsZaiaBrwtxkDSSWRpCWp
         9HEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GPb67I9oQnubkc/njt5Um4x2e2Ifge29AHW5/xfuJpY=;
        b=RGhg+85FNTt1JxVFxOZAfEdWtIDxZbCXJ/xakniFiBN9+NfEu22qZA4ejhgCOlnLY8
         yeA+SY0zG2uKfOQXpnT4X4nqRVaEoLZp7wwOr4m4hrQ6V8HCk619vCDMi6hkie6kAcMY
         yoWVUXMVLAvikYCpJh7rs/MsY4W+jf69kyvaYKOPzpjZ6V2K2tMdtuQimzUpOlqxXwjU
         nL98DKyBbU9PuU5Q2VUjajo2LvTFKF3bqWGyu8oclNYlsJqOqnu3suOaHcfkhb+3d+r4
         Jw/uVruYvX4xM85N2xonrWLyP2dJXzFofNG/C2/6BwnjMnnGEVletmUpmsAGd1fUTOeV
         k9uQ==
X-Gm-Message-State: APjAAAVy2twk5rHls5vwgXTAAQyNbRYY22XvKT8FjWczwx2C1pFgDaSs
        ttLqD8q8sI8ezDcZOvg8s6AkwUAA
X-Google-Smtp-Source: APXvYqzVOQ7F6/WzfBeRzHeOS3vT2H3NLxW7lDjbAlIPlTPVrfHsSEw87sAqGAlPnL8m+xIuD4vlNA==
X-Received: by 2002:a65:4808:: with SMTP id h8mr39727986pgs.22.1568322621905;
        Thu, 12 Sep 2019 14:10:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id h3sm4741615pgb.13.2019.09.12.14.10.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 14:10:21 -0700 (PDT)
Date:   Thu, 12 Sep 2019 14:09:58 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: ABI for these two registers?
Message-ID: <20190912210957.GA21945@Asurada-Nvidia.nvidia.com>
References: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
 <20190912183218.GA5065@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912183218.GA5065@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Guenter,

On Thu, Sep 12, 2019 at 11:32:18AM -0700, Guenter Roeck wrote:
> On Wed, Sep 11, 2019 at 05:28:14PM -0700, Nicolin Chen wrote:
> > Hello Guenter,
> > 
> > Datasheet: http://www.ti.com/lit/ds/symlink/ina3221.pdf
> > (At page 32, chapter 8.6.2.14 and 8.6.2.15)
> > 
> > I have two registers that I need to expose to user space:
> > 	Shunt-Voltage-Sum and Shunt-Voltage-Limit registers
> > 
> > Right now in[123]_input of INA3221 are for voltage channels
> > while in[456]_input are for Shunt voltage channels.
> > 
> > So can I just use in7_input and in7_crit for them?
> > 
> Doesn't Shunt-Voltage-Limit apply to in[456]_input ?
> If so, the limit should be attached to those.

The initial patch of ina3221 driver applied Shunt-Voltage-Limits,
being named as "Critical Alert Limit Registers" in the datasheet,
to curr[123]_crit, corresponding to curr[123] and in[456]_input.

And this Shunt-Voltage-Limit-Sum is more related to the reading
from Shunt-Voltage-Sum, which we just agreed it to be in7_input.

Do you mean that this Limit-Sum should become in[456]_crit even
though it only has one value, related to sum of all three shunt
voltage channels?

> in7_input for Shunt-Voltage-Sum would be fine.

Okay. Will add in7_input for Shunt-Voltage-Sum. Thanks!
