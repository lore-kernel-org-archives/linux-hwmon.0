Return-Path: <SRS0=Dm/l=UJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31A4C282DD
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Jun 2019 12:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D084207E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Jun 2019 12:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc6pTuZN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389606AbfFJMsB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Jun 2019 08:48:01 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44005 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389474AbfFJMsB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Jun 2019 08:48:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so5243822pfg.10
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Jun 2019 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DBbVjlpcwYWcynbbs0vLiocJEpaFuTDDRMrFS3E6L0s=;
        b=kc6pTuZN2ZVyNRdfRcyKaH1swex9WZEqzLT5Wg/bAK9qU745AoGs+ymnwrYmuQM79Z
         U3wUf5Ep2PFSllANemITtaNJjwtXqAbNEyo8QqUo89e3rwFQ4lXiK4U4WIvlJi7euHXP
         MqS6cFq/B0mOsggZkcYkx94mbNrSeXZAAfN0PrTPj68SCpbwsU4YFpJ5c17PX0F5pzhh
         JJ3pFFBzpoLKdwvh160I41ESDuLxZB7ArofKGJhOnYfPdspdqyzXw8tWYM1vQNjNdl1I
         Ve3TsfhVrKasK4wntIGmjk4eNr49OAhVT4IVGiYg6isGl+kPZwjSHnugPftnmYCRT12U
         2A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DBbVjlpcwYWcynbbs0vLiocJEpaFuTDDRMrFS3E6L0s=;
        b=PPw0EoE+vqLsu6BojTXeaEy+wJuSsVn2CFWEpKGPtwXKh1W+Q1isL17/pfykDAiS4g
         mTxSWUNNB1lymdcetgC9XrdKeQsH7RsKjEZHmit+syTZI3bSg5fYy30QrecXsyJn/S7d
         xcKg5EBJZJNR7KNJGiKIij1cdGVFDYOR4CEPF8l40edFQJnkCaZX+rzQz4viCUtH88xu
         2lH8aMLi7mTBf87c/vAAlr6PhpmwnlT43NWTsBP90LqRAeyppJz45foM8lHxDAOAtCyy
         Rkd6VAjr03SeubzYikcCrNTiCYZSVrp9c5mDv/y+sap79Tjqha9kCLHaDb5rIS8Ov3iK
         XcqQ==
X-Gm-Message-State: APjAAAUhbQNVokCnYcVv1yeALFnyCMwc4FbEpSMud45dWZf7sK6i6K4A
        U6cMIdmzeyZqGYd/nJMbVgg=
X-Google-Smtp-Source: APXvYqzov3lTMHFAje+dXMUlbiJc7i433+zpxOVTB9Vn4pg7fV1rb3Lr3seZQUe999AK8S2zh1dgGg==
X-Received: by 2002:a17:90a:b104:: with SMTP id z4mr21080628pjq.102.1560170880303;
        Mon, 10 Jun 2019 05:48:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y1sm10592896pfe.19.2019.06.10.05.47.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 05:47:59 -0700 (PDT)
Subject: Re: [PATCH v2 04/10] hwmon: (max6650) Declare valid as boolean
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
 <1559928205-14030-4-git-send-email-linux@roeck-us.net>
 <7EFD58F1-4603-41BA-B7BE-472EF3301F7C@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b511e9ee-2b35-c7df-dbd0-e0826b9459ab@roeck-us.net>
Date:   Mon, 10 Jun 2019 05:47:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7EFD58F1-4603-41BA-B7BE-472EF3301F7C@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/10/19 4:33 AM, Jean-Francois Dagenais wrote:
> Hi Guenter,
> 
>> On Jun 7, 2019, at 13:23, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Declare valid as boolean to match its use case.
>>
>> Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: No change
>>
>> drivers/hwmon/max6650.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
>> index caede4d3e21a..90565318aafb 100644
>> --- a/drivers/hwmon/max6650.c
>> +++ b/drivers/hwmon/max6650.c
>> @@ -104,7 +104,7 @@ struct max6650_data {
>> 	const struct attribute_group *groups[3];
>> 	struct mutex update_lock;
>> 	int nr_fans;
>> -	char valid; /* zero until following fields are valid */
>> +	bool valid; /* false until following fields are valid */
> 
> Is there some compiler configuration that ensures this non-explicitely initialized function variable will be zero'ed?
> 

struct max6650_data is allocated with devm_kzalloc(), which returns zero-cleared data.

Guenter

>> 	unsigned long last_updated; /* in jiffies */
>>
>> 	/* register values */
>> @@ -183,7 +183,7 @@ static struct max6650_data *max6650_update_device(struct device *dev)
>> 							MAX6650_REG_ALARM);
>>
>> 		data->last_updated = jiffies;
>> -		data->valid = 1;
>> +		data->valid = true;
>> 	}
>>
>> 	mutex_unlock(&data->update_lock);
>> -- 
>> 2.7.4
>>
> 
> 

