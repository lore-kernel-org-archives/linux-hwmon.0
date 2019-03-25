Return-Path: <SRS0=S2uc=R4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1D4C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 10:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 281F62084D
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 10:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siLq9mwl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbfCYKnU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Mar 2019 06:43:20 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46396 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730606AbfCYKnT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Mar 2019 06:43:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id a22so6235241pgg.13
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2019 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k9jFKob1IKGpqfBayIGkyKXP1cCCwU8821AjdRG5kRk=;
        b=siLq9mwlanWqCwefXWpGVe8ek5WD/DWLmvyScGR8Ln8QAWiEmeGZB1AgoEOBrqlrWk
         uSWmmrYCGx2XV559BwbH053E9JK7DnWcXBoKGAL9vvQt3mB5scLJNhev2WvifsyfcCo9
         kyzJOpMqys7u1jWnaVXFf3QL/vBxY3IwVv42Hrt8XLBi5lL87qFXNRQG/OP+R4KkPqRs
         S7mQJJvc6V6f+HS4fSpXcAkubShY8Nj1al4wezNnsPvfL9bRUG0Z2raD3G3qrcVjCpBj
         4CFH/PhYKRgaV/bAZ4h4I6dYZDX9MSialvl4hvS4hMw9ml+nPsyfZLmHQnCOgeMFQNeS
         5TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k9jFKob1IKGpqfBayIGkyKXP1cCCwU8821AjdRG5kRk=;
        b=nGg6gQUAEr8CG+t1cm2DeTIcEOvcQviMHumvudH46SVw/axRAblouPC8Uz0JsFyymI
         4ERxO1qqG6iDtJVxTCXuO+9bSMVemqDkjtoj/WtL0NONn8uYAQWQxR8bWPtEIVGNEpoy
         Frvgeedf/WUZ2IolW0EByfjCJohcWIZZfZwkIm0Gv+xo9viPrkNw4BJNRXJ4egQRUD5z
         XEZgKyCxUw3epSnGPE0CFOfZgTYhczXFsgkheHV5JufxPmUT/QkgO3SQNxpF6SKDLp3p
         m6m/P+i3MRZIxp/wU5mX65Wr7SwdfRLDYpfyCMDP3RCqztLnorj6MqWoY8AqpuPUPmis
         /neg==
X-Gm-Message-State: APjAAAUrYPPlCXBvkPzCmWsWjoD8X4/cSRd0asbdKXEBtG8fsIT3Y9/5
        iqzMc+vdB1qHeCmfVddEvjI=
X-Google-Smtp-Source: APXvYqyngIa1FLSQu1yE8WzHEB43BkmVKa3+F172YKc3f+9IKDirbovX35niS7Pv25xc0VSYa2EncQ==
X-Received: by 2002:a62:4602:: with SMTP id t2mr9601366pfa.26.1553510598871;
        Mon, 25 Mar 2019 03:43:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m25sm7309809pfa.175.2019.03.25.03.43.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2019 03:43:18 -0700 (PDT)
Subject: Re: Userspace matching of hwmon devices to hardware
To:     Lei YU <mine260309@gmail.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Jean Delvare <jdelvare@suse.de>
References: <CAARXrtmNL+Px7vk4mA++yzO22nUWqmBnL3hn6oedB8d9516pvg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cd76447d-fa01-e3f7-fa2d-7695372e71e3@roeck-us.net>
Date:   Mon, 25 Mar 2019 03:43:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtmNL+Px7vk4mA++yzO22nUWqmBnL3hn6oedB8d9516pvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/25/19 1:21 AM, Lei YU wrote:
> This email is to ask/discuss if there is a stable path/name (or whatever) for
> hwmon devices in the different versions of kernels.
> 
> In OpenBMC, the service phosphor-hwmon reads the sensors' value and expose to
> DBus, depending on a configure file that matches the device tree path.
> 
> The service is started by udev rule, called with the DEVPATH and OF_FULLNAME,
> so it knows where to find the configure file depending on DEVPATH or
> OF_FULLNAME.
> 
> E.g. on Romulus BMC, the w83773 sensor has OF_FULLNAME at
>     /ahb/apb/i2c@1e78a000/i2c-bus@440/w83773g@4c,
> and the service knows the config is matched from path
>     /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@440/w83773g@4c.conf
> 
> However, the DEVPATH or OF_FULLNAME is not stable in different kernels:
> * In 4.1x kernel, the path is as above.
> * In 5.0 kernel, "i2c@1e78a000" is changed to "bus@1e78a000" in the path.
> 

This is due to a devicetree source change with commit 1426d40e11f73 ("ARM: dts:
aspeed: Fix I2C bus warnings"). In general you can not assume that devicetree
files (or path names derived from devicetree source files) stay the same across
kernel releases.

> This breaks the userspace's phosphor-hwmon.
> If we fix the issue by updating the configure files' path in userspace, it
> means the userspace only with the new 5.x kernel.
> 
> So the question here is, it there a stable way for userspace to match a hwmon
> device?
> 

libsensors should handle it for you, but I don't immediately know how to map
that into udev rules. Jean, any idea ?

Guenter

