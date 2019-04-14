Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256F2C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 22:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3CA720818
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 22:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDO0tQUX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbfDNWAa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 18:00:30 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44138 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfDNWAa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 18:00:30 -0400
Received: by mail-pl1-f194.google.com with SMTP id g12so7562547pll.11
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Apr 2019 15:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IKFZ0h2vgMAJpU8AYO4erd06uN/uwHJ8A/KQMECk0aQ=;
        b=HDO0tQUXlbEhiy9vEKL2s0eMFtXTZRo9i31Q22Q09JQTxqH6G4cuee5lY1DtyfGzoq
         cJD+nofU4UnvA/jwaS1kuf5GpU7oD6on8WNU28mzNRpMsOpT/1RuJ3pWoWglXlLX1Fs+
         9RnVEZbAJnwIPxCd1Gb7Rr7U6DDc53WXkpsvu5QRrste+xe6HJ//6u0Q/W9BZIWJNwmj
         5Yydf6vnsuqebmOGhEdTgUYjaeRAESRCPW260Ge51577UWZTExlBJzViwsEu9s6MVhsr
         GEYKBk4vS67cdqLjeOPGe7yOw5gtbKcxAoEdeFciDPJvjYmxGm3F2iCSPML5uRmwLIZx
         AdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IKFZ0h2vgMAJpU8AYO4erd06uN/uwHJ8A/KQMECk0aQ=;
        b=KmF2diAhgQfyWTqoURAdbPpRoInWjnDpwrnzqcd2Dm6CsyrhHnkePoi2EIxFV3BCI8
         XwuiDTk+LhgVzjKgr977+QNCGN+aDNz8xuBoInsxE6x5gXUofR3GAjSltPTReGmjcY6v
         V8p688mbhq8c11ggraw1y3xRgQtO4qzYHS/TeebOYyu7g35tCXb2WdCmeTepdygpW+L9
         ljc/Nn2om0gzdHzAFIh3BnjTeQEqO//PDpNmrMurPaYtwuYnG+IywErN5UB8tBlYBLXT
         IZuiyawF+AdotU/aVTEUl6DB3FZIciRHlzjVu0NmqG/kfzRe9YvZWyNUZpqw5xGEcPrJ
         ME6Q==
X-Gm-Message-State: APjAAAXwbhQ8nf2yDL3q/bwulB15pRCWchPVPevUofjZFugilXcbSiCE
        10WZPhaXO5tG66Huqlq2+Ru3C2xV
X-Google-Smtp-Source: APXvYqw7jTWVW/JN5reGa6/q7SsS8RYjV9Au487hBS0r2PRCNLzZQTsK+D6axK7j/pksayxsZBfnyQ==
X-Received: by 2002:a17:902:8d89:: with SMTP id v9mr71402333plo.230.1555279229864;
        Sun, 14 Apr 2019 15:00:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r76sm55568597pfa.39.2019.04.14.15.00.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 15:00:29 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
 <a2e0f8d21ecd61d4a1c1445c872f5abd9b685a18.1555171278.git.krzysztof.adamski@nokia.com>
 <4e51a07b-a7ec-a3a8-38b1-1bfee1d6b00e@roeck-us.net>
 <20190414190848.GB15303@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <337fb3a4-7e8c-80ef-55fc-597e95e985f2@roeck-us.net>
Date:   Sun, 14 Apr 2019 15:00:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190414190848.GB15303@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/14/19 12:08 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> On Sun, Apr 14, 2019 at 07:27:47AM -0700, Guenter Roeck wrote:
>> On 4/13/19 9:03 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>> Those virtual registers can be used to export manufacturer specific
>>> functionality for controlling the number of samples for average values
>>> reported by the device.
>>>
>>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>>> ---
>>>   Documentation/hwmon/sysfs-interface |  18 +++++
>>>   drivers/hwmon/pmbus/pmbus.h         |  15 ++++
>>>   drivers/hwmon/pmbus/pmbus_core.c    | 114 ++++++++++++++++++++++++++++
>>>   3 files changed, 147 insertions(+)
>>>

[ ... ]

>>> +
>>> +static int pmbus_add_samples_attr(struct pmbus_data *data, int page,
>>> +				  struct pmbus_samples_attr *attr)
>>> +{
>>> +	struct pmbus_samples_reg *reg;
>>> +
>>> +	reg = devm_kzalloc(data->dev, sizeof(*reg), GFP_KERNEL);
>>> +	if (!reg)
>>> +		return -ENOMEM;
>>> +
>>> +	reg->attr = attr;
>>> +	reg->page = page;
>>> +
>>> +	pmbus_dev_attr_init(&reg->dev_attr, attr->name, (S_IWUSR | S_IRUGO),
>>
>> S_IWUSR ran out of favor and generates a checkpatch warning.
>> Please use 0644.
> 
> I wasn't sure if its more important to care about checkpatch warning or
> to keep convention in the file. I'll change to numerical value as
> advised.

My plan was to convert all remaining S_xxx in hwmon drivers to numericals
in one go, probably right after the next release. I did have the patch for
this file ready, actually. I just sent it out for review, and added you
to Cc:.

Guenter
