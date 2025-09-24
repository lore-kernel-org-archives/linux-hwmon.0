Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14E0301477
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724908; cv=none; b=suSLxzNdK77jcbYJPad6bPKpdSiFHQaURRyoCDYk11jVpHjT+MnJPPBfysK1OfXO8tnes1vCu1wqjOxcaupIqOpLtZO9YL5Bh5n0R0gwmYFUklzyYs4521TDtlieMi2D6CBD6h8843xCL6/hlrRObwfP/sjQHj6B5OfPqMI7LDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724908; c=relaxed/simple;
	bh=W0CAhktGRZ04V99yCWSPlVYW9qZzY2wunBg7h0NhCIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daie3tQjhiPSjMA5k1gkz8bg/JYHRnvmmYkAnTDKMdjQLj4u0FPCehd2ch9PG3U7YUo5fNoUDB0BdSoEaEzEXdetEeU/pPJ02YzLvksTIEZPiPusxBpK58A2Y1gsJTu7wajYLaS32cRKg7tpHlJdCwGcZgrxR8stletjtNqrx+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbXt3tWc; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbXt3tWc"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77f7da24397so707867b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724906; x=1759329706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePDH5KGJWCygcppGoaQCIvDmpnnW40P9lL64y9nVceU=;
        b=lbXt3tWcjKJvB+kDC16FAMuTrE0MOVUqEpo4ndY6kOcyFfXe65VDq6RdFMKLH5dkCL
         LyRy2zoEaj2zUQlWlWPhJ9fTZZqJofKKi5EOwwBzGZUiFjRqdH2S6hyRTSRGMqAAeC4Z
         97diC6wYez0k4yKZDVUGw+l6Gh3oIijyuJfCEBnPHtlZsGSHF7Op2lk40FpF57tUpcZY
         oBoZAirXIpj0cEjrngvurd8rkZoUala8cBPAoolGRPrQdgsuZkhdhD4iEC8EKbhpDItv
         PS/b1tji43BQrBUnxMp0PVDRJX3QTkJ5AKPAti8B5I3M1YPnW5Jaej0k4bmtXkV11KSr
         EqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724906; x=1759329706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePDH5KGJWCygcppGoaQCIvDmpnnW40P9lL64y9nVceU=;
        b=CqMC216bot11czYkNONkqHde9N6UGpOMpyoJtUVoVUh59YqIoai+ThML5+vPgjcYsR
         DgCS8hHfakzOwNOj8LxRgYOEGwWOzvucJoavC6lO+OMiONruOEW4EvivWQuQzyQ4GOGA
         +5X/C/MBUqcHa8GyyPTobOo4hS9EgqvS38btsNr4iIXoF7CWj6ACjFFvSRPIjGFo8CEV
         g0DaFXQ4HAF5FneM3Ne9MP3AwJ3VJxoeJZzcyesi+dDD1BimweULpZPAhY0T0bQFYm0K
         2Gf8haC8cU+xIs86+GU21QQZY3ZX8a/wrIxjGo6phaJLa5EMAq1PfCjqxiSpQ/3xpdC+
         Tnkg==
X-Forwarded-Encrypted: i=1; AJvYcCVjMDYIk6GJwaMm1F+LZ3AD94w5QRmwsXBOzG0Glbpit6+TDNf2yrYFCzJ1Hp9TO/EhsGBoxRusmp4U/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4oTcfZou8us+Iar7wfw1s0FbMlW76qtRt7L4+fRUz6nO2Dzq/
	aR3k6+GB7/P4ubp0fTlSCGQL9oRH0GWb3XVJvGPOTmDqLGrvZXxYp75x
X-Gm-Gg: ASbGncv7YZfmydm+L5ljy+QTRMqTVqIEBXtf4+FFyHJbJ0svGhZvOx+BCeSqocJjWPl
	TO2H9ri06h7zR0mP8jftcNE1pgiQCsCpZEKNb9yYH48vZzfiyBuYUDididSeOiQQieJn6Khift+
	KvD4vCBDXWt15jm9OawPlKVvwKJ6ESiaR49WU9lF0pgVBuRHRNAlAiX8q3F00J1TTvfEr9XhHbg
	Ql5vpf3GUb2vG4l85H4CwCGu68PSky7EeLC7RwCcamlKL/w+ZEPdAo2Sdu6VoQKjyWW8HnKScuO
	omRssnF/k58EQgY3b63riOiKonuZDyDrCYNdMxNPdt1xDUAth8LYGSPIJ6TyP9qK80c3T64Izw1
	9q0Nqp+aTWTGBqv2/EGLTF2zADiDrEqKrzco=
X-Google-Smtp-Source: AGHT+IE/thFWQvdVClEOk/6wwXKwPKjW/dGu1B5hditayD8OO6MbNLQaLCuiocvpMwHugPUxDy74zg==
X-Received: by 2002:a05:6a20:729f:b0:2c0:227b:13e4 with SMTP id adf61e73a8af0-2cfe7b1879cmr9245324637.26.1758724906138;
        Wed, 24 Sep 2025 07:41:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7aad7sm18984248b3a.12.2025.09.24.07.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:41:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:41:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <5327db80-86c3-4b68-83fa-1788e5a30fc2@roeck-us.net>
References: <20250916-ctl2301-v1-0-97e7c84f2c47@linux.dev>
 <20250916-ctl2301-v1-1-97e7c84f2c47@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-ctl2301-v1-1-97e7c84f2c47@linux.dev>

On Tue, Sep 16, 2025 at 12:46:44PM +0800, Troy Mitchell wrote:
> Link: https://www.sensylink.com/
> 
This is not an appropriate patch description.

> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 77160cd47f54079a39f35b570d69f7c4c2274724..ea4011d64ab9081d212a738839849d5814cf6c98 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1353,6 +1353,8 @@ patternProperties:
>      description: Sensirion AG
>    "^sensortek,.*":
>      description: Sensortek Technology Corporation
> +  "^sensylink,.*":
> +    description: Sensylink Microelectronics Technology Co., Ltd.
>    "^sercomm,.*":
>      description: Sercomm (Suzhou) Corporation
>    "^sff,.*":
