Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA140801E
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204502; cv=none; b=CDCnXhOYN1dne11towMDjJg69Wps7tUWgXLeEh0kQYqNSTnJ9vxHtGWx0PvbMUqdwGEY2j7IOIGfiS3v9RiHVX6DUqMT3ehkWRp1y0xegYjkDKSt5YRqzlQ+lQKHxDvUKVooYHH7WFHyR7KrunxXo9ImKrXRYB38iLgnGoOZA1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204502; c=relaxed/simple;
	bh=7U3DpHGKHbLVxNQHooKXxFaPlFJ2BrqPpyXAw7jk440=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvtXrBvzhqO3QK+Q3LiDvVNCV5YYUs1BqiAyMQ+dRe2XxJaylMplj76HezirfB/oEfcqwoUZTcqDQthat78JC4K7Kf8Q+lCXOloEvlOYO112hZmSJWLmMNn/Is4ZWUaJZY1SRfYlFDJNTtgq6HaxOQwPIX8wY/7TlGcEep7jHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hEUI5fZ2; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hEUI5fZ2"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so33459867b3.2
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 08:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204499; x=1779809299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ybKseu4uG1MNY6IQoD8TBrLpm9iKlKVO0I43NmR8gBU=;
        b=JvYEMTiOWStWUuO6Utffp/+bvL1BC76gM+31yg3xutUxC0wvW7Nh/KwDWG3jItjTec
         fpZi3DgLWozStkJYC7lsKCdWa2yQx7+57Y5Jl9YBZLCgB9nyD5ze6JRy9uC10lyzYng3
         cOTjDoTVjbmfEdmDIV84zf/isFNe9aWO/R5J7uzDEgVb6rhbsdeTezZMdwSi+79Ixffu
         iE3484g9iFDu0/m8gXEcZbDQd6gmsqERPc/acS29SZlmjY1XVaurqoaGFnS0Xet1AZXR
         n6SCk+odQ23tyCunvYsEhrKavw6DzYsV0mta4j+cm5cVUpIIM9uy7PEoJGYo30/dFIsh
         PJtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NnpQD5woexm5p1hj024R3If4IsulDArvZjDMT2v8BsWdR7vet0AgPYOH3pAgMWh1rXbdcEONOQxEz0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL82O59DCcqjt66efUHth8Xua9yP55d8FVz8lb0P6m0d8qFQIL
	GoaoeKzOkQ8jv/EgUPUnY+OL4t9kN3yCEd4vjqhnF4XMMgePJKcI3Qk4OBIOVc0oj/zFcppAvJ7
	JmV+jg3rZMUD63mzLK7hBjXBXzLq0KoVg6p3XuF71QxZ3YcJrKs4Ba8T5NlaRpAXSR37RD3nDdE
	ae8Sha+ySk4Ujq38geHtcWjcWqMD9GeIFl5/89AML81znKY23PNIbkZFJYn/76asHcXp2/6Q14K
	g+kdKhLzt66wyjjxVK2Rx0=
X-Gm-Gg: Acq92OGNt6f5+EKMLRyC1R62eDGnWHKA5IYaK6oDeOkh40khg7CjP3DMuDYfqiH1baJ
	TJKx0uCNizK/3+NJTQAJfH4lLbKM2aLweWh1P0S4HIcsRP5bB359DM3/ICCcwYemcb9/slJDKXl
	Df4c/K4uogP0S23ja8bMDJ6r2rc6oz/qAB3+CYyqL9kzYYJRmrKtz+vHYDyP/SWser6LX2htMok
	XTZx55uIDUZWA1KKmngDtdhg6nkKlaNWZY2KPZe0FRlFZKIKeLPLUL5fqVeYkcQyeL/WIQuCZF3
	G1U8R5Lqh7YEKUkFtu0DjIq1zkSm8BMSHHvuQR597q4HXGafb3CKXMT6+T9LYwP8V9CrlOvD8MP
	jb6Mbkxa4pMGikBgmroAoeFmhrKaouAV4c8RPI0D4e+Jd7SRTYr2VoYYLmPRzMpvF2A9lNR5ZYC
	Lc5mr8uUiHKA==
X-Received: by 2002:a05:690e:400a:b0:65e:3bde:1afb with SMTP id 956f58d0204a3-65e3bde223cmr13298271d50.34.1779204498919;
        Tue, 19 May 2026 08:28:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65e0db30c04sm1327795d50.27.2026.05.19.08.28.18
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2026 08:28:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8c9352f816aso89552576d6.2
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779204498; x=1779809298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ybKseu4uG1MNY6IQoD8TBrLpm9iKlKVO0I43NmR8gBU=;
        b=hEUI5fZ2SM43Ja43CBzkQu8sZwS5MoIiEgboTBYjFWmpmlYu04bISODmyIFR68LAzT
         ACzTRa1IlvsOBHqvMFG43cgJQW1koWBKt8dhwMcTprpTL92BzoQrjk7klIbPCn0ED8S6
         pEmRS9ETiOeaqHzQ/VYF0+g8gnQ06qCXgPme8=
X-Forwarded-Encrypted: i=1; AFNElJ9aI3u2+TohUafQhsCbkJ2bH1lE70zLV7J/Z3088DX3motNnqwIGNEctV8Tv3PuKRWzmk4KYlFZLkQ0oA==@vger.kernel.org
X-Received: by 2002:a05:6214:484a:b0:8bd:1f2e:7063 with SMTP id 6a1803df08f44-8ca0f643076mr294961706d6.5.1779204498085;
        Tue, 19 May 2026 08:28:18 -0700 (PDT)
X-Received: by 2002:a05:6214:484a:b0:8bd:1f2e:7063 with SMTP id 6a1803df08f44-8ca0f643076mr294960916d6.5.1779204497466;
        Tue, 19 May 2026 08:28:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3619c29asm93644856d6.34.2026.05.19.08.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:28:16 -0700 (PDT)
Message-ID: <31af08eb-8299-4ba9-aaa7-3150ce31b523@broadcom.com>
Date: Tue, 19 May 2026 08:28:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: raspberrypi: Add voltage input support
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 5/17/26 01:04, Shubham Chakraborty wrote:
> Extend the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements through the hwmon subsystem.
> 
> The driver now exports the following voltage inputs:
> 
>    - in0_input (core)
>    - in1_input (sdram_c)
>    - in2_input (sdram_i)
>    - in3_input (sdram_p)
> 
> Voltage values returned by firmware are converted from microvolts
> to millivolts as expected by the hwmon subsystem.
> 
> Update the documentation related to it.
> 
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>    Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
