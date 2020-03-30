Return-Path: <SRS0=Jj3a=5P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E33C43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 15:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D523206F6
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 15:24:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIV4oKAC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728955AbgC3PYe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Mar 2020 11:24:34 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:42316 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728666AbgC3PYe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Mar 2020 11:24:34 -0400
Received: by mail-pf1-f178.google.com with SMTP id 22so8732303pfa.9
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2020 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RZtKFPbubKCAdsl1k9SGX1EFDs8J0MVqeY8+F5r/UNA=;
        b=pIV4oKAClcB75vjSWUlqLqbKMCp2wejcQuGDqNLzO45Owzr0pF4Yoj1L6zV5kP8FpQ
         rZ9J3el1kRBR80KI9ThjLKMquwa+7Hi7A31Sce0nv5xujq/tUB4T/tk7CHF86bY6prnJ
         5GSM37zqwNnz7HSyDfN6NX87LQ852vI5Bg3M9S2l8vu8GPkU0q5lM2kdlfY9ziDkktC+
         RO0YBT6Vw/fcy+WjmDXxxiCLoAsIufIaSc8atM4q8iq/+VKacR+kWrjun2gmQA1DK/gE
         BqcFGxuVLnJ5iSNIMw06iLW/CpjKDuBjLIofAofpgSdncPReYZn2FVi4FChYI/50pDkR
         K8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RZtKFPbubKCAdsl1k9SGX1EFDs8J0MVqeY8+F5r/UNA=;
        b=os3sDVjHnx497ZT5T/QafP+OmeT8MV82AxKxJPp/I/monLKx4Z3N5HsYqFr3H9kkO2
         loKlM/vesXz2ygbnMau6saGyr73jpVq0eqPloEdy+wO3x1JHh3ufKuu9vDAlxatkzafN
         IZ0zwHCEZnwjPQVCcOx9m6Rkzl69ZnZrQd1WNpKcJbtkh9ioxIAw+dlRh05D9H1ozU6y
         t+K2UqFmS6H/YXZ2f22cEal5hOixT1Ri+4fyWRv+9MAihtl0WbO3hTIoJO2fcL9TaEwI
         bFTJCyfK/kj50v13tNZwTIRAYPU/2+utUuQ1+29MBREWSUhfkGeRMjFtkKoWWtgugyyc
         XU9Q==
X-Gm-Message-State: ANhLgQ1aTctZixLyCLTHqAy8mLxmdX4HGnsQ7ydvWMJht3qdxP/qKhGW
        QvwGh2Ermgx5ZRGtNExKRO3nrevN
X-Google-Smtp-Source: ADFU+vsCDsJsST7QyvHkA3rMUPJNRBOqrAB6tgjCMKui1QmM2rxQnWrlNE9Y+yCRwS9E8bTo/3n9zw==
X-Received: by 2002:a63:8048:: with SMTP id j69mr13447293pgd.410.1585581872735;
        Mon, 30 Mar 2020 08:24:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r59sm10732585pjb.45.2020.03.30.08.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 08:24:31 -0700 (PDT)
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Michal Simek <michal.simek@xilinx.com>,
        Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
Date:   Mon, 30 Mar 2020 08:24:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/30/20 4:33 AM, Michal Simek wrote:
> Hi Robert and Guenter,
> 
> Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
> I have checked that u-boot can detect that devices and read it.
> 
> ZynqMP> i2c probe
> Valid chip addresses: 0C 13 14 20 43 44 74
> ZynqMP> i2c md 13 0 10
> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
> ZynqMP> i2c md 14 0 10
> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
> ZynqMP> i2c md 43 0 10
> 0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> ZynqMP> i2c md 44 0 10
> 0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> ZynqMP>
> 
> Here is DT fragment which I use (it is under i2c mux)
> 
> 185                         irps5401_43: irps5401@43 {
> 186                                 compatible = "infineon,irps5401";
> 187                                 reg = <0x43>; /* pmbus / i2c 0x13 */

Does that mean the mux is at 0x13 ?

> 188                         };
> 189                         irps5401_4d: irps5401@44 {
> 190                                 compatible = "infineon,irps5401";
> 191                                 reg = <0x44>; /* pmbus / i2c 0x14 */

Why _4d ?

> 192                         };
> 
> I see that driver is used but with error.
> 
> [   37.553740] irps5401 3-0043: PMBus status register not found
> [   37.559815] irps5401 3-0044: PMBus status register not found
> 
> 
> That's why I want to check with you what could be the problem.
> 

PMBus status registers are at 0x78 (byte) and 0x79 (word). The above
error is reported if reading both returns an error or 0xff / 0xffff,
which indicates that the chip is not accessible.

I can say for sure that whatever is at 0x43/0x44, it is very likely
not an irps5401. If it was, at least registers 0x2 and 0x6 should report
different values, and 0x01 doesn't look much better (the lower 2 bits
should never be set).

> Also I would like to know if there is a way to disable it via any API.

Not sure what you want to disable. The message ? The PMBus core needs
to have access to the chip to initialize. If there is no status register,
there is nothing it can do but to refuse to instantiate.

It might make sense to use i2cdetect / i2cget in Linux to determine
if the chips are accessible. I'd try reading the status registers (0x78
to 0x7e), value registers (0x88 to 0x8d, 0x96, 0x97), manufacturer
id (0x99) and model (0x9a), and i2c device ID (0xad) and revision (0xae).

> One of this regulator is connected to another device which doesn't have
> access to it. It means before powering up this device there is a need to
> enable this power regulator. The best via any dedicated API.
> 

We can add regulator support to the PMBus core or to the irps5401 driver
if necessary (patches welcome), assuming the regulator in question is
handled by Linux.

Hope this helps,
Guenter
