Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F8D2C190;
	Fri, 20 Dec 2024 01:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734657660; cv=none; b=Nw/rb+RzVl8nStcpchbKEhcA50L5BNEZ3AsJeVSBJo5oJjvEC4glEGyHvSV+RnbqX2tFh7gLzUjnz39D51M1MQXPEnBX39huxgo5Xt9QfAzhC4On6KG6+U4gMoLhftWJb/K0Br1iqShtmEA9hEsDPFB0iSq+EtkwM5eGY6SlWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734657660; c=relaxed/simple;
	bh=FpjYfeNB7BFRQ+MKO3G28025pJrgUDI8/f1QpvPRSxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qw6Nmgc7FkYHvfbnTmsmNdoLQoE7+YU7UiLC7+lxVevyinRxBhOYF/iiArsjhbtzKT4qlJQ4sAkFin/b6W/YjHg/IUS4K1hclgNGGJQrhbeWr1zzqHNj+KNCwYfD/pinfWS+C0PCn1mgjUerwP0ETUhletSCnjLVmVBM4jWhh/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSy2GJK0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSy2GJK0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216395e151bso9420785ad.0;
        Thu, 19 Dec 2024 17:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734657657; x=1735262457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hRaVYQz0eaqdlFoD9WfYJZJlait03JCSHyNRye+Yz3w=;
        b=OSy2GJK0yHtmhEa0gS9A/38/WXcOVMGvGvRSvlyAxabMe5b3bNE1H2r0f4gIP1Y9dL
         uvt+mIG3AqKVnDSixBhbrqOjGlGbQVFSFf8uZc3U+NFObcOYoLhdq8EL7Wg4sSg62fnW
         Dw+Vtw14jQYZ6iNiNCLRQpHaz5bf3LiBi15InhzkQggO6RnKukgAIwKORDPFA4SohBof
         +ul0XV+3cCsYWQeV/sGLgs8gRy0AlWlPjHzGmbwnmd6ChHtTzfgpmP3z9B+pGSBD1/fa
         bZWmPnl9nu5LykI3BzRRyOWV5/vaWpA5MdzHTeL5l4m6mZT/IAaqKgtsMumUWSJ/Wdwd
         44Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734657657; x=1735262457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRaVYQz0eaqdlFoD9WfYJZJlait03JCSHyNRye+Yz3w=;
        b=I6mZ9TIP3m/9HAPoDPs8vQdn2xNfZ9q0bzwFleiH1pnnoItqIcAnjE1Sx1+Mq4EOSA
         OGJFzsP3s+zc04Gmvj6aXJ4i9e9oULz3kW0RK93+kzi9dYhra6HTBxL2R0Q10m5yjx9H
         1k0AiRFy19gXNnm/bj/5QVc9Nue6QpFmVHpSg7WUV9K2DEb2KifNUqgWn7/M6wlh0JVl
         vGO7pla2to/hnYa/Od3HY44bgVtyG1jVTjKmk/tla9NY6qQgVvvvJ5cHTnicyoHYCDF3
         IzohECmjLI+FtuQPWCIhNbW0fDVekNWXOF693XaywSdZjIpxwB0N8AofxR6EpK8P2lq5
         rlqw==
X-Forwarded-Encrypted: i=1; AJvYcCU2/8nZri56HYOd1MZwclqARkxNuTZJz0+hT81JEp6rYM3waDYeNL1mVcR1Nfdzv9KCyoFN2sz5SvaRjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8wNETEj4NVvawDIQ47O7dotAAE6a50ekcfCSNBM+tnmACK3I
	E2b9pRnDZ/HobBBDSGBpa6o9R5tPbURAsz+PnzvLyv1wxQtAybLQ2qPy1g==
X-Gm-Gg: ASbGncsssnu675ko+cnXf+JXoww9fJugoondnzYkZFlneRX1zsYQ7xHCiCuWtYJyPnI
	4+0lpRzMCLjANI1Gqt6JlJ3WXO/qOX6O0RlPsggfeAHLBwWIANCcGsy0PxspY1dkYGxYJx09cML
	VrtxwUFzmsAaarj/mx4LV0e0zYrpW22T5UM6Y9icCuAPQuMaM05G/BIOOTVBeoQ7sEDwNGoxFHH
	i4w2EkA5YG4kieT+REJab9xuT42UoWr/mXksxsB/jG7yDAyq/UZwi5LoxYnyegwxfGMeE1OccKr
	MMi6C3CYy8tUU6DEJAxmYAtTQcgjEg==
X-Google-Smtp-Source: AGHT+IEtA+fzsolPYC9cmjhUtvQxdOEnO2qKu6/m1Kb6zvJlFUXZfTcBPK2EWTetGTvnIC988cjw9g==
X-Received: by 2002:a17:902:f643:b0:216:59f1:c7d9 with SMTP id d9443c01a7336-219e6d599famr16937675ad.19.1734657657091;
        Thu, 19 Dec 2024 17:20:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9630a5sm18698305ad.51.2024.12.19.17.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 17:20:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <92a841f0-ab20-4243-9d95-54205790d616@roeck-us.net>
Date: Thu, 19 Dec 2024 17:20:54 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suspend/resume failing due to SPD5118
To: Lucas De Marchi <lucas.demarchi@intel.com>, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <dmx2x5sziux7ubk5fcas2nmj4lt3vpalr5gc7qmmwq2megmp24@24vmehdkle3x>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <dmx2x5sziux7ubk5fcas2nmj4lt3vpalr5gc7qmmwq2megmp24@24vmehdkle3x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/24 14:59, Lucas De Marchi wrote:
> Hi,
> 
> In our CI for xe and i915 drivers we are noticing some issues
> with suspend/resume with these error messages from spd5118:
> 
> <3> [120.648546] spd5118 3-0051: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -110
> <3> [120.648598] spd5118 3-0051: PM: failed to resume async: error -110
> <3> [122.825989] spd5118 3-0053: PM: failed to resume async: error -110
> 
> Example:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3885
> 
> (there are a few other issues in which this error shows up, but this is
> the the cleanest one that doesn't mix with other bugs)
> 
> thanks
> Lucas De Marchi
> 

The timeout is observed when the resume code tries to write data back to the
spd5118 chip. It originates from the i2c controller driver, not from the spd5118
driver. I have no idea why the i2c controller would time out in this situation.
Presumably it should have been brought out of suspend by the time devices connected
to it are re-enabled, but I don't see any associated message in the log.

I know that others have tested suspend/resume support with the driver and confirmed
that it works. It might help to enable debugging of the i2c controller driver if that
is possible. Other than that I have no idea what might cause this problem or how to
track it down.

Guenter

