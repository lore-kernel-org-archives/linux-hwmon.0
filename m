Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456835;
	b=QmOOmbsGtLNwSisTOqJiGso7zwb3ztkcPRNqNTEDK8lc1RTj6DcGZi8DjGQ1ZIEv90v3
	 pjb47ix1GUOaFf2AxuZjhzFbj1mtDaeZqNRpmi8dChpTcGEU3gj4xMkSht3twzZ6xRcdG
	 sHU2KoRhGtQvgjbyUK0JjRbwy7hXSmBaPOAqMkxlOXUof4WnbFn3POYDwSDL98Qozp+MI
	 CLpGbGhjxns16kHnTH6dU0Z2miV29E8QHjN2+e046oYezTj8aOdc0LN01ZkfyQPdw1l1F
	 LenoNZUPxM963nL5I/ac2crNUyznwce9xykN3sutOKVxXKbUVjkF+3xtnCzhoQMczSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i2Uo8ZbXxs1WnMgPH/vmsGLPejz4zkDpjPqPpLShB/o=;
	b=dMlFMKyztzSPfIPAYaW815lYgHBb/QpB+hWSf1PYfIPHLHBaymF4YDc0EJ+ZzJ/wRBUP
	 DBC7ptT1tB+bl0Ha0Dsc0XTjpLw2u/vqh9HJK4E0x4+HulFv2FxYTHJn89lLVzkAIEHrR
	 bvZj0RHPhq8Hf7B9mwtNYu1HIaZ909hcOXeeHo+90pXdUQVZx/bFeZvk/ouunfy3nL++Q
	 ldeHXTtgiviyAcqlnPrErXhVbLjABBLZCV+7oNVOvpF3OHznUotNi6QxvactwtW+1nTt7
	 4xnehMNkRIAnK+RPAI3RuI1zKuY8OUB4u6gWIGuPEbWVNJTnSB9Q0SvP4ZJBRQb/qhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gpznAi3u;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A074606A31F
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 00:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A074606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gpznAi3u
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1569782a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 17:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456835; x=1793061635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2Uo8ZbXxs1WnMgPH/vmsGLPejz4zkDpjPqPpLShB/o=;
        b=gpznAi3uGEOKnGWouZFQYOBEKOrEFwHdWUhFGPUzyTOoxMBeIkh4nyCicymokkb+Sm
         aOq/RMO4WOuWYELo+CiMnj/+TbIwxNTO5B9+Hunf7JXl5in9PfrohInzRRLhOfqZIoIa
         2UyEBa4Q546/a2XBjO3F0dFp/1menTnVYDUIbmdOj3BoEuio0pc330Wwtz6W1pazC3Ac
         YPwhb5mIwWJlm4CPpdnm7zHzVUq+WdjHHvmSh/P7FsFm0l4z4Gk5LZfsp3ZYfqWNq78O
         95XyxciZJCdiSs3AhnGfSi2IywVjuqtDeatMc04TUoUU9TuPmZkUfQ5gLFGAsvotLSDU
         Ii+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456835; x=1793061635;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i2Uo8ZbXxs1WnMgPH/vmsGLPejz4zkDpjPqPpLShB/o=;
        b=QXKwiHqrZr0frsrAdJDhhnCESubStsvPmNRWcOBQRc2dZBbfNcrBjJjJ6oaYpZio/+
         iAOwO2ApmCxxgOpN5z8hZLK8mJlsJW5dC2W6m3gcSQ3l+U/S3TpLwzkk7jGEQPvAqhgO
         VVFeROe4RBtJ/lNF3xMwn/wNh2TNZzJZoHB5ND7QrN/LbRJG2q7uSPRXH8c0ADdktLfv
         KLUof0a0s1BTd3xdGeCCzhCD5GZP4rGkE8d0WOX0f+Vvv98n0x2zhMDVcCqov5LCRKHn
         sv5y++N8G8V/5H6rQLX3RGWc1WVi9NN2J7uFSPYT6xXdkjbjNPjVE+cEsFppC5IPG/ul
         X3JA==
X-Forwarded-Encrypted: i=1; AKwUvByo+5FTiPB6YrjhT/tf6m35KULvbOvX3InRmrGU/G9a2I/arYnNTbj7TR2i497lSPHSEUQ/idjhgehE3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYI4B6g5S1iwDYTudPlico2utkh5TWm5oQalV9rhyI+YQadzs+G0
	b4i07ZJNiGNtfnl707pv8+v1KMySRWLtMjVIPYt+A5zfLEmx3274X4dD
X-Gm-Gg: AYBFou00i3d1ubgBoVvKJfeuvCC82cYmLyxJCHv9v2XUAgnJgxg0mYs2lNSAFUhDiPt
	S/4IlKKudbzt8apWGDgCzJIlJV9mEzXPtTKrn8wOTEkJf/jdg5KSgWCOyxlvdO23h9WnDUtaoty
	HBDn6ivJE1Z3iM2efDiQ3XjsdqlVw9o9X97RAefGi/baKa+AUiiy/rCeKi6XRFLWxtCzEIwmSyS
	86YdjMYKnMh1UPcojDqRTiM/Lqlr8riro0vfPOLhgTmT3crSM+v10EsKxEP8BXOAUpQJ1stNocu
	EBTkQpuCS+TGDXnjhhK8kx6YA9sX//63jFMiYzj0RYaXHWj62Mx2VTSxQvRa2wbSEdAuOHFcqJq
	qiAL1Gf4TJjD0MWVVqS80yvDDdg/XVfjV0rVtA7v7aXyqe3t5T+klTjMyT0FewW7jEZ0oXknzO+
	2QJzmHoyi16zk/MjbZcPh4+nsByr/8EZhbYlalTFjTKlBr+k6rU5v4VuG1bOsWFmUPrR/Cxoioh
	RHl591u1dEY7DRIXtHWbrfY/+DT3Jtrc0aGcRI+eSFDeeUK
X-Received: by 2002:a17:90b:4c92:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3acef134becmr8381372a91.12.1792456834493;
        Mon, 19 Oct 2026 17:40:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df89fsm1769191a91.11.2026.10.19.17.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 17:40:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d23a754b-81a6-484a-a1f1-2f0548e28b68@roeck-us.net>
Date: Mon, 19 Oct 2026 17:40:31 -0700
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
Subject: Re: [PATCH v3 0/2] hwmon: pmbus: 0-based thermal sensor index,
 mps,mpq8785 #thermal-sensor-cells
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>,
 Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <atCS6zOqNzo30q3J@L18297.iliad.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <atCS6zOqNzo30q3J@L18297.iliad.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 01:46, Vincent Jardin wrote:
> Hi Guenter,
> 
> This one is a gentle ping on this series:
>    https://lore.kernel.org/all/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr/
>    https://patchwork.kernel.org/project/linux-hwmon/patch/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr/
>    https://patchwork.kernel.org/project/linux-hwmon/patch/20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr/
> 
> Patch 1 is the pmbus_core fix you asked for (0-based thermal sensor
> index, with your comment), and the patch 2 has the Conor's Acked-by.
> Could you take them into hwmon-next for v7.4?
> 
Sorry, I was out for several weeks, and just came back a couple
of days ago. Unfortunately this (and many other patches) is going
to miss the commit window.

Guenter

