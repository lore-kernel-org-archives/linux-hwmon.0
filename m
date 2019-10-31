Return-Path: <SRS0=ti+p=YY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CD2CA9ECB
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Oct 2019 13:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6AF720873
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Oct 2019 13:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLxY9Foh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfJaNQN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Oct 2019 09:16:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36777 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfJaNQN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Oct 2019 09:16:13 -0400
Received: by mail-pl1-f196.google.com with SMTP id g9so2704387plp.3
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Oct 2019 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=srRaCLuv3kuZtHdzxZeosuumdCk1qFSFEDQU+HZSfUM=;
        b=MLxY9Foh0IASbPH3LXhJA6ebZawAZx23RYKbSbHT0iF7Otxbfh1BiYWku9qZ+C1o1P
         C7Jc7E9A4NNW+JXJ4mvuO94PtxSa8xH8X5WEPTzuPAtDLi+sDatFzMY01kTSC6q30+XH
         jgUGXBkM4mlRC79i5aGloEVSxOrbEiksqRbcs7Dl3KqSRKWjN9djfXhbpJCe/rCwO2rI
         0MAoxl/x0+YmhRfXGVFym8UPfJB48NUwvyBMaySybfzC53o/wBzs6FWKwYAa3PPlGmDa
         up+rA+Gd2Axno3z1Qi+I0ttNOPSrb5Ht+J5S12kJugogEKv+2I71KxC/lFFPj+wuHGbU
         B1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=srRaCLuv3kuZtHdzxZeosuumdCk1qFSFEDQU+HZSfUM=;
        b=sBFOET7sTtb2I0W7tANNt+pt96eEv+QSFKKBrxv6OazA4XPLMwGCQ0kiw8A2POOO3w
         CAkiiR+SWyb65QLhL9ZbQJsfVH/OVUcIfiPHHfOPQLoW0xkUt1poEt+cIPnjkJAVlqYj
         NFwlAj5cQjqtpHDDJr4xJIpvTZkP1WJqQKqQqZqrVlHp9aC1w0hUACxt9rQ40/b6M4tH
         F/ly1Nv1jYCo+iZ4NK2p3VjLh1XlI5gQprN1cxRXhD0wfC9c61K15hQ34xamRwt6D+5m
         VrCgSZni5d/suuWelW4ESiAIPuAuWZLNjLxCWPu2YTqvDxQRwcuCAHQk4SMCnFCthfXE
         5fHg==
X-Gm-Message-State: APjAAAUigtLAqmF3mOPXpCL2mITQ8RQHRkql4bdA3r2MemdcfIavokXa
        UY5mpeeTNZhe+mlNBEUVD0a/tu/q
X-Google-Smtp-Source: APXvYqzwVHYciBtay0AhppKbEgWB3Mv1PTE3ywgG7Z/B/zSjGsDm66+sxgjs3yE6xP/xSAiw9v1vuQ==
X-Received: by 2002:a17:902:7586:: with SMTP id j6mr6488051pll.43.1572527772349;
        Thu, 31 Oct 2019 06:16:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j186sm2419623pfg.161.2019.10.31.06.16.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 06:16:11 -0700 (PDT)
Subject: Re: git fsck broken due to "hwmon: (nct7904) Fix incorrect
 temperature limitation register setting of LTD."
To:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>,
        "amy.shih" <amy.shih@advantech.com.tw>, linux-hwmon@vger.kernel.org
References: <20191031103846.59a96454@primarylaptop.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <aa0c664e-b0cb-36b1-e16f-7d4b11487184@roeck-us.net>
Date:   Thu, 31 Oct 2019 06:16:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031103846.59a96454@primarylaptop.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/31/19 2:38 AM, Denis 'GNUtoo' Carikli wrote:
> Hi,
> 
> When fetching linux[1] I have:
>> $ git fetch origin
>> remote: Enumerating objects: 119615, done.
>> remote: Counting objects: 100% (119615/119615), done.
>> remote: Compressing objects: 100% (22639/22639), done.
>> error: object 4a2d78822fdf1556dfbbfaedd71182fe5b562194:
>> badDateOverflow: invalid author/committer line - date causes integer
>> overflow
>> fatal: fsck error in packed object
>> fatal: index-pack failed
> 
> According to gitweb[2], 4a2d78822fdf1556dfbbfaedd71182fe5b562194
> corresponds to "hwmon: (nct7904) Fix incorrect temperature limitation
> register setting of LTD.".
> 
> The issue seem to be that the "Author date" is "2085-06-18 15:57:19
> +0000" which seems wrong.
> 
> Is there still time to fix this date?
> 

Sorry for the trouble. Unfortunately I didn't catch it before it was pushed.
I don't think it can be fixed; my understanding is that the git tree can
not be modified.

What is your git version ? I don't see the problem with git version 2.17.1.

Guenter

> References:
> -----------
> [1]git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4a2d78822fdf1556dfbbfaedd71182fe5b562194
> 
> Denis.
> 

