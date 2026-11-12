Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497009;
	b=uoA2f9LsHI+vJgJjn6d18GNBDUw32CjZO362ebGF4LSow0tCUBjI3kaEDbJ4Rl0rR3zX
	 MfTSzN/kgCBn71+o74Rtdp5IfIT9g8OJf7n2/FFuiyjTVRvnqvsyj56BFKJkgB7r5XPcO
	 ggZwFMRsqBh6h+ebPYjs0l+q6a+9TYPt9Qc5h+IbCtzGSms5nGcv+4nX7W2Og/2dzhhBk
	 wxLz9nmy0qDZMYxKPBTCc6IafbwbIfQdFQsrWnqpI5SunFTtYXN4fRhfNhV0YQnkSU7CO
	 PMWMKGNAVWut3bk5pH+Q7QzzurohznzS1WKWwO4qxA/+YpyD5tEK1lgRrQ1CCgNkSDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ykN2lBUtf6ymGAIeUL7rd3VrIbiFNDowZV9GMRTZITM=;
	b=WzukHAl/l3TyRjHyhf/9EEJWwq0D+1kHG4ObAnbREeAMqikh3fJKRQeCxwqgNAs8LQbJ
	 GthfUSoK39P8wphzP5nsuNeELtwilp4q4N4lRN8W9oEdPgNBq1YErHrngZfYhITjawNQG
	 1bswiqtjckugWWBuc6E/sc6PPfVgXikWQi981N7k+36B8UhRJpyZBipKa0Oj09MRI9qFG
	 0TMovp8VYtYO1/5PTEdZHTSlWBEcWGF/AL8tR3D7tQHVjUn5ys37EPd0UEpUXqt+ftuHr
	 FKJjD9rLS4XbKMrlatkmO26SnpQL9YK68uzZZ+85zTLczqnCj7vizqGB0A3UoUgZeWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c1E4JNv;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25A960A3827
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 15:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25A960A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c1E4JNv
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4910b863b84so655424f8f.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 07:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497007; x=1795101807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykN2lBUtf6ymGAIeUL7rd3VrIbiFNDowZV9GMRTZITM=;
        b=0c1E4JNvnSW3Y7NixbmubZsac7eLcUXLkIMtzoMbkxG6k9cazBcj1ZfkDOhyBbyGw6
         HZChn+jfz6zkokE1FJWDlAFsMI1Fbv/Y9nLWcLIllA6rLHNwCiJt7bQOq4gcjs8c6e9v
         R80W6y1jhaX2dWqv8VKRXbNl55VmD9aLcBCAdMuo0ViOY2PKQyYWViFKP/Qv/ORj8/2R
         T4/Wq87fMJ9pHcgdxbm8asTXhjUdi0JUqU5KXL4qO2TgB7uCHSeo8FIquRbhITTrp3xC
         VJdp5yyLjutOV2T2w0eBlFRfUWsSsQBxm1/piuAFw5whudGyn4d++zCw0lmX6o1vRi2p
         6uZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497007; x=1795101807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykN2lBUtf6ymGAIeUL7rd3VrIbiFNDowZV9GMRTZITM=;
        b=tOP46eiQMeTPxZ8OykuMXHboCM28UJxQaE5LP/W5mE8PYko66dFVMQaZWMQb8Y8jZ6
         6Dddt9qhXa2jEjguxccle7EgHHDrc+3gmthPe5OvhaDWEUkkX3cWliiTnJKLhHmkmyOa
         O1lWbD+VTc6BGqdDZvIjNT77nxfpRMY0BKO0EWfysPp/O+s7uYAymlu6C5LJvC9wmTLS
         1MeApyHKD7AcoUWWfHRjqgTg3Opt7YEZB4whjhN4zBYkpo938j4nFL6DDYcXdmTExaXJ
         92n2EN+tBDC1sOnytGGZezHQpNq73v0irgI7mHgIuMCo7DpFJXBJKANyUorKyV5n54pB
         CrZA==
X-Gm-Message-State: APuU4Z8lS2nYPW8O4ayvGnC47LlZ3Js6Gz3dkm3mI6RD0g8LncVNdUKZ
	sh0yBHcMTCrBy5j2RJHMI/VxaPEWx4m4j6WNnDKWEvwDBxPByWfCUsbf
X-Gm-Gg: AYBFou1vQONtIeZyPk1/JQwIKsFJNgxobsf3bj8gO8KcS+24ctOack70eTO6wrrTdRg
	sqALG6A5SRlTAdfbypKipRPXF7MTAeZAAF7YFnujZTp3Kn4RIYgvGQm9Pc9zlngAn9cd6CHP4n/
	Ma2qHJI298ZhWw3MAt0ZPrNeUn5TI7Tmartgro6SM7GTtoxlzElQ8uyJOHi6Rli46JmQF8IAgL+
	0CMz5woA65r0IHAtO83zG7eiTygY8C3RMFYkQNjenDv2Os1UIGlmglrXIfUKz7xLCROJTda/U6O
	EaVuci8Qg4GfNFGUWH74uF0v+7n9+0HyJX0RGhVjlE77th/Xw13rWIyaPXpoTcq/LIq+UfjbMWc
	vk+PEaAyYahSvAz1GRF1M8XOUbTaP5XqUGK5gc/1z4v5OcILy9HqwnC5IPcmy3C5UWS7/4p8Iha
	tpWORJjY0tmR33mvuD3TWx7t9HBqUlKPztQUVfciZbHYFMI7/Y2ps/Oi1HB9dO0mBMUIQ6+W7io
	R93yEvuDnXQ09Tf7v2X9TqdOSNyI+YewvOcVqXeHJvbgC47rN9jugfDuNU7kK3uZc/cQMYyhRaD
	17+2s+H4JIEyWhmmdIIqzunX4Cc=
X-Received: by 2002:a05:600c:860b:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4bb4e296a9fmr58453255e9.15.1794497007254;
        Thu, 12 Nov 2026 07:23:27 -0800 (PST)
Received: from [10.2.0.2] ([212.104.214.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e251686sm75915855e9.3.2026.11.12.07.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:23:26 -0800 (PST)
Message-ID: <0734cdde-3c63-4a53-b405-5cf741f3a5e2@gmail.com>
Date: Thu, 12 Nov 2026 15:23:25 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260
 to fan control whitelist
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111150435.75965-1-shady.abh@gmail.com>
 <20261111172733.84217-1-shady.abh@gmail.com>
 <96902e72-6a75-42b4-9d30-ea54e82ee933@roeck-us.net>
Content-Language: en-GB
From: Shady Abu-Hussein <shady.abh@gmail.com>
In-Reply-To: <96902e72-6a75-42b4-9d30-ea54e82ee933@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

v2 only changes the Signed-off-by/Author to use my real name instead of 
a handle, per the automated DCO review on v1 — no code or commit message 
changes otherwise.


On 12/11/2026 15:18, Guenter Roeck wrote:
> There is no change log. What changed in v2 ? Do you really expect me to
> track that down myself ?
>
> Guenter 

