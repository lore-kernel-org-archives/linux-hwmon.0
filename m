Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709EC2BDC16
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681145; cv=none; b=TcKMu/JkmWKo3oxtvUVohQ0TSlq6B/tfvt5CLXiAULqJindqdhrhJf2bebfeUcU5F3nhY00XjwZFmi+brdt9WPQmy6OYaurN3qoAJ2VKh4z+iOEyNqXlMv9AwN1nZhhe6RrQXNdL6kK9I5JfMUpSZpjwE7J+TldCocweVHCsBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681145; c=relaxed/simple;
	bh=rBOXqwWQ8mwmYLJsPxyjaSk4d7qHCF7BxdORHqxHnzU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=f3tCyZ8om7dYVb2EJXWwuUxasrZDnmux3MU8CsNcLLkba26IfDoQrgfh35wQrCF2kYoyEks/2QdIcgk06QOBLv4EdQhF0rXkxqJNGkCVnQFHZ2fVRCoETwfeIdo4GtLnE7zUyQeOlaA41C4l+8nT5ibYboReai6WCODQtdE/AJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+hNbXaf; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+hNbXaf"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1329fc4bf77so4133463c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778681144; x=1779285944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sQRXkG4wRh99NErHsyPmbae7UrLAtk1RG2SB7nBNkF8=;
        b=N+hNbXafkj3JIUbDiNT1O1xBTNpdkq8y5APLRmj1Wf72eYO/Us428c7aoR5FagTya/
         T5Xp0TWpDpflUrRfcyoTOZT9vPqHGmDUNAMVgy67Co/yZX63tkAN0sEbf/1umXgunnbM
         3yXHe3mmHVpXPSv2v6SmlBrzvYEU2ewkytDIyDwZ6zEdg282WyLMFhwHRLZlOM5SpINj
         1NtgH+EaqTlxQ6Iww8EQ3G6Ad9cP5EHkw0bHGvZMhHBFmOBnSFdl+Jve1pZ8kUWyMJov
         /9q3J+YGt3TOObDir/Uc2lOJyjLNDwb/zCCmqRnvpF4d/u2wzz7I6TSBwQZ2d+H4ZVv2
         bOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681144; x=1779285944;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sQRXkG4wRh99NErHsyPmbae7UrLAtk1RG2SB7nBNkF8=;
        b=r+0HD3+N6iMmGfzeV0Td4w0V37oZ5GAxskTaqkME/gVYyTJ7N29bLm3BbZ5f5oZQ/K
         USV66/8JAUjWKOininZOAOWyiyQeiU9kvmj44eCypAm4W5GtBOy0YX4r2e5pnVmc5Yyf
         8C/wEBlT8RvGtxSPqlc+Kft6A9QTqfRHZwpDihZ9EsA1yjSETY2ZqVLDg7liL9wCnXQU
         ajZKk/qeluz4c41NDq3xV7GC6jH8px2I3SNCFhXrL+2v2g73fwaDhkU4375zrxn0B2XF
         w2xHuJtiU6HDXpPeA6ERmAiFXOAaYpFt4D3SkHKeA6x/GyiUdTGgAQlsR1qgzW4dM5G2
         bvVQ==
X-Gm-Message-State: AOJu0Yzp5RKKiKD8Aq/cMwU2XVgabILnz7EyY5okyhiB6PwuwbDWqhJT
	Bwio8lVQhMgtrN6FEk1H4bFhuUsGzBBay8nC0VAkPOO1lcgIaoUGOctd
X-Gm-Gg: Acq92OGlYN9QRBAOetYPJLgFsRvVXNStSxaPqfKMijXVm5MToB5wXBri6dZYpJuzPJk
	AbNaOnswZgbh7rX3V+Usy4jlAvyfQjgFnNJMLezVqLplSAW44QnJKEhtHmYgFUDCPfG3jMp3sHw
	/rgBMxc1vyUkiUvDfH3EZyIEImvrNJpy7ni5x6DJ1mCCqCsngfPD9sLPH6LkYTHDzXIxoC4hY22
	F4lT/2UE0NuhxvtP5W0xyd6mcKXF0u/ciVJONK++LA6gpC5uKgv5K2gS6D0pcbXe8si2nC4u04v
	g5xMhmDfd1ovbSllKhpzYIN7hOXCeX2NP7wmf5QhR52LT8E3On4grJddIHM0sLwxY790wxKEmo6
	zKo8HeAOJMJTpGp0leBVygdtR/4kYHb0dMQDPGyhdHYKpDpOvcgxgx1U/M1+PgwZAYJ0BurkCgy
	dnnI2b0i/V3UplXvxenQ6eUk5NLt8joxa6ncaSNP+394SLEf+hSuk5YWhKggIGg7qw8B1J5gzt8
	2nDp0LTM/o=
X-Received: by 2002:a05:7300:e105:b0:2f6:811e:c840 with SMTP id 5a478bee46e88-30118daa1f4mr2145319eec.18.1778681143450;
        Wed, 13 May 2026 07:05:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8860c7accsm22141144eec.8.2026.05.13.07.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:05:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
Date: Wed, 13 May 2026 07:05:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
From: Guenter Roeck <linux@roeck-us.net>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>, linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
 <5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 06:43, Guenter Roeck wrote:
> On 5/13/26 06:32, Wilken Gottwalt wrote:
>> Fix removed locking mechanism. The locking mechanism does protect
>> chained commands (set rail + get value), which are two separate calls
>> to the low level access function. The hwmon (temps for example) and
>> debugfs (uptimes for example) subsystem can trigger that chain of
>> commands in parallel. The serialization in the hw monioring core alone
>> is not enough.
>>
>> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
>> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> 
> You'll need to explain why using the subsystem lock for debugfs
> accesses does not work.
> 

Clarifying: "Why using hwmon_lock() / hwmon_unlock() in the debugfs functions
would be insufficient".

Guenter

