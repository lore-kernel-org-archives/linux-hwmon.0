Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05492C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 15:04:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C461E21925
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 15:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP9v4Gze"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKLPEm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 10:04:42 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43109 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfKLPEm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 10:04:42 -0500
Received: by mail-pl1-f193.google.com with SMTP id a18so9494260plm.10
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2019 07:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tCoEPoQn/IVtnGjFo4U/Qk8LODjSGOJgasNa0i9XMFQ=;
        b=JP9v4GzeWOTBAOJDS73oZmUmLetL/nwxLIf0eel8gIHMHeDAIr9rWpeXuiH/4biPvg
         bCARep6kj8T5it7Nu/f1kJH3MAWf8LCrotngUsvWXNaPF4RTU5bE31XM2q69LSO56TbE
         ymE45oXmQGthVBCtfgcV9hAMfCaidN3E63vpf03Dg/E6/yOtcntMrSvNLEtt0M8irGz2
         BlKPDc55SUUMnaFbBmipLGEJUebzDExF7BRj3g+aZNjU2jKrVwRKV4xVDrPCF0LBfV+a
         FVcsRBk/jAGeFL13xwaupLO2NjgHnh1Km0ST2KQLQ0+BP3UADyjeY0Tk+QbxegZbA5Px
         6snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tCoEPoQn/IVtnGjFo4U/Qk8LODjSGOJgasNa0i9XMFQ=;
        b=Q5qicmBoRhneYhDi9eC57AJmLINo23wgo46x7iKiA10hVlYUIzvJP8lfomBY62Ncqc
         sKMzyin0jCvz8AlXA7eoXPLwUUEk7DzUtmTP2WlHy/dgN4lVrsWE8aqjszE9ED2SSQZ9
         9vsNIF9C3Lc0ScrPipi0bDjgTU2DxLpSdWNtxcrM2VoVV9AHOlWDfcZABvkA6QhUvHwz
         gzwH1kM2SOwMfq/c8TmTdLMcmcgPm1WzPi4LL2R+zdqXVPTy2e6UEOFDvWWOfDc2pFbf
         GM35Vd+01Je9GljC5PN5DBw26/jHS98/F96uGMSjmU/o15QdtK/WFAi2sADMooSaQQLu
         1Rzg==
X-Gm-Message-State: APjAAAXRSKq5B1Bd04XR3b17gd3eeDstql51YuFm1855pXVVgUEGP+nx
        sAfEm8q3j3Jf9G/gIlJ3dE4=
X-Google-Smtp-Source: APXvYqwWqlJZzlUJsC/KoWSFOpjTy3lx7BNBIPaPn+ViHSqLgmL2jF2n26mVnPCA6vxQUZHUbAtwAg==
X-Received: by 2002:a17:902:24b:: with SMTP id 69mr29945761plc.203.1573571081569;
        Tue, 12 Nov 2019 07:04:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u8sm7913821pga.47.2019.11.12.07.04.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Nov 2019 07:04:40 -0800 (PST)
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
 <d3c0c9a7-00b9-0465-16e1-6fd7ba97dfd0@roeck-us.net>
 <CAC5umyiju2Q2fdfVaFyX+Q=sMKr5Gsc_GDVYmSa0vB+w8acvAw@mail.gmail.com>
 <20191111173505.GB5826@roeck-us.net>
 <CAC5umyjviR1J5HojE6WBhYQCzu=CFPPoNxXY=T9KRw2yTpO=VQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e2699eee-8ca2-fcf4-d6b2-624cbddd4c6d@roeck-us.net>
Date:   Tue, 12 Nov 2019 07:04:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAC5umyjviR1J5HojE6WBhYQCzu=CFPPoNxXY=T9KRw2yTpO=VQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/12/19 6:40 AM, Akinobu Mita wrote:
[ ... ]
>> I'll see if I can test this tonight on my other NVMEs. I also dug up an old
>> NVMe drive from Toshiba; I'll see if I can connect and test it as well.
> 
> That's nice.
> 
It works on all devices I have, including the Toshiba, with the exception
of the Intel. Interestingly, the Toshiba NVMe reports:

nvme-pci-0600
Adapter: PCI adapter
Composite:    +56.0°C  (low  = -20.0°C, high = +85.0°C)
                        (crit = +82.0°C)
Sensor 1:     +56.0°C  (low  = -20.0°C, high = +85.0°C)

ie the critical temperature is lower than the high temperature. Go figure.

The Toshiba model is
	THNSN5256GPU7 NVMe TOSHIBA 256GB

The Intel NVMe has the latest firmware version installed, so this isn't
a problem that was ever fixed.

Guenter
