Return-Path: <SRS0=ADoj=2I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB16C43603
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 23:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48A7C21582
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 23:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhutN0a4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfLRXZk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Dec 2019 18:25:40 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41521 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfLRXZj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Dec 2019 18:25:39 -0500
Received: by mail-pl1-f195.google.com with SMTP id bd4so1664694plb.8
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2019 15:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=by+2zXZ9D0W2jbyPiMVzRQOrsmDpsL5Q7Ho+sFmiPek=;
        b=AhutN0a4brrp6iuyeIpVg2vjU5mtasqLj8PhMQf4eu1mCAeLgTZQb+GicY60k/F3Nj
         MMIRv3jiRTma5gazG+/o3KZCqO9UAlfIJyaDT9PGl7Me8FK3hWpOmui8vaophSgppOpX
         Cd2MXdqQHUr9pUAyvp2keow4FDHHANk3MWoWQJCaa8WeSpPT7pat0ngxxi56k+R7HsKG
         /+yWMnchI1/kzNQV/ACBAHbTR+uWvw4FtPnG4VdQiHy1LOX2Ldlh7NF1M00ngWRBzCxl
         QR/xeM75/eK6aQ+tEzu2UzTTAxzMFegKpbGyDb0DIyMw1kwjfFmYzoaht7MivI5BITQE
         mfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=by+2zXZ9D0W2jbyPiMVzRQOrsmDpsL5Q7Ho+sFmiPek=;
        b=Dlx+SUP0+t4X3h7wn12V/836tn5XXKbzFg75PkBKy+2tsFA3Dq7+4dvpL4kpR1a7JC
         Bo0oFKYOZNu9lahK79gbE2mAuzapL5h094n6loxL2gFlDgkf8pJMoxDLUCgoLy+zOeX1
         1PePNIZXbB2jGTCS8EL1CMO+xyvY+oQOALNTtsBncSm+GiYHrElmONJbTh7MCHycKI8s
         PgumoMtJoGOTgu3lFb3kxFT5mOASUGB1bLLC8FYxXsXAjauoT1cmyuAym//ZyetqJWpL
         bWtt2bxKPYuVD6s0XTNPs30w8oJODGUThVXCd4xCGnChSof/1vuCCEa/mk4Za0EJMPx8
         U76Q==
X-Gm-Message-State: APjAAAXUUutAJZ7AmuMen7f8joWs51DF1TfHjGMQu9ZUeu1y+wmvklhV
        FNcTI3OrArkZGXjMfFwD3xU=
X-Google-Smtp-Source: APXvYqyX0CGco/HI1LWR6ui2Vm6Gb7u4oet0T5xHEEascC6uVitMFiN8IeZhPavB1T5mqv1c8MJ0dQ==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id h13mr5879697pjc.1.1576711539149;
        Wed, 18 Dec 2019 15:25:39 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f127sm4960763pfa.112.2019.12.18.15.25.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 15:25:38 -0800 (PST)
Date:   Wed, 18 Dec 2019 15:25:37 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Logan Shaw <Logan.Shaw@alliedtelesis.co.nz>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/1] hwmon: (adt7475) Added attenuator bypass support
Message-ID: <20191218232537.GA24464@roeck-us.net>
References: <20191218024238.19836-1-logan.shaw@alliedtelesis.co.nz>
 <20191218024238.19836-2-logan.shaw@alliedtelesis.co.nz>
 <5f444fb6-4acc-031d-45bb-93e5384d9a40@roeck-us.net>
 <ea991d7654aae9af95c6aa8e2da1b87486f90215.camel@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea991d7654aae9af95c6aa8e2da1b87486f90215.camel@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 18, 2019 at 04:30:39AM +0000, Logan Shaw wrote:
[...]
> > 
> > The datasheet for ADC7475 does not say anything about the ability to
> > control
> > attenuators other than for vcc in configuration register 4. Bit 4, 6,
> > and 7
> > are listed as unused/reserved, suggesting that those bits - if at all
> > - are
> > only defined for other chips. Nothing in this patch suggests what
> > those chips
> > are. Attenuation bits need to be validated against the chip type.
> 
> You are right, I missed including important details. The ADT7476 and
> ADT7490 datasheets specify "Bits [7:4] of Configuration Register 4
> (0x7D) can be used to bypass individual voltage channel attenuators".
> 
> My thought process was it would be up to the person configuring the
> devicetree to only add the attributes where appropiate (for example,
> not for a ADT7475 chip). I can see this is dangerious. Instead would it
> be acceptable to add a check to the load_individual_bypass_attenuators
> and load_all_bypass_attenuator functions that verifies the device
> supports setting the appropiate bits and if not return 0 immediately?
> 

Devicetree properties are acceptable, but not writing bits which
are not supported (reserved) for a given chip. How to implement this
is up to you.

Based on your feedback, and my personal opinion, I won't accept
new (non-standard) sysfs attributes. Note that I also won't accept
C++ style comments in this driver.

Guenter
