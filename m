Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0091D9A42
	for <linux-hwmon@vger.kernel.org>; Tue,  5 Nov 2024 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730819524; cv=none; b=AT7+MTVqwqjDNo5Zw1wqSJHTdopjeMG/LqFT+bbLAbifhqZPlS6fwvsyxTcMLHOJv4TDw7HSx2l9EsbamNFpxqTLonjSX1hFuh0YjH/W2D0ubBjM4UnNJ5oDkJkk1BamRsXnUQiD1LmlTQhnYYRxR8WiBX3Rwj3fEEMJOmoOmt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730819524; c=relaxed/simple;
	bh=npQ6nnGKQRiLUKkln3dmqY4adAUI4+EEN5Y6ZvHfmSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mjs3263Pohg+AyPM6HtsWXu+Ds5Z3TNjroxU9K1AvDpV73D5Z28hbeh314qkKvrkoTZkybBfiS884hDN9fxOWEgaqL4YGynDj5wZto6Ek8SCO94kLu8esDOENqWsL6f1JOHzLaFUHK66KtXRpXBElDhvkfG3euUbk4402+92heM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdspHEcB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdspHEcB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2110a622d76so42617385ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Nov 2024 07:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730819522; x=1731424322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9518lU1QMzxGw7GXOhvIFHYAI+msf41TWD1PKJLmP1k=;
        b=DdspHEcBubhyDddOVuu2mz2TZBjXmffQbGXg2F1jzpaj6rpKw3KMqxP0zF8YEmxtjO
         QrijsSDO7rXQxFTFSABHJdoHCoumHfwi4KUrKdzJeN93zviXMRJ8bA4ito6TvcRX3FBK
         /66BT8BRVzxppX+9kXTPvePAP/zsQGc4Rrebg2YlXn6ibBT8y8DnVFznFlPYnO2fNxZx
         rHR/u4e3r9QsQLTW8PS0RJhUrRxFrdn9wq9AWszZc5SzHux9HrQITcr4vSjuJ9Q2A4PL
         ip0LhLbUYnE4Y8UF0GB4qlFdkB6u2RoLpIFE/mCtCoRIZu2AWL7BvDepxbOHxdIuznpS
         3r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730819522; x=1731424322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9518lU1QMzxGw7GXOhvIFHYAI+msf41TWD1PKJLmP1k=;
        b=Sq17JU/WjLEOjqw72vfPi5vCbec25E74/m/sb6sffEurlbYMfpMb5BmIMyCpiUbjpH
         eHvytLoMRfESfJjrnfFuan4LQWoax8wdS0D6FjkRgEOLadCgtjzSQ6NlZpD1qMGb45A9
         8aigr3s3aZlftwatwHwdWltd5xs38/q9RjM3A+WeX0HTcmH8KY9RmGq89R3B4D2Wui/d
         bstmhCzeR02d//4GdfB6vJHfOX350cyx19iYu6B+ZckvFRxbf3Zaf+UTP83VRrJgs0fl
         cxczFFbYRKFp7dpB3hBdCzZDTjho5Tpf9aIaBDjlo1wdi9loZQMZBDz+rthWMc2n6Qtz
         N+2g==
X-Forwarded-Encrypted: i=1; AJvYcCXfbKU+KT3oenqANSz0hohxH0oHd+jvha2GV2hlN8d8om69kqNlQoqJgaAUA0mebNzvGowbF/B6btVm1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyej18kPQRcCvIerQQ0MXUxm8oyeuAdxoPmNFRvHCAgXlyzBFZy
	WjPag5cGUlggFQQuuK9Y8gQQEGfS6UAtdcO9wTFLeh2Bu1wLy2hxFvpZAg==
X-Google-Smtp-Source: AGHT+IHGbbungnyqxdHYt72jhkHfh8Uc/M1hX24rOSZsI85f3pGS/6hOK4dk2CWfImyxnIOe9+mmYw==
X-Received: by 2002:a17:903:1c2:b0:20c:a175:1943 with SMTP id d9443c01a7336-210c6c6d9a5mr497903165ad.40.1730819521637;
        Tue, 05 Nov 2024 07:12:01 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057070a2sm79637785ad.78.2024.11.05.07.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 07:12:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <40f7efda-56ce-4a21-90d2-1f94baf85c48@roeck-us.net>
Date: Tue, 5 Nov 2024 07:11:59 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hwmon: Add trivial userspace-configured monitor
To: Ahmad Khalifa <ahmad@khalifa.ws>, linux-hwmon@vger.kernel.org
References: <20241102174639.102724-1-ahmad@khalifa.ws>
 <ed296133-4139-4618-b8de-f8826064576f@roeck-us.net>
 <c43b0364-660e-474e-b789-134970ca587c@khalifa.ws>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c43b0364-660e-474e-b789-134970ca587c@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/24 05:04, Ahmad Khalifa wrote:

> Just curious, how were you thinking of passing those commands? sysfs?
> over i2c-dev?
> 

I didn't get that far, but probably neither. i2c-dev is its own driver,
unrelated to hardware monitoring, and sysfs is not suitable for passing more
than a single value (yes, I know, I am sure you'll find some code violating
that, but that doesn't make it better). Something like bpf would make
more sense, but I don't know if that is even possible.

Guenter

