Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5148C38A02
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Oct 2022 03:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJ3D2s (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 23:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJ3D2r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 23:28:47 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0391B46859
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 20:28:46 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1322d768ba7so10452961fac.5
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 20:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HdkJZuStByZVNUN/8HydnpUDh7Hy/IVi7l3yE7sZwJY=;
        b=ODqQlAnejLz94PR/I0lcS4wz/uH+E1AQest/twwLRnZYakENvd624NQ6f27O3mSzPe
         I2PhT736PlBBLONfyu4FU4SnYkL9evvIlZjtRdYQRdKZ/A9dTKXjKr6FHuQGek9eyImt
         syhs8PLKWSmEEdfwB+OoPTPF+kfKtzbNaXWvj4RxfprJzjq+5Dmz3FwMn5HybBicq3BW
         g2zXEElB+taHDkigbMNFLiQ7+M7pZ/hteVRVDGeh2DOi/Bm0vZSWsyGBgNouINg5Xx0K
         +8sSDd6hNR+Ox4jYVwKo3VN42tTXxNT5zTz/6EcAsoCDlPk5XsV0vQeiO07dIWSdfPsi
         fO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdkJZuStByZVNUN/8HydnpUDh7Hy/IVi7l3yE7sZwJY=;
        b=TyLTr0lbJxw618BZJwzHOv6PT4J59vvdgSZW08UrYv0jsFX4rzZPcCoXEyKH5NKaXZ
         SxM3EEqfukol8oRqM84EWNX5okrwGmLXMUv7q3JCS3j32d3KDOSHnnEXp5k/HC6BT5hJ
         nHNUQyUuB04GNWlj99gghfVmlYmih9hVcxULrRcDPaifqP6YP4Y4z/vmXPlFing7nWP5
         XrW9Fqq6yYf2s/+YP5Sz54rNdmjyzbEcSkh2xlkheVTupn9g3ccyrF3MEKL2TXU8oz54
         BCx5FNnPmavqyUPo4pxj+/XKRmy8/Cm4X27EclTvFmCu6HexhX3JDGolHnfh1r7gt1y1
         T2TA==
X-Gm-Message-State: ACrzQf2vENCfQ2KQBI7JL8na2QLF3bC3asiZyDfOmqTB7ecj3If2yBq/
        4D8dO3LmrRPOeLS5dqCx99c=
X-Google-Smtp-Source: AMsMyM45By1faNkaPShiFJyb+OQUOIV8vlbx3pq8YaJadybElANbF9CJcv4bhqwHnzROCG5N7eiN/A==
X-Received: by 2002:a05:6870:41c4:b0:131:55a3:3069 with SMTP id z4-20020a05687041c400b0013155a33069mr3803963oac.159.1667100524775;
        Sat, 29 Oct 2022 20:28:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x1-20020a9d4581000000b0066c45517c8fsm746311ote.52.2022.10.29.20.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 20:28:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7f0f7b4b-8716-580c-e71e-11ed4134e269@roeck-us.net>
Date:   Sat, 29 Oct 2022 20:28:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/1] hwmon: (it87) Create DMI matching table for
 various board settings
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20221029103057.3234561-1-frank@crawford.emu.id.au>
 <4a4dd112-2c71-9b8e-8e33-95dac9a8d32f@roeck-us.net>
 <f802b322431a182c4bdf0f91cd4114fe381ebfe7.camel@crawford.emu.id.au>
 <20221030013909.GA1264837@roeck-us.net>
 <cd0def02f2397db0a05f100debe9d11b0f6d5ac0.camel@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <cd0def02f2397db0a05f100debe9d11b0f6d5ac0.camel@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/29/22 19:06, Frank Crawford wrote:
> On Sat, 2022-10-29 at 18:39 -0700, Guenter Roeck wrote:
>> On Sun, Oct 30, 2022 at 10:43:59AM +1100, Frank Crawford wrote:
>>> On Sat, 2022-10-29 at 07:04 -0700, Guenter Roeck wrote:
>>>>
> ...
>>>> That is really not what I meant when I asked to use a callback
>>>> function.
>>>> As written, the code might as well call that function directly
>>>> from
>>>> the
>>>> init code, and there would be no reason to have a callback
>>>> function
>>>> pointer.
>>>>
>>>> A callback function would only make sense to me if it is added
>>>> to struct dmi_system_id, and called via dmi_check_system().
>>>> See other callers of dmi_check_system() for examples.
>>>
>>> Oh, investigating other kernel code I see what you mean, and it
>>> does
>>> simplify one possible future update, but looking through the other
>>> modules in hwmon, I can't see any using a DMI callback.  The
>>> primary
>>> use of dmi_check_system() is just as a count of successful matches.
>>>
>>> Also, just going back to a previous comment about creating a static
>>> version of sio_data and updating this in the callback, this does
>>> worry
>>> me going forward as in future I hope to add code to handle the case
>>> of
>>> multiple chips.  Updating the static version for one chip may cause
>>> issues with the other chips.
>>>
>> The value is set based on DMI data. I don't see how that would make
>> a difference even if there are multiple chips. The DMI data would
>> still be the same and is board specific, not chip specific.
> 
> For present cases, yes, but consider the current setting, which
> disables pmw2 for the FN68PT board, if there was a second chip on that
> board, you would not want the same setting for both chips.
> 

Quite obviously it _is_ known that this board only has a single chip,
and it will never magically have a second chip.

Chip specific code should be implemented in the probe function (which
is chip specific), not in the init function (which isn't).

> I haven't yet worked out how it would be distinguish at the time, but
> also it hasn't been strictly necessary.
> 
> A simple case I have coming up for future patch is to use the DMI table
> to ignore ACPI conflicts when we know it is safe, but that should be
> done on each chip separately, not necessarily globally for all chips on
> that board.  Again, in practice it isn't important, and I haven't
> worked out how to specify it separately yet.
> 
> Also, I have been looking at the difference in the use of
> dmi_check_system() and what the use of dmi_first_match() does and it
> really is just a case of the callback being used at the time of
> matching vs deferring the actions to be performed at later and possibly
> more appropriate stages.
> 

It doesn't need to do anything but set values or parameters. Any action
should be done in the probe function, not in the init function.

Guenter

