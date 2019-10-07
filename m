Return-Path: <SRS0=YDtn=YA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D2AC47404
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 22:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A7D82133F
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 22:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECUcFQoY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbfJGWyr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Oct 2019 18:54:47 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:36719 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729244AbfJGWyr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Oct 2019 18:54:47 -0400
Received: by mail-pl1-f178.google.com with SMTP id j11so7577763plk.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Oct 2019 15:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pcJe5TUW41ndF7pAiFiEDjLKJXo5asCbzlXSKZKxkDg=;
        b=ECUcFQoYkmod1of9Fh0w8LiL9PTXteISUJ+5waC21YyC6GJsOc6S1wOztKoCGUazCv
         +VFf873Vysh7Dayi2qA5OQGgpzxnBynUFO/GIUxfA1DgUgXTAIJrDfPInPwKdgZ/riFn
         k7mUGjn8QD0qoHl/mkfGh/Aml8eUgQANMp1ISIrR7aoY6UZdc5f72nK8IH0U7thU0cb7
         dHlOOV5rCRYAMHWOhKYZ5ffhsRfuwt3Oq5kRfjtOQYKZoPX2l+zzum8Wr9Zf4f2MQaqA
         qkhAU6J9LP+TvJLp0SFBx0Xk0j4Wb1BEt4SQJWAzQTfLCPpyR3a+eOQQXHS4Xi79IrWs
         iIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pcJe5TUW41ndF7pAiFiEDjLKJXo5asCbzlXSKZKxkDg=;
        b=ifJ4C3gS1GnvMvPtHzSDUNDmgupT/4mTVk/m/AhcdO39bupscs6dkYwCpKnxXjdIWI
         JSo/7mmyqbjWdxZPMqXXmHP/vXjTA9DrQzW6Wmnnk1RAbsGvaI7eJTqnDZmvuHYi81VV
         tVtcyKVb/OfznPLehwkNOUX1wQR8ubFKTQrPh3js2jFIFg+WVm+gzjDxYFnzHhQryXuT
         vSI3d7dvbgfIyYjzpKLdm/dnkNdI/geQVIc9Y3i5pLpHGoZWPn/msQcJmndc+l742ei3
         3bQfRVzvDOJnNe8/BOPXwL4xfAw66MoFOqxd1b7ZwM4w/MQVbBcVi9DNGWE6n8Q1uGwR
         7Ypg==
X-Gm-Message-State: APjAAAW38kItkx+khNut1z49+EVCH0aOOB4gHsGsXjTdNrRGmdHJXxS8
        22aYhsoeAMtI6W8RpgyUYNap6//Ezjw=
X-Google-Smtp-Source: APXvYqxZw27SvUvJy964O8apZ4V+us8nWjso1TZbsqskTlJpBsyAwmcxl+8jqPXLog/g7ipq8AjkKg==
X-Received: by 2002:a17:902:14f:: with SMTP id 73mr32727435plb.57.1570488886629;
        Mon, 07 Oct 2019 15:54:46 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id s21sm3516903pgv.37.2019.10.07.15.54.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 15:54:45 -0700 (PDT)
Date:   Mon, 7 Oct 2019 15:54:09 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: ABI for these two registers?
Message-ID: <20191007225408.GA3579@Asurada-Nvidia.nvidia.com>
References: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
 <20190912183218.GA5065@roeck-us.net>
 <20190912210957.GA21945@Asurada-Nvidia.nvidia.com>
 <20190912220947.GA8072@roeck-us.net>
 <20190912224528.GA24937@Asurada-Nvidia.nvidia.com>
 <20190913001237.GA31111@Asurada-Nvidia.nvidia.com>
 <20191001221735.GA27958@Asurada-Nvidia.nvidia.com>
 <a863488c-29fa-394c-3e3a-2761d18a0052@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a863488c-29fa-394c-3e3a-2761d18a0052@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 02, 2019 at 10:03:11PM -0700, Guenter Roeck wrote:
> On 10/1/19 3:17 PM, Nicolin Chen wrote:
> > Hello Guenter,
> > 
> > It's been nearly three weeks. Would it be possible for you to
> > provide some advice on my latest questions? I'd like to write
> > code and submit changes once ABI is confirmed...
> > 
> 
> Non-standard attribute discussions always require a lot of time,
> since I have to re-read the chip documentation and try to understand
> the reasoning why the attributes are needed. On top of that,
> asking me "what should I do" instead of suggesting possible
> solutions for me to choose from takes even more time, which
> unfortunately I don't have right now. I'll try to get to it,
> but, sorry, I can not promise you a time right now.

Thank you for the reply...as I can't submit changes unless ABI
is decided, I will be waiting for your further reply.
