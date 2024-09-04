Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB641E4926
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Sep 2024 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475334; cv=none; b=swhMzMuMwmW8Dz72jIJAH4h9ylu/WE+S1TdM9E7WXzCup1JnPTqAwVhSXyqHRK2A9+Je+h6eKVpUhbxgtKUJbBTsqHCueqfOEoDB7gqogJKdSkTtYBkUQyLd6GsSyqjAfmo26G4adaHLUtFawqGs1L7KyP6u5fQrpxB4n5LjP2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475334; c=relaxed/simple;
	bh=KU0DM89FP7NNLSMII7Kar7HQTWZDTibSYwQxMpWSXS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogCEVbeeUHzrJ9fvEMDiYb3orrJ3QrRCHARpyQb+Ce0VeUjehhtWKkup5LUIs5DunYag0b/Gf+W9IEL+4p96NQBDy1CwbVTrh/5tZ0rMicxWzrPXaXh2j0fA2IPOtezcdXn/Zon5T3g4vhy98sh2GLEctGEwOA0VRu740oz1850=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JddpcWRa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JddpcWRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725475331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiStKQr5MQ3eQ9f3Frd483InuNNxa84CGz2fxljewuc=;
	b=JddpcWRakwhGAI3AsuG9MqU8TKZXe290bdJjOpffXdtczJoQvDriabxp+Vl+m3eRYQqx/R
	//CA0bod88miOGoxrq15hj/nZPeJFmtj91BAvBroFxD6yjqrJKqeS6IN6MGJpYXKMPTbv+
	eYpl6drlNZ7NnsYDpq6zuBNkYHEfrDw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-soVMFFRbOY2WFY-lzd742A-1; Wed, 04 Sep 2024 14:42:05 -0400
X-MC-Unique: soVMFFRbOY2WFY-lzd742A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a868403dbdeso539293866b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Sep 2024 11:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475324; x=1726080124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wiStKQr5MQ3eQ9f3Frd483InuNNxa84CGz2fxljewuc=;
        b=vxbz2qdSrrbtsB3g1jeqAjX2I4WuzMpjV/eD4b6/QCrtpqDQJYNKDtwgLi4DqxVgdM
         egrHBr/jsL8fKO83r74t91CvgC0VBq1anKTMWlG+xCTIvlXtdkWlbRUR49XAHmmIX+Ns
         4QX+fUuxA/vHoTYDuMvd21lOpnZm8nSHaozNCko23dX3VJJ8bZHRwC3fR5iiG1Hd0Wu2
         yqGhV5t2iUbzODkyC72VuGE/W+Yx2vl3zq+FWqmuU6yWjsWYH8AhgBZZw2HiJb5373dq
         MLLQJ3joqFz46nRU5/pRIyNvnCDvIFuN/JYp5DCw5tEWS4iVaTbQd4/CuzDfxMxxUg2I
         +sxg==
X-Forwarded-Encrypted: i=1; AJvYcCWV27SwTvt9UE8T5jbVq/dX1Z/2G+OlqrRwqPgInsIitMESrpu58depZrqBcfSU37gk7CpqRVpTwQVyPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtG8PcH5EfOwKFOl0Zw8XzY0IIIuTKS39e+iaygmKVOUWqG4cg
	msHOwI5I16cMjojdNmLm7Bkl6Vg1EqQD1kD5Ed++OSr/yYqoK1GGt+wvr86L9N7y7rIhp9GfXL7
	YNnByipY76AAIzwFEgmQP9bR4RALEoWp4kjIGGYQfEfzF19igDmrrdidAxFqQ
X-Received: by 2002:a17:906:8903:b0:a8a:43bd:a9e8 with SMTP id a640c23a62f3a-a8a43bdabe5mr146887266b.65.1725475324354;
        Wed, 04 Sep 2024 11:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkZm9z+b0p/5nzedvKbFagKfIqWn0+M/jiPfPzYDcTT8hChkeZMaijJmNKjc7odKysNSE4Iw==
X-Received: by 2002:a17:906:8903:b0:a8a:43bd:a9e8 with SMTP id a640c23a62f3a-a8a43bdabe5mr146885366b.65.1725475323812;
        Wed, 04 Sep 2024 11:42:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a61fbae00sm23990266b.10.2024.09.04.11.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:42:03 -0700 (PDT)
Message-ID: <ea8adf37-9fe2-4a15-9666-e164c192bedb@redhat.com>
Date: Wed, 4 Sep 2024 20:42:02 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hwmon: (hp-wmi-sensors) Check if WMI event data
 exists
To: Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>
Cc: james@equiv.tech, jlee@suse.com, corentin.chary@gmail.com,
 luke@ljones.dev, matan@svgalib.org, coproscefalo@gmail.com,
 ilpo.jarvinen@linux.intel.com, jdelvare@suse.com, rafael@kernel.org,
 lenb@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240901031055.3030-1-W_Armin@gmx.de>
 <20240901031055.3030-2-W_Armin@gmx.de>
 <e90b40e9-b3a5-4228-8f12-b02a77b7789d@roeck-us.net>
 <bf7910d7-395a-4d01-960e-46789d836da4@redhat.com>
 <6f900fd9-f850-44a3-9409-18889add2cf3@roeck-us.net>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6f900fd9-f850-44a3-9409-18889add2cf3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Guenter,

On 9/4/24 8:38 PM, Guenter Roeck wrote:
> On 9/4/24 10:55, Hans de Goede wrote:
>> Hi All,
>>
>> On 9/2/24 4:28 PM, Guenter Roeck wrote:
>>> On Sun, Sep 01, 2024 at 05:10:51AM +0200, Armin Wolf wrote:
>>>> The BIOS can choose to return no event data in response to a
>>>> WMI event, so the ACPI object passed to the WMI notify handler
>>>> can be NULL.
>>>>
>>>> Check for such a situation and ignore the event in such a case.
>>>>
>>>> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>>
>>> Applied.
>>
>> Thank you.
>>
>> Unfortunately patch 2/5 touches the same part of the file,
>> so I cannot apply the rest of the series without first
>> bringing this patch into platform-drivers-x86/for-next .
>>
>> Guenter, can you provide an immutable branch/tag with
>> this patch on it; or drop this patch that I merge
>> the entire series through platform-drivers-x86/for-next ?
>>
> 
> Can you wait a couple of days ? Since this is a bug fix, I had
> planned to send a pull request either later today or; with that,
> the patch would be upstream.

Yes I can wait a couple of days, thank you.

Regards,

Hans



