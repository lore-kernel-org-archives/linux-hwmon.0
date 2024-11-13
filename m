Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C06204F66;
	Wed, 13 Nov 2024 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731528512; cv=none; b=ECqyM6F2T5oEGEeLnfFt6b76O3c7EDOgbR3IMmkv3I6dVcpdsTREGPdRAG0AD1I+zc+T/RsBVvXyaN9/5muPkUDsPu7dvt4SN+J8JH/mfZxCFA9/4e8fLT+XL3179vhkYtB4Tkh1L69e7vI0Ia1/d8MqJBQayVyFdj0ec6VcMEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731528512; c=relaxed/simple;
	bh=cjaxfP3K2+vqhGLJnlRta9XnHUBsBBTtsoQobxaWEc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnlzUXxCdOnIhtGek0opJ36wnlZYDjfBf5b52SiNsO1J9NOJi6d8NXLfBnITTVhLSFw0LPeU55t14/us/TFx2t0+zcHEHSf3J2b2aUdLSxp19atxxVhAKsPzaqq4m4IHJgKFO+UjMYYQUiY1uZ9oHdxx8aWdQHjyjKeryIxRTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmhbD5yf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmhbD5yf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c714cd9c8so76044725ad.0;
        Wed, 13 Nov 2024 12:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731528510; x=1732133310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjULDMvD6L6UJTTrMaZgXK2gf1klZ78cKDDqW9QajSs=;
        b=QmhbD5yfW6LmivcoflPleNDpJFX4voL7J8PnVG6hU7yJ/RCAkzgWkpV1HJyEzBWmZT
         eXgOyQixquS0ln2EmSrGJj6eVcu0fAIrV62HQoAkpkPgJc3ebQXUNo7HRVDxqnyzo1uj
         sCsgai/64sXTu7DO1+aKN/OUsWQbdmA5W1rOozuf/WsD42VAE+oE07kQAi+yxlFsKWdZ
         KMPfZ1yDk6X+HV2Sw5X6x0mqYjtO71xpBxRO1J00QsXV5Fen6r0hH2Cjs+WjGv9a24Jg
         mvOywEvc7czjBq//oqfWqXQCUJwMs8Z2aC5LO38sO0E/kbzJh0hRuL55ww4bx8xejqC4
         likQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731528510; x=1732133310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjULDMvD6L6UJTTrMaZgXK2gf1klZ78cKDDqW9QajSs=;
        b=QH/ClTwuReLF93hA1Cr3+ljOs73A9+8td9FtblYQlnZRiZ8l+ZTMRYOBeGgX4HrXwE
         vig2FJog93C15al2TvZ91H7IsQSGJLE5FOKOBTw0DW21ESIn7bUDkMLLAB9D6qpTJDoR
         pK7Wf0H4tE46BYX3tJEDWfSkT4gI+D4jay8LNxgExwB3WkOWxfxevghCAAgmrZdhocwK
         YGYK+Yqe9eTSXITj004GKhZ3xUyODTqwdIN5exbMqW+iZOAPOLqxaxx4g+J8k52NP8h4
         cxDJcEZPibVtw6FIaOo+kK+iVq8WL4UmdLsJdDzMjW7T+YnLSidX47HprOi+ubhvetFd
         X2xg==
X-Forwarded-Encrypted: i=1; AJvYcCUNvm0YntEXAU/Fm3T1Z/4Jz72VBuKFlyI4iY8Zl5cj7qOllqAz1iM5GkWJai2bRCYaKgywXkOw5nJJ@vger.kernel.org, AJvYcCV2FIvkAeKU3EYzdCJr4qwH5KNFLJxlpwVRxMTopunEMLIcMyhZcNJthdO285S0WPEP6REB2RHkp3nUADY=@vger.kernel.org, AJvYcCWbC7cEeo5qkFrtinLMPGVgcPIyZ7mgH/xQ382S7rEIsAVCVTRMm1xXY5U+IBCVeLf8iwlv4+oyoPTk@vger.kernel.org
X-Gm-Message-State: AOJu0YxNrPcVgux/MKm56Ebs1od2NoosIJT79NA5zxpW2nXzMIn+TDVN
	/iPFMBhWoPm7bCuxhLdKKSCALIGKnSgjFIHOdf70l94sJ961yRpx4KzEZw==
X-Google-Smtp-Source: AGHT+IEfX/6VXsH/46gb2dd20hEXeNyda1cJCDwfObzPE/fL4S9iczScSXbGw2hTHJZIJB2sjoVf5g==
X-Received: by 2002:a17:903:1d2:b0:20c:c15c:96ab with SMTP id d9443c01a7336-21183e4a120mr299032685ad.48.1731528510245;
        Wed, 13 Nov 2024 12:08:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddd62csm113419915ad.59.2024.11.13.12.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:08:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 Nov 2024 12:08:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <0ccfb361-0c20-41f2-b5b7-3c37c5226110@roeck-us.net>
References: <cover.1731439797.git.grantpeltier93@gmail.com>
 <8c2d048f87282bcf66313afbf5e923d8fc17b4d7.1731439797.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c2d048f87282bcf66313afbf5e923d8fc17b4d7.1731439797.git.grantpeltier93@gmail.com>

On Tue, Nov 12, 2024 at 02:09:28PM -0600, Grant Peltier wrote:
> Some applications require Vout to be higher than the detectable voltage
> range of the Vsense pin for a given rail. In such applications, a voltage
> divider may be placed between Vout and the Vsense pin, but this results
> in erroneous telemetry being read back from the part. This change adds
> support for a voltage divider to be defined in the devicetree for a (or
> multiple) specific rail(s) for a supported digital multiphase device and
> for the applicable Vout telemetry to be scaled based on the voltage
> divider configuration.
> 
> This change copies the implementation of the vout-voltage-divider
> devicetree property defined in the maxim,max20730 bindings schema since
> it is the best fit for the use case of scaling hwmon PMBus telemetry. The
> generic voltage-divider property used by many iio drivers was determined
> to be a poor fit because that schema is tied directly to iio and the
> isl68137 driver is not an iio driver.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>

Applied.

Thanks,
Guenter
