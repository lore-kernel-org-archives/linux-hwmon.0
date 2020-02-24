Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6404C11D30
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 16:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C66E20836
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 16:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUz1IMYq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbgBXQ1i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 11:27:38 -0500
Received: from mail-pf1-f181.google.com ([209.85.210.181]:33531 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727160AbgBXQ1i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 11:27:38 -0500
Received: by mail-pf1-f181.google.com with SMTP id n7so5632858pfn.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Feb 2020 08:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4qlZlyxODTNALgXeX6porAtMQ2IiKziyB9UiK16e2Vc=;
        b=kUz1IMYqPSAUzjEVY7tJeixK7Jnd+3wX1UAJr/O7PtlXQaH3ocxk1nc/RIwJ9aBJhf
         Qxlnt8TLni6koXNa0Pp/iDGLdCCCOdkGGJDSLL8zwg2hcPDQCBf4S/LkvxTFi0mGjqtp
         Jv9ZvTiV9DHRfxdsNfX6wMnyOknWLRT7Tntn38xuYlV0Fpex9Y8hKvz4I4uubWtlqSUg
         A+V2hdxvOkF2QSZzwUm8K93xE73xVdf9m48EEnNaNKj03ZGFwuWfBJqrtr+FdCQzczFr
         eT+8xAktdWajn2Q1klOfJmr2UT2MlDKEpPwslM0Wf2RkzGvU6LNiCGZdHnqVHkh7CGQf
         9uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4qlZlyxODTNALgXeX6porAtMQ2IiKziyB9UiK16e2Vc=;
        b=gptt1rl5bvTKqhuHIrkyqOHLH8V88nW4bC1+Oytomq3phnvqOLZpSh9oHtof2CxDgu
         FIHz31dJD+JjJ4h3KTONHVNKeI454jYRkBKUN/uND3pXoZPOPCmRnffsesRQ/veaoTAc
         OGnZJV9lEn2A6oHYrZJ+HPiU22HC4jkA5k+Nh4C3YkPlz1vjBWnoOl+P+nLymOvhJo7N
         VA4B4nmF6+I6T7kgH41FooGi3CR1JBW+MBJr/Io/Su0n07L/rRJ7n+4CJ+eoxNb4qG0M
         bhLMSfMU9FFKKVQZ8h+D2bBQCYRoC7FaufpcJxDCEGjNAd4BEnNBnRDu0DaP9Av9hXs4
         Rk/g==
X-Gm-Message-State: APjAAAV0NPcAFSclhk5M3mJRMiocIq5wDoIUCo64FSAjOl06fgk7YBhf
        d/FlTUt77TA6r2/YpdzHVQC9bwNr
X-Google-Smtp-Source: APXvYqwstafDQ/j3JwC4x3mRXP9VohZu6jK/UtEsruEHz+H3iuKMc8Sb8bq68owjkZyQneU0yZ5TUg==
X-Received: by 2002:a65:4647:: with SMTP id k7mr54211195pgr.11.1582561656311;
        Mon, 24 Feb 2020 08:27:36 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b98sm13962429pjc.16.2020.02.24.08.27.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 08:27:35 -0800 (PST)
Date:   Mon, 24 Feb 2020 08:27:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
Message-ID: <20200224162734.GA25424@roeck-us.net>
References: <20200224131316.28238-1-vadimp@mellanox.com>
 <b9b2d96b-1b1d-7445-18a7-21e3d28e6819@roeck-us.net>
 <d38525ac-e7f2-970b-5c7c-e0a84d492492@roeck-us.net>
 <DB6PR0501MB235847DEC43DED481A0553EDA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB235847DEC43DED481A0553EDA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Feb 24, 2020 at 03:44:04PM +0000, Vadim Pasternak wrote:
> 
[ ... ]
> 
> When we discussed this feature I asked:
> 
> >> Can I assume that most i2c controllers support "smbus_read_block",  or 
> >> it's better to read with
> >> i2c_smbus_read_i2c_block_data() with size 5?
> >> 
> And you replied:
> > I use i2c_smbus_read_i2c_block_data(); that is what it is for.
> 
Outch. I must have had a bad day when I wrote that. I don't think
I ever used it; I always use i2c_smbus_read_block_data().

Sorry for the confusion.

Guenter
