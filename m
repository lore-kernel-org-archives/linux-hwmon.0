Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5834E326958
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766084389; cv=none; b=sgAf3yJq1RbjSNVZDPtxHd7e6gu/NpkiwH93CBcQ7CQNK4IuIa3V99d3e211Ve+9tyN8emR5s/a86xs76PQ0pY2cUuoeHqZWjX7zfv71WK3lIDHfXngcPK4d1xbkiuJg2PWcHN04f8PNin74bfLFryQo5QRKo8GDhwozirQB4+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766084389; c=relaxed/simple;
	bh=NplT6xYJ/cK4TEddhfsGN4Q51qOsXqQQrqlEoU6OdPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRCg9hQ2Qu5M4IN/cZqCWbihnQDlNSKzXB5j3ckLtYrb2NRydR9OHehzLlw4y/8HB/HSEJU/c9G9G0TYdQqHrBwouEEfk7BWgFugGz6c6Mthw051Y9vROMwLEdDTThwMmx5BkXuKPy4BYNF/D5x4o/D4CqJyAOq4MSjjBRrY7w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oycmq15m; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oycmq15m"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso871062b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 10:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766084371; x=1766689171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j26nHAPgjjrJMEAGV4x0/HTLhUONW/2XtzHEZRasOq0=;
        b=Oycmq15m1eyIcevO4+IxLx9B5fPz4SQ4ETilgO8jb1X5S0ujv6LX9Uv+zP21eR8Yu3
         srPgYvo7nsthgiSeqXcX9zGwD/5FUk0kXYm+cdFqxhquwL6nTS2lCMEuQMbi4A6WnQes
         Ir1znABAq71QLSGMjee9MLJkqXlwu0y6baseLM21+enKtM012nQ6nFjY7mDMCZjKn4bq
         5pLa4tAeScnqMdC/Ei4GjIEuW1mn4/3bOfgMCmkbYVsEBUX8eWZ9ECrAclzOrXhrBW8t
         FVoqLzaqUAEJadG1QjN6iMaHEhbJsBJfyv5T9E3HQVI2buRsATcIIVfnLZ9VFTwwxhon
         luBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084371; x=1766689171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j26nHAPgjjrJMEAGV4x0/HTLhUONW/2XtzHEZRasOq0=;
        b=JA2sXLDTWobfAORGSSFF0RegAuD9E3AFa7iJ94oR9bO8L9jzWcv9a8IX1VKXpgr+MP
         XQwWcFe2rxk+0zR9a3EomienawWE2a/wEUW+CPkNC+f1BB0IkAlHT7TJyPOSonTU3Wg+
         GP/+5TeEqKDf3VZSw3nKsZBkVf5mNh0UCFr6/+tpd/BSgcR8JTagKhZStkRMbJuvQYfb
         s3wLuCYabiCEs+NeKOY35z+HnFI8mMivnnE5PtvWerAvOaLwpBu8bWDidzXOyoTphN19
         IJn4u2cq77svEDHe5Q2AsDKrM+eDfoyxMX6Ty0ufTlz0Jap3kXC5NMCKgn5HT7sHgtfc
         Uw7A==
X-Forwarded-Encrypted: i=1; AJvYcCXFXuDariFsp2/F1mUv29dTjInP620ElDfYcSx3WTkqWQTYJGYDX/i4TQtrQTqCjs1lmLzq/+yONxnw9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyL1VaHZ1jJP/3jLOsc6q1Mq4L8iZPat2tya52RAe0VE/Kv0U
	mD47BgHFn/YlO3B/9dQjx9jd3RXx6xVW0IsKlNnftaltRWfQiVBq8p1b
X-Gm-Gg: AY/fxX6mnGXq+CqV5MijS8RVpkoNdhO/czMNkD2IE8JQNlrR1e0z2bnazrc/s5wrjqX
	MUBudgMPfYVxXCc5JqCf95cGvsg3C3Q455fTDSxGCnmyuB4qChkYL04mFE3y7v7x1mBdMR6noos
	J1TcNM3BvJ9z18CGi6EeR2aVf9uIF4WjLQgPK7yuhZXsk9vEXgo9LiaRsaO6gkRpeuaJ277d+/p
	qp7TlHP5x1FfGMyzDfaQKNvM2Qv9B7h9RB9yuqQ0RhPu7aQ6D9G02MS2xhWUUKJYynJCnlDjI1M
	TIZaAKsa3dSqfVdB1x383ZVcfXgPpQMfX5Qumlzxkx3lSaKFIA3Cwmd7vyS9h7EXxvXvmfoYo9H
	7LsSF9mM/Ux0YCGoyaGnQ6Bjb8zMv3G9VYjiM49SIcxgi9VPsjJn4e7ErwjwMGm4XmykQ/2X/g4
	zH2vsxT+XHytnYE2KE9JOZD2xx
X-Google-Smtp-Source: AGHT+IElyL/OgWNb2ziTltoW4Ek+cdt4xnXfyKA6C4+Tq3bCOv4tP7j7k97ttOq3OKwF7sTEF26tKw==
X-Received: by 2002:a05:7022:670f:b0:119:e56b:98ba with SMTP id a92af1059eb24-12172303262mr311214c88.33.1766084371260;
        Thu, 18 Dec 2025 10:59:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm306099c88.12.2025.12.18.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 10:59:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 10:59:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Huang Rui <ray.huang@amd.com>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] hwmon: (fam15h_power) Use generic power management
Message-ID: <4d310ba1-34e0-400c-9662-971b4647a6ec@roeck-us.net>
References: <20251216181401.598273-1-vaibhavgupta40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216181401.598273-1-vaibhavgupta40@gmail.com>

On Tue, Dec 16, 2025 at 06:13:59PM +0000, Vaibhav Gupta wrote:
> Switch to the generic PCI power management framework and remove legacy
> .resume() callback. With the generic framework, the
> standard PCI related work like:
>         - pci_save/restore_state()
>         - pci_enable/disable_device()
>         - pci_set_power_state()
> is handled by the PCI core and this driver should implement only
> device specific operations in its respective callback function.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied.

Thanks,
Guenter
