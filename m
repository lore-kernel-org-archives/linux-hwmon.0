Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCAF24B41
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707300971; cv=none; b=MeBFTMbIav5hS2lArICB6trn3LmBBwlzrK1nEboD78nwP4o4pAdJwiLyWFnqrTATlJ/uVyrKi4Co+4FCcksMnPMbRLdRpmPbJlTAWxP/xaLzDanR1hohFCNiOCKKturwVBgfb/gyj9AALTCnH2n20b6Oet/3pkEPbFN4yXgOMDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707300971; c=relaxed/simple;
	bh=SX4i4ogiPn2BLCbRXtT9m3wlLpKMh3kIiMF+HbF1pvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8xHiBG4XLqo3aYH1JaUwSyFdMv1MwOwRQAJw5oFTc+8wFsn4cJxYT0SVYTGeoRxWYIj8eNoBP+dBlpfzpBGYjl/M7Fy/aw4LeYio8LFe4madTPI6dVHj9G9Gw0p3cHgmJmvMhIIbFSfW8yllbsSWPC7E0EhGQbczScxjomlbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vZGr+HmA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZGr+HmA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so510867a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 02:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707300967; x=1707905767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UN6Itv6PZbeyX5qmqFhw0rKbEBdTeVzfwruk5gmsqHg=;
        b=vZGr+HmATouj19XTCdGXY75EbARMfyPMg8SOi8W7qSyWxAeQjorahmNJNUrncCCU8k
         apQYLF0gIq3M2a93YkPeyOABNWA3hK2T7Mi35kfDvNSYWrSKTjC78+HCgjnHDC9MCxKz
         wcg0VHopkncZoaYiI451ySDEBapdjYfLE865BDf7t3duMBPTWNZzaMPCwY0s+vQLwQaV
         p1k9x7NznoDwH5gs5b3fdpZfePr4i0DTn2flrrTR0UK0nnFpWjy9U0VgiD+LtexcNs5D
         AfYsksjhQHF51IKNI+w2wSYpB/2mFBBxaOQjNCuzC+OsGAmsnQS4GAgpAKcpmQ9ZL4H8
         49yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707300967; x=1707905767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN6Itv6PZbeyX5qmqFhw0rKbEBdTeVzfwruk5gmsqHg=;
        b=QHLvDbwkRnsw+x7HKKu5v7OO707ucV/GhcRFel51qx5tvWa8qw9IiBJuve4DWfquek
         eaR88F6SVOxJS8hKaW9zzGQK0ym2vPLXyYJ3RhKlBgU7AtDmALPt6xbvdCF/ZOt8awBL
         xUULcdksRiYw06dY8y6Y4fSsp8ZXOJUDAsrC7XyepHqpswP6gzxalMj3Cpte3xuGbGlJ
         wLVa0xXOsi/NHR2ya9laxmnQgEDDsquBspjNRTryXD7Lm1Rja4WPID9Qz/EJvEam4LBH
         rZ5QS2yelF7sCOPcPjGQmqZxIGQ96W3TarvHEjAUXxZaHBDg2Zk2fdryER151XZnxQLV
         nKvw==
X-Gm-Message-State: AOJu0Yxh0M3XT/okejwAYZGxggIED1wpMTi8QS5VDNOBFf2qAVJ75R5F
	iPtOpZIwTetXCqt4TT6/Mq5ze7bJmiN3IGYGJKKCbesA95IqvPh3X1cy6C5MY1o=
X-Google-Smtp-Source: AGHT+IFGVryUTKM7cRWgl7evc9UrweEmF0V/JOSdFYgkpvRMWkejSXxCns4FWZnLHV8nUfvSXe3PHA==
X-Received: by 2002:a17:906:3e0e:b0:a38:6d3:ac54 with SMTP id k14-20020a1709063e0e00b00a3806d3ac54mr3823007eji.23.1707300967178;
        Wed, 07 Feb 2024 02:16:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIGHkd2GpbRXPdScQL8ANrrNwnckc5LmG7LP8njvvMldouaMY4DKCtknVI3lY2bICHQVPm421moCwKqGcawd44xuk7Y2+UXY4=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qo8-20020a170907874800b00a2b1a20e662sm588060ejc.34.2024.02.07.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 02:16:06 -0800 (PST)
Date: Wed, 7 Feb 2024 13:16:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [bug report] hwmon: Add support for Amphenol ChipCap 2
Message-ID: <563343c4-8893-44d8-a398-ea36a9cd396a@moroto.mountain>
References: <c61a90ff-7f63-4181-96fd-ca5a5029386d@moroto.mountain>
 <ca9be823-8b43-4f51-9bc0-8ee5de7df4a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca9be823-8b43-4f51-9bc0-8ee5de7df4a2@gmail.com>

On Wed, Feb 07, 2024 at 11:08:18AM +0100, Javier Carrasco wrote:
> 
> The ret variable should be initialized to 0 because if no irqs are
> defined, the function should not fail i.e. the driver supports that case.
> That is probably the reason why I did not notice in my tests.

These days everyone has the GCC extension to automatically zero out
stack variables so it wouldn't have shown up in testing.  It's still
technically a bug, but I don't know how many people it would affect in
real life (probably a small number).

regards,
dan carpenter

