Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5933630B1
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569463; cv=none; b=uT2YtLEVxHVQHLeQtKbnkLGKhDtdlDFmLjR+PdWoh9vtvj60AKTbU5MSXFytF7DLR7pV1rfZ3ouwX1R7m/evpcNcmnU7l6+v55QlGUN3jKiSRckYuq2UeDWiBUAPgfsK6adN1SBhS2qVNzzm/i8x1av0Zg/iB6asU04Gr+rL7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569463; c=relaxed/simple;
	bh=CdGifpXTjb+spzLE+zLsBL2Sw5L7SU7MRgG9SEVCaSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N36xYQZvR3SNaSisLkgBgQ+EqYKmfThBddoudgr14fcPYEs42ChA/54D5zDTDpfDdSNNb6fomtAhtyYjS9ppUZdFYQKVNCsZ7i5hh2vI9eQnEdHHn+uuOodUB5lXTxH9pFT7gPp5fu0oM0jkUQqCsryIQAJYQMMyVv2PeUKXVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTrZJCsU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTrZJCsU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b458ca2296so7645595ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569461; x=1778174261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxTEotuK8mpwbrGLCcn25pmcSWTLgELt4EA9ZD/huhU=;
        b=CTrZJCsUQxXR8ZwX0xfPVU5Rz3CYTlqHlin7fOL9I5UmPflRaVPlsYRFqhctZYeUv7
         1xjM0R56h9wBPxcIJlI6JYBKitsOqNP+mMp6th7ZVJ+YHAN5Co9utnTkvr6aSaenYo8/
         F4h6qSlwUtIH6N4SMCN2ank9eI0nifLrA68fE+G2bS5FiViTG+mVDl6rOklul7uNuk2s
         RZN8a0e2wl2fuC2IZD9hyKN2DCuJn/EeDMsQdlVpeR7bwyQTI/JokEHD2YScXSWDWwSN
         NmjghzxJOrJ0ll800/Hl3RYq8UwJMIzISW4KFO/wzO5bLIbUMGDItHIrLbSVJlLB4uGv
         C7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569461; x=1778174261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxTEotuK8mpwbrGLCcn25pmcSWTLgELt4EA9ZD/huhU=;
        b=lLlT02t/a0wnLKA1hG40yhXcM8JLObbDYnoh2X0Eqzn7SA6dH+9SwHQeFXUCCSVKr7
         vIjxNTWJjQTatuGTY9WtfkdvuMHrOZvOZjyhRiJCq7WjinYvM4kwgGWHjXPistK8YPD0
         TDtYMziIsiXpxMLvcabenK+sogRzKIu4F569QYPtXD65mwaxfFV+3O83BY6iojccI4Us
         3QtmYaFi/ia8LKaQqPr8VODsl+HhRz5CqLQJe1O0NB2W6kUZfdp/RzKm4D/SYqMNDP6F
         uw9oCIwwBWNrn0NroamAmKHonKLYl8ylg+xHYbMN+nXwNlZf6/LkVx8gFqPppoYBYh6b
         Ndwg==
X-Forwarded-Encrypted: i=1; AFNElJ+3oHtq1+t+QsUOffO7ZC0aUgSLUeC6S8TdcUAN9MmUdW6BiYD8XpslYLSAZWM81WGSXV/s4e9MWNI7xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznVq9vXSV4hTyPTxzu8ahujFesk8T0593xLyFcGRYzYqkrk9zF
	6q22800d+EbG1nwSLsC0GkyOh3//GrGx4bGYR+ZB4wTdHXDHuqpwzvQ3
X-Gm-Gg: AeBDieu5lIpumoV/FZFV78SYLigTAzmaWN1Rz/p9VEq6eziq28Sc6zeo94i1000mH76
	78ndHZ2v8+oehLZVrdcIq/DjvpPK1W+tlR3g6fQQ6Wy6at3duci/9eoAF/il0VIZrUW327R99F7
	s3EvS+dcfJVqT4P7JqJDuIEX5m+f7ZsG/chkyDHmwY/VIl/45NuErYyyAg+xhyUxMOmK5vtc+gT
	WKqhrc6YyS9b2QF6KECsaGnm1BJSABHaPMcT630PivzTFxblB1BFPCtBPwROvbYfM+qF34GZw0K
	kwTkeQ5zMUk8t9DMgBq7PEwmLkprAGlxgTgq5euM2Pm/uM/HN+srrr03wr2dra2KVpUBoLI1fgF
	ozGPtPNwE1I2lP7hWnfjgkA6NamTqwkpyJWS1AjVNvTKyfreoaJaBfd0PkbpLEzDZnGJYgZrM70
	A2c/cLYWeof92X97hG6rBoVaazAxRn7hloxpA//K+4yTOWcRo=
X-Received: by 2002:a17:902:ea0a:b0:2b2:53f5:463c with SMTP id d9443c01a7336-2b9a23199edmr42138745ad.4.1777569461529;
        Thu, 30 Apr 2026 10:17:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caac6e7asm1903835ad.30.2026.04.30.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:17:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:17:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add MPS mp2985
Message-ID: <0967f7dc-f65d-4a02-8816-65b97847f406@roeck-us.net>
References: <20260414092801.1067470-1-wenswang@yeah.net>
 <20260414092921.1067735-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414092921.1067735-1-wenswang@yeah.net>

On Tue, Apr 14, 2026 at 05:29:20PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter
