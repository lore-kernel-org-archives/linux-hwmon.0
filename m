Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CF3C433B4
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 May 2021 17:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 447AA61185
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 May 2021 17:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhECRf1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 May 2021 13:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhECRf1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 May 2021 13:35:27 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F9AC06174A;
        Mon,  3 May 2021 10:34:34 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id l6so6163841oii.1;
        Mon, 03 May 2021 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u+NbrtD9anNLIJ+4wcRSHygXIWUqi8H+m/3cio5BNfo=;
        b=VyNNGv3UB2Sit0slDQ3i1FOhEY+XAWxLmZqILEc4OhfOOCYsuPJ4q8X60A5+kOvf2G
         rpE8aIRp+w2cfJ3b8B69U7aMQmaP8jlbv5XOT9IikoK7FeLXkG7H40akgkTaR4Mm8GAZ
         B+lruG9xbyySuse0SxXmko59f4nXO6zLew1Vc93o2KuzjwIiO5KzcxjutYwmr8T012yX
         ebM1NkU7rQ7r8Iq8fdjdGYUP4c/t3JhHMyPp7Xs6CBR94Je1oso9Fq9LFbLQJA586nLG
         APd0kgP5l8SkZpezzzU7tNfl7RrNVKBZ5qQ1Wu1o07XL+/gr/E2pXMK+GPI1VDx3zqXP
         37Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u+NbrtD9anNLIJ+4wcRSHygXIWUqi8H+m/3cio5BNfo=;
        b=Kend2F74grL4+BgtZtqmBQi4km2WK4iDMo86V4fOwXKOvAY9NwQEBAs+YVls+3l3qV
         89Tpx27WnZklCaCfaHhjwvoXkpvrg3+JiobXCgAUsHoMjMj8bOeMJCJD3R929ml5hvA3
         bJKrag/01ipp+weEGVYNGKJp/X4bfwas7kBrjpmueKrUgVQ1u8v4d2CpoVWMF9CmioKb
         nAYElTsltgJr0RkRkqDl3F0bOmZ2I/T+JqrCob37As1MQrNgi5J3/7VgPtSlB3P81Ggp
         6dVocy6fL28zNAWVJ1WJLSAtGq91jE6xp7Q3QT344awnC8dhbFJf0/xPpTz+8pxzwKay
         g6mQ==
X-Gm-Message-State: AOAM530ubLbcwQAGrrKSe2Jb7bGc3Nq/E2N2dZ7OSp+J+4vxLI2CWlhp
        Svy8ghvJjp19BwpfeE5YlerN4VpbP5M=
X-Google-Smtp-Source: ABdhPJx/YRQJjNh95hdl4q3HSS3EG4x37nLgH2WX0Kg4cNVLaKeSjELio2IcVA1HC33UvABvz2MXOA==
X-Received: by 2002:a54:410a:: with SMTP id l10mr21390458oic.15.1620063273388;
        Mon, 03 May 2021 10:34:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d185sm97893oib.25.2021.05.03.10.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 10:34:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Vadim Pasternak <vadimp@nvidia.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20210426221731.1718613-1-vadimp@nvidia.com>
 <20210426221731.1718613-3-vadimp@nvidia.com>
 <6bb0e063-66b4-b7bb-3f7d-0d563390bcfb@roeck-us.net>
 <DM6PR12MB389893AC33FCFC7073C41F77AF5B9@DM6PR12MB3898.namprd12.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH hwmon-next v3 2/3] hwmon: (pmbus) Add support for MPS
 Multi-phase mp2888 controller
Message-ID: <c03c6c3b-0aab-6668-b032-f5869ff69bef@roeck-us.net>
Date:   Mon, 3 May 2021 10:34:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB389893AC33FCFC7073C41F77AF5B9@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/3/21 9:11 AM, Vadim Pasternak wrote:
> Hi Guenter!
> 
...
>>> +	case PMBUS_VIN_OV_FAULT_LIMIT:
>>> +	case PMBUS_VIN_UV_WARN_LIMIT:
>>> +		ret = pmbus_read_word_data(client, page, phase, reg);
>>> +		if (ret <= 0)
>>> +			return ret;
>>> +
>>> +		val = mp2888_reg2data_linear11(ret, PSC_VOLTAGE_IN);
>>> +		ret = val * MP2888_VIN_MANTISSA;
>>> +		break;
>>
>> Unless I am missing something, this is linear11 with, for some reason, bit 10
>> erroneously set for PMBUS_READ_VIN. That means that setting the format
>> for PSC_VOLTAGE_IN and clearing bit 10 for PMBUS_READ_VIN should work
>> without local conversion. Am I missing something ?
> 
> On board I have vin 12V.
> From register I am getting 0xed80.
> If I am masking bit 10, 0xe980, it gives me 48.12 V, masking bits 11,10 gives 24.00.
> For getting 12, I should mask bits 11, 10 and shift left bits 8 - 0.
> But I it doesn't look right things to do. 
> 
Turns out that is because the data format for READ_VIN is not linear11,
it is something like linear10. The mantissa is 10 bit (unsigned), the
exponent is 6 bit. So the exponent is -5, not -6 as one would assume.

With that in mind, I'd still prefer to fix up READ_VIN to linear11
instead of converting the limits to direct mode.

Thanks,
Guenter
