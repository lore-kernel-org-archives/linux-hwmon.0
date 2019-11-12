Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A399C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 16:35:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D36962084F
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 16:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezHsXq64"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfKLQf1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 11:35:27 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41812 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbfKLQf1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 11:35:27 -0500
Received: by mail-pf1-f195.google.com with SMTP id p26so13731363pfq.8
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2019 08:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EaPXOh6xM3m0jUHzGL0Mf6qRxhaBbvP46g40Pz2Afjw=;
        b=ezHsXq648C4og9q+X76LLX659EAlWoyf2d4/8Mb4lHoJKaTPJEUA0EuSExYd5caP8J
         cJr+UMLQgUIBxmvPIL1qpFunU8/TSaLL7l3SucDdPk/fvXKroacJ577GlkweiNW+k3Ek
         p2P/PNsWh9ncbzRTfDFG6VheJGhl6XLUpTItXIAV4XSrsDRlisYU76ubnLYTadzDTOm7
         9DjvqYriqrqrv9400/o0DX7gxa3Grv8WKJzsDjHOwnacJUyR1TMmxkg6oFVhtNFpxEu/
         2Fm4xiA5Q6DArosCSNDBXEhPXHRB1+op8bKrq4i9jklxn12+6BD208ArjMVM7jqu8O/m
         R5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=EaPXOh6xM3m0jUHzGL0Mf6qRxhaBbvP46g40Pz2Afjw=;
        b=Gp5Svks/p+8S1yPvHAxg2szRsTuJl4rHyyXRRUXEwHl7itK48YPdUPzpkAYbn2tFPr
         aDDl1Xokz7l0/bnAgcYY5B7VLtn9SRxe+AkSzrKbyR3neAd5yhS8CwxHUbqMMY40aE/y
         QFQ1a11vGxsHNXFWT8ZnZf7UVL8V74zuJONF99WwBnvBZKGjobemaG79puPavziWzXvZ
         Kb5yQjRIe5FFBQ60+Oo+t8y4qhOaGELkS+R4tRDe/yqcmsqrH2pI/w/dRlV0kC0N0mwq
         sXZHre0TXA1eWQ34NQiKBz2bgHYmCQssqaJYc/UyU2KSxX5e6j04lxdzO5MyDiil6SVw
         gM5w==
X-Gm-Message-State: APjAAAWt6y8lODAnuSlMQtbAIiO6thbROacyPUlI5gkvuCluL9gbJFUt
        KDVBA+Oh1wlx7kZZTUII320=
X-Google-Smtp-Source: APXvYqwwb1tr95cSpt3fTYC17da1UbfBzFXxAniNMO3nHvjy4LJwdwC5wavglB+Zl/8u4ZpWDR0Wpw==
X-Received: by 2002:a17:90a:ec07:: with SMTP id l7mr7588481pjy.68.1573576526503;
        Tue, 12 Nov 2019 08:35:26 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y1sm20185576pfq.138.2019.11.12.08.35.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 08:35:25 -0800 (PST)
Date:   Tue, 12 Nov 2019 08:35:24 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
Message-ID: <20191112163524.GA26911@roeck-us.net>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
 <d3c0c9a7-00b9-0465-16e1-6fd7ba97dfd0@roeck-us.net>
 <CAC5umyiju2Q2fdfVaFyX+Q=sMKr5Gsc_GDVYmSa0vB+w8acvAw@mail.gmail.com>
 <20191111173505.GB5826@roeck-us.net>
 <CAC5umyjviR1J5HojE6WBhYQCzu=CFPPoNxXY=T9KRw2yTpO=VQ@mail.gmail.com>
 <e2699eee-8ca2-fcf4-d6b2-624cbddd4c6d@roeck-us.net>
 <20191112150659.GA12493@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112150659.GA12493@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 12, 2019 at 04:06:59PM +0100, Christoph Hellwig wrote:
> On Tue, Nov 12, 2019 at 07:04:38AM -0800, Guenter Roeck wrote:
> > The Intel NVMe has the latest firmware version installed, so this isn't
> > a problem that was ever fixed.
> 
> What Intel device is that?  If it is one of the XXXp models, those just
> seem some of the most buggy NVMe SSDs around unfortuntely (excluding
> the Apple ones that don't actually claim to be NVMe at least).

SSDPEKKW512G7; this is a 600p model.

Guenter
