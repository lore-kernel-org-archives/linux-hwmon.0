Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4818348C6E
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694268; cv=none; b=bl39IjlkSIwZLs4Ys92wlKq7LB1UZZmm2LwKS8BI0gDpQ861qDFgQLe9UjQFIVnQqmLZOYlwNbzFQk5oawhhkCNIAJXqMUi66SQ80OP3CxVB/D1bxiL7KNAjtYpV4ScS8xAj52LZnWQaieoAHcmELDGCj/wMs+38eMkTKB5W13g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694268; c=relaxed/simple;
	bh=I0FGiWLBFt5px18T+h2u02DuXF422Q2h2dIDAXT+9d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDw9RL/8EmwWZAfXsaQazAzN9GxaGct23pPmyZ7mK3LdZ74YRJQVU3J7DFnA+iGaTUS4O8IzvzS58JKOwhQWe4jXSJHuBdfQDQMrbOp5OaIIfDjxQa4Td/a6mxVEgcfocNTmnpR3skAMwu5PWTXvoSQWHZi4wLXHZ2rBFdRwACI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfMyAdX4; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfMyAdX4"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so826327a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783694267; x=1784299067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f1EAbgqCofbf0UacpqguLpk9PQP81OggCyfKLGDrUok=;
        b=VfMyAdX4KZWEC6IlPfkz1hss+MI+MNdYGWC+YTdes2Zl4YUmVtE+O87pQIUjSeFZpy
         M1T7Fh9U6Ij996ao5yXX9+hCO5NqicewCcwsz2w/3Oaa+W4Tf7Wtb4PHwikqFsA/qtvW
         TXaLv8zMA3i3uocPXsTHV0DbTkd5RtPfFIkWEQdaxWZgxEYRinxotTr+NI+QE4m/3MFM
         2AJfz7DYbcCn1yqjDONbcuZpVW6uAMVKic1F1zBPpufKIyDWK4R1qrdskyb/q1wwfboQ
         +IDP/JMXjCKB9Ykv/E5qyt71KSWESrxGci459eRVlRtnwidyPxX0yZ+2DQ2OVK1BDcj2
         9LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694267; x=1784299067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1EAbgqCofbf0UacpqguLpk9PQP81OggCyfKLGDrUok=;
        b=fcR+v/TFpvC4Qs0phzTda6CAPAtcCjfrPiF0QklG1LpORN8yRp6UUGE3sHuWW0VOjK
         0MZF+loedUji19BUpDbKeunh3jf2TP74sOTESJkXd2CR+WjAkFRn3juzdGwC0DwtUbnu
         wQTF1q5K8f3WzI6puntb2lMMshEwzK/1uZRSA9S/CKC2wckrmwCRqzCWgyjSBnqyfQNZ
         WCbF0ltTZCCt7zRG6NeGiCCPb5tsiqUBRyy+yhyiUPPhQEh6L5tTWafhzG/qf3nKmi5f
         GexsG8Goa9HUW+cTKteD1S7beJG9L2q0qT7n1F+5tfsw7TsdPfMmWOto783Arezeojej
         obXA==
X-Forwarded-Encrypted: i=1; AHgh+RpTrMl0l9WmcMe2dWLdZztbUd1vLzSzbQHKdeYSGe85WuJWTRugc6TcGaW3waNK/dSQQ6rqxWchgAj29g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB7LSKtJzcXKrN4cEeKyM2kYT2z64cEBElc4NoQIZm39KEsWcf
	My2dWsJ3qICqIFuOXYLyAZpgx/DglvHINicoxsSDXNp82/KEG8/W8gxv
X-Gm-Gg: AfdE7cm/dFQJDCnyZJx8HH9DvWDyw4VrwvDQ3Y3elspUWYu6s3XJjqgKR1ej8tEltJI
	zSUhUw5/1Ldsj/kaq1hNAniKxTgyeHVbJgABfYZFrQHXsUUxM2pUu1AKjNHcxJATbBwploPFCz1
	Y3IdoGFNMuE1KZAUgS99piwVglllO9++3hY1LyLRNf8w7fexUhkXED9/z2XAIzE72XCakwc5FbE
	5iSC0ymvR85eFJEjEKhkxgvUID6u1FNWQYUm9Im2P5fxs4hknZLtIA9m0XInP4U2kuEhCt3waYy
	xsnF45b697+EYtJ/xUMcu3ELCXfiT/F63vWYdebVOT8qqLYEle+pFdHJVzsdJMa7j6dRMJ8PljS
	FBQNbBppaqHEoaUoja18hekzKQA5zaWvSk6QKzgnN/v876xuVxQRWsakIDpkXGUUQdecYVFVrp0
	0tdV3oncd51p+pNPehppsabJAu0g==
X-Received: by 2002:a17:90a:d887:b0:37f:9ce0:af36 with SMTP id 98e67ed59e1d1-389421ad646mr12688787a91.33.1783694266923;
        Fri, 10 Jul 2026 07:37:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b3206aaasm6581894eec.13.2026.07.10.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:37:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Jul 2026 07:37:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sarbajit Sarkar <sarbajitsarkar16108@gmail.com>
Cc: sergiomelas@gmail.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for Lenovo LOQ 15IAX9
Message-ID: <69c9530e-66f5-4948-9cdb-04896c09fdf3@roeck-us.net>
References: <20260709183500.13761-1-sarbajitsarkar16108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709183500.13761-1-sarbajitsarkar16108@gmail.com>

On Fri, Jul 10, 2026 at 12:05:00AM +0530, Sarbajit Sarkar wrote:
> Add the Lenovo LOQ 15IAX9 product family to the yogafan dmi_system_id
> table. Unlike the Legion series, ACPI table extraction reveals this LOQ
> utilizes an 8-bit EC architecture with a 100x multiplier, but maintains
> a dual-fan setup via the \_SB.PC00.LPCB.EC0.FA1S and FA2S paths.
> 
> A new loq_15iax9_8bit_dual_cfg structure was added to properly map these
> hardware registers and calculate RPMs correctly while avoiding path
> conflicts with AMD-based LOQ variants.
> 
> Signed-off-by: Sarbajit Sarkar <sarbajitsarkar16108@gmail.com>

Applied.

Thanks,
Guenter
