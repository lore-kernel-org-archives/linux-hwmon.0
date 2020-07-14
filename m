Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6840C433E1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 17:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3EC92074A
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 17:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pL/URKFl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgGNRbC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 13:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgGNRbC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 13:31:02 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDB5C061755;
        Tue, 14 Jul 2020 10:31:01 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id p1so7308845pls.4;
        Tue, 14 Jul 2020 10:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PzntEiI+G6UNw1jwS+CfKfTz9gaFaIgKULPvWCc9Dsc=;
        b=pL/URKFlN8xtMQNvTeDQX58frJBXXYMVGPtKptsSHFOgEpV7u0Q9QrhukvZLnTo8PD
         Cu56XtguKZkJ93zMR8Gcol1oThoxPGQbJKZDltoKf+a6RFXnIEIkVIh1t6sDv5D/3c5h
         TgKiD4l4P3AmzKltLZfR0ELb8pNm1uUnfpCoc9bqtI4qhqIwPtE2eF7LGqNQm5qon7Sz
         j/UX9P7flq2cAWBRRCvcElsHyUSWPW0e+7SdbBQIip/Z1DxG61698mIcm548qi9ZLZ6n
         JTNoghIyvjV+JGbFTqlr/FBJQl8xRUi3ItO2Rfx57py52uF6NeVjqOKNHgUep2cN6I8V
         SWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PzntEiI+G6UNw1jwS+CfKfTz9gaFaIgKULPvWCc9Dsc=;
        b=k3pEKEi5fLlFS98+7LgB3hXNuf6znI8cgv+yhbsthyMU77fYDgFex7rC8mOndLYdQ8
         THbeZhfRcuWi0J3Fx+JiIN/vc+6apqo49WCeY187xO6MluE2j1LVnGoBd/8gM+USmw0z
         nRSoIrkdZbKAg07kxqhgjqDWK96cvw8l4E25nFcmVfFV280bf8XFCgdaR8bx8ubNWkDW
         RJaSFtt8OLas+mIbaeKKHJqf34EwsFq1Cd9ar6T3IOEFz5dXRWOBERn5VPYXSBRwmQs4
         hL7AvKpK1h02MidW4XzYVxz9tLLpTlyVyEnobbAmU1x6mIUqwvWdkI/OvbtlGxjEf1Rt
         sEqQ==
X-Gm-Message-State: AOAM533ZcOBlGRaMFrdWbTHmLN/H5o3DRRtNYP994gMNdtrY5zR5FioL
        tbbDmpt3DyxFsnn88PMkYXs=
X-Google-Smtp-Source: ABdhPJyJNJ5rhYebATAEAo72BfOEfcipNSDtj34J/ftTd4g90QJVctcBT5VfXF+gTniEDjzOR4P2XQ==
X-Received: by 2002:a17:902:c3ca:: with SMTP id j10mr4970253plj.171.1594747861287;
        Tue, 14 Jul 2020 10:31:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n18sm19085797pfd.99.2020.07.14.10.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 10:31:00 -0700 (PDT)
Subject: Re: [PATCH 1/6] skeleton for asetek gen 6 driver
To:     jaap aarts <jaap.aarts1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org, Jaap Aarts <jaap.aarts1@example.com>
References: <20200713193227.189751-1-jaap.aarts1@gmail.com>
 <2647223e-74c2-8fd6-f649-9e051a7d9d6b@roeck-us.net>
 <CACtzdJ1+1FUaq0TMrUk1tkenOFfxE2Xrsrx1DOnd1P+vZwnSTA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bad1784c-d484-b772-6a08-f460802e2aa2@roeck-us.net>
Date:   Tue, 14 Jul 2020 10:30:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACtzdJ1+1FUaq0TMrUk1tkenOFfxE2Xrsrx1DOnd1P+vZwnSTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/14/20 3:03 AM, jaap aarts wrote:
> On Tue, 14 Jul 2020 at 06:59, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 7/13/20 12:32 PM, jaap aarts wrote:
>>> Signed-off-by: Jaap Aarts <jaap.aarts1@example.com>
>>
>> I am not going to review code which is later changed in the
>> same patch series. Please combine all patches into one.
>>
>> Guenter
> 
> Thanks for the feedback, most guides state you should
> split up your changes into smaller patches if they get very big.

Yes, but not if the later patches change the initial ones. this
is not the case here. Your first patch doesn't even register a
hwmon device. The last two patches change previous patches, meaning
I would just waste my time reviewing patches 1..4. Worse, all those
style issues fixed in the last patch would create so much noise that
I might miss real issues.

A split would have been fine if the first patch introduced working
code, then subsequent patches built on it without replacing previously
introduced code.

Guenter

> Maybe I misunderstood the intent of that?
> Anyways I combined all patches, fixed my signoff line, added
> a changelog and fixed my subject line.
> 
> Thanks,
> 
> Jaap Aarts
> 

