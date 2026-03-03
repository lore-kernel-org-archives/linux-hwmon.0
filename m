Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BF63750A0
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 02:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772506010; cv=none; b=Bo7XP5bQ0rNZPc64uod0xq0ascg4zdfQvFCEzVRGrVN3z1aS1+/SwGS+cbzOjkYVT1vbd+9+EHdKe/I7vl8OIpdOVtAHU7i5bUmf0se1LgCrZd+rnZ8Xq7JSm0L6vRUsjbXgdcAuTsRjw88Se54nXpbi5lDBhnMj6/ppB9dHBrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772506010; c=relaxed/simple;
	bh=sgBFv3FqJVUgQfwg5VJQL8K50hqxFiA1ETfdtKWQN68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6izqGGraZjlUq8hXvM+JfroLRBiwEbPIyGGs1hzfO2z/CsftZ1ziswnIslc0movLpymSG9DeZLzOxwLmlBjFmtlRRLyZMddeUoJ1etvxuP6in/vUW8/oa6zf90cqcRMqbe89LJNEhsn3FclTpAknTXLwUayFlGYN3n3S0nPI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLi3ldjN; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLi3ldjN"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1275910b930so3082927c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 18:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772506008; x=1773110808; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsDwpsSdUUc1aPnyYssN5xevD3sXbYTWbWRZnJRa7lc=;
        b=YLi3ldjNd+buPMoPgeomgU8y12l3gsV0K3cljVsATOhYoIINwar6OTunLzzPEs2w+A
         14qWEze2ufYNLrSRdVjyrddDbEAEMawSqbrGjWvR1pkG7QRX1PGAUM8eS93FxT9Rkdmx
         /LQ51Fc1VJH5FuEY+lGH61ke4IZqTPr1+g+yQ8DhjgtVES000XLUBeZEEtODu96JIm03
         XWhA2oXXW6xAf6G4KjV7om/5lnyEqaNfXjuMj814itovITxJrULj0FwvDGpBWir/l8jh
         v5EQiu/Qsk6C6k0vG68E5KpV5b+onJQV1UtTtSPCwHzifsuxBR5SEAusVA5fneu2TuHz
         pr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772506008; x=1773110808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsDwpsSdUUc1aPnyYssN5xevD3sXbYTWbWRZnJRa7lc=;
        b=hVOd7yXe/S5HuMeZLOa9ZADDvepDiZr7Nh7635Zy3x3abIdQ8L2w3H8nepXxHmYp3Z
         6iy8l7N0eQyEA9p38wfg0CBQ8lsjH5VyQGgOZHKUOnrQi2PMCVi3QG3kM3bTw+3O7Vkc
         mrIw+CRjddYd3Ci3ZCy+07XOSnCCAIN31DdfdvBiCjb4C09hs+ppO0xJHNjl1mHaMZOo
         k6tJoN3tpu6lbZsfuWftLGh1pdw47lNTX5qVxm5SleroXtEat12uIbE9Ferul/lr5DOL
         TINYpv8PyiY9TpGUGghf1DWewdIzfxUJe2TEG1iXsc89NSGQTaTYC3IzjGwyzqaaRRXj
         Y3Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVFIZRRAAfwKddbKMYzYzJr6ywUc7vh+Is8CN7w6U7/AZYcdVOqWAvpGWr4PJafoO+FS7YCMPTpYjfBHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytI2b/JRqNazi9qmC7g9atY+IotcGDl450yTPovhEwrtnbRGzD
	ZaJPtVyhnpPmVzfpM0aRS9u1Fbm5vVL+Uvd1cvfslKUTXPOmQkO/Qz4R
X-Gm-Gg: ATEYQzylCLcy5R2622QEiUdB5RStN8Q0/6/aCdpZyHkyFlNk2z6JYqHojVx24GHf0Jm
	y5cCHhw/Uf3WuM7zJFVnJUlMjvBlV3Qtn34FT+qy0TBXyiByHNUB2TxN59dwX8ea37PJpUY7RXr
	wTKPK/R2mZdqKxzqYR2l+F2NTqklkBAzgS9bLcY1YzPK0C2nk1rffCAGWkfB4vVxm6nTD+a/NBo
	hyTaxErXPCJjFVd83I04A0TTm65dfNf3/IQhpV7kD6jTTb3AUm+R5XuKsy2+FfzfsrrsNf6gBM1
	YXwwpmYQMBBBcKxjU0NG1PwAJRhzEvXCTCcWiEcftVaGpuQChozu5NtuPFg/Gt+3ukFPew1+jzz
	gwj2u8UTV3EXKUsoWtU6QLEA8Bup9m/Gh18GgA46i4oh3Y0nJJFawFn73kGtxjO+YGxYZEcMJbA
	blPYjRj+5P8UvD2KO//mRf1VELo9yvxdyoXJqg
X-Received: by 2002:a05:7022:e16:b0:11e:3e9:3e92 with SMTP id a92af1059eb24-128b0e2a400mr198972c88.23.1772506007993;
        Mon, 02 Mar 2026 18:46:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdf662eb6dsm7616028eec.2.2026.03.02.18.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 18:46:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Mar 2026 18:46:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mariano Abad <weimaraner@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: Add LattePanda Sigma EC driver
Message-ID: <8dc48dd3-c9af-4cbf-bf83-8ace235e4619@roeck-us.net>
References: <20260303004628.3406271-1-weimaraner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303004628.3406271-1-weimaraner@gmail.com>

On Mon, Mar 02, 2026 at 09:46:04PM -0300, Mariano Abad wrote:
> Add hardware monitoring support for the LattePanda Sigma SBC
> (DFRobot, ITE IT8613E EC). The driver reads fan speed and
> temperatures via direct port I/O, as the BIOS disables the
> ACPI EC interface.
> 
> Signed-off-by: Mariano Abad <weimaraner@gmail.com>
> ---
> Hi Guenter,
> 
> Thank you for taking the time to review this again and for the
> detailed feedback — I really appreciate your patience. The
> rollover catch was a great point, I hadn't considered that
> scenario.
> 
My pleasure.

Applied.

Thanks,
Guenter
