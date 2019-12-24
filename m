Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344D4C2D0C0
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 02:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01B21206D3
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 02:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTYuMELK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfLXCVp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Dec 2019 21:21:45 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35735 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbfLXCVp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Dec 2019 21:21:45 -0500
Received: by mail-pf1-f196.google.com with SMTP id i23so4629822pfo.2
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Dec 2019 18:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hPaGmIdNEqHZuX1H4IQkwoZaBcisrqzQ/gVxiL1fyhE=;
        b=BTYuMELKowIXPcLbf+fIgvM7jpVnLO6myArQmvCXT5jW2iu7phDLmbDA/Rme+3EK/y
         ydojJQ2cpDsR1mqyTI+3QT2sDli8E2ktRmQEVRchHvNw/yBQ7319uqBFbiFMX+yZJ7SZ
         TBQNxyRzHLJb+bqWX0uFCo3qHTDvd/JoheRE7o8znL2sfvtsrrIjmtqPhBqQAK2MMfj5
         1Dpap9C610r/chS27N/rOb2w1qStmDD905X8bT6nAOHOeZgD65799TlODzM51uArp9AI
         bJKHcOlBPhkvBeGxblepJwc6oKK75mfxnfINrOi1V66XdQuorJVqcjLAJxZMk9RntoBz
         WKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hPaGmIdNEqHZuX1H4IQkwoZaBcisrqzQ/gVxiL1fyhE=;
        b=P5M29pjAd2vslNaxbBhxGAO5c0OolHrTLDTFy/grxhsy8iYB5UlPlZhR7woHbyCoCt
         qmArAOrNhlyDJFKJuxM6TdUTFSBoOKDQELFKY2QjYhXi/058FFEmgjD63LUMONAO72q0
         2qTyxvthPHaCOstPfxzoQKqTPunM+Wu1kbBNn2Z+VoOgw53lwfHTIvLpv1VgAbbTEkgz
         z3yW3470YzAAKCaa48MfwQGP6Cz7fmETicakzuz18LuVuWjNCLFjTb7NKEfZIMW+ONBV
         dQ3RqYJP8qkqWPBrqXuLadEs5disk4jq0quEbZSPAec97xWwljf61gMmQYDeQ6FTcUB8
         CdeQ==
X-Gm-Message-State: APjAAAXsLtAzMQtzr62Iq+A79fihvsmhyFgKcp9hLAC/yjfxr1qRuC+K
        g7I6zZpcwIBqu6uO28Q4Zn6zFPBW
X-Google-Smtp-Source: APXvYqxunwuz1/5Dqd65ruPMAy32v5rJoXYf8nUU/zFPrPYljIi/9BLIwxirztVinn2ytAgLyCjcDw==
X-Received: by 2002:a63:e4b:: with SMTP id 11mr34910717pgo.5.1577154104458;
        Mon, 23 Dec 2019 18:21:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t187sm25802631pfd.21.2019.12.23.18.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2019 18:21:43 -0800 (PST)
Subject: Re: [PATCH 2/2] hwmon: (w83627ehf) convert to with_info interface
To:     "Dr. David Alan Gilbert" <linux@treblig.org>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20191124202030.45360-1-linux@treblig.org>
 <20191124202030.45360-3-linux@treblig.org>
 <20191207135127.GA24852@roeck-us.net> <20191207164936.GA25521@gallifrey>
 <20191224021605.GA19223@gallifrey>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <43d68dd7-3548-6560-95a1-5c6e70713804@roeck-us.net>
Date:   Mon, 23 Dec 2019 18:21:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191224021605.GA19223@gallifrey>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/23/19 6:16 PM, Dr. David Alan Gilbert wrote:
> * Dr. David Alan Gilbert (linux@treblig.org) wrote:
>> * Guenter Roeck (linux@roeck-us.net) wrote:
>>> On Sun, Nov 24, 2019 at 08:20:30PM +0000, Dr. David Alan Gilbert wrote:
>>>> Convert the old hwmon_device_register code to
>>>> devm_hwmon_device_register_with_info.
>>>>
>>>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>>>
>>> Looks good. I am sure I am missing something, given the size of the patch,
>>
>> Thanks! I couldn't see an obvious way to split it and keep it working
>> bisectably.
>>
>>> but I am going to apply this to hwmon-next.
>>
>> Great.
>>
>>> Side note: At some point we should drop support for nct6775 and nct6776
>>> from this driver.
>>
>> Hehe it would have probably easier to do that first!  Oh well,
>> I've added it to a TODO, that means nothing about if/when I'll actually
>> get around to it!
> 
> I've started looking at this.
> 
Sounds good.

Thanks, I appreciate the effort!

Guenter

