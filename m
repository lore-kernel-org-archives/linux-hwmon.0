Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9D3C0B;
	Fri, 24 Jan 2025 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737730577; cv=none; b=Fsa22MNvuxUSLms6PZebZUeu8AM6N4uI33iQKDB3oVOTREorP5gmLfjCk1R78D3Yt8gPClsR8kOGX7bkxR3Vt0GyJsylxn58m6GfBjdurGvSn5JwnNtMlEWoSQbfhh+8hsYLDtrfh9svnS5KJyoeJPFCqu+RJk8tEp/u2XGPzdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737730577; c=relaxed/simple;
	bh=gOSnG516AQWd/tWj1MLID//GigpPHmqBezrYFe7Kj4w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GAkerAw+0gM1Me9XVWdLAettt7OgN08zhlI5hW61ZptuFeG/vfyXdO/1gIO8tyzfsyZOrHjfn7VRTEUVdp5gmjks/awfbtycgSemHKxOvMqXjqVTebMvbKbMr6N/ZoWW6wMml/Sn+3e9eQZ3ki/5I0F3xD7y07VK0Ym45eDUYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3ZXKWAH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3ZXKWAH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so22793305e9.1;
        Fri, 24 Jan 2025 06:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737730574; x=1738335374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmQ18C9MeCo0UCNJIujHAEajbVUBuKz0DqhdhG4JTb4=;
        b=k3ZXKWAHFx2BL609M3FFV4bifZ39+qNJwxF/1BP45oNB19lWt1Kge0zO0ILzvFA3pr
         oFFBlAEwpkQLNLKpnakXm9HjEycC+e4sDXwJVlqEAqUirdOo/ZHZ/QpVIJjLlENqZtWb
         5fSjsflrXkdv1rh56eG24oCIj+c40aXXnOT2yQxmUinOW/e6DhPKbgVk0mW1PJo8S3a9
         oLTiMdNvWNE46K0Kk6F+Rkjo1XXMcOTMkZeJ9LZZ/Gh1WyjBoF366l/JVH4/tP37kMR8
         xEZA0cf9cCXPQcvLxHKDeM5J1UtqEZ3mhdI4eoH5f2ypILY0u9+E7H/Xid5Tayj6S3r1
         jBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737730574; x=1738335374;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmQ18C9MeCo0UCNJIujHAEajbVUBuKz0DqhdhG4JTb4=;
        b=qqpCnUs+PdyxzjRzwOarYxcsrzeNZPi9zXduffQKweFWWGLqAr6heXq7avC+o/cNUT
         0V5K1Yv7P7nKhP4rAMpyY+H8TGLSYkhHIlymI9DcvKj2971qSSSytfNu9O8i08IlNt2P
         FCs7imCPVg5vQBntKrWPAOT+wLe64bn3KA/mtguvdv0aAj6U7RE/SpA8BwsHG54IMOSi
         RwRUwaO4gk6YJaDiY/8tDEqK8q8bbceBTu0IymFQONx563G9XYpu263fBzqx8q9IZpTw
         x9fGnaTjJyyNNimr4SVNSA8CCDM6FvqazEi3bHbMk3LlVGxvM0+JW0F0sFDqLpPaCZ/d
         K93w==
X-Forwarded-Encrypted: i=1; AJvYcCVX2oxC5QJgInw3hXy8yGp1quVUfiJ7nH1aqnRkUUAyJjm1J2ljtMHtu3mskJS5hJvsdDKZ00KFNRXiLsE=@vger.kernel.org, AJvYcCW+OBM7ZK5kDY8rQ5Md6gFdRzL7nXg5D+l7QhNWZZidzHMUDkuoNeLeozNxUcIR2myTAtpak67fg8mt@vger.kernel.org, AJvYcCXAyhfKBwLBP4JgKP03ygRfwWezbeswUjW9B0QlKPidpfGNteVp5/VtNq+TX/SBoOMWbetPNA+3CvbltYyh@vger.kernel.org
X-Gm-Message-State: AOJu0YxWgyqcWqup6GA3/RxEMtCK903IMMKCWkArky0l3BwrKMBdBkeW
	MejNkA3I0B6oAjw/C6+B9rrIdDPS0Fv8hSd2naY3I/yMGsqd0w45
X-Gm-Gg: ASbGnctNp885en93pGAyJpxodcFsN/EC/w2nWxRzErVbHPTn1zvyxMKJjrSi/ElMTmX
	rCbjVWWfAkm4ij9JTGK1LyrHW7YGQVfnRTwLMNpataY9QE2SUKOOngJ7zLSQAu3qERMptP8g/3c
	VbVWWel2+4VhYmyzti/7yP82tH9vA3bf0u8W3lh+n4wqES9nqngg4/ZHKSeDcKoBo9KSmM9j6jG
	wt4wBmn548CMaS5iA2HnwsYi0i4c67/Gw/asiRBVCxqcbMGv+TGw6NjXxvCsMM00zwxrKk4CRog
	ovdbrLew6PO/h1ry9NQW0WSTi4lEMksJlmpY12Og2KZp0d2ZHJn1rRaNsds/5oj7iEia1uGREg0
	7HCfTz3MlkB9gyMRanyG5y7nmzYEPGl05W36FH1YezcTzr1Nk0JjSSl8vUnMhhljp39rureAWUj
	TjOVjTyw==
X-Google-Smtp-Source: AGHT+IHDiUAwKaImn0AEmySCypFyqvAIe5+5lTW4iDSlgdWJchU3ikFc8BG8MZP5tfzS1ehC7RA6Tw==
X-Received: by 2002:a05:600c:19cc:b0:436:fb9e:26c with SMTP id 5b1f17b1804b1-438913de937mr284299305e9.17.1737730573716;
        Fri, 24 Jan 2025 06:56:13 -0800 (PST)
Received: from ?IPV6:2a02:8388:e103:2700:901d:34fb:88b0:2f4d? (2a02-8388-e103-2700-901d-34fb-88b0-2f4d.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:901d:34fb:88b0:2f4d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d2c0esm28932315e9.33.2025.01.24.06.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:56:13 -0800 (PST)
Message-ID: <9c2bcef2-4e8c-4856-9a49-1f02110284a5@gmail.com>
Date: Fri, 24 Jan 2025 15:56:12 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: Re: [PATCH 1/2] hwmon: add driver for HTU31
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250123202528.223966-1-andrey.lalaev@gmail.com>
 <20250123202528.223966-2-andrey.lalaev@gmail.com>
 <20250124-refined-belligerent-hornet-270b14@krzk-bin>
Content-Language: en-GB
In-Reply-To: <20250124-refined-belligerent-hornet-270b14@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2025 09:31, Krzysztof Kozlowski wrote:
> On Thu, Jan 23, 2025 at 09:25:06PM +0100, Andrei Lalaev wrote:
>>     ibmpowernv
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 4cbaba15d86e..e123e06ba352 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -789,6 +789,17 @@ config SENSORS_HS3001
>>  	  This driver can also be built as a module. If so, the module
>>  	  will be called hs3001.
>>  
> 
> Looks like you add here stray spaces.
> 

Could you please explain what you mean? I see only 1 tab and 2 spaces right after it,
but they were here even before my patch.


-- 
Best regards,
Andrei Lalaev
