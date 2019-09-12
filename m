Return-Path: <SRS0=SwvS=XH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B6BC4CEC7
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 18:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6F9A2084F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Sep 2019 18:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkM2H7O0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfILScX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Sep 2019 14:32:23 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:33288 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbfILScX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Sep 2019 14:32:23 -0400
Received: by mail-pf1-f178.google.com with SMTP id q10so16523838pfl.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2019 11:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WlsHr18zrjSKp+ynO23cXeEI8P/fpwolSlN4tSUOuGA=;
        b=hkM2H7O0RBDTxAAbuIQxAYtnkjhFurZUyaAU/KZgpgNkNXe3+0dbRWWcyT42xzlpV8
         AbPDVvZHLnsXRuVsGKHuS61MuUgwutORFIv0i3qWk3KZNj25g8LzPqNVSyJ1QoCkBTTi
         JVq7IiCC08Zks/K4L3bjgTv5g70YscnWdyC3qrRsyDdI3NWSLF3aIpZruIJD8sgKpmQ6
         wOoqwWkAXocbrXJbS2U1KsI+mWlLtvNtGuDKV4LMACu48HV7ZauLHMqGK8avRFzPSgaF
         HTsBEZksuAvBf9R0c6W2uF0LGBh+32Iq2Y+tLZoVjRoIClVYlxJiWHui762b5pnnfVA7
         Z5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WlsHr18zrjSKp+ynO23cXeEI8P/fpwolSlN4tSUOuGA=;
        b=Hpq35gmCNozFkqZqhoKsGbZ5afhND9e1WLnQk8Sg64zgNLZmtBKTr+yTX7e2LOa4QK
         /kdRcuuoZNOcbf8wOQPnhyJZZTXlDKrlBpXtEgVDIC6LKNmvlHqzuImd2aR8yCCLMWqI
         TKkO4asri5OmEZ6FRmTh9/H+aaoT6oyQsB77su+IxeNfeUAAnilq9cAros8qh3NG2UZt
         8SmRBVb0mNeGosF4xQYk9ai/nFwx9eNGLQs9qTIrl10NqeiYHPWfi2nar9yqFpLdYS2I
         UFyOnAmEVq9B2yCtNgKO02zybFn06jAkzamhsA7n8BEmGhBntC6WxUtgPWtVYm8jPb9a
         ezsw==
X-Gm-Message-State: APjAAAXPrS0pmqXDqhuj5InGlRzUlERbu+Y8vlNBcIvb0ydpUeRKqHze
        Iw/3+TTj4m2MXzfPDRixds36+JXW
X-Google-Smtp-Source: APXvYqxnNrAQ5xQun/jm6+JlOQVMyqlOvjmpDE6OkSsvgLMd3LExFj/O/hACs54T4iMjf33KCzaatw==
X-Received: by 2002:a17:90a:2ecb:: with SMTP id h11mr25696pjs.108.1568313140962;
        Thu, 12 Sep 2019 11:32:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q21sm28920273pfh.18.2019.09.12.11.32.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 11:32:19 -0700 (PDT)
Date:   Thu, 12 Sep 2019 11:32:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: ABI for these two registers?
Message-ID: <20190912183218.GA5065@roeck-us.net>
References: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 11, 2019 at 05:28:14PM -0700, Nicolin Chen wrote:
> Hello Guenter,
> 
> Datasheet: http://www.ti.com/lit/ds/symlink/ina3221.pdf
> (At page 32, chapter 8.6.2.14 and 8.6.2.15)
> 
> I have two registers that I need to expose to user space:
> 	Shunt-Voltage-Sum and Shunt-Voltage-Limit registers
> 
> Right now in[123]_input of INA3221 are for voltage channels
> while in[456]_input are for Shunt voltage channels.
> 
> So can I just use in7_input and in7_crit for them?
> 
Doesn't Shunt-Voltage-Limit apply to in[456]_input ?
If so, the limit should be attached to those.
in7_input for Shunt-Voltage-Sum would be fine.

Guenter
