Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2E1D7E41
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777733290; cv=none; b=O3vBEROhCuP6Cj3Aex5tAeaiEVEgzvZVr0nD8m8xw5rJThKJ6k+ACTCsP9Zg+hwcSglXcY9qTUrHkPy3HENdqSQSNAzvJoUVyLXTRIScftPePMjngCDY3bgIbsFwWhyikSpeOHEHpcHAT5mHSoeJ1O35aJs23GUSU4Glh94wmzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777733290; c=relaxed/simple;
	bh=46Tm76T5vVg/3XUK88NgEklf9oDJ16ZvFU1JsZ/VO6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h3QSP5+RNw4nKhNRwM4gGwuuUQtouAxjzhQAhc/rG+d8ezNSuC8YamoPVeHcvqTNYTVR5CaPW7msDjDDU3eKeMsFkkGNg9LwxZ4T7B/Q0rCK/2/iFBEaoCJ0D9xq5aYONecwmXjd/PGV/NqWvbgI3AeL+xh9w9tOYe7m/+mKj4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIJlhj4S; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIJlhj4S"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c45281a06so4317792c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777733289; x=1778338089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=c5jZ1CoarEiOSwIoWW1VNZ7Ki+Uvhuwpedk7yjnYHDw=;
        b=gIJlhj4SqZZFABx0mqUCG0XSKocVARIsialDCTN+FyJa38J5n8xLHJgqJiEi0QwKyW
         M4bfxVU/cw/mAYZ579rStxQNq2G5fes2obvlLmfrNSqqFdFUZf44mIiQ1joP7/ouzEpD
         KkmJpt32okuB+k/TsgsFTvrW0Tp2NpzGdkYuiTRWLyIyCZeVwPnXoRRlcHCg4xhhF0NC
         /hI4FTOoOTGEYM7ojKIcrwqfq3+lFfIjku5PEMPXJgZbPaUwW3qOr5AbWEGZSP1yiayz
         giQFuw6Lg+o5Iu6YcV60XKuB8eKfFvbrBZAgAoYiB9qSpmyjWuFReHzhZAO4rqfMruAK
         bCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777733289; x=1778338089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c5jZ1CoarEiOSwIoWW1VNZ7Ki+Uvhuwpedk7yjnYHDw=;
        b=o4D+4VSqBN1yoN9hDKX9Sya0wvGvPpop0Feq9CK4EDYdh6k5pYRGff9TZvdh+Fspin
         L99tTAzjoBfTXqYSPwILt4h6fa2MOS6sTabKjTWip7M3dHJoyEUCE40IYvBf78x9l68n
         0Wbk525HnfPWvtieDugA5LF+pXo2qdcws7ouO668XbeRKay2JklNjHkH3tiIGi76aaii
         Qn7beOw8FUGI5nwGd+zoB88e2bOeQmTE4mzN5KjXo12WVbjMaLI1iZ1gSZcYLrBDEU4c
         Z6EZpOtA0Wk73x9+JIFk0Asa+SfLoynnSUAliFFxlpqlIJ7xRZLfyrWqo/IuWk9nDzpF
         Tl3g==
X-Forwarded-Encrypted: i=1; AFNElJ8+J4cGyKCC8w/2TMYNCDAgEBm7ig+T5aThHpkR+gQUeW/qP5rwbwXjVkT3iI6V7D+gZlfYW7+lSgGh4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmy6dkSTmbwPM/NYW2Z0C4euqF3NMOVDzOO1DyvocpEbRzDZMr
	z+t1sHJ9XxNO4NHYOhzOmHdwFJWj0WrMLegfG7eAM4tQzsFlc8A1QMCV
X-Gm-Gg: AeBDietakcWvrQuYkkFLzySjd1Z81eJKBP+INlZYbxoxm7aYcZx+VLjtqlyAJSZU8R5
	ImS09f7hdVfXPb086r/Vs/h5NF1iaEbiSD/Rhm/s07I8v5D7tZhJHMchY7wXU3fha8uXlHR3iIT
	iJpUM1Hc+T2oenEbWW7tlywLMVozkKH7QmWqHZHFsxfNraklueHe7wA3zxWgD0MbaP7n6JLgV7X
	ZCnXbCLA2iVWSig8Tzgh0nFFkwjUak0X+QPanhAygqSvtiC6Qx+MvsHf/86MKDt8n5xVk7rWk8q
	ELEXu3SF+lWnBxCqQWYCR6aKDUUprL0/JIjycQ+RiftDuhoWBMn3yTXIwkJLvW7XRya9OzXMbZk
	ucGb4UtwpDQAknDedYgYc1GarFPFQPVMSlMWVu7IzMZ27BUn1/3ZRBeu0VEJdZ9mkcdbbs2lKcx
	KirG2BKSQ5HjWvw2lDyoQzgoioBUbc5DWl2aBV6Ysg8HY4ZavdKtQY9FQ85a6kcAcZTUrXF5AJ6
	LlSOaaq9O2EaNlrbULPnA==
X-Received: by 2002:a05:7022:908:b0:12d:de3f:d851 with SMTP id a92af1059eb24-12dfd83bbf5mr1255711c88.42.1777733288845;
        Sat, 02 May 2026 07:48:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84250f1sm8065715c88.11.2026.05.02.07.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 07:48:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d591d58e-8a6c-4df0-b0a6-1b862120e4dd@roeck-us.net>
Date: Sat, 2 May 2026 07:48:06 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
 linux-hwmon@vger.kernel.org, wsa+renesas@sang-engineering.com,
 alkuor@gmail.com
References: <20260502094524.3358193-1-markus.stockhausen@gmx.de>
 <20260502094524.3358193-2-markus.stockhausen@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260502094524.3358193-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 02:45, Markus Stockhausen wrote:
> The initialization of the AS6200 has two shortcomings
> 
> - The device-add-commit states "Conversion mode: continuous" but the
>    the lm75_params structure uses set_mask = 0x94c0. This activates
>    single shot (bit 15) that effectly disables the sensor

Actually, according to the datasheet, the single-shot bit is only
relevant in shutdown mode and is supposed to trigger a single shot
conversion in that case. So setting it doesn't disable the sensor,
but it is either pointless or has unknown effect.

Sorry again.

Guenter

