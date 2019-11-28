Return-Path: <SRS0=8Ik9=ZU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3D2C432C3
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Nov 2019 15:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 733E22168B
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Nov 2019 15:22:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIWl2X8W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfK1PWo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Nov 2019 10:22:44 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:44903 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfK1PWn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Nov 2019 10:22:43 -0500
Received: by mail-ot1-f49.google.com with SMTP id c19so22466047otr.11
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Nov 2019 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8DiqKC4tY+G7VyNwEV4g0DqGxW0K/7MS1A050haqRec=;
        b=WIWl2X8W0c10fx8FZ1FCMScDiqI92fT9jJ90WTTifD/mM/JAX0SyiXp5KT0CEnv5Qf
         O5lrFG2dlIaIiUhofjab1hr961fmkFi5DfO5QGFlTT6Fhl6yOe5wVU9jwDc6+etNpm01
         wv7chcdWmT3ZDnN+LcX8VaV3D1GJYjn55e5Om4aRFa6xhx26lfGOBGVLvgjrc0XR/42X
         DOJZiMTAopGimnZ1attjmogay85EwXgoX5MH9xTRuBfS2LBlWtrphIrQsmHAG9yXvwUV
         tY5aib9EBi3o+C/NbrnlCwnlC6aDDmVMdEE/U1p5tHtJ1R1ru+IhwY7AuB2QbPABoS00
         fNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8DiqKC4tY+G7VyNwEV4g0DqGxW0K/7MS1A050haqRec=;
        b=tO8veXHkSX5/WgHEOMsYnRT6ui7JNWUlurSSJvmRxBCfF7yPaCFLvznWBJ6DIF8htr
         IPyN7v37rT1Tqd4EYRRsY0TxsuUZMfchXZhR1TwD2tBGpHXqSeRttbAxewnqcdMXIKDj
         Vz+prQ3o3KIrgS0a50v3MNDHi+JNVPlBSzwP7P22teUnum+K/bJOEr0Qe2XyrFUUzYBe
         Vg1kppgAJDWMJmqpQGOm5FPa4P6tdNEa3lsKBnULR2xcRzH6tvjiGUtRvHQiGr7zVV68
         ZygkR715ioOn44K1bHPggfMl8WAY2b1NDYGNrZYFlZm8TvD8OXWpgj+zzXNSgI+yI4p+
         Y1qQ==
X-Gm-Message-State: APjAAAW+N9zE1so5+F9dqzw16yHkA98QpOVPJEC6UUd4Mu/Oxbk8lvYU
        sQKiyoOjGFNzYdRwrV9Fd5Dycf0U
X-Google-Smtp-Source: APXvYqylYe5HkQu9qJYp3plB885kTcDeZgVEvx1Vs/zkJ+yDkfqX5SR09C5XIRjHmt0Mj51LfGVEoA==
X-Received: by 2002:a05:6830:110a:: with SMTP id w10mr242911otq.300.1574954562620;
        Thu, 28 Nov 2019 07:22:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y23sm6186550oih.17.2019.11.28.07.22.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Nov 2019 07:22:41 -0800 (PST)
Subject: Re: hwmon: (nct7802) buggy VSEN1/2/3 alarm
To:     Gilles Buloz <Gilles.Buloz@kontron.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <5DDBD386.4070408@kontron.com>
 <6cde95e5-0ab3-016f-b67d-73db8c16ff71@roeck-us.net>
 <5DDC04FB.1030705@kontron.com> <20191125173538.GA21072@roeck-us.net>
 <5DDC1812.9080009@kontron.com> <5DDCF86F.7010703@kontron.com>
 <fc7c1f0b-abaf-0281-7b1b-726f08abcb16@roeck-us.net>
 <5DDD5732.5050503@kontron.com> <20191126182049.GA24175@roeck-us.net>
 <5DDE8B04.4080800@kontron.com>
 <e69d0a21-ff80-4e51-9e48-bf5913720829@roeck-us.net>
 <5DDFA5DE.5080102@kontron.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d191c93b-b78d-a2ab-317e-e7eb7a923f8b@roeck-us.net>
Date:   Thu, 28 Nov 2019 07:22:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5DDFA5DE.5080102@kontron.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/28/19 2:47 AM, Gilles Buloz wrote:
> Please find the inlined patches according to your feedback. I've also fixed some typos and added a mutex_lock/unlock in in_alarm_show().
> See also my replies to your questions in the previous mail below
> 

Please don't send final patches inline, nor as reply to previous e-mails.
Doing this violates Documentation/process/submitting-patches.rst.
Besides, I use patchwork for my workflow, patchwork gets confused by it,
and the patches don't show up there.

On top of that, the patches are whitespace damaged (tabs replaced with spaces)
and would not apply, even if I tried.

Guenter
