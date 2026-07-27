Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E038837B
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163308; cv=none; b=OjGMahsyyzELJDPz3b4OtdbIJ1yqScmZ03YOp4HVXJ7p6SuO+bawoRDmvbkpsu/OkRD7DS+7EmOZlVMP8gqMDdlMQwBb3Sjr25mSyAfMbbCLmFpRM0yKt8vvEpyWc9YD3ekhNEA8zQU4Be6zq8Owzr0lYohd47ICAE5NsNU2wmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163308; c=relaxed/simple;
	bh=t6w1Im2DkuyzdMCE+ASzKdfVWcpCqbCUNEi+RElOGho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9KX9WmMJT/wVycyZ747D5vpG8JKn1vMz8APjcLSj9BbluhWCHxvqDahDsaza/kR/DtVUrbzPhYzmk/E2QSb1AAaZ2QBm0iX5NwJFgXEoyNA3RBhURp+R8UTB/xzIR0by1EvaLHQfpl+2dz7RZ1iX2CjH//oobfUOR8Dehyzk58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5F2L6/A; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5F2L6/A"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2343284a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163298; x=1785768098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ho62qmc8k6xuRrfZ2CNtaVu4pSIvsJ17TU2OHfivqGo=;
        b=q5F2L6/AJpLZgEfyFsdtxAZMGyzP8on10GYdDW8kFSoMtiwZuKZLeP9pHNBpdMU2Qa
         SCqDQcmfu+CspaUIrdvFzEobHwIuDDuMxy8Y4/9KUQUWSJvw+FnB3T3S7uoe1lvCYcVE
         Eyr508+82v8myGS33jvkxwvDDz3fiB+mtAlZ+iO2nkEIzVoBXN9ysbOtc2IhkqrcHet0
         OfgXQyNTLdLS3W6zDBP86iMavCHwAi5fbQexHnnNdaMi37eN9QX2Bm5HRQ6Bpq/OEwdI
         VfLkR3omfhKhXae+6f/KH/Ec8eRKLT5+7gZe9r7z/I3G7nDV6eCdC4hvkdYu6Oq7++vS
         dJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163298; x=1785768098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ho62qmc8k6xuRrfZ2CNtaVu4pSIvsJ17TU2OHfivqGo=;
        b=l55AhNTXWmT5hLzy9v3cVtpYgrlHPPvkLtNS5YpCTXN0Y1/ZlKQjR2KEFcIHrMdiHG
         C/seUTRAU0Se37fdYz2MeQSEuGfdx7xOAqftKJ4mjL2df+qbr+UehrUPegnRWzJjTaWm
         uanet3Ho96zBte5+J9aUObrDLulReuTjtXukAMzyztCTOa3sTsBzeYHV03rhHLQc4zbu
         IJgVjBGrnkIYh++gcmZNTqz1EJxm+V3wRdVFNZIckhq4fjVWNLgbOdbk6kmT7u/E2XJd
         vrp76aRUWxukZyjnj8GQ+A4NLRjReBLs5h1ois/+4ByhRjPcaAjtVaylG8XFf6pturwC
         WRWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeK/EqZlGMXcUKPnzVdKbxedxmz2ZdrxOiXqDGbtmtI7krw/LlIfMNDkC9p8ApH8Zcd2QOq+90oN+N9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZT0iXVGQB7tG/QUn/+E7y2NKjHVqExRRMWLTolbT1hBp5qDXp
	kBcjQnI6BS2dIwDbH3sWqAnE5t5vtXrJppDwVr/7TWNt9Ry5x6bLm+ci
X-Gm-Gg: AR+sD10zX5N+dlDZpK0BCMGYwrHDP/4UR08Jy6kRBhaZPOOBnvLJkbRINi7WaMO7B3A
	uiVXmrXexWS75Izc0xjrbs880Ey/8Zssvg8GjPHwAIdIR5TuNA8B9GyhN2yvHmi50VHAdnLWjfR
	rxxFeZHelc2NUvXGgKDZ4tgyk6mBcwH4Kp38uUawA3ebUNoCN77UgsNjr9h3QTJkNN3V22tWYXa
	w3hUr2hbgIauiJVlSO9k0RWK+1/+lky1eiJ6TfY5AaIofsNVYXjlY5w8VjWgM13OHfrsS/30HgZ
	+3OBMWoB+DyMRTcd9iO+UnYHwdVj5j8ymMujbgu58z1jAf3ZR5cRiomo1voeXnwnMFjKr5FBErm
	fm5Yti0i3hCdEeXgGlj0JzlXCrxb/lL43Q/TSUWCUtxt29raJGvNnPx08pEEWqACH/X5t+U4Ztc
	ApmGeBhHTr1pMaWjw=
X-Received: by 2002:a05:6a21:4e01:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c67240d4c1mr10310593637.15.1785163298516;
        Mon, 27 Jul 2026 07:41:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm32928271eec.0.2026.07.27.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:41:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:41:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Message-ID: <9151a4d1-a23e-4247-8583-03a1e8976a1c@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:39PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Applied.

Thanks,
Guenter
