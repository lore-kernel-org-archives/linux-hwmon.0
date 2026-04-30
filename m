Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FFA32BF4B
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572952; cv=none; b=cmzaerBYZXqOTM85AtXLVZF3svoR3Ms7OMTb7/WXUJeejslTBibgtTeQ9dVguY9WngfLsHqltULPfNhui6VXlQ7j/s+bQgxmI9/Rrk485SRRn3RqbfE8U2jh311gORcs9CrvJSG2VAx5wkEHpedy7nuYW+7v9TmNDRqvEp6pjqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572952; c=relaxed/simple;
	bh=ZDsZMoA9/WSo4HcPc0dJPU4kSOVUdowYn/YFm1z2xEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJ/0wV71hD0gRfhYBxxAip9jVVNVqz0jBLHhL6b+Rbs8nv7nM047X74xsKfpeOra39Ho3DvHhIahIQbdiDhXQlkd0RgxeAcaHEstZnFf9c3sTOwmkhBiGVP/yzwn8JrXeyO+b2F3A598Q7nWX5ISBu6xg+zmLzYSXCzyPAfVlA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4O5nqtR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4O5nqtR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b788a98557so10581315ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 11:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572951; x=1778177751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEhlTZx8HGqlWFdMwpSRx7cd1QbHSDI+RBJ/gpUc+9I=;
        b=K4O5nqtRqQ1AerWfnfh6X/KsQipMaYOCBpg+TycYcbZHtI0w+3MjuMHPx8nie095+L
         vTXR8IGHT+voxoimg4/SBXM+wakHlqfZ1PURrBkYbapuCkqMbniC0jJ5xJ43o9HYlrMC
         RomBdsBUxqxG9UGYkPJcra1YFfrqxJ1OQ+SNKjW1UV06rWhrdR/oq3CF2AgFoOTP+zh3
         SZBMaFEOUMl0S4+ABNnkWVerfQiIA8g3aUkc8yGui4FdZNyuHyHbmxV9APmhMJgDW3RG
         R76Aplk3n2W/cB8S7f/4qh+TAJtZlSdJI4akGQvZRwA3ZzF9rK4ER+XpCAhwPD7f25mO
         bl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572951; x=1778177751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEhlTZx8HGqlWFdMwpSRx7cd1QbHSDI+RBJ/gpUc+9I=;
        b=phmdPPohxX/MSMoz7Jfew8YVKOZ3KZg46k0OwFbeyxbE3yL4tEk/f8NJDjYPYjhaH5
         bfL0Pd9E41hkMDLOiXQPLxDqePH4itionmZzUCyooSLjiRTKL2KPfAe82GtiudVBgbAv
         RUVLHsOT3paYKKyau3e4h3mzvX/NK8fAdrux4XgdqWL+d972pivwWTJ5bCxS752I5qB1
         68bJeg8vetZMpW6SvJSr/L5Cvgwtul/jBctjVqxV62pJHGZJBT8B3jDvzgKOJXC0kAVl
         FeU6AXhR9UT8ZFVH2QnlwBNTdCrCn96ApYhNQWZe2RY4AbtPF2R9oYUk2SLtM9/REuDw
         ePLA==
X-Gm-Message-State: AOJu0YygjU6uiIFOUp3mOGE7y9upHj9U0zaoiMpq5Ow9auHAdRb1F0CA
	WO5z/hDhjusBMy2FHvl/RiOiv9kVrfK4EOfnYFwNowWUmwQuSZcmDW4Q
X-Gm-Gg: AeBDieuJSXwjHZktK4KGhZuZhkdVoZl3kozzwirWt+pVJC70nP7B6Ghe0CkXWfxn+In
	pKU4pSJcCStry2H5jdUfEyUh4+cttXO8xpEDp1qrMRy6BKA/TPOW0ukeJJhY3pQu1RJcmqwwHas
	4LRRtcGZGfdi2mELO93MetBeGuUHUBIxfrpKrs5C7fAsUQtWfczURK0XtX6d+g64jr0g2cdvX+z
	RqgkooevXCBWO/rTNSQ5aH5HSLpQwPIGyHPiC+4XCssX/ImjUmt0PHwOlapxUmEiL4zPzG8URWq
	ZvB/yFWDl5Lg/XuxkyRTKsRBpHCIMPBrj2KSllYKJ1XYVUBW/HCVJNnsnuRhfKLVINe6ykQiAaE
	y3toiRq4yDtSMDFm4Bhi8C37ZAgWe6OI6DLUJyIS9EKm+xIQVCe0qAYmdKNemAymBfQ6eYDEczO
	pxnUoJu+gyiQWyNW0gvOnDOoNbPFfsx4Tb4bMop0qpFWffXNc=
X-Received: by 2002:a17:903:3d46:b0:2b2:5ec6:dcf6 with SMTP id d9443c01a7336-2b9a231aa47mr31788415ad.8.1777572951235;
        Thu, 30 Apr 2026 11:15:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaae66fsm2686245ad.21.2026.04.30.11.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:15:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 11:15:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	marius.cristea@microchip.com
Subject: Re: [PATCH v2] hwmon: mcp9982: Add external diode fault read
Message-ID: <7b19c208-6d85-4c09-aac6-1f7cbb520150@roeck-us.net>
References: <20260423-add-external-diode-fault-read-v2-1-4004bb5f7d55@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-add-external-diode-fault-read-v2-1-4004bb5f7d55@microchip.com>

On Thu, Apr 23, 2026 at 01:56:40PM +0300, Victor Duicu wrote:
> Add external diode fault read capability to the
> MCP998X/33 and MCP998XD/33D driver.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>

Applied.

Thanks,
Guenter
