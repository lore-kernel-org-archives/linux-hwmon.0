Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973409;
	b=Dr3nZCnVaDrnUFI4RAt6twmfgZOFnQsfQ70PQLzt0RDNLL/q1KnwPKE27/TOouV+Fz6H
	 fLOgjuISXKEgAYDitHkbzQVXFpVp/M49N9/r6CPFsTASoKV/QoOWsA2xi+tHGcudQP053
	 uQx+d2gkeH0TpNU4GjfpjiHv+bG00DJYFqjClosI5Kg2FdiwP1BlCYSKQVZo/yIAbYSaU
	 BIWsDIN2XXX1jr63jGmvizxl3FQQyxbPPRLPLwLehtR8fkApE2vC3uNmWNnjRlsAdKYCo
	 0+XyvPwqmFI1B2fz9piq//aJ53a0m1o4FL2Xm81drPRkBkjp6GZ1ZCyvD2p3Zi2s/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=I6RNa18QQwE+anXKqe6bcJQOCZahegO/UDnIdYaNXRQ=;
	b=vD+XUDS1iGMU0g8Qjxp04LVOUkjOcQMHnJZ4w7uUFSeOhnCzoSCNPCIzRMqHhCw+Nf8W
	 n/fciDtZveiSWKCWXVuSbs0nB1a9eeC37vf+N4MhWLA1GNISMbG8GBUY+/cINnsaXmvq5
	 hw9FEynunS5E9c9bHNftw84JSzVjC1Zgz0XV5avAMBa7CS7+/Lv8wKtI5o3zkgr5cKDU9
	 YhDAoaTHNOowwJRToYtbXfi2bH8T2Dui1yvNVgROq3Z7UVtsGELsywhX2SbZ3MWHv1MiA
	 Zj0gCnkxGTnnidwj2m6KoZm+U6J0H9bkHN3f8Ls6GwzeD4sa7Zm6pWPGwdkejUc9XOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=obGspQYT;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C012606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C012606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=obGspQYT
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06b436dffso1074593b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792973408; x=1793578208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6RNa18QQwE+anXKqe6bcJQOCZahegO/UDnIdYaNXRQ=;
        b=obGspQYTYyqXhIh45EyMX+wi/DglbB6Fl+P0tHTQUCssxcre7T3xvzUTngUHg6ZeNR
         5fds8Q2TCrIG9GF01u/+fd9yyR1DphOkA175De9TfldLy8jE8D1XxkGQYbey6PEA52ud
         9ncjnnFHQXH3UVfPto7OPuwkAmpeIdnIx2Wr97IrdKcj5YO70kxYjEkt+1D36hSNppDq
         pCNs1gJxtb+uTDukEoPGdgC+FWMNOErI7FI2I3fQS7eGIk9paY5FMayg9dsVjw8wOEQZ
         vkpV8vAZ7RnmvUn0Yd/wxDPYF/JoDwUwowiN+Cw3xBkQkG4Vjri71Px5UXyjozoCQLIv
         1sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973408; x=1793578208;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I6RNa18QQwE+anXKqe6bcJQOCZahegO/UDnIdYaNXRQ=;
        b=iU1zpppSh/lkG78/M572BVxzXBxM3l9Z2kDghcdypSN2jblh9U95pnSTi96p6z+kDu
         /eD7ipXtPPgobSeQZoCLhFx2BNQXv0CiiN8ZIsxkpyj33RxHWRqlvI407lCa8icUYYUU
         cWd2Ov9ErB2ZEd/Z1dZbB0bINVWIyWzwn3kQ9I5Kcs98lCKm8gAGk6G8SIgPsdqrlMiv
         kQvl2g6aGUQD9ngY0t6F3sJC/qWoTMPQo8uKEi+ka5E3xNqJk1VFsRAQ6d8imgAPRK9U
         fyk/BBvihAF1w8g9eb0gQP9BQ6ntuSCPdW5eYSdXZJXHjRCzC+bpO5Qt4Kx+a+0p3fhK
         LEwg==
X-Forwarded-Encrypted: i=1; AKwUvByVEOp7qeEGWSuAx2z+njcteZWiY0jpNz6R/xTP7aV1C8tVlR8Sen5DnotdjYLnJEmYtJYo1ZzLUJpYdA==@vger.kernel.org
X-Gm-Message-State: AFq9FYId56tQFUQdmQVIzI/az0MpRjQR+d69YxtN5RJcCEr3njSYS+SI
	ja1YW2R7t33ThfeVrCuxvpvmb2swGlCvQP36bXKsinlupAXvgNJaLlJe
X-Gm-Gg: AYBFou0hWCEbTZ/Nv/klRPIkmgnlY8fLEAkNqr1yPOMmJhK/DGptEWmMzITv1KKumOJ
	8bcEOVL8e54pAyXu304FQ+F8+JQ3/6YgC05KG9EkEGST63GKy/SqLwn3nl8rMeY94TnnNJzaLVS
	Atg12dKYmVveoTlZ0juVOJQSUBhRbrHwbPIj44yEcu9pz4/+pz1gTAdT8RERmZq49Gt2J9GViF1
	aQ8itiutzMMhyP4AQ+f/fD6fCwMuLjJk4LH/I6U/ZpVhwCQN55PtsPUzcsIWjl2Z26fH92bgCyG
	CA4UPjMaCoqPJvVHlNJMiDITymzb8PnzF5CkN3FMAgG4E4P0UWLEdvHsiyIiBRIlOF/D6I5VxoX
	xIqer7494DkQ56v7bKl4eXuWWHmAryDZQ+j5o7G9SA6VKbwcHmlRCniDIiJxrd2vxdBnjNmOUgl
	8VEnhBk54hJ1G5/ikyJmNoQ4gIZqZEwn2mq7dnHQYC1+v9zONZf+l3rLyqXmtM7TBucZAowpKTG
	86W/Yjq5NMzU1DVtFko2u4wpeL/Iq2JBxn4UblGZY32TxenKkYDWR3fTM+UMUrRzQv5p9h/mEVR
	MY/kqeqZk1wbnlBTWk1b01vaHia3XQ==
X-Received: by 2002:a17:90b:2789:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3adea9d6f7dmr4046130a91.20.1792973407824;
        Sun, 25 Oct 2026 17:10:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacbf5fsm6169808a91.6.2026.10.25.17.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 17:10:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dd1f8bf4-0dc7-4d89-9eee-8a08e2d5832e@roeck-us.net>
Date: Sun, 25 Oct 2026 17:10:05 -0700
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add support for Analog Devices MAX30210
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: krzk+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, Michael.Hennerich@analog.com, andy@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, joshua.crofts1@gmail.com,
 linux-hwmon@vger.kernel.org
References: <20261023080623.1830-1-johnerasmusmari.geronimo@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261023080623.1830-1-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 01:06, John Erasmus Mari Geronimo wrote:
> This series adds support for the Analog Devices MAX30210 I2C
> temperature sensor.
> 
> Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max30210.pdf
> 
> The device provides a 16-bit temperature output and includes
> features such as a hardware FIFO, programmable sampling rate,
> threshold alarms, and interrupt support. These capabilities map
> naturally to the IIO subsystem, particularly the buffered interface
> and event framework -- hwmon has no equivalent buffered-capture
> framework, and its alarm attributes are polled rather than
> interrupt-driven, so there is no path to supporting the FIFO or the
> autonomous threshold comparators there.

Oh, please, do not make up stuff. The hardware monitoring subsystem
does support interrupts, but it is not mandatory. Sure, most drivers
don't implement it, but that does not mean it is not supported.

Guenter

