Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5489BE65;
	Mon, 20 Jan 2025 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391114; cv=none; b=Rl+4q1p2TokN2VwM5rGMCmhql8AvS641FK1GPdaOPiF5HsGA5b08syGk6T+CGJynzPzazsG/zmA4YX9Iuuz65hU8t6T70tyVVOjRQfGsVeVrXmE+CSM8cyl6sIQXporBRncnUGqout/WOFhbHG52s2mQIudv+iwnVBm6R3lRvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391114; c=relaxed/simple;
	bh=beb+3lrWJSyhhHCy8mTNGF8Xm21vXfox7glk5jaPsSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTb56nFtriD7CRPCIjIF5OpxvqTXpJ0VKxx9F/gRB/fUILFZx1AQcaY5EbbtEgGKkSpU/JFlfZIUrN2Qbrl4xJKsoGPa7BcrGjdLFOApFOSZ062GqDdy/41Uxqbgr+wYmc3jvV9f30jmJ8YmBJej7NPP09/yAsh8NM13MGp1HiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGgGJD4K; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGgGJD4K"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f42992f608so6430297a91.0;
        Mon, 20 Jan 2025 08:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737391112; x=1737995912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ml9AjxEp1+qEb41M3AkNiI5nJdvIcd8WuIMqKsp7kWs=;
        b=hGgGJD4Kpq9hYO2yZSS4fs+siTtLsV4+CIq0XsvEgPs2ihJgJTyOCttXaOjq3e8gwf
         +cYbzZPx62NNRNekcBubBwc76cTsoYVk4YAukGHNOjL/m6X1sHlnMa/hXtmm9NmtuPW+
         Eyq9K9bzRrekkfTg//yjTk/hPrahRREY80uz9rP3zMZVsy10a1mgtRHgMQaBhm7Ouxg1
         cdVSUuSvfmBIpEIOE/cY394n1n6lMhr4Ma91EJS/mgxAPPK0fx2om2dNX7eTGL+zKtG/
         oG09oeML5WqgflkjTY+tFhfAvxrj/Ci6XSOrcxXVMibO6EZztiW05rHtMhQAG38gewYs
         CmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737391112; x=1737995912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml9AjxEp1+qEb41M3AkNiI5nJdvIcd8WuIMqKsp7kWs=;
        b=LgfnxwJ7ZSfYIo1nWteryX0B7AkOo1aOwwOCCYAqMIcaWMBXM5n0EhROwoZDDMhfYf
         3jR6As5cQlDD1DDKWfnSQDdqRIeHOAvRW7K0ZulfzuP7d6jxy0Mu54Dqna05JOC5ogdP
         3kkVAzUfc9yrON5iBMRh+14gcPB9op9GTpZofEllzN/3taQ8emOjXYgVgpOexTIPFgxp
         YWJrvcD+rEfpOrSQaaxBrGqYglBRWL6++jOwTLEfY1/0MrerKVf7vcC//tJEmtMICpfG
         e7iX+D2vZruzT3XE8CcYxSXYwksSj8g2eEpCLjpUtJHp/XoFmRkha99x4MSN18NdCbCC
         29hA==
X-Forwarded-Encrypted: i=1; AJvYcCUIwd7IqGRuka6Ba6hnfzOuxwhOxT8d4KkWA40MmP2Ao+9I/KTlhzPJTI4moLG8F00Wqn8JhvI632EGm1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2xbyKw7mjHtF4inLZ9K1E3gu9DO0y5BYu9/a2Y89zA+rETX0
	FnhC/Aq9Z54d4evnuPTGMhS5dhFkUulv8jicGzr0Tt2P10FQAWsRld1GQQ==
X-Gm-Gg: ASbGncuuv7BIjHnmh0fLQQnGWNT0rDKKSI08YW099LBZAPI6GBv7kbBSaMUJpmV0ab4
	JuegQaGvbzYptpnDzy7/qsNZtjZp1enJsuYOc1TTb3uMEBNlqpN7ylYb6pkEaK5PwaAr/c4g8aL
	8hR881IgRJ2FxAWysk7Do3OdLa0hjKK7QY3/UISQ7uz23wI4lSPL+1Z5oJinMdsFnCsEYYaZIu5
	NEVnv8tCAlaXnTkWxaarFASVLtuQLw1mEWw3nuOLMd+gnoV4hJlttq+Z/smO4wMQcm4NrKTfs31
	znpTaHqmCA8k+CZg0ox2+NGCQT6NMerQ913H4dzQdDs=
X-Google-Smtp-Source: AGHT+IFrLuCR3ngqNjE1EUVKWvbvy87NAoOiCZsXrm3oPedou5ulNxKec6adQ4mSvTCNO3cFhMKaMA==
X-Received: by 2002:a17:90b:38ca:b0:2ef:316b:53fe with SMTP id 98e67ed59e1d1-2f782d306dbmr16835102a91.22.1737391111884;
        Mon, 20 Jan 2025 08:38:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c17f99dsm12187869a91.15.2025.01.20.08.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 08:38:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ef0741d5-832e-4c15-ae45-f4efcf4bc443@roeck-us.net>
Date: Mon, 20 Jan 2025 08:38:29 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: ina238: Add support for shunt voltage scaling
To: Potin Lai <potin.lai.pt@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Patrick Williams <patrick@stwcx.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
References: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/20/25 08:23, Potin Lai wrote:
> The INA238 sensor reports shunt voltage with microvolt precision.
> However, the hwmon driver currently exposes this value only in
> millivolts via `in0_input`, which results in a loss of precision for
> readings within the range of ±1 mV.
> 
> This patch introduces an `in0_scale` attribute to provide the scaling
> factor applied to the shunt voltage reading. By exposing this attribute,
> users can accurately interpret the in0_input values in microvolts,
> preserving the sensor's full precision.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Sorry, this is an ABI violation and thus a no-go. in0_input is and will
always be reported in mV.

Guenter

