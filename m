Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9AD3E3148
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778944306; cv=none; b=BP8arbbuEO5p5Vg3Zj434S/Gk2VysSksjx5ARjb6B/uekA+fOtPuC85RY5dsvDtbArsGal9NxkJo43rNr8nspp45yLRExgH1qmvbytRPallsM3loy7z1gx97prfP4fDFuo40qF6bRexSP2jZqVrAUtSOUgar/s9Vn8lfJY3x8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778944306; c=relaxed/simple;
	bh=E9pcr/535Gr7kYSJxjUaXzWht1zhpDZcBz/5xjacYYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBAaqRuo4Pi1N9wUq/RxtNAjgtR0JdSwmEpSPmJth4mid0TjVr0MWoQSXcwxYygqvUX5SPwHSSIKfppBPhiVAYFV+TFWvU/NiC7CMWZjcqvB07sZobzVjF5DbQFwiMNhM0F7RBUg8dk3DZdS1BY0CZdlui1gpG0blh3jmA22Xlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsbHP/bI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsbHP/bI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b9ea536877so4138725ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778944304; x=1779549104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+j4cr1iyUCBb1PP17Lc7udm6C+rJ+6/BnxCiDoqSk58=;
        b=VsbHP/bIl/dQLqbV3tynHzbNlLOUWu+HsL4Vvf8VUXC5lPiMHiomSb+EVV1eUYmhGF
         dJGKoL1jR5DZUjMAa/0k0PdOBFU1Jmxy6z9aNxoK4NLQkINOtQWGPCar+GDqiQdE9/qz
         cK1uHd3Wc+IHFbsoZxWqo7FRyfRsbGESFydNxz6MQPXk1O6F/p47LWZx0HpR8imWOtF1
         wuvFB1tjwkhmyLmGbayxJjpiwC+m01IF9IEfucHpA73aa036PRM4KZpHh+RJF/ihrUex
         +NrkHGlzGicQuNvhEHSr26lmThsefzy9YyLxMiF6fKWFc/m2KFMsv93VZrRIicj0sIGV
         nU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778944304; x=1779549104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+j4cr1iyUCBb1PP17Lc7udm6C+rJ+6/BnxCiDoqSk58=;
        b=MCQ4ORyZ2W5mIqtfQVjNbKTZOibl1/VV8dEFFAMhEoC7bE20pIh0HcKWE6LTpCXui4
         wrsbfBH+AUwqywUrNtft5bJDBABsnt8+yFmkfkfLN8vmzJO+OxjoE4Z+SOg9geIgP7EV
         K/gnkYrXQVZUUuLen4Et2+gMtvPDZp2XolT/aMPzLgWIC7wmm1CgEl1FYLGAQ69EyD+h
         tAQFATcUx6RV1X26xP9rsLxnvZy98guvtEAYGuB5Cd8S7lTHep/HwkUKnjLAw5hRSzQF
         rZZcR/bL21x0pe2BF9n3u8OqaMU54hYIY5UuM7rCxKYti6h6FbEu0CBMvZ8FIvDd58Kt
         zeUA==
X-Forwarded-Encrypted: i=1; AFNElJ+yI2yJmae5UbGjBZRkXK/nzO8BwQwnXrMVO0thKWbyGzCdU9h/xDukfNn7IfW40hf/R7RW+rd3wuvMzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYK3sL0UmoNJQw83RG1cHeaf1bwf5dOT3tebNkTExPlKY7j4Eq
	h+1TQpe7OEGYuiU72rpiieScsp76NGNS4BzzclHGyW3Ds8xOmPUFx4yP
X-Gm-Gg: Acq92OFSepsjQPuXFT7ROFoV75GlvUo/9jZOt2YHap8O6yBckDjdNgpELxj/8cO1xVz
	pkLa2r7NWt1PJqee+P4IRM4ZCNYlAINGS2UqRJt45sKZXhBRNeVDzVIy9XumCev3DjDUbb2X4Ps
	B7sjEkLK5s+DxEwgOkLfxBoEd5JE8aY0Knmbef0j1/pPJeM94DRUAKIf6T5+hHKC8Szvn+1my1O
	GiSky4bHJa0QWd30fWkW8uz7chj5wY0y298pjaVxPyxAxZJgUdZ8oBAe+wlCchMmiiFezHTkls9
	WVJqTYcW6qdYLKs7uSYVj2VTujG843xGfXi0FGqp6ZOJJmBaJ8aFoZOUEQrZjmMZd06QZvJ31+l
	sclCKrD/sV+wTiIzzple/XLuCSE2PgWYE+65l3j+79/HPEXW70t/kAtgNFtln8oZ5pby9O/LJZK
	6200cPmX+bXMCgyScLeTpXpy3h++eq0XLicUM/
X-Received: by 2002:a17:903:2c07:b0:2ba:21c2:d6cb with SMTP id d9443c01a7336-2bd7e933c99mr79249975ad.16.1778944304131;
        Sat, 16 May 2026 08:11:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm94594275ad.66.2026.05.16.08.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:11:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 08:11:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: trivial-devices: Add Murata D1U74T
 PSU
Message-ID: <8ce4c0df-18a3-4d9d-97c2-68685355fcaf@roeck-us.net>
References: <20260514-d1u74t-v4-0-1f1ee7b002ec@nexthop.ai>
 <20260514-d1u74t-v4-1-1f1ee7b002ec@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-d1u74t-v4-1-1f1ee7b002ec@nexthop.ai>

On Thu, May 14, 2026 at 08:03:25PM -0700, Abdurrahman Hussain wrote:
> The Murata D1U74T-W series are hot-pluggable 1U AC/DC front-end
> power supplies in the Intel CRPS-185 / OCP M-CRPS form factor.
> Each variant delivers a 12 V main output plus a 12 V standby output
> from a wide AC input (90-264 Vac) or HVDC supply, and includes an
> internal variable-speed cooling fan and on-board voltage, current,
> power, fan-speed, and temperature telemetry.
> 
> The host-side digital interface is a PMBus 1.2 port on I2C.  The
> PSU's other electrical signals (status, alert, current-share) live
> on the CRPS edge connector and are consumed by the chassis
> controller rather than the host SoC, so there are no host-described
> supplies, GPIOs, clocks, or interrupts.  Add the compatible to
> trivial-devices.yaml rather than carrying a standalone binding file.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
