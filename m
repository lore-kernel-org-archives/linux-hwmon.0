Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA4CC00140
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Aug 2022 15:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235458AbiHHPqJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Aug 2022 11:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243750AbiHHPpx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Aug 2022 11:45:53 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14880224
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Aug 2022 08:45:53 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id p8so8877593plq.13
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Aug 2022 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc;
        bh=7z4kW8a6VxQ38p5cq9w3RbBVq7w0CpZatssmeeKLzcs=;
        b=nHY2+fqXx9Jij7oVkShncxhC6zN8TMXSWQ2fcBgaK+RXnDUWJh9KhTTVO0/j+jJ2m2
         5SegfCE+cy87O0VmfgW60HwGWi4mmlWgihEDUk322y6vag2tIU2M8BsmCOWevTx5vJ7U
         dyX27k+RfqNt+9HYxsGMnV6s0DWJWfemLiThMHq4yodVdpKRNqvQPzweLOqPm3jYWRmW
         4VDqx7eKA7X4nD4rBMZV13RyVLGJDH74vO2GH5u8tEzaK4BzhbEBtAnEhTnoLpqKNPh1
         3cDi+g7qHllHPViWEMTUOLI3BedQ++J3rKGXC17gGF/osBa3hJns7yH6RhSLlP8807/i
         tMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc;
        bh=7z4kW8a6VxQ38p5cq9w3RbBVq7w0CpZatssmeeKLzcs=;
        b=4BtTVI9cs72Tq+kWSc5po8bXGNjEkJxcsdUyOEmZymfYJDZkydm/bDtuwu2TVgwGKz
         tjUs6GXKD3x1Pli5P4AK5RvYD3hpr24QJuJvA/fBhf2Q6wYPH0+JuMWdP5dYMxlUX1JD
         A1COGO34zbjRRrOfD9xTDLIqUsvu3kyps73o6upiRoF1NRQcRudnY4AgZvH3azTHzaEk
         zjqOM1EAb274e88xVS7YA2BSTRDvgRf81lps9xBC9mp2oTw56+mNtlNDh71ckbEEAVcT
         iSGGKfXAPkz1xsyx7/i4tLoQ6CZsN6N6mLHN1FtAi3J4LvHuKsKDeS2Fdlk8AiiADVH7
         29lg==
X-Gm-Message-State: ACgBeo1/4ZRAdZcDj9XGR8nDPrC9SZMWu5gaxeLofwXsLSKxwBO6NfBu
        b21Z19CyiFc+dmBKdae0Sdc=
X-Google-Smtp-Source: AA6agR4RXgNz11imrzZtRZwCpWcYhqEhtDxCcHXW5WWJc3oz6lRag88uhAyNNY7af6Y1jX5YjZQpdQ==
X-Received: by 2002:a17:902:d508:b0:16f:736:33a5 with SMTP id b8-20020a170902d50800b0016f073633a5mr18718996plg.31.1659973552563;
        Mon, 08 Aug 2022 08:45:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x13-20020a1709027c0d00b0016c20d40ee7sm8884823pll.174.2022.08.08.08.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 08:45:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a49fdf72-1166-d717-8e46-124ad4778e6f@roeck-us.net>
Date:   Mon, 8 Aug 2022 08:45:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Lars Povlsen <lars.povlsen@microchip.com>,
        kernel@pengutronix.de,
        =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
        linux-arm-kernel@lists.infradead.org
References: <20220808060640.272549-1-u.kleine-koenig@pengutronix.de>
 <20220808075408.i63dtoe66hm7xwta@pengutronix.de>
 <20220808153007.00007208@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: Make use of devm_clk_get_enabled()
In-Reply-To: <20220808153007.00007208@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/8/22 07:30, Jonathan Cameron wrote:
> On Mon, 8 Aug 2022 09:54:08 +0200
> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:
> 
>> On Mon, Aug 08, 2022 at 08:06:40AM +0200, Uwe Kleine-König wrote:
>>> Several drivers manually register a devm handler to disable their clk.
>>> Convert them to devm_clk_get_enabled().
>>>
>>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>>> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
>>> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>
>> Oh, the tags by Nuno Sá and Jonathan Cameron are a fake. I picked them
>> by mistake from the (similar) patch for iio. Please take care about that
>> before application. (i.e. drop them, or make me resend the patch without
>> the tags, or make the two give the tags post-factum :-)
>>
>> Best regards and sorry for the chaos,
>> Uwe
>>
> 
> Much like the IIO one you may get a request to split it by driver.
> I personally prefer per driver patches as Andy suggested, but meh, it is
> up to the hmwon maintainer.
> 

I don't like those one-patch-for-dozens-of-drivers approach very much
that seems to proliferate recently, and very much prefer per-driver patches.
Which is one reason for letting this hang ...

Guenter

> I'm feeling particularly unhelpful today. As it's not IIO patches going
> through another tree (like the IIO one was when I gave that tag):
> + simple patch to quickly review.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> *evil laugh*
> 

