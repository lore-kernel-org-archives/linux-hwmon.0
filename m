Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47480EACD
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762110604; cv=none; b=mdn0fzLKwK7ce5saDVjOfAR8wbW3gA1DQmHV5VjUPSpIjOxOevB4Iqshm4gnx0lRm95IN2BsU+3SWYjwta3a4RwBngCfaaAXt2d4AhTmJlSahZUmUaTT3XG5SN+2G+i2zSJf+Jr7SiXvFkvSJZtjUpRpyp+4ZPcggkmnssNzj+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762110604; c=relaxed/simple;
	bh=8Znko5NuDnyx+OGakH3V/EstaaQ2BsRjlAmgoLRxMjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRJypBXDsIsqiAUl07vBjYFPERtBwC468LwUtAN/1yvkx1CPB8mC9g2XT9RvcqkXHqjYLEYvVupDTeHFXh19BPjtTIIJLy6rGRMT5o+9MqmQwFYrN92+gOllpQbSb2DdyjC65n7zg3ks/d6Rd2/QYFuSsCVpvtiz/S+OWjmOwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1AUc7mZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1AUc7mZ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7833765433cso4919730b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Nov 2025 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762110601; x=1762715401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgLvpaYQ9gRjsmHaaMXfyMMelQArREAHVTBvb+wL2M0=;
        b=K1AUc7mZKJfyCW9y3IENaRrKjRNtD+U9+P1s6wdOZIfV1vD4Nvk1npp1ueCBLsWlZY
         rGzUYf6p560NtFFpvCyGspHknzsH+/X2UiHpqebpY2RXLjdXgz+X9XAlyjPdzGwT9T5W
         WwxAGfi7+p+Tl8D8MDjUUpYnu2L3re0HkDCTedANxmXSdLs7sigukivrnwcs7AyTi8sh
         Qj70NaextcpeTsDx3vAXBTrSrAqtF8Zlv5z1XDFQJRHYLGn6j6sy3c2TWweP+zSl7h90
         cHwZHGM8dnvg2wtDCSGrtMNF4LBIXkynoWopds42QAytj2jD7FjrXNEmdwPANizQpBQk
         Ab1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762110601; x=1762715401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgLvpaYQ9gRjsmHaaMXfyMMelQArREAHVTBvb+wL2M0=;
        b=S9P9l59nrhxAl8rx05/jm5tJ2eDp2iDqWu4YPeVAFz/eoaHxfXLEuAeMJlvNwZqEf6
         WGGgMY2r3CSaEId1O1mGCqY1dawxtN80AGiQh9g/cXUTQNryxG3JpXI7mm/pQn4d4YND
         6HYf2CuJNe/T4BtwXM1uitQ4068/KhNHGVrSLuKTb36iF/QRbi5jWWDXtrf3gLJUzUuZ
         bpW9JSzpTFWoV5+aO7X83D4MGmezEeEx/4I8T+yVXw3sfqso6Zh/a9P6CLbzlNWU0Rsw
         o7ZKg1TbpPnoXdUUauafd9XrOIHQCdCkFxxMdvKKJO2bZypIgkGmnjN2sSE/RUl3HarV
         +v8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxZvs9/ki7p3kh9ZuV5XkTX2wnwy/GGLQZ3dJsepiafQ9A0T6ekop2yF3J8MHDoqhVid7Dz3+CeB8ViA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgKEMY5reGFHhSFJjWIwwXdYM8CMgvgmVXgfj9XPhr+KZ6eAe
	V0CAyWHl7E8yrqz2DEI8CPIfqRiHODHLRV9a5/d1miAZwPq7aI24QeW/
X-Gm-Gg: ASbGncuDrW0AF4s8EV2T5BleA4j/H4QvQDhxrYsc3oqlcPUl+8W/k6IBrt/4Z/VWsaZ
	9tz5om9YB6U7QGd7eHex5eQ7zffQuRszU2MwMyH8l7Ruop4uBmi6v15qY5qYR6uMTYswDyFmXL2
	RvJUsPQMbFx9W0UMXdB7KYN/xF5TsRkx5nI4lBfpWVKZqDE/FNXbVJ27k942Xe9L3aHIHeIgq1h
	V9FAwwc0pMkEZcLzzTaukdbCOVZnbwfiDb6NnZmVzi4tM53aV/jBunyDM951MPw5V0X/ca4EwCX
	oL0bLJiAJv/ocOq3IoQMz6fvathaiMZoFVhOU3NJTlhcl0DPGtKBXHn4YWDUrf8bfAqAyFsPHZw
	N5/YMMrHm0DpdrtNjzka4Nam385ZmqLjtcFTXBdiuyguf9feEvrJLz1hHDmTp+3l9jS1XioJxFg
	uEx4k9ye8G+4xr
X-Google-Smtp-Source: AGHT+IHkMIAYpUU2qCDVKXaSXXcsZFHQC4KsbEqB40ybOnj25k8W9KwHb++brJJza1y8FVB8EDMWqg==
X-Received: by 2002:a05:6a21:99aa:b0:33e:eb7a:447d with SMTP id adf61e73a8af0-348ca75c0ccmr13766035637.17.1762110601545;
        Sun, 02 Nov 2025 11:10:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34092d2df47sm8433792a91.12.2025.11.02.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 11:10:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Nov 2025 11:10:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: akemnade@kernel.org
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: sy7636a: Fix sensor description
Message-ID: <d8befd43-5398-4659-a6a2-afe46fb5a541@roeck-us.net>
References: <20251027202847.119707-1-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027202847.119707-1-akemnade@kernel.org>

On Mon, Oct 27, 2025 at 09:28:47PM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <akemnade@kernel.org>
> 
> The temperature is not from the die itself but from an NTC. That was
> verified with an IR camera. Fix that.
> 
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>

Applied.

Thanks,
Guenter
