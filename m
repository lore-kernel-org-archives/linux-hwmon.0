Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3BE3BB44
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441143; cv=none; b=W5SQVKCdfp0FNKhYC+4NuJrTmygWz/D15e0gunQoISXK9O7bh+bcfovAtEJ+dJgjRPUApm+pn00Xz1/4ACc6mEssAqYNikKC2cIykI4JrNtWF0NlvvkbPyZHr1txPlwaUDUQNCEqspcyHo7mqaVMPkPJC2l4zbOmHfFtnbju/sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441143; c=relaxed/simple;
	bh=+ttJsDkf94r0CSdQ4el9fEq6CwTnDhuz1diFWZn1frI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS9+iFPmEqW0Uo651sjZ5iK8jZVr0IZJo5BeWgqjC12KryX3nf9fssiUf/yPu3eTaRL2RIz8HVPwhZp66X+JcgNO+pgPJ/L7hVyCjbCaCnbc1NlS+gy11Bti7VyYA18wdFCGZRf0OM7ifh9MkzVSpQidekuk4dZkbZUB0ES5EwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE5BooeS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE5BooeS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-26983b5411aso10202435ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 14:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441141; x=1760045941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGLl/rz+wrsVeMOuhwheEV/pvZWT7ZRQueFVzWddcaw=;
        b=YE5BooeScvAUASPQnOOloYzXVTOZq8vYcGpgt+XH4bdGCh+3RT9EpaP1spETJyBFC9
         0z+UJqJ/p8ogk0RBxNTbLERlw3xX+uhV288eNWHS51f/5d8CEx1dxVjL6/hyg8nv0Ch0
         QV7W69pheDwk9++hK/sy4FfG2jjWxmOBHOr5h8wly0HT8ZnaMwzuDZIGUkUonV8s7CEr
         yZHmrjl667ybX2xrfy9gvLeWhtc65VBkrnLxwEn910Ii2kF4yRzB58sWLrDidkX/GS4i
         r+nLEfTdWCE0t9sBZIzEkSCGmM8cT+5u+p3CGRbGv8nBqSSLV6o1oP8nWWrRMDT7Y4Nl
         sB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441141; x=1760045941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGLl/rz+wrsVeMOuhwheEV/pvZWT7ZRQueFVzWddcaw=;
        b=MFcCVIg++NV3qb+xX8rktT5UvG1SEDIQWUP0Qh1mIBVVS931G/4SsMMGtoa8/qodz7
         Yzn+iXHTfRIuE1N+YWenyA9YezSo9aOSLE+eyi0SlwJtkb5ev+m1xLgz4RjlvOY9bpBh
         F+lai5ag6qc7Hmw2qQNrRnjqqvON5jWpIFRvYLo22fGNx+VFrYQdim6/qK3CHQNGlsz3
         Q7vruDjiCby9N8jySl75aSvfcR5/S+i6W+T1As7fpD7RxlJxbkQumgCwJvDsdaoSy9ms
         ea3kEueoVzeyULQ0QYUUKJ2F3dLvQ0kBs/PWQr5tUBzWoPmK1y5btQNvoh7SX+AoewKv
         qGzA==
X-Gm-Message-State: AOJu0YzdyTFKJZMtew6SR1tz3lxQBEOrK8+k99hFPOuf60JVrnLp+D+F
	YwLevONqtYbMfg4dlat4EccvvqIsajjKR1P+rAMuQu9uGjMAUARfcMLsm4q2JvZM
X-Gm-Gg: ASbGncsZxP4qjsm4Wi/cFwubZk1ztSynDXTkfvye4I+PfbJQCWekSVCHodFnrFW3Hj+
	7M0/2NOgTaC3ek/148Xk2LyO0QTqMIrxeFuXA4w2c+WXWX60hQg+4QSxSDvkMTs8wlgrEg+e4l0
	b6CKtKEQypmd43OjN6lGzKce6pvJ2zTfKXqGOVaL3FTlKZZ0k44B1cPvalqrc9JovF8J/fhsk5a
	FW2lYoVOjBURR//5M+VPA96QnT5N9uf3O7jA48pSSK8CxYJUs5Iv4jprLijDFRcY4LSk5QsALTO
	VcyzEgpci2Ic55Vk3w/qzwACIJA/FRcnDM95LuLf37LXjFXENlTpjh+r6ddpfLVPqttBmnc7BYJ
	VO25JdM0gRfsflkt0YyyLVJCxcOL4Vpnk7J4lw2pewCb+2lQZ4DQmvXHtdZkY0zL/bPjcMQ==
X-Google-Smtp-Source: AGHT+IEtqQT22g+3Kd23iYkQumTvz38cXl27NAonZwLQoyLdON3rrIzQUidT4T+O5nMlBjuQSArlMw==
X-Received: by 2002:a17:902:cec2:b0:250:6d0e:1e40 with SMTP id d9443c01a7336-28e9a54ee6amr8808935ad.7.1759441140664;
        Thu, 02 Oct 2025 14:39:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110d0bsm30175385ad.29.2025.10.02.14.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:39:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:38:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Add ASUS ROG STRIX X870E-H GAMING WIFI7
Message-ID: <4ea658b6-7635-4d2b-9ec3-9b781c3795fd@roeck-us.net>
References: <20251002184958.359744-1-luzmaximilian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002184958.359744-1-luzmaximilian@gmail.com>

On Thu, Oct 02, 2025 at 08:49:56PM +0200, Maximilian Luz wrote:
> The ASUS ROG STRIX X870E-H GAMING WIFI7 has a NCT6799D compatible chip,
> which is also accessed via ACPI.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
