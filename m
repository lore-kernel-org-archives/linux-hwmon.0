Return-Path: <SRS0=B4Vt=5R=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14326C43331
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Apr 2020 02:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFF0920842
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Apr 2020 02:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="futOldii"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731548AbgDACby (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Mar 2020 22:31:54 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37390 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731536AbgDACby (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Mar 2020 22:31:54 -0400
Received: by mail-pf1-f193.google.com with SMTP id u65so1132919pfb.4
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2020 19:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dLkPnJH4gj4ZgEzEiKqaC9rDY4KC+cIXQqyc500hsbw=;
        b=futOldiiQZvNdaZTM4P5OVGlSuJgKH7oajbeuQiW3MObvFPVVokhPEk1bGtdZaWfxO
         uLBAe/DDLFL4PsfFu9tVEaNMu98TpIHWsdRdQ9HaIsOQzaeW8ie9Xo+cAbdkP9cGhFrQ
         uaaA7PzBt2hF5RXKIEExLgNQNtWqgvIEkRTPcaKLSNu8uEH02Kh6Z1EAyJdD8QW6G5vq
         mtfo0TDtZGluRRIa0GY+Fy0dAKqfYoaI7JFrfQTyHKfZoCrMG0UZ/PYU+H21zg/BBLRS
         hIdgv+1R5pXmuOV0q91HbVYj+KvJjn1GLqdUY8R5WUAemlXd3jxf+kahgwfWj47SEuIK
         A5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dLkPnJH4gj4ZgEzEiKqaC9rDY4KC+cIXQqyc500hsbw=;
        b=ljOAHmJeNt831gxtMRmjs3BrcJSZTUHHyQukEioApgA/dQhHK8PEY+A0PQmgmEsnYE
         Q9Ci3pgvF6Ow4EnlplpVzLfeQUQrhWhIjOHhr89oBQO+EGqy6FaUAaSNzyUKF2DhD3re
         xdhijZ+f3t2E+yRcxjT5p2e5B8aFoaIXJBC6VHtFMYDzfub/3ZPYQhlKBhlmxDPWBuEv
         dVvGkx3IewV2hqb/XcE+OwpKiArFTNfuwXIrclhZ4zf5Ab1NCjC++8aZ1tGT3XzhdgVY
         0a6zrVMi0t0xmbCovDJwE0TYTV6uTarEK4GqTJzsUY075X9W/xEjQTLzbRXAg+n8dT6i
         Hyxg==
X-Gm-Message-State: ANhLgQ2uyeFGbFm01QjYPKXGH75NlhbjA1Jwouyu8sdxjV4mTDKgZJaf
        V2/npmyFSedoZqDexws9h6EI51Q1
X-Google-Smtp-Source: ADFU+vvhWsOrrKyJV+ZmuSA2EvhYWIReEOA+MxBAqHKh8/DoA+RabeeKtbR8j3crEfKpa+oosV854g==
X-Received: by 2002:a62:3487:: with SMTP id b129mr21224936pfa.150.1585708310990;
        Tue, 31 Mar 2020 19:31:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 67sm372124pfe.168.2020.03.31.19.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 19:31:50 -0700 (PDT)
Subject: Re: [PATCH] drivers/hwmon/dell-smm-hwmon.c: fix blank line
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Michele Sorcinelli <michelesr@autistici.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20200331225708.52822-1-michelesr@autistici.org>
 <20200331230254.hxntiaq2s3ynk7pi@pali>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bd8007da-2189-4d22-d762-bf48e326f589@roeck-us.net>
Date:   Tue, 31 Mar 2020 19:31:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200331230254.hxntiaq2s3ynk7pi@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/31/20 4:02 PM, Pali Rohár wrote:
> On Tuesday 31 March 2020 23:57:08 Michele Sorcinelli wrote:
>> Fix missing blank line after declaration: reported by checkpatch.pl
>>
>> There are other missing blank lines reported in the declaration of
>> struct smm_regs fields (line 120) but they are probably false positives
>> so I don't think they need to be changed.
>>
>> Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
> 
> Hello! I'm fine with any coding style which is consistent. With or also
> without this blank line. So if Jean and Guenter as subsystem maintainers
> want this change I'm fine with it too and in this case you can add my
> Acked-by: Pali Rohár <pali@kernel.org>

I'll have to think about it. I don't mind cleanup patches as part of
a patch series that actually improves something, but standalone patches
like this are pretty much pointless and only a source of future failed
backports (and, yes, my thinking on this has evolved over time).

Guenter

> 
>> ---
>>  drivers/hwmon/dell-smm-hwmon.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index ab719d372b0d..7b61b613aff6 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -1276,6 +1276,7 @@ static int __init i8k_probe(void)
>>  	id = dmi_first_match(i8k_dmi_table);
>>  	if (id && id->driver_data) {
>>  		const struct i8k_config_data *conf = id->driver_data;
>> +
>>  		if (!fan_mult && conf->fan_mult)
>>  			fan_mult = conf->fan_mult;
>>  		if (!fan_max && conf->fan_max)
>> -- 
>> 2.26.0
>>

