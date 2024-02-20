Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAA52C6AA
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Feb 2024 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708443923; cv=none; b=TH4bVNM7wUmVuIUd7JiYSb2LEc1Y5fhpcUXsYwm8SAWvU2QrVjhrRxCkevzMJgkm5RERmFK17O3Jor5QNY/QU9HKKuCwbl6j012x7N/vqo0t640baa6ZNUyAAZgQPnZS1JkbT3r8fTAilnqScP7d6sOo8hNA/+hV6rXSSQhW/vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708443923; c=relaxed/simple;
	bh=/Sjv/jTDcLqL6uI3nPLiRyxjXMsQGsjbpJlB7pBl5k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ND5RHsOVB2l+ssD9pgHT0IiORzoWAmGILgwhnD9cTt2nCbBP753MrtsnPjwoBsMSpN4BiGuy1b57RgoeO3UQsYqtDyvL+lCjgKAG8FCW5lC7uF5q7s16xbDssQ5CpOaUbZN5JkGcCfQrbeOHSgU1GpoxMo7FTp+++15tKcm9hwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaPIe85n; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaPIe85n"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dc13fb0133so8556205ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Feb 2024 07:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708443921; x=1709048721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uq1ozRPLbqzPV9h9S+8an6jiZI/BQCJX1OSUtGYnCo0=;
        b=eaPIe85n/X6SJCfVzeFI1JTbjbserceC21ehJbCwyLY9ltZvql1e55sem94j240ehb
         FCMmb9mzwVSGygb+CiYcsna+d1R+jpNas6HUiIZ9WRKjQi1Z0mLrBYiQVvkzI3+007FA
         BGC7pZou/vhmhETqVMkxiryGoc3fnsL5MAD3PgfnAqv8X+aJiKCJ6+gRGN0/w5EQK240
         0glRsUItRCzr1r9XNJWx9SdfEQXB9BOl5qwKJ3mT95eIncrFzHFPAJN2RII/JjJuprFq
         Hk5C3AskFwgPU7ArxUShmg4NK2tuJ9RJEw3X3c5vgsrWomiCzi33JWc/SN+PUXuf4yLx
         dlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708443921; x=1709048721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uq1ozRPLbqzPV9h9S+8an6jiZI/BQCJX1OSUtGYnCo0=;
        b=mvuZs0k6OUWY2pDEQcFQ+OKS3DXMdIh1EmBoLJQoJnSw70nWF6gwxk2rlhM/dD+nkH
         RqL5krf3023GQ7Pi7o+Bf4H6vEHNGtv80BsLKpfbAeP6ZKuWFRO9C2nqwbdPbYWCNVWM
         /5OQZjbysTKyslEfxBA++8PPjzUVj2yCySqa2Xd9+W3nia3IJESip3NOHVgjCieA7DxS
         GaOUY92LCqbW8tL8Exdg0jJ1KF7zL5o0sntIqMEuEW0HEOdfwK0L5aIlk9NtM4Hk+Qse
         OIdO0C5BFUseWiL6gPSJAt3rQrclJ5yaNX2WSm+E8eVwYrQo16fnuJ8oiBXcYzH9WcG6
         svMw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Ff0sVALKcDVQMsWuGvzJ7Exg6k3D8dHxzSgUcsFxczw0lJ3YcwZovFdamYjqZdyF+idpO52qgLX62s0scxof9saPN+Ijo9O5iis=
X-Gm-Message-State: AOJu0YzAD8hx8uhNM7RcUvw1BY9WPEQm+MW9UDFyovhpLaOqNbce/Xfd
	nrmClsgc0OS/yyCm7uoEK2QcD3EZg1W5mfMYGXmBjV80k4hhuI9hffhecOvW
X-Google-Smtp-Source: AGHT+IFF1zMAXU2IRcKgnWPafJrSq2p/hw/HiT7BiG+Jj+PF3770J+ftHFQaOM6K1MEa7rqKwNAM4Q==
X-Received: by 2002:a17:902:d4c4:b0:1db:fd5b:e1df with SMTP id o4-20020a170902d4c400b001dbfd5be1dfmr5920803plg.6.1708443921316;
        Tue, 20 Feb 2024 07:45:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902c65200b001dbbe6f1dc5sm6432480pls.40.2024.02.20.07.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 07:45:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <324097c7-05c3-47b5-b0ca-3593ce25ebbf@roeck-us.net>
Date: Tue, 20 Feb 2024 07:45:18 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9
 [nct6775_core] (kernel 6.8-rc5, amd64)
Content-Language: en-US
To: Erhard Furtner <erhard_f@mailbox.org>, linux-hwmon@vger.kernel.org
References: <20240220140110.311652f6@yea>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240220140110.311652f6@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2/20/24 05:01, Erhard Furtner wrote:
> Greetings!
> 
> With KASAN enabled I get this dmesg at boot with kernel v6.8-rc5 on my Ryzen 5950X amd64 box (ASRock B550M Pro4 mainboard):
> 
> [...]
> nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> BTRFS info (device nvme0n1p7: state M): use lzo compression, level 0

Would it be possible to run the stack trace through scripts/decode/stacktrace.sh ?
I am having trouble associating the backtrace with the actual source.

Also, did you by any chance try the same configuration on the same system with
a pre-6.8 kernel ? The source code locations I did find (unless they are completely
off) point to code that wasn't changed on after v6.7, so it would help to understand
if this is a new problem or one that is exposed by your board.

Thanks,
Guenter

