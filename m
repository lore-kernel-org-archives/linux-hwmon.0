Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890C023C4F3
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097275; cv=none; b=fa04i2Rk6LI/lI4AZhC1Xsxq8rASI60uCPAChTZh3SIWpdCs4pY2f79uvV6zk1aOHJkdJDjZMJl2Tl1O3E5bA0hzesMzSmXUVx7oqbxjU1n9mK1IqhjV9iqXKZ0WQBW4QcOIOU57XtKNajA4QcY/bOnz0tLLbthTml33UMGvfcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097275; c=relaxed/simple;
	bh=8W+0hThKAZc6wDLK7nhSYHduijnCeiUXGq6A9UZ/gv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fc9dtx+LwJ+utYA20e4yFGjOFoLLV8kN/GQk/h2FzbQYEE9fYPdtmJJgLMkWqsF4+d5xZxJyzE/EpLYN0LeY75Gg9QwvdNhdlXGpTgw+1SpdJNc9dTrD2wc1aOwGUW5P85JCvQD62KJ2cDdy368+K8yt1hMy584GT7ngmTrCK/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFiY08zv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFiY08zv"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84229481d44so2754196b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097272; x=1781702072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmCiNke9CNNPNgybTGSAGuI43T7yC5Pi1R1N6f3/7Iw=;
        b=LFiY08zvYTPmFXsIqgAaYw5In+/AZAdJHzS8T6sHmqzrppb6kmI8oSfqdfKSytnZBa
         mpA3tLze4hgyGo5umXoHQSg1K2kWY4CQCI0upyr3pJxu+IwA+2Rzjx2xZD6vYWu26Ah2
         RuUlWnSDegB/C6yalbMW5yRpoVdWll7BYglyWzicGv5jdbrNCnZpqsgBVYAcijLE4Ef9
         wsrsBYJ6PpiBYa1sUdNZBe2FLu4Q+d4r7un6dl5mw3MNK3xEYTTDgnHSLDQNqSjdj6ln
         qt3TJ1f4L8M/mHFjZTwmcM9UQK340Npu+nNR4wmBPMMTGN2kgGpID8++rbEGRVZNaJMA
         /Cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097272; x=1781702072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WmCiNke9CNNPNgybTGSAGuI43T7yC5Pi1R1N6f3/7Iw=;
        b=KMl903L0pFH9rnEThjJi8WZidrk48jIKZd/+u5TGbdBFsmDX1RxGRzCtckoXEqUQeF
         gj2M/0gGv+QVYBZMIeqL7ly9ZrSvKn7x0clOqUZ4QZdyPBV+eCj8GimixFFCtm1jZjhP
         GQcWMDsISJ9vuJYU1UfJjMkgwhbkBlw/L6pvDgsiuxYYiJS5rNl/1uImt7KMSQrZicYa
         f3r1bV2jB0DZmmrAIb5EDi/NSjU1DLx3x3N3IalTr/5jjqILAAXSfbwDMmNrLaSyCDkR
         x4ZIXrL5wAfBTWhHjotWgv2yVNRakF0bc74rSlIJgH/T8UVB5Ap8rINynNdWrgntl3S3
         sdvg==
X-Gm-Message-State: AOJu0Yyo6POquKz00VhGTws9uaTsItTX/QBQMuDdHrrPyyiMTDoJ6mx8
	HLZAf6sas2jfV4tnr9YSARQhcOxgATeFNYaV3aVhz2Ky+vfmJfTKRvAyOIbIv/v/
X-Gm-Gg: Acq92OGoDTLooY2ihrUnitGe16XZea55hI7OUIX+lrwvylK65uIasndep9A3PGfbFHr
	Sv/4USn5j1cLb7HYeJES1SwGlHza2s8hyVJFGYEbQ9mp9uLDfV7S2rzJDsfbOXlRK7mUnebI2V0
	VoNAu5pCSdmW6cgQtcInK4D8AgEtM83Mm2ZTnbhtascrqeFilwekviOa0G2HbngRkCBIvkIG3ix
	pE4eDr2lhqolOoKYdeE8a7eC9Wv/It95hJ/AUlMMkShWySmDh4XxkzdPN7ZKrIeXxSj5yC6E5Eo
	M2yhBCf6zyhuQPNJowf9piQic7EbYRPP1IC2yEvfb5+4zw4H7CUoREVwTQ4XRPX/kWdESLvAvqu
	+L0C00nIFjXFl+EZaV3ilZvMKe6e0S/DnDW3sAx7CBHnDEd2PjNkz8KHeBLEQ0DiyQMsyITUzjK
	41+ejh1ciN4W21JGBPnZWOR6XDNsM4AK0t4buJqBVZnCZJEvCluxAj+lzr7g==
X-Received: by 2002:a05:6a00:4288:b0:842:5b63:6112 with SMTP id d2e1a72fcca58-842b0f49abfmr26684930b3a.32.1781097272354;
        Wed, 10 Jun 2026 06:14:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221086sm25034213b3a.10.2026.06.10.06.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:14:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 06:14:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	cryolitia@uniontech.com
Subject: Re: [PATCH v4 3/4] hwmon: (gpd-fan): upgrade log level from warn to
 err for platform device creation failure
Message-ID: <62cbbb04-d8dc-4547-9d15-2dcba63d8a4e@roeck-us.net>
References: <cover.1781055639.git.xiaopei01@kylinos.cn>
 <aeb2eaa6df90178b18057a8022a0eccde7bbc82c.1781055639.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeb2eaa6df90178b18057a8022a0eccde7bbc82c.1781055639.git.xiaopei01@kylinos.cn>

On Wed, Jun 10, 2026 at 09:49:11AM +0800, Pei Xiao wrote:
> When platform_create_bundle() fails, the error is fatal and prevents the
> driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
> a critical failure.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied.

Thanks,
Guenter
