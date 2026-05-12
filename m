Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BE2E2665
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611135; cv=none; b=DW+oP1L/+mfZ5xEiiTl+Tjj+E7XYEKnrtulznjsiOUNwO0wiGo5bevsAumici3LYNw/kGYPtwfjGLxG4REul89MxBIxXtmqkSdGpuPhCO9CW2F+ckjjgjjuCvqn7C6D8Xz/6x05riYBvQuPjkwgydI7+Mug7kkNe/ZC8OeyoLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611135; c=relaxed/simple;
	bh=wghiAxQuxqtAvitYKuJZuc7it+z5yLfdA1RWrKRE3E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGqjQdwTjSyfu4H4MqHRb7tDNg12nRMpmPO/zlV/ja2UQOEesQOz4WyApTCor7HZYtkH45t54E8O6XGlq4lzy2CQ8MQX1KXxMwA5dZ/hHNGKyL2Aw4gK1XBFb4VFF1ltbqtGn8aLs5tOAebg7+vMrKq5sdL35QtzaHBt+6AxuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9dM8Y5o; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9dM8Y5o"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so14088975eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778611133; x=1779215933; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DtrhvDHumLdSC7BNTWijDsXzCHRt8VBTdwQcb9tXIcM=;
        b=W9dM8Y5oSBAyVLzNTgSIl02OzzqoshFGAo6Htle6KL3jS/XF18kC8iMecGdJmwt7+f
         MFw5iBGm+0v+VAa09YsLQMMyeCwDyFPeDRYBh8NgvMWptGJZUozBpzpN6u311WTwXzQq
         EuRbmm1ApMoUtNAsjaPAYU5LDvzq7P/ogeh3lA792rjI5tPAKRmW5Nfb4THbpcOKc0sc
         BvR0/VBJteaXoxZoarkFfR7OZWh0tfu/CDxdnEJDll8wy9apiBfnACyOfHvhk3x686W/
         41HPM8qsar2vvf3JB2B9o1kmqM3uwmGjCoU+UorrhfZ9tyDMcVC/lk51hgSiuS/Fefcn
         CuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611133; x=1779215933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtrhvDHumLdSC7BNTWijDsXzCHRt8VBTdwQcb9tXIcM=;
        b=oj3zNmIOCPUXRiV+Gp38HqG0gQzAtEdv7lV9Zst69yZpctsXjfMxApl+BkS4pImB2N
         ENi5qyLMBKMfBZvnqY+kUJdfuVs26rOZygzzrS3f/Egdp3lQOeaNAVOOKaPzjVdJXbiu
         RFqpQ1vPg0RBs1XNmSq8VsKWtSHa7pacImGr7CXyWEamDrMJyqUhmDzRqX8QMh0bZfYP
         a4jma6RTKlMhtGJzBvhJor0sFBupWHlcUPniXcepbNLU+6YY/jL1+0p9N8b5viBDtKhh
         GqNSoJWqX6V4HHPaEa+6UOw/YhTe5paoFUbixmPU11S2XoEWCgQmUCpSDCqb/bijAEs0
         wQaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uk5B40j9dHSyxM4u5MdmFvjhC32AhoyiEc/L3iLcJwBzbnKusvNWqwPj9toUTjbtCy3W+mtjnjRMNMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNaqCkFV1Atuegsp5oqt7TICO+jPP/JuDMCdi0uPOR48dty4jW
	1euNdOrwmi/erQLgYq7dLCyUan57JYwHBeTgsacYxMyxdVuesLPFWVrk
X-Gm-Gg: Acq92OE59cWBv9sDnSfCE+MdtDIk3NCM7fKqHFdIVLkadJxpAL1BMkc/DbTOAkVID94
	Ai/4K2awresMmaaImfwTBTAvhD75cJ0dAN+4urMkjboeAPc+sSEEvpDUanNFFNNBvGoJs9CzME/
	UDZjaAiv0xL7CfqBeemH05Vw8k25tFFu+g/j4StAnQekMHv89t+1IL8cItEGjou3RNZChR0cV63
	ldWFH2MYfGI8iS36HXaL7shUDbC89CJbzchzFy78skmJdZg16JuIDobLk/LD4XQaRtu/tmBOEjy
	6na/FjJBRguwGmlEVr8YTr8kY7ULj+45EGKeZYIfLN8uFSZ4wuopMN005gId0Ti9mafPk8m8+g1
	y1d+o3vJYbgu2wKdhuvrNLCsVG12gmVhwVtY0dta4DOqLG+xufgvY2+jjzRo+WZVnLjyOZm9rOF
	pfhu6EH7BmaLSXf4OUwVzo8M8oUIf0WNOs0AJD
X-Received: by 2002:a05:7301:4592:b0:2ed:e15:c922 with SMTP id 5a478bee46e88-3011977d58emr155326eec.30.1778611133101;
        Tue, 12 May 2026 11:38:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm23871337eec.6.2026.05.12.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:38:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 May 2026 11:38:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Wensheng Wang <wenswang@yeah.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: (pmbus/mp2869) Drop unjustified
 __maybe_unused
Message-ID: <4e5ac680-403e-4c35-86a5-9a33e80ebd15@roeck-us.net>
References: <cover.1778603083.git.ukleinek@kernel.org>
 <3ec2ee181d4f5bfc48c3745f9ce4fdbd1e8fb01e.1778603083.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ec2ee181d4f5bfc48c3745f9ce4fdbd1e8fb01e.1778603083.git.ukleinek@kernel.org>

On Tue, May 12, 2026 at 06:28:57PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> mp2869_of_match is used unconditionally in mp2869_driver, so there is no
> need for the __maybe_unused marker.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Applied.

Thanks,
Guenter
