Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCF3E1D07
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839960; cv=none; b=hv1zhFl+8iwAFZ+lcc4x2Z6U8elN4/8X7td3TWz63NwVrFU2OXYAqcCVdqNpYUOsLzyuJMqhvQyalbBgljpq+fwKZ8r9RuUWvAdrmGSeuKHZdkQbrFc/mH90+OwOk7IbMIDNzUDeHNgNNaNOHxK2poTWTDCShiXCy+c7RsWkHX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839960; c=relaxed/simple;
	bh=ZJQ/6STZALeRog1n9zMG3DDRsVZ8lpyVsIt/JnlaSvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdh7dqQ9NwFDFg6yg5Dq8B1Rz8VZuVurQcfps0823uQymjOhbvjiTTVPXIcSHkTPIE4+5uu1KlXBrMD462SCHknLWo1Man5zKy4Ogorx1L59h6QL0YtlObScmrZBPo+xS16cXYrim62tqaZcRXPxK/oGVPBF5E4XnUoWGCNtRVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PapauwYy; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PapauwYy"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c54c68db4dso3968689eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775839957; x=1776444757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ipHaH6PMq71U83t6ZzV35VtmOmfjOzg6Hcsr7AXxQVc=;
        b=PapauwYyxLqqFJUSza64YOmLwwJ7jTneDrwjFmMP2Her3/BGRDB2qVoNsJYF4NT9wB
         MSa6A84kfJm9T8uRpDdMw5YYPmdvF+6ZditpMjZBgfr5QQDV0azpqEcJZI0OjM0wDZPO
         2jFhgWWzT4bFEb3A0NiaLqUpSpeR8M5COc7i36YmCrY4qVx2Jhsr1TL05vMw9a9EeE81
         m5Ir97W4KppWayZ5wH/nlTht3tSwUW0Daan0P5dv1x6lAetUQYwpRMB4k/rUZ6XPg1Hp
         A1NfRXRuxm5sN24N5tw6AOZry9rI9DtENRHHeEfUVfo/QgU6s26fqi9fiIR8uHPmM66X
         1bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775839957; x=1776444757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipHaH6PMq71U83t6ZzV35VtmOmfjOzg6Hcsr7AXxQVc=;
        b=maSrWOim50/NZ4ZT+Alvt92kGtpsYDhW9v8fbUIkJqxQN1CjUpHAT77hg22O1EvPMy
         z24PEe8PRfvaYP//TKQVGyseU0lxSkOY4EJDr3eNGWz9gz5NXZMSrLT4+9dw61yh1lmw
         NumBLZJlyXi9e5rE/XQdsG1UgLFo9LlVJ5fGA3h17vxbOx+29G/0HcmcWzwj+AFQXWHq
         UeVyUDXWthV3CDBtHbsmliwWxiPpqOyaRuoUhYPrc21zcKVFUc6dVj1T5YGPzyt0hUYh
         BhGs83gZhVQ+brb2ofrFymkmXkVBHgVP2pJ+VuYjvgAQ2pXgajUI+jyyba2lGvlOm3JF
         9s7A==
X-Forwarded-Encrypted: i=1; AJvYcCXdkixc1ee1Yir+Ev9Em2OmQuEw2wqLtuNBkTJr8pmNEWPQ1hJV/zthqcJBwq7v20465xcKOPiCx3LrLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeEUzowbxZfdX3wQe77DPb+yOYlKbFLLtFzlYltKu3oxJb3bD
	vyR4NbdpLbN7Y6J8tz10qHWE5GLDcYuVI9UJXXIo8SvW+ZmG1LvbroQxqcErwQ==
X-Gm-Gg: AeBDietKitFfISJmRah0SeGFth7NwE37/s9L6Dj5rEOMDYf3qMpGPCm4hVHamlWwx0F
	ojVzJMP2fIKuSp3k6fImktuDewnj0XJMTfQUOGKpuSZinUutg4oxxqMpLmmaq53SrypdxlJsC3/
	joxCPXq4cyR1Gxu1a4a5HNk55kL2GIDUziSrFyLAcuNO7KwvOjnzbK2Ig/J2/yZgauqjaqU9aCm
	5qp6JGfF5tk55CVUtVFy7/CW7i76dDAP4NTLaiXIzav72XjnHDopTn9RezkqKKAnSwAobfmrSTB
	xdd+tKBDlqDtBgoBmUeAW3vNWYRNBLqYdcYcjgi57w85qvl8n1wimo5Yn2Xuj3lHSE61Ec3Woh7
	GE4rJFDcGcT2Q9/SUbzj/Pu6Z+jEN4e6cUCXxOikAbqzjGNdT2+Ipy9ZhTdM3zcKvOKZj76N4du
	G0Tp66uT8EPs+lLYLSJrG6dVKrTsKMA/Xgbo6yGkz2Rs7hGFn8p0EW2UfRo9shWUnQCIkMRLkln
	pNrYFZ7NQw=
X-Received: by 2002:a05:7300:320a:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-2d5877a7b8fmr2872302eec.8.1775839956718;
        Fri, 10 Apr 2026 09:52:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69d5sm5736628eec.3.2026.04.10.09.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 09:52:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6a8479a-b955-41d6-9b45-1b16ef438188@roeck-us.net>
Date: Fri, 10 Apr 2026 09:52:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] hwmon: (sht3x) Add support for GXCAS GXHT30
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/26 03:14, Zaixiang Xu wrote:
> Hi all,
> 
> First, I sincerely apologize for the noise in v3 and v4. I unfortunately
> missed the crucial feedback provided in v1 by Krzysztof, Conor,
> and Guenter.
> 
> In this v5, I have completely dropped the incorrect approaches from the
> previous versions and completely refactored the patchset to strictly
> follow the maintainers' guidelines:
> 
> 1. Wildcards are entirely avoided. Explicit chip names are used.
> 2. The standalone YAML binding has been dropped. The devices are
>     now added to trivial-devices.yaml.
> 3. The redundant of_match_table addition in the driver is dropped.
>     The driver now relies on the I2C core's fallback matching mechanism.
> 
> Patch 1 adds the vendor prefix for GXCAS (Carries Conor's Acked-by
> from v1).
> Patch 2 adds the explicit SHT3x/STS3x and GXHT30 models to
> trivial-devices.yaml.
> Patch 3 adds minimal I2C ID support to the sht3x driver.
> 

Sashiko feedback:

https://sashiko.dev/#/patchset/1775211296-63722-1-git-send-email-zaixiang.xu.dev%40gmail.com

I think at the very least this will require a proper of_device_id table.

Thanks,
Guenter


