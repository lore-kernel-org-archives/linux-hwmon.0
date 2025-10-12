Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3D1E8836
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760291414; cv=none; b=TtinaKfoL9C1TgjjPsgLNm5AHO0aHOANX0vtF95MN+Uds2aCfi8Gfo80kKi7HFqH5YqREd2BOJYNW95yu4PMYSUm8LZtWgW3hxqvhH5Rg9LLX6d0qbV62M1pi012NwM8LiPsobPTtusgryMIfkvy92apfl73+jUnqp/Yil2bDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760291414; c=relaxed/simple;
	bh=0XtKuLa8UiwNtFQOHtGYSF9Ae5RbWbAtQVc8rTPpTUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEaPRSNfHkNHgXaI722edBlS9aS7JKtVaJAZnGSx+YAiuDLdvc0UiGNAze+veBqJxgvnhRRntkY476akSn7xLh/U0TX9zLw8e54p4NPJXGu+sQlNd3X3dfYxr5AHcCLleNuwdEY8EEte6e3M18GymQUCN/d4Wz3w+nivOO0vyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfUimi7H; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfUimi7H"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33255011eafso3659778a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760291411; x=1760896211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KG7cZkr2V/oLoitCh7Ph/07kt3ygxpCQRJaIzYce2jQ=;
        b=ZfUimi7Hpkun05Xe/cPHRo5tfzkZtNzLlFfCUj1gbO6OQRuCrlmqakPJ6ZfEI9aB/X
         E/tDQCRiyYyLgtY6SBDyTjTa9XY0h/jWTbb8NG5v/27gIBXCniKp3zhpPko6Dma+Nfsh
         ts044QQnOEIxhfj865cGBLxnxDmfFYl7GCr73fas6YYhp+7lKzqQVXOjXl5deuhad7kD
         Vw1832uipXDofqs/97kbGLcHvDvNSRHNEXI0MFdoRR0UK6YKyNDpfJ0Epm4+dsWmGZRe
         ypm+u24hapuyY8stJu3+aec50PJOAtY0AvPp5U+olSq4TevAmQWnC60R4dZtcbA1Jfp+
         e13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760291411; x=1760896211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KG7cZkr2V/oLoitCh7Ph/07kt3ygxpCQRJaIzYce2jQ=;
        b=SrJsiiVunz7XIZE1HhgaUVDRpOAAaYJwbUJ8+PSCtdpJmKaibzr1SkHpr9kNL4z+qC
         61aJwdBNTmOTb1tHe9//8lixYgPxqgGIECiEwRymjO5E0tKqcfv9Bjp2+XA/QaLgg0KU
         SWm+QOE2+zH/qGdZ/zJE5FHrWsKoNSOMijpdV+tSIkl/G8BYMNvTKR1xzKn4n58u7epV
         PQFD0g72NZ68NYQWtgt+fgdTIjFRx9Un/sldhG2ERKlkqob4zIt0GQFzx1ktrAuBqzw9
         CZEOGc0b526VQLIr3KglvAPQYftIIOmzgj6eGa/MCPcpaxUZnk+LYjJc8k92mzaLxolT
         uYYA==
X-Forwarded-Encrypted: i=1; AJvYcCU4bvqAy87kPWKFnOhOs9oZMrddiGXbx30ea4GHIbHztzzhuiHvM+mfqyYTn9wxZRgjl7sIS/KNRr4JuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqZw9v8iAIBToPSbfkPekuy8NGJuQs2pD7W1nxf+AISCqZw8Bs
	bUBerA1Zim0C6x3E7PpUEugRmmVmxKcp8LxLrrUpxMo6z3dWV26JH6Mr3VgADw==
X-Gm-Gg: ASbGnctkmeK+S/Lh4addaeyBpEQ/qNvUNK13L7nWJVXikI02OkqsSSxavwW/Ka5jYtx
	oUoMi2bYBbuVr5fdY6DefgCxg0JW6l9aKvsMz4OPVHKOnGz5VIAAqwNYUBf03bsNsLiB9LJXvUu
	1HtP2d0a8IIsO1AshV8+psQNhn9VEinKA0lHGBHqcC9csD1E/dfe1mkzNKpmW4q9G+cufPXQCIS
	1ftW8XD1TEiE4jBm6c5dROIjO1XngmcA0YBJEO1SHT6M0SKw1TnoDNGPuthU9thzp5fqypD6hVS
	2yYjwp138wosNP1x+h9Qz7aN+qcQOwRF22eQhHeru1AF86Dyzrr1I348c+utuTYI0rA53CNdjZB
	EtwKbausaW7kwpRC1i2wQ2+gaoo8iGTwQnmAo8MS8MxYw3YlN1g+c55yDBUYDggFu
X-Google-Smtp-Source: AGHT+IFPUnweijrn2pOw98DIoWtnaMWpi9PLMftd6tmmurmdLN2gURd0KnujjCj0/eqqy8Ofu8hbtQ==
X-Received: by 2002:a17:90b:1d89:b0:330:797a:f504 with SMTP id 98e67ed59e1d1-33b5114d664mr25165948a91.3.1760291411356;
        Sun, 12 Oct 2025 10:50:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d15e2sm9407269a91.21.2025.10.12.10.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:50:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 10:50:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] hwmon: gpd-fan: Fix return value when
 platform_get_resource() fails
Message-ID: <917278e0-cb6b-481b-8d1f-04b693668273@roeck-us.net>
References: <20251010204359.94300-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010204359.94300-1-harshit.m.mogalapalli@oracle.com>

On Fri, Oct 10, 2025 at 01:43:59PM -0700, Harshit Mogalapalli wrote:
> When platform_get_resource() fails it returns NULL and not an error
> pointer, accordingly change the error handling.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Applied.

Guenter
